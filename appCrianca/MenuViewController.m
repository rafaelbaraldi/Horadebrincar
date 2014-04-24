//
//  MenuViewController.m
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 28/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "MenuViewController.h"
#import "LigueAsFigurasViewController.h"
#import "MathViewController.h"
#import "LabirintoViewController.h"
#import "PontosViewController.h"

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
    
    //Alloc Array de Estrelas
    [self setEstrelas:[[NSMutableArray alloc]init]];
    
    //Frase - Selecione o nivel
//    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, [self view].bounds.size.width, 60)];
    [[self lblTitle] setText:@"Selecione um nivel"];
    [[self lblTitle] setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:60.0f]];
    [[self lblTitle] setTextAlignment:NSTextAlignmentCenter];
//    [[self view]addSubview:title];
    
    [self carregaFases];
}

-(void)carregaFases{
    
    //Button 1
//    [self setButtonFase1: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
//                                                                     [self view].bounds.size.height*2/8, 100, 100)] ];
    [[[self buttonFase1]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase1]setTitle:@"1" forState:UIControlStateNormal];
    [[self buttonFase1]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self buttonFase1]setBackgroundColor: [UIColor greenColor]];
    [[self buttonFase1]setTag:1];
    [[[self buttonFase1] layer]setCornerRadius:20];
    [[self buttonFase1]addTarget:self action:@selector( botaoIrFaseSelecionada: ) forControlEvents:UIControlEventTouchDown];
//    [[self view] addSubview: [self buttonFase1]];
    [self controlaEstrela:[self  buttonFase1]];
    
    //Button 2
//    [self setButtonFase2: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
//                                                                     [self view].bounds.size.height*3/8, 100, 100)]];
    [[[self buttonFase2]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase2]setTitle:@"2" forState:UIControlStateNormal];
    [[self buttonFase2]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self buttonFase2]setBackgroundColor: [UIColor yellowColor]];
    [[self buttonFase2]setTag:2];
    [[[self buttonFase2] layer]setCornerRadius:20];
    [[self buttonFase2]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
//    [[self view] addSubview: [self buttonFase2]];
    [self controlaEstrela:[self  buttonFase2]];
    
    //Button 3
//    [self setButtonFase3: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
//                                                                     [self view].bounds.size.height*4/8, 100, 100)]];
    [[[self buttonFase3]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase3]setTitle:@"3" forState:UIControlStateNormal];
    [[self buttonFase3]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self buttonFase3]setBackgroundColor: [UIColor redColor]];
    [[self buttonFase3]setTag:3];
    [[[self buttonFase3] layer]setCornerRadius:20];
    [[self buttonFase3]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
//    [[self view] addSubview: [self buttonFase3]];
    [self controlaEstrela:[self  buttonFase3]];
    
    //Button 4
//    [self setButtonFase4: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
//                                                                     [self view].bounds.size.height*5/8, 100, 100)]];
    [[[self buttonFase4]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase4]setTitle:@"4" forState:UIControlStateNormal];
    [[self buttonFase4]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self buttonFase4]setBackgroundColor: [UIColor purpleColor]];
    [[self buttonFase4]setTag:4];
    [[[self buttonFase4] layer]setCornerRadius:20];
    [[self buttonFase4]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
//    [[self view] addSubview: [self buttonFase4]];
    [self controlaEstrela:[self  buttonFase4]];
}

//Recarrega as estrelas
-(void)viewWillAppear:(BOOL)animated{
    if([[self view]tag] == 1){
        //Button 5
//        [self setButtonFase5: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
//                                                                         ([self view].bounds.size.height*6/8), 100, 100)]];
        [[self buttonFase5]setHidden:NO];
        [[[self buttonFase5]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
        [[self buttonFase5]setTitle:@"∞" forState:UIControlStateNormal];
        [[self buttonFase5]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [[self buttonFase5]setBackgroundColor: [UIColor grayColor]];
        [[self buttonFase5]setTag:5];
        [[[self buttonFase5] layer]setCornerRadius:20];
        [[self buttonFase5]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
//        [[self view] addSubview: [self buttonFase5]];
        [self controlaEstrela:[self  buttonFase5]];
    }
    
    if([[self getFases] count] == 0){
        return;
    }
    
    for(int i = 0; i < [[self getFases] count]; i++){
    
        int pintarEstrela = [[[[self getFases] objectAtIndex:i] numero] intValue];
        
        Usuario * u = (Usuario*)[[[self getFases] objectAtIndex:i] usuario];
        Jogo* jogoDaFase = (Jogo*)[[[self getFases] objectAtIndex:i] jogo];
        
        Jogo *jogoAtual = (Jogo*)[[self getJogos] objectAtIndex:[self view].tag -1];
        
        if([[u nome]isEqualToString:[[self getJogadorAtual] nome]] && [[jogoDaFase nome] isEqualToString:[jogoAtual nome]]){
            
            UIImageView *fase = [[self estrelas] objectAtIndex:pintarEstrela-1];
            [fase setImage:[UIImage imageNamed:@"starYellow.png"]];
        }
    }
    
}

-(void)controlaEstrela:(UIButton*)fase{
    
    //Inicia estrela
    UIImageView *star = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"starBlack.png"]];
    star.tag = fase.tag;
    [[star layer]setFrame:CGRectMake(fase.bounds.size.width - 10, fase.bounds.size.height - 20, 20, 20)];
    [fase addSubview: star];
    [[self estrelas] addObject:star];
}

-(void)botaoIrFaseSelecionada: (id) sender {
    
    int fase = [[self view] tag];
    
    UIButton *botao = (UIButton *) sender;
    
    LigueAsFigurasViewController *vc;
    MathViewController *mv;
    LabirintoViewController *lv;
    PontosViewController *pv;
    
    switch (fase) {
        case 1:
            vc = [[LigueAsFigurasViewController alloc] initWithNibName:@"LigueAsFigurasViewController" bundle:nil] ;
            [vc setFaseAtual: [botao tag]];
            [self presentViewController: vc animated:YES completion:Nil];
            break;
            
        case 2:
            mv = [[MathViewController alloc] initWithNibName:@"MathViewController" bundle:nil] ;
            [mv setFaseAtual: [botao tag]];
            [self presentViewController: mv animated:YES completion:Nil];
            break;
            
        case 3:
            pv = [[PontosViewController alloc] initWithNibName:@"PontosViewController" bundle:nil] ;
            [pv setFaseAtual: [botao tag]];
            [self presentViewController: pv animated:YES completion:Nil];
            break;
            
        case 4:
            lv = [[LabirintoViewController alloc] initWithNibName:@"LabirintoViewController" bundle:nil] ;
            [lv setFaseAtual: [botao tag]];
            [self presentViewController: lv animated:YES completion:Nil];
            break;
            
        default:
            break;
    }
}

//- (NSUInteger)supportedInterfaceOrientations
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return UIInterfaceOrientationMaskPortrait;
//    } else {
//        return UIInterfaceOrientationMaskPortrait;
//    }
//}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
