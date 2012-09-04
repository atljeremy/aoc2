//
//  ViewController.m
//  AOC2 Week 2
//
//  Created by Jeremy Fox on 9/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MainViewController.h"
#import "InfoViewController.h"
#import "JFCalculatorManager.h"

#define kSegmentWhite  0
#define kSegmentBlue   1
#define kSegmentGreen  2

#define kPadding       20
#define kLabelHeight   31
#define kInfoLabelText @"Created By: Jeremy Fox"

@interface MainViewController () {
    BOOL shouldClearOutput;
    int  currentValue;
    int  previousValue;
}
    
@end

@implementation MainViewController
@synthesize outputLabel;
@synthesize onOffSwitch;
@synthesize backgroundLabel;
@synthesize segmentedControl;
@synthesize infobutton;

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup the action for the segmented controls "UIControlEventValueChanged"
    [segmentedControl addTarget:self
                         action:@selector(segmentChanged:)
               forControlEvents:UIControlEventValueChanged];
}

- (void)viewDidUnload
{
    [self setOutputLabel:nil];
    [self setOnOffSwitch:nil];
    [self setBackgroundLabel:nil];
    [self setSegmentedControl:nil];
    [self setInfobutton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Custom Methods

- (void)segmentChanged:(id)sender {
    
    switch ([self.segmentedControl selectedSegmentIndex]) {
        case kSegmentWhite:
        {
            [UIView animateWithDuration:0.5 animations:^{
                [self.view setBackgroundColor:[UIColor whiteColor]];
            }];
            break;
        }
            
        case kSegmentBlue:
        {
            [UIView animateWithDuration:0.5 animations:^{
                [self.view setBackgroundColor:[UIColor blueColor]];
            }];
            break;
        }
            
        case kSegmentGreen:
        {
            [UIView animateWithDuration:0.5 animations:^{
                [self.view setBackgroundColor:[UIColor greenColor]];
            }];
            break;
        }
            
        default:
            break;
    }
}

#pragma mark - IBAction's

- (IBAction)switchChanged:(id)sender {
}

- (IBAction)plusButtonPressed:(id)sender {
    currentValue = [self.outputLabel.text intValue];
    int sum      = [JFCalculatorManager calculateSumOfNumber:previousValue
                                             andSecondNumber:currentValue
                                                 withOperand:kAdditionKey];
    self.outputLabel.text = [NSString stringWithFormat:@"%d", sum];
    previousValue         = sum;
    shouldClearOutput     = YES;
}

- (IBAction)equalsButtonPressed:(id)sender {
    currentValue       = [self.outputLabel.text intValue];
    int sum            = [JFCalculatorManager calculateSumOfNumber:previousValue
                                                   andSecondNumber:currentValue
                                                       withOperand:kAdditionKey];
    self.outputLabel.text = [NSString stringWithFormat:@"%d", sum];
    previousValue      = 0;
    shouldClearOutput  = YES;
    
}

- (IBAction)clearButtonPressed:(id)sender {
    self.outputLabel.text = @"0";
    currentValue          = 0;
    previousValue         = 0;
    shouldClearOutput     = NO;
}

- (IBAction)infoButtonPressed:(id)sender {
    
    InfoViewController* infoVC = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    [self presentModalViewController:infoVC animated:YES];
}

- (IBAction)zeroPressed:(id)sender {
    [self setOutputLabelWithValue:@"0" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)onePressed:(id)sender {
    [self setOutputLabelWithValue:@"1" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)twoPressed:(id)sender {
    [self setOutputLabelWithValue:@"2" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)threePressed:(id)sender {
    [self setOutputLabelWithValue:@"3" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)fourPressed:(id)sender {
    [self setOutputLabelWithValue:@"4" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)fivePressed:(id)sender {
    [self setOutputLabelWithValue:@"5" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)sixPressed:(id)sender {
    [self setOutputLabelWithValue:@"6" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)sevenPressed:(id)sender {
    [self setOutputLabelWithValue:@"7" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)eightPressed:(id)sender {
    [self setOutputLabelWithValue:@"8" shouldClearOutputLabel:shouldClearOutput];
}

- (IBAction)ninePressed:(id)sender {
    [self setOutputLabelWithValue:@"9" shouldClearOutputLabel:shouldClearOutput];
}

- (void)setOutputLabelWithValue:(NSString*)value shouldClearOutputLabel:(BOOL)clearLabel {
    if (clearLabel) {
        self.outputLabel.text = @"";
    }
    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:value];
    shouldClearOutput = NO;
}

@end
