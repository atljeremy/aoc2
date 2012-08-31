//
//  JSMotorcycleFactory.h
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/29/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFMotorcycle.h"
#import "JFMotorcycleDucatiMonster.h"
#import "JFMotorcycleHondaCBR.h"
#import "JFMotorcycleSuzukiGSXR.h"

@interface JFMotorcycleFactory : NSObject

// Used to instantiate a subclass of JFMotorcycle, the specific subclass
// to be instatiated is dependant upon the argument passed in.
- (JFMotorcycle*)instantiateMotorcycleOfType:(NSString*)type;

// Used to return to (single) instance of the JFMotorcycleFactory
+ (JFMotorcycleFactory*)sharedInstance;

@end
