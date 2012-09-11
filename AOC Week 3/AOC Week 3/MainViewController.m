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

@interface MainViewController () {
    BOOL clearTextView;
}

@end

@implementation MainViewController
@synthesize eventsView;
@synthesize events;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (NSString* key in self.events) {
        Event* event = [self.events objectForKey:key];
        
        if (clearTextView) {
            self.eventsView.text = @"";
            clearTextView = NO;
        }
        
        self.eventsView.text = [self.eventsView.text stringByAppendingFormat:@"New Event: %@ \n %@ \n\n", event.event, event.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.events   = [NSMutableDictionary dictionary];
    clearTextView = YES;
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
    [self presentModalViewController:[[AddEventViewController alloc] initWithNibName:@"AddEventViewController" bundle:nil andMainView:self] animated:YES];
}
@end
