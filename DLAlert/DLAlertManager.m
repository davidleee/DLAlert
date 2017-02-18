//
//  DLAlertManager.m
//  DLAlertController
//
//  Created by David Lee on 2016/12/6.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLAlertManager.h"
#import "DLAlertAction.h"

@interface DLAlertManager()
@property (strong, nonatomic) NSMutableArray <DLAlertTask *> *tasks;

@property (strong, nonatomic) UIWindow *alertWindow;
@end

@implementation DLAlertManager

+ (instancetype)sharedInstance {
    static DLAlertManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DLAlertManager alloc] init];
    });
    return sharedInstance;
}

- (void)enqueueTask:(DLAlertTask *)task {
    if (!task) {
        return;
    }

    [self.tasks addObject:task];
    [self execute];
}

#pragma mark -

- (void)execute {
    if (self.tasks.count == 0) {
        return;
    }

    DLAlertTask *task = self.tasks.firstObject;
    if (task.executing) {
        return;
    }
    task.executing = YES;

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:task.taskTitle message:task.taskMessage preferredStyle:UIAlertControllerStyleAlert];

    DLAlertAction *dlAction = task.actions.firstObject;

    __weak typeof(self) weakSelf = self;
    UIAlertAction *realAction = [UIAlertAction actionWithTitle:dlAction.actionTitle style:dlAction.style handler:^(UIAlertAction * _Nonnull action) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (dlAction.actionHandler) {
            DLAlertActionHandler handler = [dlAction.actionHandler copy];
            dlAction.actionHandler = nil;
            handler(dlAction);
        }
        strongSelf.alertWindow.hidden = YES;
        [strongSelf.tasks removeObject:task];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [strongSelf execute];
        });
    }];
    [alertController addAction:realAction];

    if (task.actions.count > 1) {
        for (int i = 1; i < task.actions.count; i++) {
            DLAlertAction *nextAction = task.actions[i];
            UIAlertAction *realNextAction = [UIAlertAction actionWithTitle:nextAction.actionTitle style:nextAction.style handler:^(UIAlertAction * _Nonnull action) {
                __strong typeof(weakSelf) strongSelf = weakSelf;
                if (nextAction.actionHandler) {
                    DLAlertActionHandler handler = [nextAction.actionHandler copy];
                    nextAction.actionHandler = nil;
                    handler(nextAction);
                }
                strongSelf.alertWindow.hidden = YES;
                [strongSelf.tasks removeObject:task];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [strongSelf execute];
                });
            }];
            [alertController addAction:realNextAction];
        }
    }

    [self.alertWindow makeKeyAndVisible];
    [self.alertWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Getter

- (NSMutableArray<DLAlertTask *> *)tasks {
    if (!_tasks) {
        _tasks = [[NSMutableArray alloc] init];
    }
    return _tasks;
}

- (UIWindow *)alertWindow {
    if (!_alertWindow) {
        _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _alertWindow.windowLevel = UIWindowLevelStatusBar;
        UIViewController *rootVC = [[UIViewController alloc] init];
        _alertWindow.rootViewController = rootVC;
    }
    return _alertWindow;
}

@end
