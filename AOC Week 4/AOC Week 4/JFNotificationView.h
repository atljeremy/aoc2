//
//  JFNotificationView.h
//  AOC Week 4
//
//  Created by Jeremy Fox on 9/19/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFNotificationView : NSObject

- (void)showNotificationWithMessage:(NSString*)message inView:(UIView*)view dismissAfter:(NSInteger)delay;


@end
