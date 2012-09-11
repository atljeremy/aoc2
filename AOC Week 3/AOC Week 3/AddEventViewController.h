//
//  AddEventViewController.h
//  AOC Week 3
//
//  Created by Jeremy Fox on 9/10/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *eventField;

- (IBAction)saveEvent:(id)sender;
- (IBAction)closeKeyboard:(id)sender;

@end
