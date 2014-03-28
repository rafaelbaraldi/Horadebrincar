//
//  ViewController.m
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 25/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setFaseAtual:1];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    switch ([self faseAtual]) {
        case 1:
            [self setFiguras:[Figura retornaFiguraFase1]];
            [self setAnterior:[UIImage imageNamed:@"fase1.png"]];
            break;
            
        case 2:
            [self setFiguras:[Figura retornaFiguraFase2]];
            [self setAnterior:[UIImage imageNamed:@"fase2.png"]];
            break;
            
        default:
            break;
    }
    
    
    [self setGanhou:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.view]];
    
    CGPoint toque = [touch locationInView:[self view]];
    
    [self setFiguraInicial:nil];
    
    for (Figura* f in [self figuras]) {
        if([f x1] < toque.x && toque.x < [f x2] && [f y1] < toque.y && toque.y < [f y2]){
            [self setFiguraInicial:f];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if([[self figuras]count] != 0){
        UITouch *touch = [touches anyObject];
        CGPoint currentPoint = [touch locationInView:self.view];
        
        UIGraphicsBeginImageContext(self.view.frame.size);
        
        [[[self tempDrawImage] image] drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), [self lastPoint].x, [self lastPoint].y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0);
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        
        [[self tempDrawImage] setImage:UIGraphicsGetImageFromCurrentImageContext()];
        
        [self setLastPoint:currentPoint];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Remove linha do usuario
    [[self tempDrawImage]setImage:[self anterior]];
    
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    Figura* figuraFinal = nil;
    
    for (Figura* f in [self figuras]) {
        if([f x1] < toque.x && toque.x < [f x2] && [f y1] < toque.y && toque.y < [f y2]){
            figuraFinal = f;
        }
    }
    
    //Verifica se o usuario acertou as imagens
    if(figuraFinal != nil && [self figuraInicial] != nil){
        
        if([[[self figuraInicial] tag] isEqualToString:[figuraFinal tag]]){
            if([[self figuraInicial] x1] != [figuraFinal x1]){
            
                int x1 = ([[self figuraInicial] x1] + ( ([[self figuraInicial] x2] - [[self figuraInicial] x1]) / 2) );
                int y1 = ([[self figuraInicial] y1] + [[self figuraInicial] y2]) / 2;
                
                CGPoint centro1 = CGPointMake(x1, y1);
                
                int x2 = ([figuraFinal x1] + [figuraFinal x2]) / 2;
                int y2 = ([figuraFinal y1] + [figuraFinal y2]) / 2;
                
                CGPoint centro2 = CGPointMake(x2, y2);
                
                //Remove figuras acertadas do vetor
                [[self figuras] removeObject:figuraFinal];
                [[self figuras] removeObject:[self figuraInicial]];
                
                //Desenha linha acertada entre os itens corretos
                [self  desenhaLinha:centro1 :centro2];
            }
        }
    }
    
    //Altera image anterior
    [self setAnterior:[[self tempDrawImage] image]];
    
    //Verifica se Ganhou
    if([[self figuras] count] == 0 && ![self ganhou]){
        
        _gesto = [[GestoArcoIris alloc] initWithTarget:self action:@selector(metodoDogesto)];
        [[self view] addGestureRecognizer:_gesto];

        //Set Alpha do Jogo
        [[self tempDrawImage] setAlpha:0.2];
        [self setGanhou:YES];
        
        //OK
        _ok = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ok.png"]];
        [_ok setFrame:CGRectMake([[self view] bounds].size.width/2-75, CGRectGetMidY([self view].frame), 150, 150)];
        [self.view addSubview:_ok];
        [[_ok layer] setOpacity:0];
        
        CABasicAnimation *animacao = [CABasicAnimation animationWithKeyPath:@"opacity"];
        animacao.duration = 3;
        animacao.removedOnCompletion = NO;
        animacao.fillMode = kCAFillModeForwards;
        animacao.toValue = [NSNumber numberWithFloat:1.0f];
        [[_ok layer] addAnimation:animacao forKey:nil];
        

        [self performSelector:@selector(animaArcoComDedo) withObject:nil afterDelay:1.2];
    }
}

-(void)animaArcoComDedo{
    
    //Adiciona arco-iris
    _arcoiris = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arcoiris.png"]];
    [_arcoiris setFrame:CGRectMake(35, 300, 700, 343)];
    [self.view addSubview:_arcoiris];
    
    //Adiciona o dedo
    _dedo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"finger.png"]];
    [_dedo setFrame:CGRectMake(95, 560, 156, 250)];
    [_dedo setTransform:CGAffineTransformMakeRotation(-(M_PI / 4))];
    [self.view addSubview:_dedo];
    
    //Roda dedo
    CABasicAnimation *animRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animRotation.toValue  = @(M_PI / 4);
    animRotation.duration = 4;
    animRotation.removedOnCompletion = NO;
    animRotation.fillMode = kCAFillModeForwards;
    [_dedo.layer addAnimation:animRotation forKey:@"position.z"];
    
    //Anda pra cima
    CABasicAnimation *animAndar1 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animAndar1.toValue  = [NSNumber numberWithInt:480];
    animAndar1.duration = 5;
    animAndar1.removedOnCompletion = NO;
    animAndar1.fillMode = kCAFillModeForwards;
    [_dedo.layer addAnimation:animAndar1 forKey:nil];
    
    //Anda ate a metade
    CABasicAnimation *animAndar2 = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animAndar2.toValue  = [NSNumber numberWithInt:-250];
    animAndar2.duration = 2.5;
    animAndar2.removedOnCompletion = NO;
    animAndar2.fillMode = kCAFillModeForwards;
    [animAndar2 setValue:@"subir" forKey:@"animaSubir"];
    animAndar2.delegate = self;
    [_dedo.layer addAnimation:animAndar2 forKey:nil];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    //Anda ate o final
    NSString *value = [anim valueForKey:@"animaSubir"];
    if([value isEqual:@"subir"]){
        CABasicAnimation *animAndar3 = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        animAndar3.toValue  = [NSNumber numberWithInt:-10];
        animAndar3.duration = 2.5;
        animAndar3.removedOnCompletion = NO;
        animAndar3.fillMode = kCAFillModeForwards;
        [_dedo.layer addAnimation:animAndar3 forKey:nil];
    }
}


-(void)metodoDogesto{
    [_ok removeFromSuperview];
    [_arcoiris removeFromSuperview];
    [_dedo removeFromSuperview];
    
    [[self view] removeGestureRecognizer:_gesto];
    
    _faseAtual++;
    if(_faseAtual > 2){
        _faseAtual = 1;
    }
    
    [[self tempDrawImage]setImage:[UIImage imageNamed:[NSString stringWithFormat:@"fase%d.png", [self faseAtual]]]];
    [[self tempDrawImage] setAlpha:1];
    
    [self viewDidLoad];
}

-(void)desenhaLinha:(CGPoint) inicial :(CGPoint) final{
    
    //Desenha a linha reta da farinha ao pao quando a crianca tracar certo
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    [[[self tempDrawImage] image] drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint( contexto, inicial.x, inicial.y);     // ponto inicial da linha (farinha)
    CGContextAddLineToPoint( contexto, final.x, final.y); // ponto final da linha (pao) // falta descobrir o ponto exato
    CGContextSetLineCap( contexto, kCGLineCapRound);
    CGContextSetLineWidth( contexto, 10.0);
    
    CGContextStrokePath(contexto);
    [[self tempDrawImage] setImage:UIGraphicsGetImageFromCurrentImageContext()];
}

@end