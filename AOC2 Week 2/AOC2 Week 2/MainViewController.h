//
//  ViewController.h
//  AOC2 Week 2
//
//  Created by Jeremy Fox on 9/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField        *outputLabel;
@property (weak, nonatomic) IBOutlet UISwitch           *onOffSwitch;
@property (weak, nonatomic) IBOutlet UILabel            *backgroundLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton           *infobutton;
@property (weak, nonatomic) IBOutlet UIView             *disabledView;

- (IBAction)plusButtonPressed:(id)sender;
- (IBAction)equalsButtonPressed:(id)sender;
- (IBAction)clearButtonPressed:(id)sender;
- (IBAction)zeroPressed:(id)sender;
- (IBAction)onePressed:(id)sender;
- (IBAction)twoPressed:(id)sender;
- (IBAction)threePressed:(id)sender;
- (IBAction)fourPressed:(id)sender;
- (IBAction)fivePressed:(id)sender;
- (IBAction)sixPressed:(id)sender;
- (IBAction)sevenPressed:(id)sender;
- (IBAction)eightPressed:(id)sender;
- (IBAction)ninePressed:(id)sender;

- (IBAction)infoButtonPressed:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (void)segmentChanged:(id)sender;

@end
