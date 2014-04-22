//
//  ViewController.m
//  appCrianca
//
//  Created by RAFAEL CARDOSO DA SILVA on 25/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "LigueAsFigurasViewController.h"

@interface LigueAsFigurasViewController ()

@end

@implementation LigueAsFigurasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setFaseAtual:1];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [[self tempDrawImage] setAlpha:1];
    
    switch ([self faseAtual]) {
        case 1:
            [self setFiguras:[Figura retornaFiguraFase1]];
            [[self tempDrawImage]setImage:[UIImage imageNamed:[NSString stringWithFormat:@"fase%d.png", [self faseAtual]]]];
            [self setAnterior:[UIImage imageNamed:@"fase1.png"]];
            break;
            
        case 2:
            [self setFiguras:[Figura retornaFiguraFase2]];
            [[self tempDrawImage]setImage:[UIImage imageNamed:[NSString stringWithFormat:@"fase%d.png", [self faseAtual]]]];
            [self setAnterior:[UIImage imageNamed:@"fase2.png"]];
            break;
            
        case 3:
            [self setFiguras:[Figura retornaFiguraFase3]];
            [[self tempDrawImage]setImage:[UIImage imageNamed:[NSString stringWithFormat:@"fase%d.png", [self faseAtual]]]];
            [self setAnterior:[UIImage imageNamed:@"fase3.png"]];
            break;
            
        case 4:
            [self setFiguras:[Figura retornaFiguraFase4]];
            [[self tempDrawImage]setImage:[UIImage imageNamed:[NSString stringWithFormat:@"fase%d.png", [self faseAtual]]]];
            [self setAnterior:[UIImage imageNamed:@"fase4.png"]];
            break;
            
        case 5:
            [[self tempDrawImage] removeFromSuperview];
            
            [self setFiguras:[Figura retornaFiguraFaseRandom]];
            [[self tempDrawImage]setImage:[UIImage imageNamed:@"transparente.png"]];
            [self setAnterior:[UIImage imageNamed:@"transparente.png"]];
            
            for(Figura *f in [self figuras]){
                [[self view]addSubview: [f imgView]];
            }
            [[self view] addSubview:[self tempDrawImage]];
            break;
            
        default:
            break;
    }
    [self setVetorRemover:nil];
    [self setVetorRemover:[[NSMutableArray alloc] initWithArray: [self figuras]]];
    
    [self setGanhou:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    if ([self faseAtual] == 5) {
        for (Figura* fig in [self vetorRemover]) {
            [[fig imgView] removeFromSuperview];
        }
        [[self vetorRemover] removeAllObjects];
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.view]];
    
    CGPoint toque = [touch locationInView:[self view]];
    
    [self setFiguraInicial:nil];
    
    for (Figura* f in [self figuras]) {
        if([f x1] < toque.x && toque.x < [f x2] && [f y1] < toque.y && toque.y < [f y2]){
            [self setFiguraInicial:f];
        }
    }
    
    UIGraphicsBeginImageContext(self.view.frame.size);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if([[self figuras]count] != 0){
        UITouch *touch = [touches anyObject];
        CGPoint currentPoint = [touch locationInView:self.view];
        
        
        [[[self tempDrawImage] image] drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), [self lastPoint].x, [self lastPoint].y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0);
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        
        [[self tempDrawImage] setImage:UIGraphicsGetImageFromCurrentImageContext()];
        
        [self setLastPoint:currentPoint];
    }
}


-(void)verificaJogada:(NSSet *)touches{
    
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    Figura* figuraFinal = nil;
    
    for (Figura* f in [self figuras]) {
        if([f x1] < toque.x && toque.x < [f x2] && [f y1] < toque.y && toque.y < [f y2]){
            figuraFinal = f;
        }
    }
    
    //Verifica se o usuario acertou as imagens
    if(figuraFinal != nil && [self figuraInicial] != nil){
        
        if([[[self figuraInicial] tag] isEqualToString:[figuraFinal tag]]){
            if([[self figuraInicial] x1] != [figuraFinal x1]){
                
                int x1 = ([[self figuraInicial] x1] + ( ([[self figuraInicial] x2] - [[self figuraInicial] x1]) / 2) );
                int y1 = ([[self figuraInicial] y1] + [[self figuraInicial] y2]) / 2;
                
                CGPoint centro1 = CGPointMake(x1, y1);
                
                int x2 = ([figuraFinal x1] + [figuraFinal x2]) / 2;
                int y2 = ([figuraFinal y1] + [figuraFinal y2]) / 2;
                
                CGPoint centro2 = CGPointMake(x2, y2);
                
                //Remove figuras acertadas do vetor
                [[self figuras] removeObject:figuraFinal];
                [[self figuras] removeObject:[self figuraInicial]];
                
                //Desenha linha acertada entre os itens corretos
                [self  desenhaLinha:centro1 :centro2];
            }
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Remove linha do usuario
    [[self tempDrawImage]setImage:[self anterior]];
    
    [self verificaJogada:touches];
    
    //Altera image anterior
    [self setAnterior:[[self tempDrawImage] image]];
    
    //Verifica se Ganhou
    if([[self figuras] count] == 0 && ![self ganhou]){
        
        //Salva a fase vencida
        [self salvaFaseVencida:0 faseAtual:[self faseAtual]];
        
        //Execute animacao no fim da fase
        [self animacaoFimDaFase];
        
        [[self tempDrawImage] setAlpha:0.2];
        
        [self setGesto:[[GestoArcoIris alloc] initWithTarget:self action:@selector(metodoDogesto)]];
        
        [[self view] addGestureRecognizer:[self gesto]];
    }
}

-(void)metodoDogesto{
    
    [[self ok] removeFromSuperview];
    [[self arcoiris] removeFromSuperview];
    [[self dedo] removeFromSuperview];
    
    [[self view] removeGestureRecognizer:[self gesto]];
    
    [self viewWillDisappear:NO];
    
    _faseAtual++;
    
    if(_faseAtual > 4){
        _faseAtual = 5;
    }
    
    [self viewDidLoad];
}

-(void)desenhaLinha:(CGPoint) inicial :(CGPoint) final{
    
    //Desenha a linha reta da farinha ao pao quando a crianca tracar certo
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    [[[self tempDrawImage] image] drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint( contexto, inicial.x, inicial.y);     // ponto inicial da linha (farinha)
    CGContextAddLineToPoint( contexto, final.x, final.y); // ponto final da linha (pao) // falta descobrir o ponto exato
    CGContextSetLineCap( contexto, kCGLineCapRound);
    CGContextSetLineWidth( contexto, 10.0);
    CGContextSetRGBStrokeColor(contexto, (arc4random()%750)/1000.0, (arc4random()%750)/1000.0, (arc4random()%750)/1000.0, 1.0);
    
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