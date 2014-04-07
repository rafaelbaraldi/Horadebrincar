//
//  MathViewController.m
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 01/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "MathViewController.h"

@interface MathViewController ()

@end

@implementation MathViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSMutableArray* conta = [Contas retornaContasFase: [self faseAtual]];
    
    [self setEquation: [conta firstObject]];
    [self setSolution: [conta lastObject]];
    
    int posicao = 0;
    
    //[[self equation] count] == [[self solution] count] == 9
    int tamanhoVetores = [[self equation]count];
    for (int i = 0; i < tamanhoVetores ; i++) {
        posicao = posicao + 100;
        //coloca os frames no labels e mosta eles
        [[[self equation] objectAtIndex: i] setFrame: CGRectMake(self.view.bounds.size.width/9, posicao, 200 , 60) ];
        [[self view] addSubview:[[self equation] objectAtIndex: i]];
        
        [[[self solution] objectAtIndex: i] setFrame: CGRectMake(self.view.bounds.size.width/9 + 400, posicao, 200 , 60)];
        [[self view] addSubview:[[self solution] objectAtIndex: i]];
    }
    
    //junta os vetores de equacoes e respostas em 1 so para fazer a verificacao unificadas igual no jogo das imagens
    [self setContas:[[NSMutableArray alloc] init]];
    for (int i = 0;  i < tamanhoVetores ; i++) {
        [[self contas] addObject: [[self equation] lastObject] ];
        [[self equation] removeLastObject];
        
        [[self contas] addObject: [[self solution] lastObject] ];
        [[self solution] removeLastObject];
    }
    
    [[self tempDrawImage]setImage:[UIImage imageNamed:@"matematica.png"]];
    [[self tempDrawImage] setAlpha:1];
    [self setAnterior:[UIImage imageNamed:@"matematica.png"]];
    
    [self setGanhou:NO];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
}

-(void)viewWillDisappear:(BOOL)animated{
    for (int i = 0;  i < [[self contas] count]; i++) {
        [[[self contas] objectAtIndex: i] removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.view]];
    
    CGPoint toque = [touch locationInView:[self view]];
    
    [self setLabelInicial: nil];
    for (UILabel* label in [self contas]) {
        int labelX = label.frame.origin.x;
        int labelY = label.frame.origin.y;
        int labelW = label.frame.size.width;
        int labelH = label.frame.size.height;
        if( labelX < toque.x && toque.x < (labelX + labelW) && labelY < toque.y && toque.y < (labelY+ labelH) ){
            [self setLabelInicial: label];
        }
    }
    
    UIGraphicsBeginImageContext(self.view.frame.size);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if([[self contas]count] != 0){
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
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Remove linha do usuario
    [[self tempDrawImage]setImage:[self anterior]];
    
    UITouch *touch = [touches anyObject];
    CGPoint toque = [touch locationInView:[self view]];
    
    UILabel* labelFinal = nil;
    for (UILabel* label in [self contas]) {
        int labelX = label.frame.origin.x;
        int labelY = label.frame.origin.y;
        int labelW = label.frame.size.width;
        int labelH = label.frame.size.height;
        if( labelX < toque.x && toque.x < (labelX + labelW) && labelY < toque.y && toque.y < (labelY+ labelH) ){
            labelFinal = label;
        }
    }
    
    //Verifica se o usuario acertou as imagens
    if(labelFinal != nil && [self labelInicial] != nil){
        
        if ( [[self labelInicial] tag] == [labelFinal tag] ) {
            if( [[self labelInicial] frame].origin.x != [labelFinal frame].origin.x){
                
                int x1 = [[self labelInicial] frame].origin.x + [[self labelInicial] frame].size.width/2 ;
                int x2 = [labelFinal frame].origin.x + [labelFinal frame].size.width/2;
                
                if (x1 > x2) {
                    x1 = [[self labelInicial] frame].origin.x;
                    x2 = [labelFinal frame].origin.x + [labelFinal frame].size.width;
                }
                else{
                    x1 = [[self labelInicial] frame].origin.x + [[self labelInicial] frame].size.width;
                    x2 = [labelFinal frame].origin.x;
                    
                }
                
                int y1 = [[self labelInicial] frame].origin.y + [[self labelInicial] frame].size.height/2 ;
                CGPoint centro1 = CGPointMake(x1, y1);
                
                
                int y2 = [labelFinal frame].origin.y + [labelFinal frame].size.height/2;
                CGPoint centro2 = CGPointMake(x2, y2);
                
                //Remove figuras acertadas do vetor
                [[self contas] removeObject: labelFinal];
                [[self contas] removeObject: [self labelInicial]];
                
                //Desenha linha acertada entre os itens corretos
                [self  desenhaLinha:centro1 :centro2];
            }
        }
    }
    
    //Altera image anterior
    [self setAnterior:[[self tempDrawImage] image]];
    
    //Verifica se Ganhou
    if([[self contas] count] == 0 && ![self ganhou]){
        
        //Salva a fase vencida
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setBool:TRUE forKey:[NSString stringWithFormat:@"jogo %d - fase %d", 2, [self faseAtual]]];
        
        _gesto = [[GestoArcoIris alloc] initWithTarget:self action:@selector(metodoDogesto)];
        [[self view] addGestureRecognizer:_gesto];
        
        //Set Alpha do Jogo
        [[self tempDrawImage] setAlpha:0.2];
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
}

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

-(void)hiddenDedo{
    [[self dedo]setHidden:YES];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    //Anda ate o final
    NSString *value = [anim valueForKey:@"animaSubir"];
    if([value isEqual:@"subir"]){
        CABasicAnimation *animAndar3 = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        animAndar3.toValue  = [NSNumber numberWithInt:-10];
        animAndar3.duration = 2.5;
        animAndar3.removedOnCompletion = NO;
        animAndar3.fillMode = kCAFillModeForwards;
        [_dedo.layer addAnimation:animAndar3 forKey:nil];
    }
}

-(void)metodoDogesto{
    [_ok removeFromSuperview];
    [_arcoiris removeFromSuperview];
    [_dedo removeFromSuperview];
    
    [[self view] removeGestureRecognizer:_gesto];
    
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