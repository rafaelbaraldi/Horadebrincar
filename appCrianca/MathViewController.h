//
//  MathViewController.h
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 01/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestoArcoIris.h"
#import "Contas.h"

@interface MathViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;

@property CGPoint lastPoint;
@property UIImage* anterior;
@property BOOL ganhou;
@property UIImageView *dedo;
@property UIImageView *ok;
@property UIImageView *arcoiris;
@property GestoArcoIris* gesto;
@property int faseAtual;

@property UILabel *labelInicial;
@property NSMutableArray *equation;
@property NSMutableArray *solution;
@property NSMutableArray *contas;


@end
