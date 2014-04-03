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
    //pontos fase caracol
    Pontos * p1 =  [[Pontos alloc] initWithX1:435 y1:525 x2:480 y2:570 tag:1];
    Pontos * p2 =  [[Pontos alloc] initWithX1:514 y1:507 x2:514+45 y2:507+45 tag:2];
    Pontos * p3 =  [[Pontos alloc] initWithX1:492 y1:396 x2:492+45 y2:396+45 tag:3];
    Pontos * p4 =  [[Pontos alloc] initWithX1:366 y1:442 x2:366+45 y2:442+45 tag:4];
    Pontos * p5 =  [[Pontos alloc] initWithX1:394 y1:572 x2:394+45 y2:572+45 tag:5];
    Pontos * p6 =  [[Pontos alloc] initWithX1:524 y1:557 x2:524+45 y2:557+45 tag:6];
    Pontos * p7 =  [[Pontos alloc] initWithX1:588 y1:455 x2:588+45 y2:455+45 tag:7];
    Pontos * p8 =  [[Pontos alloc] initWithX1:514 y1:340 x2:514+45 y2:340+45 tag:8];
    Pontos * p9 =  [[Pontos alloc] initWithX1:376 y1:317 x2:376+45 y2:317+45 tag:9];
    Pontos * p10 = [[Pontos alloc] initWithX1:283 y1:418 x2:283+45 y2:418+45 tag:10];
    
    NSMutableArray *pontosFase = [[NSMutableArray alloc] initWithObjects:p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, nil];
    return pontosFase;
}

+(NSMutableArray*)retornaPontosFase2{
    //pontos fase florzinha
    Pontos * p1 =  [[Pontos alloc] initWithX1:269 y1:382 x2:269+45 y2:382+45 tag:1];
    Pontos * p2 =  [[Pontos alloc] initWithX1:321 y1:405 x2:321+45 y2:405+45 tag:2];
    Pontos * p3 =  [[Pontos alloc] initWithX1:367 y1:347 x2:367+45 y2:347+45 tag:3];
    Pontos * p4 =  [[Pontos alloc] initWithX1:404 y1:408 x2:404+40 y2:408+40 tag:4];
    Pontos * p5 =  [[Pontos alloc] initWithX1:461 y1:383 x2:461+45 y2:383+45 tag:5];
    Pontos * p6 =  [[Pontos alloc] initWithX1:440 y1:449 x2:440+40 y2:449+40 tag:6];
    Pontos * p7 =  [[Pontos alloc] initWithX1:384 y1:477 x2:384+45 y2:477+45 tag:7];
    Pontos * p8 =  [[Pontos alloc] initWithX1:355 y1:560 x2:355+45 y2:560+45 tag:8];
    Pontos * p9 =  [[Pontos alloc] initWithX1:325 y1:478 x2:325+45 y2:478+45 tag:9];
    Pontos * p10 = [[Pontos alloc] initWithX1:285 y1:450 x2:285+40 y2:450+40 tag:10];
    
    NSMutableArray *pontosFase = [[NSMutableArray alloc] initWithObjects:p1, p2, p3, p4, p5, p6, p7, p8, p9,p10, nil];
    return pontosFase;
}

