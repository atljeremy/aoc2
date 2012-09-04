//
//  ViewController.m
//  AOC2 Week 2
//
//  Created by Jeremy Fox on 9/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "ViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

- (IBAction)segmentChanged:(id)sender {
}
@end
