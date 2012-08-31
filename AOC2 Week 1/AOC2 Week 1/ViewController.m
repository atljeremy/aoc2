//
//  ViewController.m
//  AOC2 Week 1
//
//  Created by Jeremy Fox on 8/27/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "ViewController.h"
#import "JFMotorcycleFactory.h"
#import "JFMotorcycleDucatiMonster.h"
#import "JFMotorcycleHondaCBR.h"
#import "JFMotorcycleSuzukiGSXR.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myMotorcyclePic;
@synthesize ducatiOne;
@synthesize ducatiTwo;
@synthesize hondaOne;
@synthesize hondaTwo;
@synthesize suzukiOne;
@synthesize suzukiTwo;
@synthesize ducatiThree;
@synthesize ducatiFour;
@synthesize hondaThree;
@synthesize hondaFour;
@synthesize suzukiThree;
@synthesize suzukiFour;

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Hide the picture of my motocycle so it can be faded in after view has appeared
    self.myMotorcyclePic.alpha = 0;
    
    
    // Get the DucatiMonster class instance from the JFMotorCycleFactory preconfigured
    // with its ecessary attributes set using properties declared in both the base
    // class and the class itself.
    JFMotorcycleDucatiMonster* ducatiMoster = (JFMotorcycleDucatiMonster*)[[JFMotorcycleFactory sharedInstance] instantiateMotorcycleOfType:[NSStringFromClass([JFMotorcycleDucatiMonster class]) lowercaseString]];
    
    self.ducatiOne.text = [NSString stringWithFormat:@"%@ - %@ %@ %@ %@'s Available",
                           [ducatiMoster updateStockWithSoldCount:3],
                           ducatiMoster.getYear,
                           ducatiMoster.getCc,
                           ducatiMoster.getMake,
                           ducatiMoster.getModel];
    self.ducatiTwo.text = [NSString stringWithFormat:@"%@", ducatiMoster.stringFromColorsAvailable];
    NSString* ducatiarrentyAvailable = [ducatiMoster.hasDucatiWarrenty boolValue] ? @"Yes" : @"No" ;
    self.ducatiThree.text = [NSString stringWithFormat:@"Warrenty Available: %@", ducatiarrentyAvailable];
    self.ducatiFour.text = ducatiMoster.ducatiWarrentyDescription;
    
    // Get the HondaCBR class instance from the JFMotorCycleFactory preconfigured
    // with its ecessary attributes set using properties declared in both the base
    // class and the class itself.
    JFMotorcycleHondaCBR* hondaCBR = (JFMotorcycleHondaCBR*)[[JFMotorcycleFactory sharedInstance] instantiateMotorcycleOfType:[NSStringFromClass([JFMotorcycleHondaCBR class]) lowercaseString]];
    
    self.hondaOne.text = [NSString stringWithFormat:@"%@ - %@ %@ %@ %@'s Available",
                          [hondaCBR updateStockWithSoldCount:1],
                          hondaCBR.getYear,
                          hondaCBR.getCc,
                          hondaCBR.getMake,
                          hondaCBR.getModel];
    self.hondaTwo.text = [NSString stringWithFormat:@"%@", hondaCBR.stringFromColorsAvailable];
    NSString* hondaWarrentyAvailable = [hondaCBR.hasHondaWarrenty boolValue] ? @"Yes" : @"No" ;
    self.hondaThree.text = [NSString stringWithFormat:@"Warrenty Available: %@", hondaWarrentyAvailable];
    self.hondaFour.text = hondaCBR.hondaWarrentyDescription;
    
    
    // Get the SuzukiGSXR class instance from the JFMotorCycleFactory preconfigured
    // with its ecessary attributes set using properties declared in both the base
    // class and the class itself.
    JFMotorcycleSuzukiGSXR* suzukiGSXR = (JFMotorcycleSuzukiGSXR*)[[JFMotorcycleFactory sharedInstance] instantiateMotorcycleOfType:[NSStringFromClass([JFMotorcycleSuzukiGSXR class]) lowercaseString]];
    
    self.suzukiOne.text = [NSString stringWithFormat:@"%@ - %@ %@ %@ %@'s Available",
                           [suzukiGSXR updateStockWithSoldCount:5],
                           suzukiGSXR.getYear,
                           suzukiGSXR.getCc,
                           suzukiGSXR.getMake,
                           suzukiGSXR.getModel];
    self.suzukiTwo.text = [NSString stringWithFormat:@"%@", suzukiGSXR.stringFromColorsAvailable];
    NSString* suzukiWarrentyAvailable = [suzukiGSXR.hasSuzukiWarrenty boolValue] ? @"Yes" : @"No" ;
    self.suzukiThree.text = [NSString stringWithFormat:@"Warrenty Available: %@", suzukiWarrentyAvailable];
    self.suzukiFour.text = suzukiGSXR.suzukiWarrentyDescription;

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self fadeInMyMotorcycle];
}

- (void)viewDidUnload
{
    [self setMyMotorcyclePic:nil];
    [self setDucatiOne:nil];
    [self setDucatiTwo:nil];
    [self setHondaOne:nil];
    [self setHondaTwo:nil];
    [self setSuzukiOne:nil];
    [self setSuzukiTwo:nil];
    [self setDucatiThree:nil];
    [self setHondaThree:nil];
    [self setSuzukiThree:nil];
    [self setDucatiFour:nil];
    [self setHondaFour:nil];
    [self setSuzukiFour:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma  mark - Custom Methods

// Custom method to fade in the picture of my own motorcycle at the bottom of the view
- (void)fadeInMyMotorcycle {
    [UIView animateWithDuration:1.0 animations:^{
        self.myMotorcyclePic.alpha = 1;
    }];
}

@end
