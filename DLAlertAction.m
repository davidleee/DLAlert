//
//  DLAlertAction.m
//  DLAlertController
//
//  Created by David Lee on 2016/12/6.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "DLAlertAction.h"

@interface DLAlertAction()
@property (copy, nonatomic) NSString *actionTitle;
@property (assign, nonatomic) UIAlertActionStyle style;
@property (copy, nonatomic) DLAlertActionHandler actionHandler;
@end

@implementation DLAlertAction

+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(DLAlertActionHandler)handler {
    DLAlertAction *action = [[DLAlertAction alloc] init];
    action.actionTitle = title;
    action.style = style;
    action.actionHandler = [handler copy];
    return action;
}

- (void)setActionHandler:(DLAlertActionHandler)actionHandler {
    _actionHandler = actionHandler;
}

@end
