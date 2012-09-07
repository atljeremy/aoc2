//
//  JFMotorcycleHondaCBR.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleHondaCBR.h"

#define kHondaIncentiveProgramReward -75.00 // This will subtract $75.00 from the total cost of shipping

@implementation JFMotorcycleHondaCBR
@synthesize hondaCBRWeight;
@synthesize hondaWarrentyDescription;
@synthesize hasHondaWarrenty;

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
     * we are using a unique data member (self.hondaCBRWeight) in this subclass to determine the shipping cost
     * but we have a check to ensure a @param wasn't passed in, if it was, it will supersede the data member
     */
    double bikeWeight;
    if (weight > 0) {
        bikeWeight = [[NSNumber numberWithInt:weight] doubleValue];
    } else {
        /**
         * Here is where we are using this subclasses unique data member
         */
        bikeWeight = [self.hondaCBRWeight doubleValue];
    }
          
    double costPerPound = kCostPerPound;
    
    /**
     * Here is what makes this overridden method become unique, We subtract the Honda Incentive Program
     * Reward amount from the shipping cost
     */
    double hondaIncentiveProgramReward = kHondaIncentiveProgramReward;
    
    double currentShippingCost  = [[NSNumber numberWithDouble:bikeWeight * costPerPound] doubleValue];
    NSNumber* totalShippingCost = [NSNumber numberWithDouble:currentShippingCost - hondaIncentiveProgramReward];
    
    return totalShippingCost;
}

- (void)setHondaCBRWeight:(NSNumber*)weight {
    hondaCBRWeight = weight;
}

- (void)setHasHondaWarrenty:(NSNumber *)yesno {
    hasHondaWarrenty = yesno;
}

- (void)setHondaWarrentyDescription:(NSString *)description {
    hondaWarrentyDescription = description;
}

- (NSNumber*)getHondaCBRWeight {
    return hondaCBRWeight;
}

- (NSNumber*)getHasHondaWarrenty {
    return hasHondaWarrenty;
}

- (NSString*)getHondaWarrentyDescription {
    return hondaWarrentyDescription;
}

@end
