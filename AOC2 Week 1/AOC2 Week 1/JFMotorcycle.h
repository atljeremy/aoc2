//
//  JFMotorcycle.h
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFMotorcycle : NSObject {
    BOOL hasWarrenty;
}

@property (nonatomic, strong) NSString       * cc;
@property (nonatomic, strong) NSNumber       * year;
@property (nonatomic, strong) NSString       * make;
@property (nonatomic, strong) NSString       * model;
@property (nonatomic, strong) NSMutableArray * colorsAvailable;
@property (nonatomic, strong) NSNumber       * totalAvailable;

- (NSNumber*)updateStockeWithSoldCount:(int)sold;

// Accessor/Mutator Methods (Not sure why we are having to write these manually when @synthesize does it for us??)
- (void)setCc:(NSString *)bikeCc;
- (NSString*)getCc;

- (void)setYear:(NSNumber *)bikeYear;
- (NSNumber*)getYear;

- (void)setMake:(NSString *)bikeMake;
- (NSString*)getMake;

- (void)setModel:(NSString *)bikeModel;
- (NSString*)getModel;

- (void)setColorsAvailable:(NSMutableArray *)bikeColorsAvailable;
- (NSMutableArray*)getColorsAvailable;

- (void)setTotalAvailable:(NSNumber *)bikeTotalAvailable;
- (NSNumber*)getTotalAvailable;

@end
