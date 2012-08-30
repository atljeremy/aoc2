//
//  JFMotorcycleHondaCBR.h
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycle.h"

@interface JFMotorcycleHondaCBR : JFMotorcycle

@property (nonatomic, strong, getter = getHasHondaWarrenty, setter = setHasHondaWarrenty:) NSNumber* hasHondaWarrenty;
@property (nonatomic, strong, getter = getHondaWarrentyDescription, setter = setHondaWarrentyDescription:) NSString* hondaWarrentyDescription;

- (void)setHasHondaWarrenty:(NSNumber *)yesno;
- (void)setHondaWarrentyDescription:(NSString *)description;

- (NSNumber*)getHasHondaWarrenty;
- (NSString*)getHondaWarrentyDescription;

@end
