//
//  GestoLabirintoFase1.m
//  appCrianca
//
//  Created by RAFAEL BARALDI on 03/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "GestoLabirintoFase1.h"

@implementation GestoLabirintoFase1

-(id)initWithTarget:(id)target action:(SEL)action{
    
    self = [super initWithTarget:target action:action];
    
    if(self){
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    int x1 = 120;
    int y1 = 5;
    int x2 = 320;
    int y2 = 180;
    
    if(toque.x < x1 || toque.x > x2 || toque.y < y1 || toque.y > y2){
        self.state = UIGestureRecognizerStateFailed;
        [[self view] setTag:1];
    }
    else{
        [[self view] setTag:0];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    if((toque.x < 180 || toque.x > 320 || toque.y < 100 || toque.y > 610) &&
       (toque.x < 180 || toque.x > 600 || toque.y < 480 || toque.y > 610) &&
       (toque.x < 460 || toque.x > 600 || toque.y < 480 || toque.y > 1150)){
        self.state = UIGestureRecognizerStateFailed;
        //        NSLog(@"errou o caminho, saiu do tracado");
        [[self view] setTag:1];
    }
    
    if(toque.x > 460 && toque.x < 600 && toque.y > 850 && toque.y < 950){
        self.state = UIGestureRecognizerStateRecognized;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    int x1 = 460;
    int y1 = 810;
    int x2 = 660;
    int y2 = 980;
    
    if(toque.x < x1 || toque.x > x2 || toque.y < y1 || toque.y > y2){
        self.state = UIGestureRecognizerStateFailed;
        //        NSLog(@"soltou fora");
    }
    else{
        self.state = UIGestureRecognizerStateRecognized;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.state = UIGestureRecognizerStateCancelled;
}

@end
