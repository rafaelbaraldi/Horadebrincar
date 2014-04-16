//
//  Jogo.h
//  appCrianca
//
//  Created by RAFAEL BARALDI on 16/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Fase;

@interface Jogo : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSSet *fase;
@end

@interface Jogo (CoreDataGeneratedAccessors)

- (void)addFaseObject:(Fase *)value;
- (void)removeFaseObject:(Fase *)value;
- (void)addFase:(NSSet *)values;
- (void)removeFase:(NSSet *)values;

@end
