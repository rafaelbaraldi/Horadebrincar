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
    
    NSMutableArray* figurasFase1 = [[NSMutableArray alloc] init];
    
    Figura* f1 = [[Figura alloc] initWithX1:20 y1:61 x2:180 y2:255 tag:@"Farinha-Pao"];
    Figura* f2 = [[Figura alloc] initWithX1:47 y1:285 x2:207 y2:558 tag:@"Galinha-Ovos"];
    
    Figura* f3 = [[Figura alloc] initWithX1:20 y1:61 x2:180 y2:255 tag:@"Abelha-Mel"];
    Figura* f4 = [[Figura alloc] initWithX1:20 y1:61 x2:180 y2:255 tag:@"Cana-Acucar"];
    Figura* f5 = [[Figura alloc] initWithX1:20 y1:61 x2:180 y2:255 tag:@"Farinha-Pao"];
    Figura* f6 = [[Figura alloc] initWithX1:20 y1:61 x2:180 y2:255 tag:@"Galinha-Ovos"];
    Figura* f7 = [[Figura alloc] initWithX1:20 y1:61 x2:180 y2:255 tag:@"Abelha-Mel"];
    Figura* f8 = [[Figura alloc] initWithX1:20 y1:61 x2:180 y2:255 tag:@"Cana-Acucar"];
    
    
    return figurasFase1;
}

@end
