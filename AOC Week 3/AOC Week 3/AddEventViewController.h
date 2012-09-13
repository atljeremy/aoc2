//
//  AddEventViewController.h
//  AOC Week 3
//
//  Created by Jeremy Fox on 9/10/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AddEventViewController : UIViewController

/**
 * Custom init method which accepts a MainViewController as a @param to allow us to
 * easily update the events dictionary that belongs to the MainViewControler.
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andMainView:(MainViewController*)mainView;

/**
 * The text field where a user can name the event
 */
@property (weak, nonatomic) IBOutlet UITextField *eventField;

/**
 * The date selection picker
 */
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

/**
 * IBAction method which formats the date selected using the datePicker then
 * initializes a new Event object and sets its properties accordingly. This
 * Event is then added to the MainViewControler's "events" dictionary. Finally,
 * the AddEventViewControler is dismissed.
 */
- (IBAction)saveEvent:(id)sender;

/**
 * IBAction method to close the keyboard
 */
- (IBAction)closeKeyboard:(id)sender;

@end
