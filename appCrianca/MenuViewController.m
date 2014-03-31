//
//  MenuViewController.m
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 28/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "MenuViewController.h"
#import "ViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setButtonFase1: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
                                                                     [self view].bounds.size.height*2/8, 100, 100)] ];
    [[self buttonFase1]setTitle:@"1" forState:UIControlStateNormal];
    [[self buttonFase1]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self buttonFase1]setBackgroundColor: [UIColor greenColor]];
    [[self buttonFase1]setTag:1];
    [[self buttonFase1]addTarget:self action:@selector( botaoIrFaseSelecionada: ) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase1]];
    
    [self setButtonFase2: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
                                                                     [self view].bounds.size.height*3/8, 100, 100)]];
    [[self buttonFase2]setTitle:@"2" forState:UIControlStateNormal];
    [[self buttonFase2]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self buttonFase2]setBackgroundColor: [UIColor yellowColor]];
    [[self buttonFase2]setTag:2];
    [[self buttonFase2]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase2]];
    
    [self setButtonFase3: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
                                                                     [self view].bounds.size.height*4/8, 100, 100)]];
    [[self buttonFase3]setTitle:@"3" forState:UIControlStateNormal];
    [[self buttonFase3]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self buttonFase3]setBackgroundColor: [UIColor redColor]];
    [[self buttonFase3]setTag:3];
    [[self buttonFase3]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase3]];
    
    [self setButtonFase4: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
                                                                     [self view].bounds.size.height*5/8, 100, 100)]];
    [[self buttonFase4]setTitle:@"4" forState:UIControlStateNormal];
    [[self buttonFase4]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self buttonFase4]setBackgroundColor: [UIColor purpleColor]];
    [[self buttonFase4]setTag:4];
    [[self buttonFase4]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase4]];
}

-(void)botaoIrFaseSelecionada: (id) sender {
    UIButton *botao = (UIButton *) sender;
    ViewController * newcontroller = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] ;
    [newcontroller setFaseAtual: [botao tag]];
    [self presentViewController: newcontroller animated:YES completion:Nil];
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
