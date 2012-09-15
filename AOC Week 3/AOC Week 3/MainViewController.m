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

@interface MainViewController ()
@property (nonatomic, strong) NSMutableArray* eventsArray;
@end

@implementation MainViewController
@synthesize eventsView;
@synthesize events;
@synthesize eventsArray;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /**
     * Check to see if we've added any events yet, if not, set to to placeholder.
     * If we have, then clear the text view to prepare it for the new events.
     */
    if (self.eventsView.text.length == 0) {
        self.eventsView.text = @"All The Events Go Here...";
    } else {
        self.eventsView.text = @"";
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.events = [NSMutableDictionary dictionary];
    self.eventsView.userInteractionEnabled = NO;
}

- (void)viewDidUnload
{
    [self setEventsView:nil];
    [self setEvents:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)addEvent:(id)sender {
    [self presentModalViewController:[[AddEventViewController alloc] initWithNibName:@"AddEventViewController"
                                                                              bundle:nil
                                                                         andMainView:self] animated:YES];
}
@end
