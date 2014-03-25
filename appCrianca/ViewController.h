//
//  ViewController.h
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 25/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "draw.h"

@interface ViewController : UIViewController{
    
    CGPoint lastPoint;
    BOOL mouseSwiped;
    

    CGFloat brush;

    
    
    
}
@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;

@end
