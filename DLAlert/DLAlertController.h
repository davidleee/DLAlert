//
//  DLAlertController.h
//  DLAlertController
//
//  Created by David Lee on 2016/12/6.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLAlertAction.h"

@interface DLAlertController : NSObject

+ (void)presentWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <DLAlertAction *> *)action;

@end
