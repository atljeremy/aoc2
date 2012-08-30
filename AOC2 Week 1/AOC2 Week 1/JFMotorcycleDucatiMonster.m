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
