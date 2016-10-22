//
//  ViewController.m
//  RAlertViewDemo
//
//  Created by 邵银岭 on 16/10/22.
//  Copyright © 2016年 MOLMC. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "RAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)SimpleAlert:(id)sender {
    RAlertView *alert = [[RAlertView alloc] initWithStyle:SimpleAlert width:0.8];
    alert.contentText = @"SimpleAlert \nAlertView A pop-up framework, Can be simple and convenient to join your project";
}
- (IBAction)ConfirmAlert:(id)sender {
    RAlertView *alert = [[RAlertView alloc] initWithStyle:ConfirmAlert];
    alert.theme = Purple1Alert;
    alert.headerTitle = @"ConfirmAlert";
    alert.contentText = @"AlertView A pop-up framework, Can be simple and convenient to join your project";
    alert.confirmButtonText = @"Ok";
    alert.confirmButtonBlock = ^(){
        NSLog(@"Click on the Ok");
    };
}
- (IBAction)CancelAndConfirmAlert:(id)sender {
    RAlertView *alert = [[RAlertView alloc] initWithStyle:CancelAndConfirmAlert];
    alert.headerTitle = @"CancelAndConfirmAlert";
    alert.contentText = @"AlertView A pop-up framework, Can be simple and convenient to join your project";
    alert.confirmButtonText = @"Ok";
    alert.cancelButtonText = @"Cancel";
    alert.confirmButtonBlock = ^(){
        NSLog(@"Click on the Ok");
    };
    alert.cancelWindowBlock = ^(){
        NSLog(@"Click on the Cancel");
    };
}


@end
