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
    
    _appDelegate =[[UIApplication sharedApplication]delegate];
    _context = [_appDelegate managedObjectContext];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [tap setNumberOfTapsRequired:1];
    [tap setNumberOfTouchesRequired:1];
    [tap setCancelsTouchesInView:NO];
    [tap setDelegate:self];
    [[self listaCriancas] addGestureRecognizer:tap];
    
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
    
    NSInteger numeroDeUsuarios;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    
    NSArray *objects = [_context executeFetchRequest:request error:nil];
    numeroDeUsuarios = objects.count;
    
    return numeroDeUsuarios;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    
    NSArray *objects = [_context executeFetchRequest:request error:nil];
    
    return ((Usuario*)[objects objectAtIndex:row]).nome;
}


- (IBAction)addUsuario:(id)sender {
    [self showKeyboard];
}

- (IBAction)jogar:(id)sender {
    
    GameViewController *gm = [[GameViewController alloc] init];
    [self presentViewController:gm animated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    Usuario *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:_context];

//    NSLog([textField text]);
    [newContact setNome:[textField text]];
    [newContact setFase1:nil];

    [_context save:nil];
    
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
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    NSArray *entityObjects = [[self context] executeFetchRequest:request error:nil];
    
    for(Usuario *u in entityObjects){
        [[self context] deleteObject:u];
    }
    
    [[self context] save:nil];
}

@end
