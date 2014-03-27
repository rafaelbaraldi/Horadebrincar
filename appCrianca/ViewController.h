//
//  ViewController.h
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 25/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Figura.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;


@property CGPoint lastPoint;
@property UIImage* anterior;

@property NSMutableArray* figuras;

@property BOOL acertou1;
@property BOOL acertou2;
@property BOOL acertou3;
@property BOOL acertou4;

@property Figura* figuraInicial;

@end
