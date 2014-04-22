//
//  PontosViewController.h
//  appCrianca
//
//  Created by RAFAEL BARALDI on 02/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestoArcoIris.h"
#import "Pontos.h"
#import "ControlaViewController.h"

@interface PontosViewController : ControlaViewController

@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;

@property int faseAtual;

@property NSMutableArray *pontos;

@property UIImage* anterior;

@property Pontos *pontoFinal;
@property Pontos *pontoInicial;

@end