+(NSMutableArray*)retornaPontosFase3{
    //pontos fase abelha
    Pontos * p1 =  [[Pontos alloc] initWithX1:228 y1:436 x2:228+45 y2:436+45 tag:1];
    Pontos * p2 =  [[Pontos alloc] initWithX1:179 y1:477 x2:179+45 y2:477+45 tag:2];
    Pontos * p3 =  [[Pontos alloc] initWithX1:161 y1:540 x2:161+45 y2:540+45 tag:3];
    Pontos * p4 =  [[Pontos alloc] initWithX1:186 y1:603 x2:186+45 y2:603+45 tag:4];
    Pontos * p5 =  [[Pontos alloc] initWithX1:239 y1:642 x2:239+45 y2:642+45 tag:5];
    Pontos * p6 =  [[Pontos alloc] initWithX1:329 y1:641 x2:329+45 y2:641+45 tag:6];
    Pontos * p7 =  [[Pontos alloc] initWithX1:370 y1:688 x2:370+45 y2:688+45 tag:7];
    Pontos * p8 =  [[Pontos alloc] initWithX1:443 y1:727 x2:443+45 y2:727+45 tag:8];
    Pontos * p9 =  [[Pontos alloc] initWithX1:518 y1:713 x2:518+35 y2:713+35 tag:9];
    Pontos * p10 = [[Pontos alloc] initWithX1:555 y1:675 x2:555+35 y2:675+35 tag:10];
    Pontos * p11 = [[Pontos alloc] initWithX1:563 y1:603 x2:563+45 y2:603+45 tag:11];
    Pontos * p12 = [[Pontos alloc] initWithX1:528 y1:525 x2:528+45 y2:525+45 tag:12];
    Pontos * p13 = [[Pontos alloc] initWithX1:464 y1:497 x2:464+45 y2:497+45 tag:13];
    Pontos * p14 = [[Pontos alloc] initWithX1:394 y1:486 x2:394+45 y2:486+45 tag:14];
    Pontos * p15 = [[Pontos alloc] initWithX1:344 y1:438 x2:344+45 y2:438+45 tag:15];
    Pontos * p16 = [[Pontos alloc] initWithX1:281 y1:423 x2:281+45 y2:423+45 tag:16];
    
    
    NSMutableArray *pontosFase = [[NSMutableArray alloc] initWithObjects:p1, p2, p3, p4, p5, p6, p7, p8, p9,p10, p11, p12, p13, p14, p15, p16, nil];
    return pontosFase;
}
+(NSMutableArray*)retornaPontosFase4{
    //pontos fase leaozinho
    Pontos * p1 =  [[Pontos alloc] initWithX1:293 y1:188 x2:293+40 y2:188+40 tag:1];
    Pontos * p2 =  [[Pontos alloc] initWithX1:340 y1:116 x2:340+40 y2:116+40 tag:2];
    Pontos * p3 =  [[Pontos alloc] initWithX1:365 y1:172 x2:365+40 y2:172+40 tag:3];
    Pontos * p4 =  [[Pontos alloc] initWithX1:471 y1:125 x2:471+40 y2:125+40 tag:4];
    Pontos * p5 =  [[Pontos alloc] initWithX1:585 y1:164 x2:585+40 y2:164+40 tag:5];
    Pontos * p6 =  [[Pontos alloc] initWithX1:672 y1:289 x2:672+40 y2:289+40 tag:6];
    Pontos * p7 =  [[Pontos alloc] initWithX1:691 y1:447 x2:691+40 y2:447+40 tag:7];
    Pontos * p8 =  [[Pontos alloc] initWithX1:659 y1:555 x2:659+40 y2:555+40 tag:8];
    Pontos * p9 =  [[Pontos alloc] initWithX1:607 y1:536 x2:607+40 y2:536+40 tag:9];
    Pontos * p10 = [[Pontos alloc] initWithX1:622 y1:596 x2:622+40 y2:596+40 tag:10];
    Pontos * p11 = [[Pontos alloc] initWithX1:551 y1:656 x2:551+40 y2:656+40 tag:11];
    Pontos * p12 = [[Pontos alloc] initWithX1:436 y1:716 x2:436+40 y2:716+40 tag:12];
    Pontos * p13 = [[Pontos alloc] initWithX1:302 y1:652 x2:302+40 y2:652+40 tag:13];
    Pontos * p14 = [[Pontos alloc] initWithX1:299 y1:607 x2:299+40 y2:607+40 tag:14];
    Pontos * p15 = [[Pontos alloc] initWithX1:241 y1:635 x2:241+40 y2:635+40 tag:15];
    Pontos * p16 = [[Pontos alloc] initWithX1:147 y1:565 x2:147+40 y2:565+40 tag:16];
    Pontos * p17 = [[Pontos alloc] initWithX1:86  y1:467 x2:86+40  y2:467+40 tag:17];
    Pontos * p18 = [[Pontos alloc] initWithX1:85  y1:349 x2:85+40  y2:349+40 tag:18];
    Pontos * p19 = [[Pontos alloc] initWithX1:147 y1:235 x2:147+40 y2:235+40 tag:19];
    Pontos * p20 = [[Pontos alloc] initWithX1:245 y1:179 x2:245+40 y2:179+40 tag:20];
    
    
    NSMutableArray *pontosFase = [[NSMutableArray alloc] initWithObjects:p1, p2, p3, p4, p5, p6, p7, p8, p9,p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, nil];
    return pontosFase;
}


@end
