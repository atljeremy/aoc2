//
//  Event.h
//  AOC Week 3
//
//  Created by Jeremy Fox on 9/10/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

/**
 * String to hold the event description
 */
@property (nonatomic, strong) NSString* event;

/**
 * String to hold the event date
 */
@property (nonatomic, strong) NSString* date;

/**
 * Convenience method to return an NSArray of events sorted by date in asc order
 * Takes one @param which is a dictionary of events
 */
+ (NSArray*)eventsSortedByDate:(NSDictionary*)events;

@end
