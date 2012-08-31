//
//  JFMotorcycleSuzukiGSXR.h
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycle.h"

@interface JFMotorcycleSuzukiGSXR : JFMotorcycle

@property (nonatomic, strong, getter = getHasSuzukiWarrenty, setter = setHasSuzukiWarrenty:) NSNumber* hasSuzukiWarrenty;
@property (nonatomic, strong, getter = getSuzukiWarrentyDescription, setter = setSuzukiWarrentyDescription:) NSString* suzukiWarrentyDescription;

// Overridden Accessor/Mutator Methods
- (void)setHasSuzukiWarrenty:(NSNumber *)yesno;
- (void)setSuzukiWarrentyDescription:(NSString *)description;

- (NSNumber*)getHasSuzukiWarrenty;
- (NSString*)getSuzukiWarrentyDescription;

@end
