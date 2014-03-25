//
//  Draw.m
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 25/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "Draw.h"

@implementation Draw

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//- (void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//    
//    CGPoint center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextBeginPath(ctx);
//    
//    //6 CGContextSetLineWidth(ctx, 5);
//    CGContextAddArc(ctx, center.x, center.y, 100.0, 0, 2*M_PI, 0);
//    CGContextStrokePath(ctx);
//    
//}




@end
