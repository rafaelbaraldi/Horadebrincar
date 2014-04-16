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

@interface LigueAsFigurasViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (strong, nonatomic) IBOutlet UIButton *botaoVoltar;


@property CGPoint lastPoint;
@property UIImage* anterior;
@property BOOL ganhou;
@property UIImageView *dedo;
@property UIImageView *ok;
@property UIImageView *arcoiris;
@property GestoArcoIris* gesto;
@property int faseAtual;



@property Figura* figuraInicial;
@property NSMutableArray* figuras;
@property NSMutableArray *vetorRemover;


@end
