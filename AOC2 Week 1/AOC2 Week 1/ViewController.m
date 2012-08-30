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

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Hide the picture of my motocycle so it can be faded in after view has appeared
    self.myMotorcyclePic.alpha = 0;
    
    JFMotorcycle* ducatiMoster = [[JFMotorcycleFactory sharedInstance] instantiateMotorcycleOfType:[NSStringFromClass([JFMotorcycleDucatiMonster class]) lowercaseString]];
    
    self.ducatiOne.text = [NSString stringWithFormat:@"%@ %@ %@'s", [ducatiMoster updateStockWithSoldCount:3], ducatiMoster.getMake, ducatiMoster.getModel];
    
    JFMotorcycle* hondaCBR = [[JFMotorcycleFactory sharedInstance] instantiateMotorcycleOfType:[NSStringFromClass([JFMotorcycleHondaCBR class]) lowercaseString]];
    
    JFMotorcycle* suzukiGSXR = [[JFMotorcycleFactory sharedInstance] instantiateMotorcycleOfType:[NSStringFromClass([JFMotorcycleSuzukiGSXR class]) lowercaseString]];
    

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
