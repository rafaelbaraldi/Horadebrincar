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
    
//    Draw *myView = [[Draw alloc] initWithFrame:CGRectMake(20, 100, 280, 250)];
//    myView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:myView];
    
    anterior = [UIImage imageNamed:@"ligaFigura.png"];;
    
    brush = 10.0;

}

-(void)viewWillAppear:(BOOL)animated{
    
    [self setAcertouFarinha: NO]; // cada vez que a view for aparecer, ele iniciou o jogo novamente,
    [self setAcertouGalinha: NO]; // entao setamos as variavel de controle (se ganhou ou nao) para NO/False
    [self setAcertouAbelha: NO];
    [self setAcertouCana: NO];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    _tempDrawImage.image = anterior;
    
    [self desenhaLinhaFarinha];


}

-(void)desenhaLinhaFarinha{
    //desenha a linha reta da farinha ao pao quando a crianca tracar certo
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint( contexto,100, 100);     // ponto inicial da linha (farinha)
    CGContextAddLineToPoint( contexto, 300, 400); // ponto final da linha (pao) // falta descobrir o ponto exato
    CGContextSetLineCap( contexto, kCGLineCapRound);
    CGContextSetLineWidth( contexto, brush);
    
    CGContextStrokePath(contexto);
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
}

-(void)desenhaLinhaGalinha{
    //desenha a linha reta da galinha ao ovo quando a crianca tracar certo
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint( contexto,150, 150);     // ponto inicial da linha (galinha)
    CGContextAddLineToPoint( contexto, 350, 400); // ponto final da linha (ovo) // falta descobrir o ponto exato
    CGContextSetLineCap( contexto, kCGLineCapRound);
    CGContextSetLineWidth( contexto, brush);
    
    CGContextStrokePath(contexto);
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
}
-(void)desenhaLinhaAbelha{
    //desenha a linha reta da abelha ao mel quando a crianca tracar certo
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint( contexto,200, 200);     // ponto inicial da linha (abelha)
    CGContextAddLineToPoint( contexto, 300, 400); // ponto final da linha (mel) // falta descobrir o ponto exato
    CGContextSetLineCap( contexto, kCGLineCapRound);
    CGContextSetLineWidth( contexto, brush);
    
    CGContextStrokePath(contexto);
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
}

-(void)desenhaLinhaCana{
    //desenha a linha reta da cana ao acucar quando a crianca tracar certo
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    [self.tempDrawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint( contexto,100, 100);     // ponto inicial da linha (cana)
    CGContextAddLineToPoint( contexto, 300, 400); // ponto final da linha (acucar) // falta descobrir o ponto exato
    CGContextSetLineCap( contexto, kCGLineCapRound);
    CGContextSetLineWidth( contexto, brush);
    
    CGContextStrokePath(contexto);
    self.tempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
}

@end