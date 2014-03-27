//
//  meugesto.m
//  aula gesture- custom gest
//
//  Created by ALESSANDRO CAMILLO GIMENEZ DE MENEZES on 12/02/14.
//  Copyright (c) 2014 ALESSANDRO CAMILLO GIMENEZ DE MENEZES. All rights reserved.
//

#import "GestoArcoIris.h"

@implementation GestoArcoIris

@synthesize xInicial, yInicial, xFinal, yFinal, raioMaior, raioMenor, centroX, centroY;

-(id)initWithTarget:(id)target action:(SEL)action{
    
    self = [super initWithTarget:target action:action];
    
    if(self){
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    //quando ha um toque, usamos a coordenadas do mesmo para definir os outros pontos
    //com o valores pre-definidos e arbitrarios para o gesto de semi-circulo
    [self setXInicial: [touch locationInView:self.view].x];
    [self setYInicial: [touch locationInView:self.view].y];
    
    [self setXFinal: [touch locationInView:self.view].x + 200];
    [self setYFinal: [touch locationInView:self.view].y]; //yinicial  eh igual ao yfinal
    
    [self setCentroX:[touch locationInView:self.view].x + 100];
    [self setCentroY:[touch locationInView:self.view].y];
    
    // valores arbitrarios dos raios(30 pixels) dos circulos de que delimitam
    // a area valida para o gesto
    [self setRaioMenor: 70];  // 100 - 30
    [self setRaioMaior: 130]; // 100 + 30
    
    
    
//    //definindo a posicao das UIviews "gambiarra" que auxilia na visualizacao dde onde o gesto de semi-circulo deve ocorrer
//    [[self largec]setFrame:CGRectMake([self centroX] - [self raioMaior], [self centroY] - [self raioMaior], [self raioMaior]*2, [self raioMaior]*2)];
//    [self.largec setBackgroundColor: [UIColor orangeColor]];
//    [self.view addSubview: self.largec];
//    self.largec.layer.cornerRadius = [self raioMaior];
//    self.largec.layer.borderColor = [UIColor blackColor].CGColor;
//    self.largec.layer.borderWidth = 3.0f;
//    
//    [[self smallc]setFrame:CGRectMake([self centroX] - [self raioMenor], [self centroY] -[self raioMenor], [self raioMenor]* 2, [self raioMenor]*2)];
//    [self.smallc setBackgroundColor: [UIColor blackColor]];
//    [self.view addSubview: self.smallc];
//    self.smallc.layer.cornerRadius = [self raioMenor];
//    self.smallc.layer.borderWidth = 3.0f;
//    
//    [[self startc]setFrame:CGRectMake( [self xInicial] - 30,  [self yInicial] - 30, 60, 60)];
//    [self.startc setBackgroundColor:[UIColor greenColor]];
//    [self.view   addSubview:self.startc];
//    self.startc.layer.cornerRadius = 30;
//    
//    [[self finalc]setFrame:CGRectMake([self xFinal] -30, ([self yFinal] -30), 60, 60)];
//    [self.finalc setBackgroundColor: [UIColor redColor]];
//    [self.view addSubview: self.finalc];
//    self.finalc.layer.cornerRadius = 30;
//    
//    [[self largec]setHidden:NO];
//    [[self smallc]setHidden:NO];
//    [[self startc]setHidden:NO];
//    [[self finalc]setHidden:NO];
    
    
}



-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    // se a posicao do toque estiver dentro da area entre os 2 circulos demilitadores
    // esta ok
    if ( pow( ([touch locationInView:self.view].x - [self centroX]), 2) +
        pow( ([touch locationInView:self.view].y - [self centroY]), 2) < pow([self raioMaior], 2)  &&
        // (x - xo)^2 + (y - yo)^2 < r2
        
        pow( ([touch locationInView:self.view].x - [self centroX]), 2) +
        pow( ([touch locationInView:self.view].y - [self centroY]), 2) > pow([self raioMenor], 2) ) {
        
    }
    // se a posicao do toque NAO estiver dentro da area entre os 2 circulos demilitadores
    // o gesto de semi-circulo falhou
    else{
        NSLog(@"saiu da area de tolerancia");
        self.state = UIGestureRecognizerStateFailed;
        [[self largec]setHidden:YES];
        [[self smallc]setHidden:YES];
        [[self startc]setHidden:YES];
        [[self finalc]setHidden:YES];
    }
    
    if ( pow( ([touch locationInView:self.view].x - [self xFinal]), 2) +
        pow( ([touch locationInView:self.view].y - [self yFinal]), 2) < pow(30, 2) ){
        
        [self.view setBackgroundColor: [UIColor colorWithRed: (arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0]];
        //muda  a cor do fundo para reconhecimento visual para o usuario ver que o gesto foi reconhecido
        
        self.state = UIGestureRecognizerStateRecognized;
        [[self largec]setHidden:YES];
        [[self smallc]setHidden:YES];
        [[self startc]setHidden:YES];
        [[self finalc]setHidden:YES];
        
        
    }
    
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    //se ao remover o dedo da tela, as coordenadas que o toque estava estivarem dentro da area para validacao (UIview "gambiarra" vermelha)
    if ( pow( ([touch locationInView:self.view].x - [self xFinal]), 2) +
        pow( ([touch locationInView:self.view].y - [self yFinal]), 2) < pow(30, 2) ){
        
        
        self.state = UIGestureRecognizerStateRecognized;
        
        [self.view setBackgroundColor: [UIColor colorWithRed: (arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0]];
        //muda  a cor do fundo para reconhecimento visual para o usuario ver que o gesto foi reconhecido
        
    }
    else{
        NSLog(@"falho pra finalizar");
        self.state = UIGestureRecognizerStateFailed;
        
    }
    
    // esconde as UIview "gambiarra" de auxilio
    [[self largec]setHidden:YES];
    [[self smallc]setHidden:YES];
    [[self startc]setHidden:YES];
    [[self finalc]setHidden:YES];
    
}




-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.state = UIGestureRecognizerStateCancelled;
}
-(void)reset{
    // so simple there's no reset
}


@end
