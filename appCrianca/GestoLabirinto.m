//
//  GestoLabirinto.m
//  appCrianca
//
//  Created by RAFAEL BARALDI on 02/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "GestoLabirinto.h"

@implementation GestoLabirinto

-(id)initWithTarget:(id)target action:(SEL)action{
    
    self = [super initWithTarget:target action:action];
    
    if(self){
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    int x1 = 190;
    int y1 = 300;
    int x2 = 240;
    int y2 = 330;
    
    if(toque.x < x1 || toque.x > x2 || toque.y < y1 || toque.y > y2){
       self.state = UIGestureRecognizerStateFailed;
        NSLog(@"comecou fora");
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    if((toque.x < 190 || toque.x > 240 || toque.y < 300 || toque.y > 330) &&
       (toque.x < 195 || toque.x > 445 || toque.y < 330 || toque.y > 380) &&
       (toque.x < 400 || toque.x > 445 || toque.y < 340 || toque.y > 460) &&
       (toque.x < 400 || toque.x > 520 || toque.y < 415 || toque.y > 455) &&
       (toque.x < 485 || toque.x > 525 || toque.y < 415 || toque.y > 495) &&
       (toque.x < 445 || toque.x > 525 || toque.y < 450 || toque.y > 490) &&
       (toque.x < 445 || toque.x > 485 || toque.y < 450 || toque.y > 565) &&
       (toque.x < 400 || toque.x > 485 || toque.y < 530 || toque.y > 570) &&
       (toque.x < 400 || toque.x > 445 || toque.y < 530 || toque.y > 610) &&
       (toque.x < 400 || toque.x > 480 || toque.y < 565 || toque.y > 605) &&
       (toque.x < 445 || toque.x > 485 || toque.y < 570 || toque.y > 650) &&
       (toque.x < 445 || toque.x > 570 || toque.y < 610 || toque.y > 650) &&
       (toque.x < 525 || toque.x > 600 || toque.y < 610 || toque.y > 730)){
        self.state = UIGestureRecognizerStateFailed;
        NSLog(@"errou o caminho, saiu do tracado");
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    int x1 = 525;
    int y1 = 620;
    int x2 = 675;
    int y2 = 685;
    
    if(toque.x < x1 || toque.x > x2 || toque.y < y1 || toque.y > y2){
        self.state = UIGestureRecognizerStateFailed;
        NSLog(@"soltou fora");
    }
    else{
        self.state = UIGestureRecognizerStateRecognized;
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    self.state = UIGestureRecognizerStateCancelled;
}

@end
