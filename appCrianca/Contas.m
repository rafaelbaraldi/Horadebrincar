//
//  Contas.m
//  appCrianca
//
//  Created by Alessandro Camillo Gimenez de Menezes on 01/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import "Contas.h"

@implementation Contas

-(id)init{
    self = [super init];
    if(self){

    }
    return self;
}

+(NSMutableArray*)retornaContasFase: (int)fase{
    
    NSMutableArray *equation =  [[NSMutableArray alloc] init];
    NSMutableArray *solution =  [[NSMutableArray alloc] init];
    
    int qteContas = fase*2 +1;
    
    int valor1 ;
    int valor2 ;
    int operacao ;
    
    for (int i = 0; i < qteContas; i++) {
        //posicao = posicao + 100;
        
        //soh coloca o frame nos labels depois da coluna de resposta estar alearotizada (ja implementado no view controller)
        //UILabel *equacao = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/9, posicao, 200 , 60)];
        UILabel *equacao = [[UILabel alloc] init];
        equacao.textColor = [UIColor blackColor];
        equacao.backgroundColor = [UIColor greenColor];
        [equacao setTextAlignment: NSTextAlignmentCenter];
        equacao.font = [UIFont systemFontOfSize:40];
        
        //UILabel *solucao = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/9 + 400, posicao, 200 , 60)];
        UILabel *solucao = [[UILabel alloc] init];
        solucao.textColor = [UIColor blackColor];
        solucao.backgroundColor = [UIColor redColor];
        [solucao setTextAlignment: NSTextAlignmentCenter];
        solucao.font = [UIFont systemFontOfSize:40];
        
        valor1 = arc4random()%10 + 1;
        valor2 = arc4random()%valor1;// evita a conta ter resultado negativo
        operacao = arc4random()%2;
        
        if (operacao == 0) { // 0 = soma, 1 = subtracao
            equacao.text = [NSString stringWithFormat: @"%d + %d ", valor1, valor2];
            solucao.text = [NSString stringWithFormat: @"%d", valor1 + valor2];
            [equacao setTag: valor1 + valor2];
        }
        else{
            equacao.text = [NSString stringWithFormat: @"%d - %d ", valor1, valor2];
            solucao.text = [NSString stringWithFormat: @"%d", valor1 - valor2];
            [equacao setTag: valor1 - valor2];
        }
        
        [solucao setTag: equacao.tag];
        
        [equation addObject: equacao];
        [solution addObject: solucao];
        
    }
    
    //faz a coluna de label de respostas ficar aleatoria
    for (int i = 0; i < 50; i++) {
        valor1 = arc4random()%qteContas;
        valor2 = arc4random()%qteContas;
        [solution exchangeObjectAtIndex:valor1 withObjectAtIndex: valor2];
    }
    
    
    NSMutableArray* expressoes = [NSMutableArray arrayWithObjects: equation, solution, nil];
    
    return expressoes;
}

@end
