//
//  JSMotorcycleFactory.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/29/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycleFactory.h"

#define kDucatiMonsterWeight 425.00
#define kHondaCBRWeight      500.00
#define kSuzukiGSXRWeight    525.00

static NSString* const kDucatiMonster = @"jfmotorcycleducatimonster";
static NSString* const kHondaCBR      = @"jfmotorcyclehondacbr";
static NSString* const kSuzukiGSXR    = @"jfmotorcyclesuzukigsxr";

@implementation JFMotorcycleFactory

// Used to create and return the specified subclass of JFMotocyle passed in as a string parameter
- (JFMotorcycle*)instantiateMotorcycleOfType:(NSString *)type {
    
    JFMotorcycle* motorcycle = nil;
    
    if ([type isEqualToString:kDucatiMonster]) {
        motorcycle = [[JFMotorcycleDucatiMonster alloc] init];
        [motorcycle setCc:@"1000cc"];
        [motorcycle setMake:@"Ducati"];
        [motorcycle setModel:@"Monster"];
        [motorcycle setYear:[NSNumber numberWithInteger:2012]];
        [motorcycle setTotalAvailable:[NSNumber numberWithInteger:10]];
        [motorcycle setColorsAvailable:[NSMutableArray arrayWithObjects:@"Red", @"Black", nil]];
        [(JFMotorcycleDucatiMonster*)motorcycle setHasDucatiWarrenty:[NSNumber numberWithBool:YES]];
        [(JFMotorcycleDucatiMonster*)motorcycle setDucatiWarrentyDescription:@"1 Year FREE Parts/Service"];
        
        /**
         ******************************** REVISION *****************************************
         * Setting the unique data member of this subclass to perform the shipping cost
         * calculation with
         ******************************** REVISION *****************************************
         */
        [(JFMotorcycleDucatiMonster*)motorcycle setDucatiMonsterWeight:[NSNumber numberWithDouble:kDucatiMonsterWeight]];
        
    } else if([type isEqualToString:kHondaCBR]) {
        motorcycle = [[JFMotorcycleHondaCBR alloc] init];
        [motorcycle setCc:@"600cc"];
        [motorcycle setMake:@"Honda"];
        [motorcycle setModel:@"CBR"];
        [motorcycle setYear:[NSNumber numberWithInteger:2010]];
        [motorcycle setTotalAvailable:[NSNumber numberWithInteger:13]];
        [motorcycle setColorsAvailable:[NSMutableArray arrayWithObjects:@"Silver", @"Blue", nil]];
        [(JFMotorcycleHondaCBR*)motorcycle setHasHondaWarrenty:[NSNumber numberWithBool:YES]];
        [(JFMotorcycleHondaCBR*)motorcycle setHondaWarrentyDescription:@"50,000 mile powertrain"];
        
        /**
         ******************************** REVISION *****************************************
         * Setting the unique data member of this subclass to perform the shipping cost
         * calculation with
         ******************************** REVISION *****************************************
         */
        [(JFMotorcycleHondaCBR*)motorcycle setHondaCBRWeight:[NSNumber numberWithDouble:kHondaCBRWeight]];
        
    } else if ([type isEqualToString:kSuzukiGSXR]) {
        motorcycle = [[JFMotorcycleSuzukiGSXR alloc] init];
        [motorcycle setCc:@"750cc"];
        [motorcycle setMake:@"Suzuki"];
        [motorcycle setModel:@"GSXR"];
        [motorcycle setYear:[NSNumber numberWithInteger:2011]];
        [motorcycle setTotalAvailable:[NSNumber numberWithInteger:6]];
        [motorcycle setColorsAvailable:[NSMutableArray arrayWithObjects:@"Yellow", @"White", nil]];
        [(JFMotorcycleSuzukiGSXR*)motorcycle setHasSuzukiWarrenty:[NSNumber numberWithBool:FALSE]];
        [(JFMotorcycleSuzukiGSXR*)motorcycle setSuzukiWarrentyDescription:@"No Warrenty Available"];
        
        /**
         ******************************** REVISION *****************************************
         * Setting the unique data member of this subclass to perform the shipping cost 
         * calculation with
         ******************************** REVISION *****************************************
         */
        [(JFMotorcycleSuzukiGSXR*)motorcycle setSuzukiGSXRWeight:[NSNumber numberWithDouble:kSuzukiGSXRWeight]];
        
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
