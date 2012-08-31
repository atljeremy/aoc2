//
//  JFMotorcycleDucatiMonster.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleDucatiMonster.h"

@implementation JFMotorcycleDucatiMonster
@synthesize ducatiWarrentyDescription, hasDucatiWarrenty;

// Overridden from superlass (JSMotorcyle)
- (NSNumber*)updateStockWithSoldCount:(int)sold {
    
    // Oh no! We were robbed! We lost 5 Ducati Monsters!
    int stolenBikes = 5;
    
    double totalSold          = [[NSNumber numberWithInt:sold] doubleValue];
    double currentlyAvailable = [self.totalAvailable doubleValue] - stolenBikes;
    NSNumber * nowAvailable   = [NSNumber numberWithDouble:currentlyAvailable - totalSold];
    
    return nowAvailable;
    
}

- (void)setHasDucatiWarrenty:(NSNumber *)yesno {
    hasDucatiWarrenty = yesno;
}

- (void)setDucatiWarrentyDescription:(NSString *)description {
    ducatiWarrentyDescription = description;
}

- (NSNumber*)getHasDucatiWarrenty {
    return hasDucatiWarrenty;
}

- (NSString*)getDucatiWarrentyDescription {
    return ducatiWarrentyDescription;
}

@end
