//
//  ViewController.h
//  AOC Week 3
//
//  Created by Jeremy Fox on 9/10/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

/**
 * Public dictionary of events.
 * This is used by both the MainViewController and the AddEventsViewController.
 *
 * MainViewController uses this to get a sorted list of events do add to the
 * eventsView.
 *
 * AddEventViewController is initialized using a custom init method which
 * accepts a MainViewController as a @param. Using this we can update the
 * event dictionary so when the AddEventViewController is dismissed and
 * "viewWIllAppear" is called on MainViewController, we can update the 
 * eventsView with the new event.
 *
 * PLEASE NOTE: I considered using delegation to handle this, but it seemed
 * kind of overkill for such a small app.
 */
@property (strong, nonatomic) NSMutableDictionary* events;

/**
 * The UITextView that will display all events
 */
@property (weak, nonatomic) IBOutlet UITextView *eventsView;

/**
 * IBAction method the initialize the AddEventViewController and present
 * it modally.
 */
- (IBAction)addEvent:(id)sender;
@end
