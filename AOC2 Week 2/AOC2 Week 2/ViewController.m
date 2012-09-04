//
//  ViewController.m
//  AOC2 Week 2
//
//  Created by Jeremy Fox on 9/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "ViewController.h"

#define kSegmentWhite 0
#define kSegmentBlue  1
#define kSegmentGreen 2

@interface ViewController ()

@end

@implementation ViewController
@synthesize outputLabel;
@synthesize onOffSwitch;
@synthesize plusButton;
@synthesize equalsButton;
@synthesize clearButton;
@synthesize zeroButton;
@synthesize oneButton;
@synthesize twoButton;
@synthesize threeButton;
@synthesize fourButton;
@synthesize fiveButton;
@synthesize sizButton;
@synthesize sevenButton;
@synthesize eightButton;
@synthesize nineButton;
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
    [self setPlusButton:nil];
    [self setEqualsButton:nil];
    [self setClearButton:nil];
    [self setZeroButton:nil];
    [self setOneButton:nil];
    [self setTwoButton:nil];
    [self setThreeButton:nil];
    [self setFourButton:nil];
    [self setFiveButton:nil];
    [self setSizButton:nil];
    [self setSevenButton:nil];
    [self setEightButton:nil];
    [self setNineButton:nil];
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
}

- (IBAction)equalsButtonPressed:(id)sender {
}

- (IBAction)clearButtonPressed:(id)sender {
}

- (IBAction)infoButtonPressed:(id)sender {
}
@end
