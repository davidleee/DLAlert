//
//  DLAlertAction.h
//  DLAlertController
//
//  Created by David Lee on 2016/12/6.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DLAlertAction;
typedef void (^DLAlertActionHandler)(DLAlertAction * action);

@interface DLAlertAction : NSObject
@property (copy, nonatomic, readonly) NSString *actionTitle;
@property (assign, nonatomic, readonly) UIAlertActionStyle style;
@property (copy, nonatomic, readonly) DLAlertActionHandler actionHandler;

+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(DLAlertActionHandler)handler;

- (void)setActionHandler:(DLAlertActionHandler)actionHandler;
@end
