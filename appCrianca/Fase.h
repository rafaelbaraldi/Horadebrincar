//
//  Fase.h
//  appCrianca
//
//  Created by RAFAEL BARALDI on 16/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Fase : NSManagedObject

@property (nonatomic, retain) NSNumber * numero;
@property (nonatomic, retain) NSManagedObject *jogo;
@property (nonatomic, retain) NSManagedObject *usuario;

@end
