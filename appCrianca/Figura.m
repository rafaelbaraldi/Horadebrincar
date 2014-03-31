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
    
    NSMutableArray* figurasFase = [[NSMutableArray alloc] initWithObjects:f1, f2, f3, f4, f5, f6, f7, f8, nil];
    
    return figurasFase;
}

+(NSMutableArray*)retornaFiguraFase2{
    
    Figura* f1 = [[Figura alloc] initWithX1:51 y1:75 x2:151 y2:182 tag:@"Chave-Cadeado"];
    Figura* f2 = [[Figura alloc] initWithX1:54 y1:232 x2:171 y2:344 tag:@"Regador-Flor"];
    Figura* f3 = [[Figura alloc] initWithX1:48 y1:434 x2:165 y2:546 tag:@"Osso-Cao"];
    Figura* f4 = [[Figura alloc] initWithX1:55 y1:596 x2:172 y2:716 tag:@"Aquario-Peixe"];
    Figura* f5 = [[Figura alloc] initWithX1:38 y1:776 x2:155 y2:971 tag:@"Coelho-Cenoura"];
    Figura* f6 = [[Figura alloc] initWithX1:549 y1:26 x2:683 y2:173 tag:@"Regador-Flor"];
    Figura* f7 = [[Figura alloc] initWithX1:539 y1:279 x2:694 y2:402 tag:@"Aquario-Peixe"];
    Figura* f8 = [[Figura alloc] initWithX1:532 y1:456 x2:714 y2:560 tag:@"Coelho-Cenoura"];
    Figura* f9 = [[Figura alloc] initWithX1:540 y1:627 x2:676 y2:735 tag:@"Chave-Cadeado"];
    Figura* f10 = [[Figura alloc] initWithX1:503 y1:786 x2:708 y2:984 tag:@"Osso-Cao"];
    
    NSMutableArray* figurasFase = [[NSMutableArray alloc] initWithObjects:f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, nil];
    
    return figurasFase;
}

+(NSMutableArray*)retornaFiguraFase3{
    
    Figura* f1 = [[Figura alloc] initWithX1:28 y1:11 x2:353 y2:172 tag:@"Balao-5"];
    Figura* f2 = [[Figura alloc] initWithX1:13 y1:218 x2:338 y2:379 tag:@"Foca-3"];
    Figura* f3 = [[Figura alloc] initWithX1:0 y1:389 x2:325 y2:550 tag:@"Circo-1"];
    Figura* f4 = [[Figura alloc] initWithX1:3 y1:594 x2:328 y2:755 tag:@"Palhaco-2"];
    Figura* f5 = [[Figura alloc] initWithX1:25 y1:789 x2:272 y2:952 tag:@"Urso-4"];
    Figura* f6 = [[Figura alloc] initWithX1:588 y1:12 x2:739 y2:182 tag:@"Foca-3"];
    Figura* f7 = [[Figura alloc] initWithX1:588 y1:219 x2:739 y2:389 tag:@"Palhaco-2"];
    Figura* f8 = [[Figura alloc] initWithX1:588 y1:422 x2:739 y2:592 tag:@"Urso-4"];
    Figura* f9 = [[Figura alloc] initWithX1:588 y1:630 x2:739 y2:800 tag:@"Circo-1"];
    Figura* f10 = [[Figura alloc] initWithX1:588 y1:830 x2:739 y2:1000 tag:@"Balao-5"];
    
    NSMutableArray* figurasFase = [[NSMutableArray alloc] initWithObjects:f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, nil];
    
    return figurasFase;
}

@end
