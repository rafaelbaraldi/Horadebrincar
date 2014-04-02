//
//  Pontos.h
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 02/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pontos : NSObject

@property int x1;
@property int x2;
@property int y1;
@property int y2;
@property NSString *tag;

-(id)initWithX1:(int)x1 y1:(int)y1 x2:(int)x2 y2:(int)y2;
+(NSMutableArray*)retornaPontosFase1;
+(NSMutableArray*)retornaPontosFase2;
+(NSMutableArray*)retornaPontosFase3;
+(NSMutableArray*)retornaPontosFase4;

@end
