//
//  JFMotorcycle.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycle.h"

@implementation JFMotorcycle
@synthesize cc, colorsAvailable, make, model, year, totalAvailable;

// Original implementation of this method. This method is overridden from within all 3 subclasses.
// Determines how many bikes are available.
- (NSNumber*)updateStockWithSoldCount:(int)sold {
    
    double totalSold          = [[NSNumber numberWithInt:sold] doubleValue];
    double currentlyAvailable = [self.totalAvailable doubleValue];
    NSNumber * nowAvailable   = [NSNumber numberWithDouble:currentlyAvailable - totalSold];
    
    return nowAvailable;
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
