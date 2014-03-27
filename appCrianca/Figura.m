//
//  Figura.m
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 26/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "Figura.h"

@implementation Figura


-(id)initWithX1:(int)x1 y1:(int)y1 x2:(int)x2 y2:(int)y2 tag:(NSString*)tag{
    
    self = [super init];
    
    [self setX1:x1];
    [self setY1:y1];
    
    [self setX2:x2];
    [self setY2:y2];
    
    [self setTag:tag];
    
    return self;
}

+(NSMutableArray*)retornaFiguraFase1{
    
    Figura* f1 = [[Figura alloc] initWithX1:20 y1:61 x2:180 y2:255 tag:@"Farinha-Pao"];
    Figura* f2 = [[Figura alloc] initWithX1:47 y1:285 x2:207 y2:558 tag:@"Galinha-Ovos"];
    Figura* f3 = [[Figura alloc] initWithX1:50 y1:599 x2:169 y2:799 tag:@"Abelha-Mel"];
    Figura* f4 = [[Figura alloc] initWithX1:75 y1:814 x2:243 y2:999 tag:@"Cana-Acucar"];
    Figura* f5 = [[Figura alloc] initWithX1:494 y1:88 x2:706 y2:266 tag:@"Galinha-Ovos"];
    Figura* f6 = [[Figura alloc] initWithX1:542 y1:381 x2:666 y2:519 tag:@"Farinha-Pao"];
    Figura* f7 = [[Figura alloc] initWithX1:530 y1:591 x2:660 y2:729 tag:@"Cana-Acucar"];
    Figura* f8 = [[Figura alloc] initWithX1:567 y1:812 x2:655 y2:976 tag:@"Abelha-Mel"];
    
    NSMutableArray* figurasFase1 = [[NSMutableArray alloc] initWithObjects:f1, f2, f3, f4, f5, f6, f7, f8, nil];
    
    return figurasFase1;
}

@end
