//
//  GameViewController.m
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 01/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "GameViewController.h"
#import "MenuViewController.h"
#import "MathViewController.h"
#import "PontosViewController.h"
#import "LabirintoViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{

    [self carregaNumeroDeEstrelas];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Criar Jogos no banco
//    [self criaJogosNoBanco];
    
    //Frase - Selecione o nivel
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, [self view].bounds.size.width, 60)];
    [title setText:@"Selecione um jogo"];
    [title setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:60.0f]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [[self view]addSubview:title];
    
    [self carregaBotoes];
}

-(void)carregaNumeroDeEstrelas{
    
    int qtdEstrelas = 0;
    for(int i = 0; i < [[self getFases] count]; i++){
        
        Fase *faseAtual = [[self getFases] objectAtIndex:i];
        
        Usuario * u = (Usuario*)[faseAtual usuario];
        
        if([[u nome]isEqualToString:[[self getJogadorAtual] nome]]){
            qtdEstrelas++;
        }
    }
    
    [[self numeroDeEstrelas] setText:[NSString stringWithFormat:@"%i", qtdEstrelas]];
}


-(void)carregaBotoes{
    
    //Button 1
    [self setButtonFase1:[[UIButton alloc] initWithFrame:CGRectMake(100, 300, 250, 250)]];
    [[self buttonFase1] setBackgroundImage:[UIImage imageNamed:@"liguaAsFiguras.png"] forState:UIControlStateNormal];
    [[self buttonFase1]setTag:1];
    [[[self buttonFase1] layer] setBorderColor:[UIColor blackColor].CGColor];
    [[[self buttonFase1] layer] setBorderWidth:2];
    [[self buttonFase1]addTarget:self action:@selector( botaoIrFaseSelecionada: ) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase1]];
    
    //Button 2
    [self setButtonFase2:[[UIButton alloc] initWithFrame:CGRectMake((200+[self buttonFase1].bounds.size.width), 300, 250, 250)]];
    [[self buttonFase2] setBackgroundImage:[UIImage imageNamed:@"Liguematematica.png"] forState:UIControlStateNormal];
    [[self buttonFase2] setTag:2];
    [[[self buttonFase2] layer] setBorderColor:[UIColor blackColor].CGColor];
    [[[self buttonFase2] layer] setBorderWidth:2];
    [[self buttonFase2] addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase2]];
    
    //Button 3
    [self setButtonFase3:[[UIButton alloc] initWithFrame:CGRectMake(100, 600, 250, 250)]];
    [[self buttonFase3] setBackgroundImage:[UIImage imageNamed:@"ligueOsPontos.jpg"] forState:UIControlStateNormal];
    [[[self buttonFase3] layer] setBorderColor:[UIColor blackColor].CGColor];
    [[[self buttonFase3] layer] setBorderWidth:3];
    [[self buttonFase3]setTag:3];
    [[self buttonFase3]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase3]];
    
    //Button 4
    [self setButtonFase4:[[UIButton alloc] initWithFrame:CGRectMake((200+[self buttonFase1].bounds.size.width), 600, 250, 250)]];
    [[self buttonFase4] setBackgroundImage:[UIImage imageNamed:@"saiaDoLabirinto.png"] forState:UIControlStateNormal];
    [[[self buttonFase4] layer] setBorderColor:[UIColor blackColor].CGColor];
    [[[self buttonFase4] layer] setBorderWidth:2];
    [[self buttonFase4]setTag:3];
    [[self buttonFase4]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase4]];
    [[self buttonFase4]setTag:4];
    [[self buttonFase4]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase4]];
}

-(void)botaoIrFaseSelecionada: (id) sender {
    UIButton *botao = (UIButton *) sender;
    
    UIViewController* newcontroller;
    newcontroller = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil] ;
    
    [[newcontroller view] setTag:[botao tag]];

    [self presentViewController: newcontroller animated:YES completion:Nil];
}


//- (NSUInteger)supportedInterfaceOrientations
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return UIInterfaceOrientationMaskPortrait;
//    } else {
//        return UIInterfaceOrientationMaskPortrait;
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sair:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
