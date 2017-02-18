//
//  ViewController.m
//  DLAlertDemo
//
//  Created by Lee on 2017/2/18.
//
//

#import "ViewController.h"
#import "DLAlertController+Authorization.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // if our user has authorized us the camera usage, thank them 3 times
    // otherwise, beg them 3 times
    [DLAlertController checkCameraAuthorizationSuccess:^{
        for (int i = 1; i <= 3; i++) {
            [self presentAlertWithNumber:i message:@"Thank you for giving us the camera authorization!"];
        }
    } fail:^{
        for (int i = 1; i <= 3; i++) {
            [self presentAlertWithNumber:i message:@"Please re-consider..."];
        }
    }];
}

- (void)presentAlertWithNumber:(int)number message:(NSString *)message {
    DLAlertAction *ok = [DLAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(DLAlertAction *action) {
        // do something if user tapped OK
        NSLog(@"Alert No.%d dismiss with result OK", number);
    }];
    DLAlertAction *cancel = [DLAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(DLAlertAction *action) {
        // do something if user tapped Cancel
        NSLog(@"Alert No.%d dismiss with result Cancel", number);
    }];
    [DLAlertController presentWithTitle:[NSString stringWithFormat:@"Alert No.%d", number] message:message actions:@[cancel, ok]];
}

@end
