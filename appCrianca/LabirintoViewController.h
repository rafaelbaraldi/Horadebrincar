//
//  LabirintoViewController.h
//  appCrianca
//
//  Created by RAFAEL BARALDI on 02/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestoLabirinto.h"

@interface LabirintoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;

@property CGPoint lastPoint;

@property GestoLabirinto* gesto;

@end
