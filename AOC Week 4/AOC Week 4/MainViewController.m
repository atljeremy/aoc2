//
//  ViewController.m
//  AOC Week 3
//
//  Created by Jeremy Fox on 9/10/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MainViewController.h"
#import "AddEventViewController.h"
#import "Event.h"
#import <QuartzCore/QuartzCore.h>

#define kStoredEvents @"storedEvents"
#define kAllEventsGoHere @"All The Events Go Here..."

@implementation MainViewController
@synthesize eventsView;
@synthesize events;
@synthesize clearButton;
@synthesize swipeLabel;



/**
 *
 * PLEASE NOTE: I was unnsuccessful in getting the debugger to respect any of the method calls 
 * to NSUserDefaults while in debug mode with break points set. I am not sure why it wouldn't 
 * cooperate while debugging.
 *
 * However, if you launch the app using xcode, then click stop in xcode and return to the simulator 
 * and re-launch the app using the app icon in the simulator, you will see that everything is working 
 * as outlined in the rubric. All events are stored to NSUserDefaults and used after the app is killed 
 * and re-launched. If you click the "Clear" button I added to the top left of the Main View, you'll 
 * notice that all events will be deleted and the next time you launch the app all events will still be
 * gone until you add new events and click "Save".
 *
 * I will outline all of this in my weekly video for project 4 and show examples in the screencast.
 *
 * If you have questions regarding anything please get with me before making any assumptions.
 *
 */



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     * Per Rubric: During application load, the text entered into the textview is loaded back in and displayed using user defaults.
     */
    NSData *storedEventdata = [[NSUserDefaults standardUserDefaults] objectForKey:kStoredEvents];
    NSMutableDictionary* storedEvents = [NSKeyedUnarchiver unarchiveObjectWithData:storedEventdata];
    if (storedEvents) {
        
        NSLog(@"Successfully Retreived Stored Events!");
        
        // We had events stored in user defaults, so use those
        self.events = storedEvents;
    } else {
        
        NSLog(@"Didn't Find Any Events To Restore!");
        
        // We didn't have any events stored in user defaults, so create a new dictionary for events
        self.events = [NSMutableDictionary dictionary];
    }
    
    /**
     * Per Rubric: The swipe right label triggers the date view to appear and is labeled appropriately.
     */
    UISwipeGestureRecognizer* swiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(addEvent:)];
    swiper.numberOfTouchesRequired = 1;
    swiper.direction = UISwipeGestureRecognizerDirectionRight;
    [self.swipeLabel addGestureRecognizer:swiper];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /**
     * Check to see if we've added any events yet, if not, set to to placeholder.
     * If we have, then clear the text view to prepare it for the new events.
     */
    if (self.eventsView.text.length == 0 && [self.events count] == 0) {
        self.eventsView.text = kAllEventsGoHere;
        self.clearButton.hidden = YES;
    } else {
        self.eventsView.text = @"";
        self.clearButton.hidden = NO;
    }
    
    /**
     * Loop through events and add them one by one to the textview
     */
    for (NSString* key in [Event eventsSortedByDate:self.events]) {
        Event* event = [self.events objectForKey:key];
        
        /**
         * Then set new text which includes new event
         */
        self.eventsView.text = [self.eventsView.text stringByAppendingFormat:@"New Event: %@ \n %@ \n\n", event.event, event.date];
    }
}

- (void)viewDidUnload
{
    [self setEventsView:nil];
    [self setEvents:nil];
    [self setSwipeLabel:nil];
    [self setClearButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)addEvent:(UIGestureRecognizer*)gestureRecognizer {
    [self presentModalViewController:[[AddEventViewController alloc] initWithNibName:@"AddEventViewController"
                                                                              bundle:nil
                                                                         andMainView:self] animated:YES];
}

- (IBAction)clearEvents:(id)sender {
    self.eventsView.text = kAllEventsGoHere;
    self.events = nil;
    self.events = [NSMutableDictionary dictionary];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kStoredEvents];
}

/**
 * Per Rubric: The save button creates an NSUserDefaults object and saves the text in the textview.
 */
- (IBAction)saveData:(id)sender {
    if (self.events && [self.events count] > 0) {
        NSData *eventsData = [NSKeyedArchiver archivedDataWithRootObject:self.events];
        [[NSUserDefaults standardUserDefaults] setObject:eventsData forKey:kStoredEvents];
        [[[JFNotificationView alloc] init] showNotificationWithMessage:@"Saved Events!" inView:self.view dismissAfter:3.0];
    } else {
        [[[JFNotificationView alloc] init] showNotificationWithMessage:@"Add Event To Save" inView:self.view dismissAfter:3.0];
    }
}

@end
