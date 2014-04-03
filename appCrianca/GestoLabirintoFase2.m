//
//  GestoLabirintoFase2.m
//  appCrianca
//
//  Created by RAFAEL BARALDI on 03/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "GestoLabirintoFase2.h"

@implementation GestoLabirintoFase2

-(id)initWithTarget:(id)target action:(SEL)action{
    
    self = [super initWithTarget:target action:action];
    
    if(self){
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    int x1 = 130;
    int y1 = 700;
    int x2 = 345;
    int y2 = 860;
    
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
    
    if((toque.x < 125 || toque.x > 345 || toque.y < 550 || toque.y > 860) &&
       (toque.x < 125 || toque.x > 665 || toque.y < 550 || toque.y > 660) &&
       (toque.x < 545 || toque.x > 665 || toque.y < 260 || toque.y > 660) &&
       (toque.x < 125 || toque.x > 665 || toque.y < 260 || toque.y > 370) &&
       (toque.x < 125 || toque.x > 245 || toque.y < 105 || toque.y > 370)){
        self.state = UIGestureRecognizerStateFailed;
        [[self view] setTag:1];
    }
    
    if(toque.x > 60 && toque.x < 230 && toque.y > 20 && toque.y < 175){
        self.state = UIGestureRecognizerStateRecognized;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    int x1 = 60;
    int y1 = 20;
    int x2 = 230;
    int y2 = 175;
    
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
