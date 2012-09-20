//
//  Event.m
//  AOC Week 3
//
//  Created by Jeremy Fox on 9/10/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "Event.h"

#define kEventKey @"event"
#define kDateKey  @"date"

@implementation Event
@synthesize event;
@synthesize date;

+ (NSArray*)eventsSortedByDate:(NSDictionary *)events {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy HH:mm:ss a"];
    NSComparator compareDates = ^(id event1, id event2) {
        
        NSDate *date1 = [formatter dateFromString:((Event*)event1).date];
        NSDate *date2 = [formatter dateFromString:((Event*)event2).date];
        
        return [date1 compare:date2];
    };
    
    return [events keysSortedByValueWithOptions:NSSortStable usingComparator:compareDates];
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.event forKey:kEventKey];
    [encoder encodeObject:self.date  forKey:kDateKey];
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self.event = [decoder decodeObjectForKey:kEventKey];
    self.date  = [decoder decodeObjectForKey:kDateKey];
    return self;
}

@end
