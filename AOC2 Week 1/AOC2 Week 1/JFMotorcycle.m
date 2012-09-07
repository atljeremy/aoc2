//
//  JFMotorcycle.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycle.h"

@implementation JFMotorcycle
@synthesize cc;
@synthesize colorsAvailable;
@synthesize year;
@synthesize make;
@synthesize model;
@synthesize totalAvailable;

/**
 * Original implementation of this method. Determines shipping cost from bike weight
 *
 ******************************** REVISION *****************************************
 * This is a new method that will be overridden in each subclass and perform a 
 * calculation using a unique data member of each subclass, per a discussion 
 * with Alexia
 ******************************** REVISION *****************************************
 *
 */
- (NSNumber*)calculateShippingCost:(int)weight {
    
    /**
     * Here in the base implementation, we will receive one @param which will be the bikes weight
     *
     * In the subclasses, we will be using a unique data member instead of passing in a 
     * param to meet requirements for project
     */
    double bikeWeight       = [[NSNumber numberWithInt:weight] doubleValue];
    double costPerPound     = kCostPerPound;
    NSNumber * shippingCost = [NSNumber numberWithDouble:bikeWeight * costPerPound];
    
    return shippingCost;
}

// Creates a string from the colors available in the "colorsAvailable" array.
- (NSString*)stringFromColorsAvailable {
    
    NSString* colors = @"";
    
    for (int i = 0; i < [self.colorsAvailable count]; i++) {
        NSString* color = [self.colorsAvailable objectAtIndex:i];
        if (0 == i) {
            colors = [colors stringByAppendingString:color];
        } else {
            colors = [colors stringByAppendingFormat:@" & %@ Colors Available", color];
        }
    }
    
    return colors;
}

// Accessor/Mutator Methods (Not sure why we are having to write these manually when @synthesize does it for us??)
- (void)setCc:(NSString *)bikeCc {
    cc = bikeCc;
}
- (NSString*)getCc {
    return cc;
}

- (void)setYear:(NSNumber *)bikeYear {
    year = bikeYear;
}
- (NSNumber*)getYear {
    return year;
}

- (void)setMake:(NSString *)bikeMake {
    make = bikeMake;
}
- (NSString*)getMake {
    return make;
}

- (void)setModel:(NSString *)bikeModel {
    model = bikeModel;
}
- (NSString*)getModel {
    return model;
}

- (void)setColorsAvailable:(NSMutableArray *)bikeColorsAvailable {
    colorsAvailable = bikeColorsAvailable;
}
- (NSMutableArray*)getColorsAvailable {
    return colorsAvailable;
}

- (void)setTotalAvailable:(NSNumber *)bikeTotalAvailable {
    totalAvailable = bikeTotalAvailable;
}
- (NSNumber*)getTotalAvailable {
    return totalAvailable;
}

@end
