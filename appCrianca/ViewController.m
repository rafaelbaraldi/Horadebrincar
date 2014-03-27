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
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self setAcertou1: NO]; // cada vez que a view for aparecer, ele iniciou o jogo novamente,
    [self setAcertou2: NO]; // entao setamos as variavel de controle (se ganhou ou nao) para NO/False
    [self setAcertou3: NO];
    [self setAcertou4: NO];
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [[self tempDrawImage]setImage:[self anterior]];
    
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    Figura* figuraFinal = nil;
    
    for (Figura* f in [self figuras]) {
        if([f x1] < toque.x && toque.x < [f x2] && [f y1] < toque.y && toque.y < [f y2]){
            figuraFinal = f;
        }
    }
    
    if(figuraFinal != nil && [self figuraInicial] != nil){
        
        if([[[self figuraInicial] tag] isEqualToString:[figuraFinal tag]]){
            
            int x1 = ([[self figuraInicial] x1] + ( ([[self figuraInicial] x2] - [[self figuraInicial] x1]) / 2) );
            int y1 = ([[self figuraInicial] y1] + [[self figuraInicial] y2]) / 2;
            
            CGPoint centro1 = CGPointMake(x1, y1);
            
            int x2 = ([figuraFinal x1] + [figuraFinal x2]) / 2;
            int y2 = ([figuraFinal y1] + [figuraFinal y2]) / 2;
            
            CGPoint centro2 = CGPointMake(x2, y2);
            
            [self  desenhaLinha:centro1 :centro2];
        }
    }
    
    
    [self setAnterior:[[self tempDrawImage] image]];
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