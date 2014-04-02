//
//  Pontos.m
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 02/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "Pontos.h"

@implementation Pontos

-(id)initWithX1:(int)x1 y1:(int)y1 x2:(int)x2 y2:(int)y2 tag:(int)tag{
    
    self = [super init];
    
    [self setX1:x1];
    [self setY1:y1];
    
    [self setX2:x2];
    [self setY2:y2];
    
    [self setTag:tag];

    
    return self;
}


+(NSMutableArray*)retornaPontosFase1{
    
    Pontos * p1 = [[Pontos alloc] initWithX1:435 y1:525 x2:480 y2:570 tag:1];
    Pontos * p2 = [[Pontos alloc] initWithX1:514 y1:507 x2:514+45 y2:507+45 tag:2];
    Pontos * p3 = [[Pontos alloc] initWithX1:492 y1:396 x2:492 +45 y2:396+45 tag:3];
    Pontos * p4 = [[Pontos alloc] initWithX1:366 y1:442 x2:366+45 y2:442+45 tag:4];
    Pontos * p5 = [[Pontos alloc] initWithX1:394 y1:572 x2:394+45 y2:572+45 tag:5];
    Pontos * p6 = [[Pontos alloc] initWithX1:524 y1:557 x2:524+45 y2:557+45 tag:6];
    Pontos * p7 = [[Pontos alloc] initWithX1:588 y1:455 x2:588+45 y2:455+45 tag:7];
    Pontos * p8 = [[Pontos alloc] initWithX1:514 y1:340 x2:514+45 y2:340+45 tag:8];
    Pontos * p9 = [[Pontos alloc] initWithX1:376 y1:317 x2:376+45 y2:317+45 tag:9];
    Pontos * p10 = [[Pontos alloc] initWithX1:283 y1:418 x2:283+45 y2:418+45 tag:10];
    
    NSMutableArray *pontosFase = [[NSMutableArray alloc] initWithObjects:p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, nil];
    return pontosFase;
}

+(NSMutableArray*)retornaPontosFase2{
    NSMutableArray *pontosFase = [[NSMutableArray alloc] init];
    
    return pontosFase;
}

+(NSMutableArray*)retornaPontosFase3{
    NSMutableArray *pontosFase = [[NSMutableArray alloc] init];
    
    
    return pontosFase;
}
+(NSMutableArray*)retornaPontosFase4{
    NSMutableArray *pontosFase = [[NSMutableArray alloc] init];
    
    return pontosFase;
}


@end
