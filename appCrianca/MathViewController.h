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
#import "ControlaViewController.h"

@interface MathViewController : ControlaViewController


@property (strong, nonatomic) IBOutlet UIImageView *tempDrawImage;

@property CGPoint lastPoint;
@property UIImage* anterior;
@property int faseAtual;

@property UILabel *labelInicial;
@property NSMutableArray *equation; // guarda os labels para removelos da view quando sair da mesma
@property NSMutableArray *solution; // guarda os labels para removelos da view quando sair da mesma
@property NSMutableArray *contas;   // guarda os labels que tem as expressoes que ainda faltam para passar a fase
@property NSMutableArray *acertos;  // guarda os labels que tem as expressoes acertadas para redesenhar qdo girar o device




@end
