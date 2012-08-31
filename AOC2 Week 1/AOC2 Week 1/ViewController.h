//
//  ViewController.h
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *myMotorcyclePic;

// Ducati Labels
@property (weak, nonatomic) IBOutlet UILabel *ducatiOne;
@property (weak, nonatomic) IBOutlet UILabel *ducatiTwo;
@property (weak, nonatomic) IBOutlet UILabel *ducatiThree;
@property (weak, nonatomic) IBOutlet UILabel *ducatiFour;

// Honda Labels
@property (weak, nonatomic) IBOutlet UILabel *hondaOne;
@property (weak, nonatomic) IBOutlet UILabel *hondaTwo;
@property (weak, nonatomic) IBOutlet UILabel *hondaThree;
@property (weak, nonatomic) IBOutlet UILabel *hondaFour;

// Suzuki Labels
@property (weak, nonatomic) IBOutlet UILabel *suzukiOne;
@property (weak, nonatomic) IBOutlet UILabel *suzukiTwo;
@property (weak, nonatomic) IBOutlet UILabel *suzukiThree;
@property (weak, nonatomic) IBOutlet UILabel *suzukiFour;

@end
