//
//  ViewController.h
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 25/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Figura.h"
#include "GestoArcoIris.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;


@property CGPoint lastPoint;
@property UIImage* anterior;

@property BOOL ganhou;

@property NSMutableArray* figuras;

@property Figura* figuraInicial;

@end
