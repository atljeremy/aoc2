//
//  JFMotorcycleSuzukiGSXR.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleSuzukiGSXR.h"

#define kSuzukiDealerFee              50.00
#define kSuzukiIncentiveProgramReward -20.00 // This will subtract $20.00 from the total shipping cost

@implementation JFMotorcycleSuzukiGSXR
@synthesize suzukiGSXRWeight;
@synthesize suzukiWarrentyDescription;
@synthesize hasSuzukiWarrenty;

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
     * we are using a unique data member (self.suzukiGSXRWeight) in this subclass to determine the shipping cost
     * but we have a check to ensure a @param wasn't passed in, if it was, it will supersede the data member
     */
    double bikeWeight;
    if (weight > 0) {
        bikeWeight = [[NSNumber numberWithInt:weight] doubleValue];
    } else {
        /**
         * Here is where we are using this subclasses unique data member
         */
        bikeWeight = [self.suzukiGSXRWeight doubleValue];
    }
    
    double costPerPound = kCostPerPound;
    
    /**
     * Here is what makes this overridden method become unique, we add the suzukiDealerFee and then subtract
     * the suzukiIncentiveProgramRewards from the shipping cost.
     */
    double suzukiDealerFee = kSuzukiDealerFee;
    double suzukiIncentiveProgramRewards = kSuzukiIncentiveProgramReward;
    
    double currentShippingCost  = [[NSNumber numberWithDouble:(bikeWeight * costPerPound) + suzukiDealerFee] doubleValue];
    NSNumber* totalShippingCost = [NSNumber numberWithDouble:currentShippingCost - suzukiIncentiveProgramRewards];
    
    return totalShippingCost;
}

- (void)setSuzukiGSXRWeight:(NSNumber*)weight {
    suzukiGSXRWeight = weight;
}

- (void)setHasSuzukiWarrenty:(NSNumber *)yesno {
    hasSuzukiWarrenty = yesno;
}

- (void)setSuzukiWarrentyDescription:(NSString *)description {
    suzukiWarrentyDescription = description;
}

- (NSNumber*)getSuzukiGSXRWeight {
    return suzukiGSXRWeight;
}

- (NSNumber*)getHasSuzukiWarrenty {
    return hasSuzukiWarrenty;
}

- (NSString*)getSuzukiWarrentyDescription {
    return suzukiWarrentyDescription;
}

@end
