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
    // Need to do something unique for this subclass
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
