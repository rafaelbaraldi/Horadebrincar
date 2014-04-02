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

@interface PontosViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;

@property BOOL ganhou;
@property UIImageView *ok;
@property UIImageView *dedo;
@property UIImageView *arcoiris;
@property GestoArcoIris* gesto;

@property int faseAtual;

@property NSMutableArray *pontos;

@property UIImage* anterior;

@property Pontos *pontoFinal;
@property Pontos *pontoInicial;

@end
