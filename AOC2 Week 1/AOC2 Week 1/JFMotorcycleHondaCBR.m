//
//  JFMotorcycleHondaCBR.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleHondaCBR.h"

@implementation JFMotorcycleHondaCBR
@synthesize hondaWarrentyDescription, hasHondaWarrenty;

- (void)setHasHondaWarrenty:(NSNumber *)yesno {
    hasHondaWarrenty = yesno;
}

- (void)setHondaWarrentyDescription:(NSString *)description {
    hondaWarrentyDescription = description;
}

- (NSNumber*)getHasHondaWarrenty {
    return hasHondaWarrenty;
}

- (NSString*)getHondaWarrentyDescription {
    return hondaWarrentyDescription;
}

@end
