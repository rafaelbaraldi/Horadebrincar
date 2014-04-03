//
//  MenuViewController.m
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 28/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "MenuViewController.h"
#import "ViewController.h"
#import "MathViewController.h"
#import "LabirintoViewController.h"

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
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, [self view].bounds.size.width, 60)];
    [title setText:@"Selecione um nivel"];
    [title setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:60.0f]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [[self view]addSubview:title];
    
    
    //Button 1
    [self setButtonFase1: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
                                                                     [self view].bounds.size.height*2/8, 100, 100)] ];
    [[[self buttonFase1]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase1]setTitle:@"1" forState:UIControlStateNormal];
    [[self buttonFase1]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self buttonFase1]setBackgroundColor: [UIColor greenColor]];
    [[self buttonFase1]setTag:1];
    [[[self buttonFase1] layer]setCornerRadius:20];
    [[self buttonFase1]addTarget:self action:@selector( botaoIrFaseSelecionada: ) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase1]];
    [self controlaEstrela:[self  buttonFase1]];
    
     //Button 2
    [self setButtonFase2: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
                                                                     [self view].bounds.size.height*3/8, 100, 100)]];
    [[[self buttonFase2]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase2]setTitle:@"2" forState:UIControlStateNormal];
    [[self buttonFase2]setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[self buttonFase2]setBackgroundColor: [UIColor yellowColor]];
    [[self buttonFase2]setTag:2];
    [[[self buttonFase2] layer]setCornerRadius:20];
    [[self buttonFase2]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase2]];
    [self controlaEstrela:[self  buttonFase2]];
    
    //Button 3
    [self setButtonFase3: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
                                                                     [self view].bounds.size.height*4/8, 100, 100)]];
    [[[self buttonFase3]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase3]setTitle:@"3" forState:UIControlStateNormal];
    [[self buttonFase3]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self buttonFase3]setBackgroundColor: [UIColor redColor]];
    [[self buttonFase3]setTag:3];
    [[[self buttonFase3] layer]setCornerRadius:20];
    [[self buttonFase3]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase3]];
    [self controlaEstrela:[self  buttonFase3]];
    
    //Button 4
    [self setButtonFase4: [[UIButton alloc] initWithFrame:CGRectMake([self view].bounds.size.width/2 -50,
                                                                     [self view].bounds.size.height*5/8, 100, 100)]];
    [[[self buttonFase4]titleLabel]setFont:[UIFont fontWithName:@"Chalkduster" size:36.0f]];
    [[self buttonFase4]setTitle:@"4" forState:UIControlStateNormal];
    [[self buttonFase4]setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self buttonFase4]setBackgroundColor: [UIColor purpleColor]];
    [[self buttonFase4]setTag:4];
    [[[self buttonFase4] layer]setCornerRadius:20];
    [[self buttonFase4]addTarget:self action:@selector(botaoIrFaseSelecionada:) forControlEvents:UIControlEventTouchDown];
    [[self view] addSubview: [self buttonFase4]];
    [self controlaEstrela:[self  buttonFase4]];
}

//Recarrega as estrelas
-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    for (UIImageView* fase in [self estrelas]) {
        BOOL statusEstrela = (BOOL)[prefs boolForKey:[NSString stringWithFormat:@"jogo %d - fase %d", self.view.tag, fase.tag]];
        
        if(statusEstrela){
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
    
    ViewController *vc;
    MathViewController *mv;
    LabirintoViewController *lv;
    
    
    switch (fase) {
        case 1:
            vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] ;
            [vc setFaseAtual: [botao tag]];
            [self presentViewController: vc animated:YES completion:Nil];
            break;
            
        case 2:
            mv = [[MathViewController alloc] initWithNibName:@"MathViewController" bundle:nil] ;
            [mv setFaseAtual: [botao tag]];
            [self presentViewController: mv animated:YES completion:Nil];
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


- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskPortrait;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
