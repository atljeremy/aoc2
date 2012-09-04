//
//  JFCalculatorManager.h
//  AOC2 Week 2
//
//  Created by Jeremy Fox on 9/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAdditionKey       0
#define kSubtractionKey    1
#define kMultiplicationKey 2
#define kDivisionKey       4

@interface JFCalculatorManager : NSObject

+ (int)calculateSumOfNumber:(int)one andSecondNumber:(int)two withOperand:(int)operand;

@end
