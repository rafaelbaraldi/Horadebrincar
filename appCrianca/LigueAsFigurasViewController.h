//
//  ViewController.h
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 25/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Figura.h"
#import "ControlaViewController.h"

@interface LigueAsFigurasViewController : ControlaViewController

@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (strong, nonatomic) IBOutlet UIButton *botaoVoltar;

@property CGPoint lastPoint;
@property UIImage* anterior;

@property int faseAtual;

@property Figura* figuraInicial;
@property NSMutableArray* figuras;
@property NSMutableArray *vetorRemover;


@end
