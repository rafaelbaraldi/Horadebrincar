//
//  ControlaBancoViewController.m
//  appCrianca
//
//  Created by Rafael Cardoso on 18/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "ControlaViewController.h"

@interface ControlaViewController ()

@end

@implementation ControlaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _jogador = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _appDelegate =[[UIApplication sharedApplication]delegate];
    _context = [_appDelegate managedObjectContext];
    
    _requestJogo = [NSFetchRequest fetchRequestWithEntityName:@"Jogo"];
    _requestFase = [NSFetchRequest fetchRequestWithEntityName:@"Fase"];
    _requestUsuario = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Usuario *)getJogadorAtual{
    
    return [[self getUsuarios] objectAtIndex:[[self jogador] integerForKey:@"jogador"]];
}

-(NSArray *)getUsuarios{
    
    return [[self context] executeFetchRequest:[self requestUsuario] error:nil];
}

-(NSArray *)getJogos{
    return [[self context] executeFetchRequest:[self requestJogo] error:nil];
}

-(NSArray *)getFases{
    return [[self context] executeFetchRequest:[self requestFase] error:nil];
}


-(void)salvaFaseVencida :(NSInteger)numeroDoJogo faseAtual:(NSInteger)faseAtual{
    
    NSNumber *verificaFase = [[NSNumber alloc] initWithInt:faseAtual];
    
    for(int i = 0; i < [[self getFases] count]; i++){
        
        Fase *faseAtual = [[self getFases] objectAtIndex:i];
        
        Usuario * u = (Usuario*)[faseAtual usuario];
        
        if([[[self getFases] objectAtIndex:i] numero] == verificaFase
           && [u nome] == [[self getJogadorAtual] nome]
           && [faseAtual jogo] == (Jogo*)[[self getJogos] objectAtIndex:numeroDoJogo]){
            return;
        }
    }
    
    
    Fase *newFase = [NSEntityDescription insertNewObjectForEntityForName:@"Fase" inManagedObjectContext:[self context]];
    
    NSNumber *faseVencida = [[NSNumber alloc] initWithInt:faseAtual];
    [newFase setNumero:faseVencida];
    [newFase setUsuario:[self getJogadorAtual]];
    [newFase setJogo:(Jogo*)[[self getJogos] objectAtIndex:numeroDoJogo]];
    
    [[self context] save:nil];
}

-(void)animacaoFimDaFase{
    
    //Set Alpha do Jogo
    [self setGanhou:YES];
    
    //OK
    _ok = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ok.png"]];
    [_ok setFrame:CGRectMake([[self view] bounds].size.width/2-75, CGRectGetMidY([self view].frame), 150, 150)];
    [self.view addSubview:_ok];
    [[_ok layer] setOpacity:0];
    
    CABasicAnimation *animacao = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animacao.duration = 3;
    animacao.removedOnCompletion = NO;
    animacao.fillMode = kCAFillModeForwards;
    animacao.toValue = [NSNumber numberWithFloat:1.0f];
    [[_ok layer] addAnimation:animacao forKey:nil];
    
    [self performSelector:@selector(animaArcoComDedo) withObject:nil afterDelay:1.2];
}

//Anima Arco e Dedo
-(void)animaArcoComDedo{
    
    //Adiciona arco-iris
    _arcoiris = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arcoiris.png"]];
    [_arcoiris setFrame:CGRectMake(35, 300, 700, 343)];
    [self.view addSubview:_arcoiris];
    
    //Adiciona o dedo
    _dedo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"finger.png"]];
    [_dedo setFrame:CGRectMake(95, 560, 156, 250)];
    [_dedo setTransform:CGAffineTransformMakeRotation(-(M_PI / 4))];
    [self.view addSubview:_dedo];
    
    //Roda dedo
    CABasicAnimation *animRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animRotation.toValue  = @(M_PI / 4);
    animRotation.duration = 3;
    animRotation.repeatCount = 3;
    [[self dedo].layer addAnimation:animRotation forKey:@"position.z"];
    
    CGMutablePathRef caminho = CGPathCreateMutable();
    CGPathMoveToPoint(caminho, NULL, 160, 700);
    CGPathAddCurveToPoint(caminho, NULL, 260, 400, 530, 400, 590, 670);
    
    CAKeyframeAnimation *animaDedo = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animaDedo setPath:caminho];
    [animaDedo setDuration:3];
    [animaDedo setRepeatCount:3];
    [animaDedo setRemovedOnCompletion:NO];
    [animaDedo setFillMode:kCAFillModeForwards];
    [[[self dedo] layer]addAnimation:animaDedo forKey:nil];
    
    //Gamb para sumir com o Dedo
    [self performSelector:@selector(hiddenDedo) withObject:nil afterDelay:9];
}

//Some com o dedo
-(void)hiddenDedo{
    [[self dedo]setHidden:YES];
}


@end

