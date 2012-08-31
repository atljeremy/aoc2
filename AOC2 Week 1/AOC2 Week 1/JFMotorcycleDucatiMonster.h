//
//  JFMotorcycleDucatiMonster.h
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycle.h"

@interface JFMotorcycleDucatiMonster : JFMotorcycle

@property (nonatomic, strong, getter = getHasDucatiWarrenty, setter = setHasDucatiWarrenty:) NSNumber* hasDucatiWarrenty;
@property (nonatomic, strong, getter = getDucatiWarrentyDescription, setter = setDucatiWarrentyDescription:) NSString* ducatiWarrentyDescription;

// Overridden Accessor/Mutator Methods
- (void)setHasDucatiWarrenty:(NSNumber *)yesno;
- (void)setDucatiWarrentyDescription:(NSString *)description;

- (NSNumber*)getHasDucatiWarrenty;
- (NSString*)getDucatiWarrentyDescription;

@end
