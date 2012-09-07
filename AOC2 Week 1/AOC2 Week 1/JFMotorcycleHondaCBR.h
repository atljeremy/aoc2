//
//  JFMotorcycleHondaCBR.h
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycle.h"

@interface JFMotorcycleHondaCBR : JFMotorcycle

/**
 ******************************** REVISION ***************************************
 * This is a new "unique" data member of this subclass that will be used in the
 * overridden base class @method calculateShippingCost:(int)weight
 ******************************** REVISION ***************************************
 */
@property (nonatomic, strong, getter = getHondaCBRWeight, setter = setHondaCBRWeight:) NSNumber* hondaCBRWeight;
- (void)setHondaCBRWeight:(NSNumber*)weight;
- (NSNumber*)getHondaCBRWeight;



@property (nonatomic, strong, getter = getHasHondaWarrenty, setter = setHasHondaWarrenty:) NSNumber* hasHondaWarrenty;
@property (nonatomic, strong, getter = getHondaWarrentyDescription, setter = setHondaWarrentyDescription:) NSString* hondaWarrentyDescription;

// Overridden Accessor/Mutator Methods
- (void)setHasHondaWarrenty:(NSNumber *)yesno;
- (void)setHondaWarrentyDescription:(NSString *)description;

- (NSNumber*)getHasHondaWarrenty;
- (NSString*)getHondaWarrentyDescription;

@end
