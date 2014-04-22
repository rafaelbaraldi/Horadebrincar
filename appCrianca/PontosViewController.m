//
//  PontosViewController.m
//  appCrianca
//
//  Created by RAFAEL BARALDI on 02/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "PontosViewController.h"

@interface PontosViewController ()

@end

@implementation PontosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //[self setFaseAtual:2];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Seta ponto Inicial vazio
    Pontos *ponto = [[Pontos alloc] initWithX1:0 y1:0 x2:0 y2:0 tag:0];
    [self setPontoInicial:ponto];
    
    [self setGanhou:NO];
    
    switch ([self faseAtual]) {
        case 1:
            [self setPontos:[Pontos retornaPontosFase1]];
            [[self tempDrawImage] setImage:[UIImage imageNamed:@"pontosCaracol.png"]];
            [[self tempDrawImage] setAlpha:1];
            [self setAnterior:[UIImage imageNamed:@"pontosCaracol.png"]];
            break;
        case 2:
            [self setPontos:[Pontos retornaPontosFase2]];
            [[self tempDrawImage] setImage:[UIImage imageNamed:@"florzinha.gif"]];
            [[self tempDrawImage] setAlpha:1];
            [self setAnterior:[UIImage imageNamed:@"florzinha.gif"]];
            break;
            
        case 3:
            [self setPontos:[Pontos retornaPontosFase3]];
            [[self tempDrawImage] setImage:[UIImage imageNamed:@"abelhinha.jpg"]];
            [[self tempDrawImage] setAlpha:1];
            [self setAnterior:[UIImage imageNamed:@"abelhinha.jpg"]];
            break;
            
        case 4:
            [self setPontos:[Pontos retornaPontosFase4]];
            [[self tempDrawImage] setImage:[UIImage imageNamed:@"leaozinho.gif"]];
            [[self tempDrawImage] setAlpha:1];
            [self setAnterior:[UIImage imageNamed:@"leaozinho.gif"]];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];

    //Salva Ponto
    for (Pontos* p in [self pontos]) {
        if([p x1] < toque.x && toque.x < [p x2] && [p y1] < toque.y && toque.y < [p y2]){
            [self setPontoFinal:p];
        }
    }
    
    //Desenha linha
    if([[self pontoFinal] tag] - 1  == [[self pontoInicial] tag]){
        
        int x1 = ([[self pontoInicial] x1] + [[self pontoInicial] x2]) /2 ;
        int y1 = ([[self pontoInicial] y1] + [[self pontoInicial] y2]) /2 ;
        CGPoint centro1 = CGPointMake(x1, y1);
        
        int x2 = ([[self pontoFinal] x1] + [[self pontoFinal] x2]) /2;
        int y2 = ([[self pontoFinal] y1] + [[self pontoFinal] y2]) /2;
        CGPoint centro2 = CGPointMake(x2, y2);
        
        //Remove figuras acertadas do vetor
        [[self pontos] removeObject: [self pontoInicial]];
        
        //Desenha linha acertada entre os itens corretos
        if([[self pontoInicial] tag] != 0){
            [self  desenhaLinha:centro1 :centro2];
        }
        
        //Salva ponto Inicial
        [self setPontoInicial:[self pontoFinal]];
    }
    
    //Verifica se ganhou
    if([[self pontos] count] == 1 && ! [self ganhou]){
        
        //Salva a fase vencida
        [self salvaFaseVencida:2 faseAtual:[self faseAtual]];
        
        //Execute animacao no fim da fase
        [self animacaoFimDaFase];
        
        [[self tempDrawImage] setAlpha:0.2];
        
        [self setGesto:[[GestoArcoIris alloc] initWithTarget:self action:@selector(metodoDogesto)]];
        
        [[self view] addGestureRecognizer:[self gesto]];
    }
}


//Esconde Dedo
-(void)hiddenDedo{
    [[self dedo]setHidden:YES];
}


-(void)metodoDogesto{
    [[self ok] removeFromSuperview];
    [[self arcoiris] removeFromSuperview];
    [[self dedo] removeFromSuperview];
    
    [[self view] removeGestureRecognizer:[self gesto]];
    
    _faseAtual++;
    if(_faseAtual > 4){
        [self dismissViewControllerAnimated:YES completion:Nil];
        _faseAtual = 1;
    }
    else{
        [self viewDidLoad];
    }
}

-(void)desenhaLinha:(CGPoint) inicial :(CGPoint) final{
    
    //Desenha a linha reta da farinha ao pao quando a crianca tracar certo
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    [[[self tempDrawImage] image] drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint( contexto, inicial.x, inicial.y);     // ponto inicial da linha (farinha)
    CGContextAddLineToPoint( contexto, final.x, final.y); // ponto final da linha (pao) // falta descobrir o ponto exato
    CGContextSetLineCap( contexto, kCGLineCapRound);
    CGContextSetLineWidth( contexto, 4.0);
//    CGContextSetRGBStrokeColor(contexto, (arc4random()%750)/1000.0, (arc4random()%750)/1000.0, (arc4random()%750)/1000.0, 1.0);
    
    CGContextStrokePath(contexto);
    [[self tempDrawImage] setImage:UIGraphicsGetImageFromCurrentImageContext()];
}

- (IBAction)goHome:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskPortrait;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

@end
