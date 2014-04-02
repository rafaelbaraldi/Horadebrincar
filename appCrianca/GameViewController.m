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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Frase - Selecione o nivel
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, [self view].bounds.size.width, 60)];
    [title setText:@"Selecione um jogo"];
    [title setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:60.0f]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [[self view]addSubview:title];
    
    //Button 1
    [self setButtonFase1: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 - 250,
                                                                     [self view].bounds.size.height*2/8, 500, 100)] ];
    [[[self buttonFase1]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase1]setTitle:@"Ligue as Figuras" forState:UIControlStateNormal];
    [[self buttonFase1]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self buttonFase1]setBackgroundColor: [UIColor greenColor]];
    [[self buttonFase1]setTag:1];
    [[[self buttonFase1] layer]setCornerRadius:20];
    [[self buttonFase1]addTarget:self action:@selector( botaoIrFaseSelecionada: ) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase1]];
    
    //Button 2
    [self setButtonFase2: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 - 250,
                                                                     [self view].bounds.size.height*3/8, 500, 100)]];
    [[[self buttonFase2]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase2]setTitle:@"Matemática" forState:UIControlStateNormal];
    [[self buttonFase2]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self buttonFase2]setBackgroundColor: [UIColor yellowColor]];
    [[self buttonFase2]setTag:2];
    [[[self buttonFase2] layer]setCornerRadius:20];
    [[self buttonFase2]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase2]];
    
    //Button 3
    [self setButtonFase3: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 - 250,
                                                                     [self view].bounds.size.height*4/8, 500, 100)]];
    [[[self buttonFase3]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase3]setTitle:@"Ligue os Pontos" forState:UIControlStateNormal];
    [[self buttonFase3]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self buttonFase3]setBackgroundColor: [UIColor redColor]];
    [[self buttonFase3]setTag:3];
    [[[self buttonFase3] layer]setCornerRadius:20];
    [[self buttonFase3]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase3]];
    
    //Button 4
    [self setButtonFase4: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 - 250,
                                                                     [self view].bounds.size.height*5/8, 500, 100)]];
    [[[self buttonFase4]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase4]setTitle:@"Saia do Labirinto" forState:UIControlStateNormal];
    [[self buttonFase4]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self buttonFase4]setBackgroundColor: [UIColor purpleColor]];
    [[self buttonFase4]setTag:4];
    [[[self buttonFase4] layer]setCornerRadius:20];
    [[self buttonFase4]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase4]];
}

-(void)botaoIrFaseSelecionada: (id) sender {
    UIButton *botao = (UIButton *) sender;
    
    UIViewController* newcontroller;
    
    switch (botao.tag) {
        case 1:
            newcontroller = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil] ;
            break;
            
        case 2:
            newcontroller = [[MathViewController alloc] initWithNibName:@"MathViewController" bundle:nil] ;
            break;
            
        case 3:
            newcontroller = [[PontosViewController alloc] initWithNibName:@"PontosViewController" bundle:nil] ;
            break;
            
        case 4:
            newcontroller = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil] ;
            break;
    }
        
    [self presentViewController: newcontroller animated:YES completion:Nil];
}


- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskPortrait;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
