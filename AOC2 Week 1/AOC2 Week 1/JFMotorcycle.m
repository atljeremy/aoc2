//
//  JFMotorcycle.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMotorcycle.h"

@implementation JFMotorcycle
@synthesize cc, colorsAvailable, make, model, year;

- (NSNumber*)updateStockeWithSoldCount:(int)sold {
    
    double totalSold          = [[NSNumber numberWithInt:sold] doubleValue];
    double currentlyAvailable = [self.totalAvailable doubleValue];
    NSNumber * nowAvailable   = [NSNumber numberWithDouble:currentlyAvailable - totalSold];
    
    return nowAvailable;
}

// Accessor/Mutator Methods (Not sure why we are having to write these manually when @synthesize does it for us??)
- (void)setCc:(NSString *)bikeCc {
    self.cc = bikeCc;
}
- (NSString*)getCc {
    return self.cc;
}

- (void)setYear:(NSNumber *)bikeYear {
    self.year = bikeYear;
}
- (NSNumber*)getYear {
    return self.year;
}

- (void)setMake:(NSString *)bikeMake {
    self.make = bikeMake;
}
- (NSString*)getMake {
    return self.make;
}

- (void)setModel:(NSString *)bikeModel {
    self.model = bikeModel;
}
- (NSString*)getModel {
    return self.model;
}

- (void)setColorsAvailable:(NSMutableArray *)bikeColorsAvailable {
    self.colorsAvailable = bikeColorsAvailable;
}
- (NSMutableArray*)getColorsAvailable {
    return self.colorsAvailable;
}

- (void)setTotalAvailable:(NSNumber *)bikeTotalAvailable {
    self.totalAvailable = bikeTotalAvailable;
}
- (NSNumber*)getTotalAvailable {
    return self.totalAvailable;
}

@end
