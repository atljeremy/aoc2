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
    double  currentValue;
    double  previousValue;
}
    
@end

@implementation MainViewController
@synthesize outputLabel;
@synthesize onOffSwitch;
@synthesize backgroundLabel;
@synthesize segmentedControl;
@synthesize infobutton;
@synthesize disabledView;

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
    [self setDisabledView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - IBAction's

- (IBAction)switchChanged:(id)sender {
    if (self.onOffSwitch.on) {
        [UIView animateWithDuration:0.5 animations:^{
            self.disabledView.alpha = 0.0;
        }
        completion:^(BOOL finished){
            if (finished) {
                self.disabledView.hidden = YES;
                [self reset];
            }
        }];
    } else {
        self.disabledView.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.disabledView.alpha = 0.7;
        }];
    }
}

- (IBAction)plusButtonPressed:(id)sender {
    currentValue = [self.outputLabel.text doubleValue];
    double sum   = [JFCalculatorManager calculateSumOfNumber:previousValue
                                             andSecondNumber:currentValue
                                                 withOperand:kAdditionKey];
    self.outputLabel.text = [NSString stringWithFormat:@"%.01f", sum];
    previousValue         = sum;
    shouldClearOutput     = YES;
}

- (IBAction)equalsButtonPressed:(id)sender {
    currentValue = [self.outputLabel.text doubleValue];
    double sum   = [JFCalculatorManager calculateSumOfNumber:previousValue
                                             andSecondNumber:currentValue
                                                 withOperand:kAdditionKey];
    self.outputLabel.text = [NSString stringWithFormat:@"%.01f", sum];
    previousValue         = 0;
    shouldClearOutput     = YES;
    
}

- (IBAction)clearButtonPressed:(id)sender {
    [self reset];
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

#pragma mark - Custom Methods

- (void)segmentChanged:(id)sender {
    
    switch ([self.segmentedControl selectedSegmentIndex]) {
        case kSegmentWhite:
        {
            self.backgroundLabel.text = @"Background Color: White";
            [UIView animateWithDuration:0.5 animations:^{
                [self.view setBackgroundColor:[UIColor whiteColor]];
                self.backgroundLabel.textColor = [UIColor blackColor];
            }];
            break;
        }
            
        case kSegmentBlue:
        {
            self.backgroundLabel.text = @"Background Color: Blue";
            [UIView animateWithDuration:0.5 animations:^{
                [self.view setBackgroundColor:[UIColor blueColor]];
                self.backgroundLabel.textColor = [UIColor whiteColor];
            }];
            break;
        }
            
        case kSegmentGreen:
        {
            self.backgroundLabel.text = @"Background Color: Green";
            [UIView animateWithDuration:0.5 animations:^{
                [self.view setBackgroundColor:[UIColor greenColor]];
                self.backgroundLabel.textColor = [UIColor blackColor];
            }];
            break;
        }
            
        default:
            break;
    }
}

- (void)reset {
    self.outputLabel.text = @"";
    currentValue          = 0;
    previousValue         = 0;
    shouldClearOutput     = NO;
}

- (void)setOutputLabelWithValue:(NSString*)value shouldClearOutputLabel:(BOOL)clearLabel {
    if (clearLabel) {
        self.outputLabel.text = @"";
    }
    self.outputLabel.text = [self.outputLabel.text stringByAppendingString:value];
    shouldClearOutput = NO;
}

@end
