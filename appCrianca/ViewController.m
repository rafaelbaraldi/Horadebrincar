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
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setFiguras:[Figura retornaFiguraFase1]];

    [self setAnterior:[UIImage imageNamed:@"ligaFigura.png"]];
    
    [self setGanhou:NO];
    
    GestoArcoIris* gesto = [[GestoArcoIris alloc] initWithTarget:self action:@selector(metodoDogesto)];
    [[self view] addGestureRecognizer:gesto];
    
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

        //Set Alpha do Jogo
        [[self tempDrawImage] setAlpha:0.2];
        [self setGanhou:YES];
        
        //Adiciona arco-iris
        UIImageView *arcoiris = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arcoiris.png"]];
        [arcoiris setFrame:CGRectMake(35, 300, 700, 343)];
        [self.view addSubview:arcoiris];
        
        //Adiciona o dedo
        UIImageView *dedo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"finger.png"]];
        [dedo setFrame:CGRectMake(95, 560, 156, 250)];
        [dedo setTransform:CGAffineTransformMakeRotation(-(M_PI / 4))];
        
        [self.view addSubview:dedo];
        
        
        CABasicAnimation *animRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animRotation.toValue  = @(M_PI / 4);
        animRotation.duration = 5;
        animRotation.removedOnCompletion = NO;
        animRotation.fillMode = kCAFillModeForwards;
        [dedo.layer addAnimation:animRotation forKey:@"position.z"];
        
        
        [UIView animateWithDuration:6 animations:^{
            [[dedo layer] setPosition:CGPointMake(610, [[dedo layer] position].y)];
        }];
        
        
        //        CGPoint pointInicial = dedo.layer.position;
        //        CGPoint pointFinal = CGPointMake(pointInicial.y+200, pointInicial.y);
//        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        
        // First we update the model layer's property.
//        dedo.layer.position = pointInicial;
        
        // Now we attach the animation.

        

    }
    
}


-(void)metodoDogesto{
    
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