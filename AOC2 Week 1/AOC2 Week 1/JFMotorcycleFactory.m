//
//  JSMotorcycleFactory.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/29/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleFactory.h"

static NSString* const kDucatiMonster = @"jfmotorcycleducatimonster";
static NSString* const kHondaCBR      = @"jfmotorcyclehondacbr";
static NSString* const kSuzukiGSXR    = @"jfmotorcyclesuzukigsxr";

@implementation JFMotorcycleFactory

// Used to create and return the specified subclass of JFMotocyle passed in as a string parameter
- (JFMotorcycle*)instantiateMotorcycleOfType:(NSString *)type {
    
    JFMotorcycle* motorcycle = nil;
    
    if ([type isEqualToString:kDucatiMonster]) {
        motorcycle = [[JFMotorcycleDucatiMonster alloc] init];
        [motorcycle setCc:@"1000 cc's"];
        [motorcycle setMake:@"Ducati"];
        [motorcycle setModel:@"Monster"];
        [motorcycle setYear:[NSNumber numberWithInteger:2012]];
        [motorcycle setTotalAvailable:[NSNumber numberWithInteger:10]];
        [motorcycle setColorsAvailable:[NSMutableArray arrayWithObjects:@"Red", @"Black", nil]];
        
    } else if([type isEqualToString:kHondaCBR]) {
        motorcycle = [[JFMotorcycleHondaCBR alloc] init];
        [motorcycle setCc:@"600 cc's"];
        [motorcycle setMake:@"Honda"];
        [motorcycle setModel:@"CBR"];
        [motorcycle setYear:[NSNumber numberWithInteger:2010]];
        [motorcycle setTotalAvailable:[NSNumber numberWithInteger:8]];
        [motorcycle setColorsAvailable:[NSMutableArray arrayWithObjects:@"Silver", @"Blue", nil]];
        
    } else if ([type isEqualToString:kSuzukiGSXR]) {
        motorcycle = [[JFMotorcycleSuzukiGSXR alloc] init];
        [motorcycle setCc:@"750 cc's"];
        [motorcycle setMake:@"Suzuki"];
        [motorcycle setModel:@"GSXR"];
        [motorcycle setYear:[NSNumber numberWithInteger:2011]];
        [motorcycle setTotalAvailable:[NSNumber numberWithInteger:6]];
        [motorcycle setColorsAvailable:[NSMutableArray arrayWithObjects:@"Yellow", @"White", nil]];
        
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
