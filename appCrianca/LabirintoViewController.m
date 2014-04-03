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
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    [self setLastPoint:currentPoint];
    UIGraphicsBeginImageContext(self.view.frame.size);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
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

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if([[self gesto] state] != UIGestureRecognizerStateRecognized){
        //Errou, zerou
        [self hiddenImageView];
        
        //Exibe o Erro
        [self animaErro];
    }
}

//anima o Erro
-(void)animaErro{
    
    //Image erro
    [[self errou] setImage:[UIImage imageNamed:@"errou.png"]];
}

//Zera imagem
-(void)hiddenImageView{
    [[self tempDrawImage] setImage:[UIImage imageNamed:@"labirintoImg.png"]];
}


-(void)metodoDogesto{
    [[self tempDrawImage] setImage:UIGraphicsGetImageFromCurrentImageContext()];
    NSLog(@"ganhou");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
