//
//  JFNotificationView.m
//  AOC Week 4
//
//  Created by Jeremy Fox on 9/19/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFNotificationView.h"
#import <QuartzCore/QuartzCore.h>

@interface JFNotificationView()
@property (nonatomic, strong) UIView * notificationContainerView;
@property (nonatomic, strong) UIView * notificationBGView;
@property (nonatomic, strong) UILabel* messageLbl;
@property (nonatomic, strong) UIView * coverView;
@end

@implementation JFNotificationView
@synthesize notificationContainerView;
@synthesize notificationBGView;
@synthesize messageLbl;
@synthesize coverView;

- (void)showNotificationWithMessage:(NSString*)message inView:(UIView*)view dismissAfter:(NSInteger)delay {
    
    /**
     * Create the cover view which will simply prevent a user form selecting anything while the notification is visible.
     */
    coverView = [[UIView alloc] initWithFrame:view.frame];
    coverView.backgroundColor = [UIColor clearColor];
    
    /**
     * Create Notification Container View
     */
    CGRect containerFrame = CGRectMake((view.frame.size.width / 2) - 5,
                                       (view.frame.size.height / 2) - 5,
                                       15,
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
    [view addSubview:coverView];
    [view addSubview:notificationContainerView];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         notificationContainerView.frame = CGRectMake((view.frame.size.width / 2) - 100,
                                                                      (view.frame.size.height / 2) - 75,
                                                                      200,
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
                             [self dismissNotificationWithDelay:delay fromView:view];
                         }
                     }];
}

- (void)dismissNotificationWithDelay:(NSInteger)delay fromView:(UIView*)view {
    int64_t delayInSeconds = delay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [UIView animateWithDuration:0.5
                         animations:^{
                             notificationContainerView.frame = CGRectMake((view.frame.size.width / 2) - 5,
                                                                          (view.frame.size.height / 2) - 5,
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
                                 [coverView removeFromSuperview];
                                 [notificationContainerView removeFromSuperview];
                                 coverView = nil;
                                 notificationContainerView = nil;
                             }
                         }];
    });
}


@end
