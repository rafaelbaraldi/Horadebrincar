//
//  PontosViewController.m
//  appCrianca
//
//  Created by RAFAEL BARALDI on 02/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "PontosViewController.h"

@interface PontosViewController ()

@end

@implementation PontosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setFaseAtual:1];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Seta ponto Inicial vazio
    Pontos *ponto = [[Pontos alloc] initWithX1:0 y1:0 x2:0 y2:0 tag:0];
    [self setPontoInicial:ponto];
    
    [self setGanhou:NO];
    
    switch ([self faseAtual]) {
        case 1:
            [self setPontos:[Pontos retornaPontosFase1]];
            [[self tempDrawImage] setImage:[UIImage imageNamed:@"pontosCaracol.png"]];
            [[self tempDrawImage] setAlpha:1];
            [self setAnterior:[UIImage imageNamed:@"pontosCaracol.png"]];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];

    //Salva Ponto
    for (Pontos* p in [self pontos]) {
        if([p x1] < toque.x && toque.x < [p x2] && [p y1] < toque.y && toque.y < [p y2]){
            [self setPontoFinal:p];
        }
    }
    
    //Desenha linha
    if([[self pontoFinal] tag] - 1  == [[self pontoInicial] tag]){
        
        int x1 = ([[self pontoInicial] x1] + [[self pontoInicial] x2]) /2 ;
        int y1 = ([[self pontoInicial] y1] + [[self pontoInicial] y2]) /2 ;
        CGPoint centro1 = CGPointMake(x1, y1);
        
        int x2 = ([[self pontoFinal] x1] + [[self pontoFinal] x2]) /2;
        int y2 = ([[self pontoFinal] y1] + [[self pontoFinal] y2]) /2;
        CGPoint centro2 = CGPointMake(x2, y2);
        
        //Remove figuras acertadas do vetor
        [[self pontos] removeObject: [self pontoInicial]];
        
        //Desenha linha acertada entre os itens corretos
        if([[self pontoInicial] tag] != 0){
            [self  desenhaLinha:centro1 :centro2];
        }
        
        //Salva ponto Inicial
        [self setPontoInicial:[self pontoFinal]];
    }
    
    //Verifica se ganhou
    if([[self pontos] count] == 1 && ! [self ganhou]){
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


//Animação do Arco e Dedo
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
    animRotation.duration = 3;
    animRotation.repeatCount = 3;
    [[self dedo].layer addAnimation:animRotation forKey:@"position.z"];
    
    CGMutablePathRef caminho = CGPathCreateMutable();
    CGPathMoveToPoint(caminho, NULL, 160, 700);
    CGPathAddCurveToPoint(caminho, NULL, 260, 400, 530, 400, 590, 670);
    
    CAKeyframeAnimation *animaDedo = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animaDedo setPath:caminho];
    [animaDedo setDuration:3];
    [animaDedo setRepeatCount:3];
    [animaDedo setRemovedOnCompletion:NO];
    [animaDedo setFillMode:kCAFillModeForwards];
    [[[self dedo] layer]addAnimation:animaDedo forKey:nil];
    
    //Gamb para sumir com o Dedo
    [self performSelector:@selector(hiddenDedo) withObject:nil afterDelay:9];
}

//Esconde Dedo
-(void)hiddenDedo{
    [[self dedo]setHidden:YES];
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
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
//    CGContextSetRGBStrokeColor(contexto, (arc4random()%750)/1000.0, (arc4random()%750)/1000.0, (arc4random()%750)/1000.0, 1.0);
    
    CGContextStrokePath(contexto);
    [[self tempDrawImage] setImage:UIGraphicsGetImageFromCurrentImageContext()];
}

- (IBAction)goHome:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskPortrait;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

@end
