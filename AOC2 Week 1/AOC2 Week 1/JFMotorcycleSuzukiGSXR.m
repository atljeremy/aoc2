//
//  JFMotorcycleSuzukiGSXR.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleSuzukiGSXR.h"

@implementation JFMotorcycleSuzukiGSXR
@synthesize suzukiWarrentyDescription, hasSuzukiWarrenty;

// Overridden from superlass (JSMotorcyle)
- (NSNumber*)updateStockWithSoldCount:(int)sold {
    
    // Just received more Suzuki GSXR's!
    int newDelivery = 15;
    
    double totalSold          = [[NSNumber numberWithInt:sold] doubleValue];
    double currentlyAvailable = [self.totalAvailable doubleValue];
    NSNumber * nowAvailable   = [NSNumber numberWithDouble:currentlyAvailable - totalSold + newDelivery];
    
    return nowAvailable;
    
}

- (void)setHasSuzukiWarrenty:(NSNumber *)yesno {
    hasSuzukiWarrenty = yesno;
}

- (void)setSuzukiWarrentyDescription:(NSString *)description {
    suzukiWarrentyDescription = description;
}

- (NSNumber*)getHasSuzukiWarrenty {
    return hasSuzukiWarrenty;
}

- (NSString*)getSuzukiWarrentyDescription {
    return suzukiWarrentyDescription;
}

@end
