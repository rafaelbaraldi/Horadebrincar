//
//  GestoArcoIris.h
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 27/03/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>


@interface GestoArcoIris : UIGestureRecognizer{
    //valores definidos a partir da posicao inicial do toque
    int xInicial;
    int yInicial;
    int xFinal;
    int yFinal;
    
    int raioMenor;
    int raiomaior;
    
    int centroX;
    int centroY;
    
}

@property int xInicial;
@property int yInicial;

@property int xFinal;
@property int yFinal;

@property int raioMenor;
@property int raioMaior;

@property int centroX;
@property int centroY;

//Uiviews "gambiarra" para mostrar o tamanho aproximado e onde o gesto de semi-circulo deve acontecer
@property UIView *largec;
@property UIView *smallc;
@property UIView *startc;
@property UIView *finalc;



@end
