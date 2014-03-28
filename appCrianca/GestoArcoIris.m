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
    [self setXInicial: 35+60 ];
    [self setYInicial: 300+343];
    
    [self setXFinal: 35+60+290*2];
    [self setYFinal: 300+343]; //yinicial  eh igual ao yfinal
    
    [self setCentroX: 35+350];
    [self setCentroY: 300+343];
    
    // valores arbitrarios dos raios(30 pixels) dos circulos de que delimitam
    // a area valida para o gesto
    [self setRaioMenor: 230];  // 100 - 30
    [self setRaioMaior: 350]; // 100 + 30
    
    if ( pow( ([touch locationInView:self.view].x - [self centroX]), 2) +
        pow( ([touch locationInView:self.view].y - [self centroY]), 2) < pow([self raioMaior], 2)  &&
        
        pow( ([touch locationInView:self.view].x - [self centroX]), 2) +
        pow( ([touch locationInView:self.view].y - [self centroY]), 2) > pow([self raioMenor], 2)  &&
        
        [touch locationInView:self.view].y < (300 +343)  &&
        
        [touch locationInView:self.view].x < (35 + 350/2) ) {
        
    }
    else{
        self.state = UIGestureRecognizerStateFailed;

    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    // se a posicao do toque estiver dentro da area entre os 2 circulos demilitadores
    // esta ok
    // (x - xo)^2 + (y - yo)^2 < r2
    if ( pow( ([touch locationInView:self.view].x - [self centroX]), 2) +
        pow( ([touch locationInView:self.view].y - [self centroY]), 2) < pow([self raioMaior], 2)  &&
        
        pow( ([touch locationInView:self.view].x - [self centroX]), 2) +
        pow( ([touch locationInView:self.view].y - [self centroY]), 2) > pow([self raioMenor], 2)  &&
        
        [touch locationInView:self.view].y < (300 +343) ) {
        
    }
    // se a posicao do toque NAO estiver dentro da area entre os 2 circulos demilitadores
    // o gesto de semi-circulo falhou
    else{
//        NSLog(@"saiu da area de tolerancia");
        self.state = UIGestureRecognizerStateFailed;

    }
    
    if ( [touch locationInView:self.view].x > (35 + 350 +290/2) ){
//        [self.view setBackgroundColor: [UIColor colorWithRed: (arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0]];
       //muda  a cor do fundo para reconhecimento visual para o usuario ver que o gesto foi reconhecido

        self.state = UIGestureRecognizerStateRecognized;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    //se ao remover o dedo da tela, as coordenadas que o toque estava estivarem dentro da area para validacao (UIview "gambiarra" vermelha)
    if ( pow( ([touch locationInView:self.view].x - [self xFinal]), 2) +
        pow( ([touch locationInView:self.view].y - [self yFinal]), 2) < pow(60, 2) ){
        
        self.state = UIGestureRecognizerStateRecognized;
//       [self.view setBackgroundColor: [UIColor colorWithRed: (arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0]];
        //        //muda  a cor do fundo para reconhecimento visual para o usuario ver que o gesto foi reconhecido
    }
    else{
        NSLog(@"falho pra finalizar");
        self.state = UIGestureRecognizerStateFailed;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.state = UIGestureRecognizerStateCancelled;
}

-(void)reset{
    // so simple there's no reset
}


@end
