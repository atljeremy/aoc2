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

// Overridden from superlass (JSMotorcyle)
- (NSNumber*)updateStockWithSoldCount:(int)sold {
    
    // YES! We just had a guy and 3 friends all buy a new Honda CBR at the last minute!
    // We've better subtract those bikes from our inventory ASAP!
    int lastMinuteSale = 4;
    
    double totalSold          = [[NSNumber numberWithInt:sold] doubleValue] + lastMinuteSale;
    double currentlyAvailable = [self.totalAvailable doubleValue];
    NSNumber * nowAvailable   = [NSNumber numberWithDouble:currentlyAvailable - totalSold];
    
    return nowAvailable;
    
}

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
