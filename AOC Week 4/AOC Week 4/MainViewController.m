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

@interface MainViewController ()
@property (nonatomic, strong) UIView * notificationContainerView;
@property (nonatomic, strong) UIView * notificationBGView;
@property (nonatomic, strong) UILabel* messageLbl;
@end

@implementation MainViewController
@synthesize eventsView;
@synthesize events;
@synthesize notificationContainerView;
@synthesize notificationBGView;
@synthesize messageLbl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary* storedEvents = [[NSUserDefaults standardUserDefaults] objectForKey:kStoredEvents];
    if (storedEvents) {
        // We had events stored in user defaults, so use those
        self.events = storedEvents;
    } else {
        // We didn't have any events stored in user defaults, so create a new dictionary for events
        self.events = [NSMutableDictionary dictionary];
    }
    
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

- (void)viewDidUnload
{
    [self setEventsView:nil];
    [self setEvents:nil];
    [self setSwipeLabel:nil];
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

- (IBAction)saveData:(id)sender {
    if (self.events && [self.events count] > 0) {
        [[NSUserDefaults standardUserDefaults] setObject:self.events forKey:kStoredEvents];
        [self showNotificationWithMessage:@"Saved Events!" dismissAfter:3.0];
    }
}

- (void)showNotificationWithMessage:(NSString*)message dismissAfter:(NSInteger)delay{
    
    /**
     * Create Notification Container View
     */
    CGRect containerFrame = CGRectMake((self.view.frame.size.width / 2) - 5,
                                       (self.view.frame.size.height / 2) - 5,
                                       10,
                                       10);
    
    notificationContainerView = [[UIView alloc] initWithFrame:containerFrame];
    
    /**
     * Create Notification BG View
     */
    CGRect containerContentFrame = CGRectMake(0,
                                              0,
                                              notificationContainerView.frame.size.width,
                                              notificationContainerView.frame.size.height);
    
    notificationBGView                    = [[UIView alloc] initWithFrame:containerContentFrame];
    notificationBGView.backgroundColor    = [UIColor blackColor];
    notificationBGView.alpha              = 0.0;
    notificationBGView.layer.cornerRadius = 10.0;
    
    
    /**
     * Create Notification Message Label
     */
    CGRect messageLblFrame = CGRectMake(containerContentFrame.origin.x,
                                        (containerContentFrame.size.height / 2),
                                        containerContentFrame.size.width,
                                        0);
    
    messageLbl                 = [[UILabel alloc] initWithFrame:messageLblFrame];
    messageLbl.textAlignment   = UITextAlignmentCenter;
    messageLbl.backgroundColor = [UIColor clearColor];
    messageLbl.textColor       = [UIColor whiteColor];
    messageLbl.shadowColor     = [UIColor blackColor];
    messageLbl.alpha           = 0.0;
    messageLbl.font            = [UIFont fontWithName:@"MarkerFelt-Wide" size:20.0];
    
    if (message) {
        messageLbl.text = message;
    } else {
        messageLbl.text = @"No Message Entered!";
    }
    
    /**
     * Add Subviews
     */
    [notificationContainerView addSubview:notificationBGView];
    [notificationContainerView addSubview:messageLbl];
    [self.view addSubview:notificationContainerView];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                        notificationContainerView.frame = CGRectMake((self.view.frame.size.width / 2) - 75,
                                                                     (self.view.frame.size.height / 2) - 75,
                                                                     150,
                                                                     150);
                        
                        notificationBGView.alpha = 0.7;
                        notificationBGView.frame = CGRectMake(0,
                                                              0,
                                                              notificationContainerView.frame.size.width,
                                                              notificationContainerView.frame.size.height);
                        
                        messageLbl.alpha = 1.0;
                        messageLbl.frame = CGRectMake(0,
                                                      (notificationContainerView.frame.size.height / 2) - 10,
                                                      notificationContainerView.frame.size.width,
                                                      20);
                    }
                    completion:^(BOOL finished){
                        if (finished) {
                                [self dismissNotificationWithDelay:delay];
                        }
                    }];
}

- (void)dismissNotificationWithDelay:(NSInteger)delay {
    int64_t delayInSeconds = delay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [UIView animateWithDuration:0.5
                         animations:^{
                             notificationContainerView.frame = CGRectMake((self.view.frame.size.width / 2) - 5,
                                                                          (self.view.frame.size.height / 2) - 5,
                                                                          10,
                                                                          10);
                             notificationContainerView.alpha = 0.0;
                             
                             notificationBGView.frame = CGRectMake(0,
                                                                   0,
                                                                   notificationContainerView.frame.size.width,
                                                                   notificationContainerView.frame.size.height);
                             
                             messageLbl.frame = CGRectMake(0,
                                                           (notificationContainerView.frame.size.height / 2),
                                                           notificationContainerView.frame.size.width,
                                                           0);
                         }
                         completion:^(BOOL finished){
                             if (finished) {
                                 [notificationContainerView removeFromSuperview];
                             }
                         }];
    });
}

@end
