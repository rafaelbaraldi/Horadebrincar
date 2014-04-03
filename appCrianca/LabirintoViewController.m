//
//  LabirintoViewController.m
//  appCrianca
//
//  Created by RAFAEL BARALDI on 02/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "LabirintoViewController.h"

@interface LabirintoViewController ()

@end

@implementation LabirintoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [[self view] setTag:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setGesto:[[GestoLabirinto alloc] initWithTarget:self action:@selector(metodoDogesto)]];
    [[self view] addGestureRecognizer:[self gesto]];
    
    //Image erro
    [self setErrou:[[UIImageView alloc] init]];
    [[self errou] setImage:[UIImage imageNamed:@"errou.png"]];
    [[self errou] setFrame:CGRectMake([[self view] bounds].size.width/2-75, CGRectGetMidY([self view].frame) + 300, 150, 150)];
    [[self errou] setAlpha:0];
    [self.view addSubview:[self errou]];
    [self setGanhou:NO];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(![self ganhou]){
        UITouch *touch = [touches anyObject];
        CGPoint currentPoint = [touch locationInView:self.view];
        
        [self setLastPoint:currentPoint];
        UIGraphicsBeginImageContext(self.view.frame.size);
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(![self ganhou]){
        if([[self view] tag] == 0){
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
        else{
            //Errou, zerou
            [self hiddenImageView];
            
            //Exibe o Erro
            [self animaErro];
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(![self ganhou]){
        if([[self gesto] state] != UIGestureRecognizerStateRecognized){
            //Errou, zerou
            [self hiddenImageView];
            
            //Exibe o Erro
            [self animaErro];
        }
    }
}

//anima o Erro
-(void)animaErro{
    
    [[self errou] setAlpha:1];
    
    [UIView animateWithDuration:1 animations:^{
        [[self errou]setAlpha:0];
    }];
}

//Zera imagem
-(void)hiddenImageView{
    [[self tempDrawImage] setImage:[UIImage imageNamed:@"labirintoImg.png"]];
}

-(void)metodoDogesto{
    [[self tempDrawImage] setImage:UIGraphicsGetImageFromCurrentImageContext()];
    
    //Gesto do Arco
    _gestoArco = [[GestoArcoIris alloc] initWithTarget:self action:@selector(metodoDogestoArco)];
    [[self view] addGestureRecognizer:_gestoArco];
    
    //Remove gesto do Labirinto
    [[self view] removeGestureRecognizer:_gesto];
    
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

-(void)metodoDogestoArco{
    [_ok removeFromSuperview];
    [_arcoiris removeFromSuperview];
    [_dedo removeFromSuperview];
    
    [[self view] removeGestureRecognizer:_gesto];
    
//    _faseAtual++;
//    if(_faseAtual > 4){
        [self dismissViewControllerAnimated:YES completion:Nil];
//        _faseAtual = 1;
//    }
//    else{
//        [self viewDidLoad];
//    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
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
