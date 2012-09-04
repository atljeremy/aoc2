//
//  ViewController.h
//  AOC2 Week 2
//
//  Created by Jeremy Fox on 9/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    JFBackgroundColorWhite,
    JFBackgroundColorBlue,
    JFBackgroundColorGreen
} JFBackgroundColor;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField        *outputLabel;
@property (weak, nonatomic) IBOutlet UISwitch           *onOffSwitch;
@property (weak, nonatomic) IBOutlet UIButton           *plusButton;
@property (weak, nonatomic) IBOutlet UIButton           *equalsButton;
@property (weak, nonatomic) IBOutlet UIButton           *clearButton;
@property (weak, nonatomic) IBOutlet UIButton           *zeroButton;
@property (weak, nonatomic) IBOutlet UIButton           *oneButton;
@property (weak, nonatomic) IBOutlet UIButton           *twoButton;
@property (weak, nonatomic) IBOutlet UIButton           *threeButton;
@property (weak, nonatomic) IBOutlet UIButton           *fourButton;
@property (weak, nonatomic) IBOutlet UIButton           *fiveButton;
@property (weak, nonatomic) IBOutlet UIButton           *sizButton;
@property (weak, nonatomic) IBOutlet UIButton           *sevenButton;
@property (weak, nonatomic) IBOutlet UIButton           *eightButton;
@property (weak, nonatomic) IBOutlet UIButton           *nineButton;
@property (weak, nonatomic) IBOutlet UILabel            *backgroundLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton           *infobutton;

- (IBAction)switchChanged:(id)sender;
- (IBAction)plusButtonPressed:(id)sender;
- (IBAction)equalsButtonPressed:(id)sender;
- (IBAction)clearButtonPressed:(id)sender;
- (IBAction)infoButtonPressed:(id)sender;
- (void)segmentChanged:(id)sender;

@end
