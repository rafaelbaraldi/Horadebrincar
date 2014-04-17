//
//  LoginViewController.h
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 16/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "AppDelegate.h"
#import "GameViewController.h"

@interface LoginViewController : UIViewController <UIPickerViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *listaCriancas;
@property (strong, nonatomic) IBOutlet UITextField *textoNomeUsuario;

- (IBAction)addUsuario:(id)sender;
- (IBAction)jogar:(id)sender;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property AppDelegate *appDelegate;
@property NSManagedObjectContext *context;

@property (strong, nonatomic) IBOutlet UIButton *botaoMais;
@end
