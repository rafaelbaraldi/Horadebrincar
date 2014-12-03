//
//  LoginViewController.h
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 16/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"
#import "ControlaViewController.h"

@interface LoginViewController : ControlaViewController <UIPickerViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *listaCriancas;
@property (strong, nonatomic) IBOutlet UITextField *textoNomeUsuario;

- (IBAction)addUsuario:(id)sender;
- (IBAction)jogar:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *lblhora;
@property (strong, nonatomic) IBOutlet UILabel *lblde;
@property (strong, nonatomic) IBOutlet UILabel *lblbrincar;



@property (strong, nonatomic) IBOutlet UIButton *btnIniciar;

@property (strong, nonatomic) IBOutlet UIButton *botaoMais;
@end
