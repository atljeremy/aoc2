//
//  JFMotorcycle.h
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFMotorcycle : NSObject

@property (nonatomic, strong, getter = getCc,
                              setter = setCc:) NSString * cc;

@property (nonatomic, strong, getter = getYear,
                              setter = setYear:) NSNumber * year;

@property (nonatomic, strong, getter = getMake,
                              setter = setMake:) NSString * make;

@property (nonatomic, strong, getter = getModel,
                              setter = setModel:) NSString * model;

@property (nonatomic, strong, getter = getColorsAvailable,
                              setter = setColorsAvailable:) NSMutableArray * colorsAvailable;

@property (nonatomic, strong, getter = getTotalAvailable,
                              setter = setTotalAvailable:) NSNumber * totalAvailable;

- (NSNumber*)updateStockWithSoldCount:(int)sold;
- (NSString*)stringFromColorsAvailable;

// Overridden Accessor/Mutator Methods (Not sure why we are having to write these manually when @synthesize does it for us??)
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
