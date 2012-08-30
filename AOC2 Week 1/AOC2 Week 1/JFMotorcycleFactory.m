//
//  JSMotorcycleFactory.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/29/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleFactory.h"

static NSString* const kDucatiMonster = @"jfmotorcycleducatimonster";

@implementation JFMotorcycleFactory

// Used to create and return the specified subclass of JFMotocyle passed in as a string parameter
- (JFMotorcycle*)instantiateMotorcycleOfType:(NSString *)type {
    
    JFMotorcycle* motorcycle = nil;
    
    if ([type isEqualToString:kDucatiMonster]) {
        motorcycle = [[JFMotorcycleDucatiMonster alloc] init];
    } else if([type isEqualToString:kDucatiMonster]) {
        motorcycle = [[JFMotorcycleHondaCBR alloc] init];
    } else if ([type isEqualToString:kDucatiMonster]) {
        motorcycle = [[JFMotorcycleSuzukiGSXR alloc] init];
    } else {
        NSAssert(NO, @"Could not instantiate object of type: %@", type);
    }
    
    return motorcycle;
}

// Singleton Boilerplate - Used to create the only (single) instance of this class
+ (JFMotorcycleFactory*)sharedInstance {
    static JFMotorcycleFactory* instance = nil;
    
    @synchronized([JFMotorcycleFactory class]){
        
        if (nil == instance) {
            instance = [[self alloc] init];
        }
    }
    
    return instance;
}

@end
