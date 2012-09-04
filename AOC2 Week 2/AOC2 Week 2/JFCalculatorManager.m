//
//  JFCalculatorManager.m
//  AOC2 Week 2
//
//  Created by Jeremy Fox on 9/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFCalculatorManager.h"

@implementation JFCalculatorManager

+ (int)calculateSumOfNumber:(int)one andSecondNumber:(int)two withOperand:(int)operand
{
    int sum;
    int numberOne = one ? one : 0;
    int numberTwo = two ? two : 0;
    
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
