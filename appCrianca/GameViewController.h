//
//  GameViewController.h
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 01/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#include "ControlaViewController.h"

@interface GameViewController : ControlaViewController

@property UIButton *buttonFase1;
@property UIButton *buttonFase2;
@property UIButton *buttonFase3;
@property UIButton *buttonFase4;

- (IBAction)sair:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *numeroDeEstrelas;

@end
