//
//  ViewController.h
//  AOC Week 3
//
//  Created by Jeremy Fox on 9/10/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary* events;
@property (weak, nonatomic) IBOutlet UITextView *eventsView;

- (IBAction)addEvent:(id)sender;
@end
