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

- (NSNumber*)updateStockWithSoldCount:(int)sold {
    
    double totalSold          = [[NSNumber numberWithInt:sold] doubleValue];
    double currentlyAvailable = [self.totalAvailable doubleValue];
    NSNumber * nowAvailable   = [NSNumber numberWithDouble:currentlyAvailable - totalSold];
    
    return nowAvailable;
}

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
    return self.cc;
}

- (void)setYear:(NSNumber *)bikeYear {
    year = bikeYear;
}
- (NSNumber*)getYear {
    return self.year;
}

- (void)setMake:(NSString *)bikeMake {
    make = bikeMake;
}
- (NSString*)getMake {
    return self.make;
}

- (void)setModel:(NSString *)bikeModel {
    model = bikeModel;
}
- (NSString*)getModel {
    return self.model;
}

- (void)setColorsAvailable:(NSMutableArray *)bikeColorsAvailable {
    colorsAvailable = bikeColorsAvailable;
}
- (NSMutableArray*)getColorsAvailable {
    return self.colorsAvailable;
}

- (void)setTotalAvailable:(NSNumber *)bikeTotalAvailable {
    totalAvailable = bikeTotalAvailable;
}
- (NSNumber*)getTotalAvailable {
    return self.totalAvailable;
}

@end
