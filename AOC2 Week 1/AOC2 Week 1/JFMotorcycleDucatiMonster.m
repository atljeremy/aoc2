//
//  JFMotorcycleDucatiMonster.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleDucatiMonster.h"

#define kDucatiDealerFee 100.00

@implementation JFMotorcycleDucatiMonster
@synthesize ducatiMonsterWeight;
@synthesize ducatiWarrentyDescription;
@synthesize hasDucatiWarrenty;

/**
 * Overridden implementation of this method. Determines shipping cost from bike weight
 *
 ******************************** REVISION *****************************************
 * This is a new method that will be overridden in each subclass and perform a
 * calculation using a unique data member of each subclass, per a discussion
 * with Alexia
 ******************************** REVISION *****************************************
 *
 */
- (NSNumber*)calculateShippingCost:(int)weight {
    
    /**
     * we are using a unique data member (self.ducatiMonsterWeight) in this subclass to determine the shipping cost
     * but we have a check to ensure a @param wasn't passed in, if it was, it will supersede the data member
     */
    double bikeWeight;
    if (weight > 0) {
        bikeWeight = [[NSNumber numberWithInt:weight] doubleValue];
    } else {
        /**
         * Here is where we are using this subclasses unique data member
         */
        bikeWeight = [self.ducatiMonsterWeight doubleValue];
    }
    
    double costPerPound = kCostPerPound;
    
    /**
     * Here is what makes this overridden method become unique, we add in a "Ducati Dealer Fee" for each
     * shipping cost calculation
     */
    double ducatiDealerFee = kDucatiDealerFee;
    
    NSNumber * shippingCost = [NSNumber numberWithDouble:(bikeWeight * costPerPound) + ducatiDealerFee];
    
    return shippingCost;
}

- (void)setDucatiMonsterWeight:(NSNumber*)weight {
    ducatiMonsterWeight = weight;
}

- (void)setHasDucatiWarrenty:(NSNumber *)yesno {
    hasDucatiWarrenty = yesno;
}

- (void)setDucatiWarrentyDescription:(NSString *)description {
    ducatiWarrentyDescription = description;
}

- (NSNumber*)getDucatiMonsterWeight {
    return ducatiMonsterWeight;
}

- (NSNumber*)getHasDucatiWarrenty {
    return hasDucatiWarrenty;
}

- (NSString*)getDucatiWarrentyDescription {
    return ducatiWarrentyDescription;
}

@end
