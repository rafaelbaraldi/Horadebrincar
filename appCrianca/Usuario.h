//
//  Usuario.h
//  appCrianca
//
//  Created by RAFAEL BARALDI on 16/04/14.
//  Copyright (c) 2014 RAFAEL CARDOSO DA SILVA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Fase;

@interface Usuario : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSSet *fase1;
@end

@interface Usuario (CoreDataGeneratedAccessors)

- (void)addFase1Object:(Fase *)value;
- (void)removeFase1Object:(Fase *)value;
- (void)addFase1:(NSSet *)values;
- (void)removeFase1:(NSSet *)values;

@end
