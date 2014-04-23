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
    
    [self criaJogosNoBanco];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* tView = (UILabel*)view;
    if (!tView){
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Arial" size:30]];
        [tView setTextAlignment:NSTextAlignmentCenter];
    }
    
    //Retorna nome do Usuario
    NSString *nome =  ((Usuario*)[[self getUsuarios] objectAtIndex:row]).nome;
    [tView setText:nome];
    
    //Check
    UIImageView *check = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check.png"]];
    [check setFrame:CGRectMake(30, 2, 30, 30)];
    
    
    //Pinta linha selecionada
//    [[pickerView viewForRow:row forComponent:0] setBackgroundColor:[UIColor colorWithRed:99.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1.0]];
    [[pickerView viewForRow:row forComponent:0] setBackgroundColor:[UIColor whiteColor]];
    [[pickerView viewForRow:row forComponent:0] addSubview:check];
    
    return tView;
}


-(void)criaJogosNoBanco{
    
    if([[self getJogos] count] == 0){
    
        Jogo *newJogo = [NSEntityDescription insertNewObjectForEntityForName:@"Jogo" inManagedObjectContext:[self context]];
        [newJogo setNome:@"ligueAsFiguras"];

        Jogo *newJogo2 = [NSEntityDescription insertNewObjectForEntityForName:@"Jogo" inManagedObjectContext:[self context]];
        [newJogo2 setNome:@"ligueMatematica"];

        Jogo *newJogo3 = [NSEntityDescription insertNewObjectForEntityForName:@"Jogo" inManagedObjectContext:[self context]];
        [newJogo3 setNome:@"ligueOsPontos"];

        Jogo *newJogo4 = [NSEntityDescription insertNewObjectForEntityForName:@"Jogo" inManagedObjectContext:[self context]];
        [newJogo4 setNome:@"saiaDoLabirinto"];

        [[self context] save:nil];
    }
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

-(BOOL)verificaJogador{
    
    if([[self getUsuarios] count] <= 0){
    
        NSLog(@"Adicione um Jogador");
        
        return false;
    }
    
    return true;
}

- (IBAction)jogar:(id)sender {
    
    if([self verificaJogador]){
        //Salva jogar atual
        NSUserDefaults *jogador = [NSUserDefaults standardUserDefaults];
        [jogador setInteger:[[self listaCriancas] selectedRowInComponent:0] forKey:@"jogador"];
        
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
