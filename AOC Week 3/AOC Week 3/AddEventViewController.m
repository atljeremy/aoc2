//
//  AddEventViewController.m
//  AOC Week 3
//
//  Created by Jeremy Fox on 9/10/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "AddEventViewController.h"
#import "Event.h"

@interface AddEventViewController ()
@property (nonatomic, strong) MainViewController* mainVC;
@end

@implementation AddEventViewController
@synthesize eventField;
@synthesize datePicker;
@synthesize mainVC;

/**
 * Custom init method that excepts a references to the main view so we can easily update its list of events
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andMainView:(MainViewController*)mainView
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.mainVC = mainView;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    /**
     * We only want this class to be initialized using the custom init method, 
     * so @throw and exception otherwise
     */
    @throw [NSException exceptionWithName:@"Invalid Initialization"
                                   reason:@"AddEventViewController should only be initialized using custim init method - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andMainView:(MainViewController*)mainView"
                                 userInfo:nil];
    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     * Restrict dates in the past
     */
    self.datePicker.minimumDate = [NSDate date];
}

- (void)viewDidUnload
{
    [self setEventField:nil];
    [self setMainVC:nil];
    [self setDatePicker:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveEvent:(id)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy HH:mm:ss a"];
    NSString *formattedDate = [formatter stringFromDate:self.datePicker.date];
    
    Event* event = [[Event alloc] init];
    event.event = self.eventField.text.length > 0 ? self.eventField.text : @"No Event Entered!";
    event.date  = formattedDate;
    
    [self.mainVC.events setValue:event forKey:[NSString stringWithFormat:@"%@+%@", event.event, event.date]];
    
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)closeKeyboard:(id)sender {
    [self.eventField resignFirstResponder];
}
@end
