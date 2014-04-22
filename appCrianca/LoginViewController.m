//
//  LoginViewController.m
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 16/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self listaCriancas] setDelegate:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [tap setNumberOfTapsRequired:1];
    [tap setNumberOfTouchesRequired:1];
    [tap setCancelsTouchesInView:NO];
    [tap setDelegate:self];
    [[self listaCriancas] addGestureRecognizer:tap];
    
    //Inicia com Jogador 1
    NSUserDefaults *jogador = [NSUserDefaults standardUserDefaults];
    [jogador setInteger:0 forKey:@"jogador"];
    
    //    [self deletarUsuarios];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [[self getUsuarios] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return ((Usuario*)[[self getUsuarios] objectAtIndex:row]).nome;
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //NSArray *objects = [[self context] executeFetchRequest:[self requestUsuario] error:nil];
    
    //Salva jogar atual
    NSUserDefaults *jogador = [NSUserDefaults standardUserDefaults];
    [jogador setInteger:row forKey:@"jogador"];
}

-(BOOL)verificaJogador{
    
    if([[self getUsuarios] count] <= 0){
    
        NSLog(@"Adicione um Jogador");
        
        return false;
    }
    
    return true;
}

- (IBAction)jogar:(id)sender {
    
    if([self verificaJogador]){
        //Chama GameViewController
        GameViewController *gm = [[GameViewController alloc] init];
        [self presentViewController:gm animated:YES completion:nil];
    }
}

- (IBAction)addUsuario:(id)sender {
    [self showKeyboard];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [[self listaCriancas] setHidden:NO];
    
    Usuario *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:[self context]];

    [newContact setNome:[textField text]];
    [newContact setFase1:nil];

    [[self context] save:nil];
    
    [[self listaCriancas] reloadAllComponents];

    [self dismissKeyboard];
    
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self dismissKeyboard];
    
    return YES;
}

-(void)showKeyboard{
    [[self textoNomeUsuario] setHidden:NO];
    
    [[self textoNomeUsuario] becomeFirstResponder];
    
    [[self botaoMais]setHidden:YES];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    [self dismissKeyboard];
    return YES;
}

-(void)dismissKeyboard{
    [[self textoNomeUsuario] setHidden:YES];
    
    [[self textoNomeUsuario] resignFirstResponder];
    
    [[self botaoMais]setHidden:NO];
    
    [[self textoNomeUsuario] setText:@""];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismissKeyboard];
}

-(void)deletarUsuarios{
    
    NSArray *entityObjects = [[self context] executeFetchRequest:[self requestUsuario] error:nil];
    
    for(Usuario *u in entityObjects){
        [[self context] deleteObject:u];
    }
    
    [[self context] save:nil];
}

@end
