//
//  GestoLabirintoFase3.m
//  appCrianca
//
//  Created by Rafael Baraldi on 04/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "GestoLabirintoFase3.h"

@implementation GestoLabirintoFase3

-(id)initWithTarget:(id)target action:(SEL)action{
    
    self = [super initWithTarget:target action:action];
    
    if(self){
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    int x1 = 10;
    int y1 = 110;
    int x2 = 375;
    int y2 = 390;
    
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
    
    if((toque.x < 10 || toque.x > 375 || toque.y < 110 || toque.y > 390) &&
       (toque.x < 280 || toque.x > 750 || toque.y < 170 || toque.y > 280) &&
       (toque.x < 645 || toque.x > 750 || toque.y < 170 || toque.y > 965) &&
       (toque.x < 340 || toque.x > 750 || toque.y < 860 || toque.y > 960) &&
       (toque.x < 340 || toque.x > 425 || toque.y < 620 || toque.y > 960)){
        self.state = UIGestureRecognizerStateFailed;
        [[self view] setTag:1];
    }
    
    if(toque.x > 300 && toque.x < 450 && toque.y > 490 && toque.y < 670){
        self.state = UIGestureRecognizerStateRecognized;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    int x1 = 300;
    int y1 = 490;
    int x2 = 450;
    int y2 = 695;
    
    if(toque.x < x1 || toque.x > x2 || toque.y < y1 || toque.y > y2){
        self.state = UIGestureRecognizerStateFailed;
    }
    else{
        self.state = UIGestureRecognizerStateRecognized;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.state = UIGestureRecognizerStateCancelled;
}

@end
