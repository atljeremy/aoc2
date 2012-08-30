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

- (JFMotorcycle*)instantiateMotorcycleOfType:(NSString*)type;
+ (JFMotorcycleFactory*)sharedInstance;

@end
