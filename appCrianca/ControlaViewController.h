//
//  ControlaBancoViewController.h
//  appCrianca
//
//  Created by Rafael Cardoso on 18/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "Fase.h"
#import "Jogo.h"
#import "AppDelegate.h"
#import "GestoArcoIris.h"

@interface ControlaViewController : UIViewController

@property AppDelegate *appDelegate;
@property NSManagedObjectContext *context;

@property NSUserDefaults *jogador;

-(NSArray*) getFases;
-(NSArray*) getJogos;
-(NSArray*) getUsuarios;
-(Usuario*) getJogadorAtual;

@property NSFetchRequest *requestJogo;
@property NSFetchRequest *requestFase;
@property NSFetchRequest *requestUsuario;

-(void)salvaFaseVencida :(NSInteger)numeroDoJogo faseAtual:(NSInteger)faseAtual;

-(void)carregaListas;


@property GestoArcoIris* gesto;

@property BOOL ganhou;

@property UIImageView *dedo;
@property UIImageView *ok;
@property UIImageView *arcoiris;

-(void)animacaoFimDaFase;


@end
