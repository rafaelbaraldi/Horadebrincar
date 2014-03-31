//
//  Figura.h
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 26/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Figura : NSObject

@property int x1;
@property int x2;
@property int y1;
@property int y2;
@property NSString *tag;

+(NSMutableArray*)retornaFiguraFase1;
+(NSMutableArray*)retornaFiguraFase2;
+(NSMutableArray*)retornaFiguraFase3;

-(id)initWithX1:(int)x1 y1:(int)y1 x2:(int)x2 y2:(int)y2 tag:(NSString*)tag;

@end