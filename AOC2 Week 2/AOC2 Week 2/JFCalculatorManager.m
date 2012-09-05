//
//  JFCalculatorManager.m
//  AOC2 Week 2
//
//  Created by Jeremy Fox on 9/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFCalculatorManager.h"

@implementation JFCalculatorManager

+ (double)calculateSumOfNumber:(double)one andSecondNumber:(double)two withOperand:(int)operand
{
    double sum;
    double numberOne = one ? one : 0;
    double numberTwo = two ? two : 0;
    
    switch (operand) {
        case kAdditionKey:
        {
            
            sum = (numberOne + numberTwo);
        }
        break;
            
        case kSubtractionKey:
        {
            sum = (numberOne - numberTwo);
        }
            break;
            
        case kMultiplicationKey:
        {
            sum = (numberOne * numberTwo);
        }
            break;
            
        case kDivisionKey:
        {
            sum = (numberOne / numberTwo);
        }
            break;
            
        default:
            break;
    }
    
    return sum;
}

@end
