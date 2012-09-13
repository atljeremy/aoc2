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

@end

@implementation MainViewController
@synthesize eventsView;
@synthesize events;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // First, remove all previous text (events)
    if (self.eventsView.text.length == 0) {
        self.eventsView.text = @"All The Events Go Here...";
    } else {
        self.eventsView.text = @"";
    }
    
    // Then loop through events and add them one by one to the textview
    for (NSString* key in self.events) {
        Event* event = [self.events objectForKey:key];
        
        // Then set new text which includes new event
        self.eventsView.text = [self.eventsView.text stringByAppendingFormat:@"New Event: %@ \n %@ \n\n", event.event, event.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.events = [NSMutableDictionary dictionary];
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
