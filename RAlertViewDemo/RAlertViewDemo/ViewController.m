//
//  ViewController.m
//  YLAlertViewDemo
//
//  Created by 邵银岭 on 16/10/22.
//  Copyright © 2016年 MOLMC. All rights reserved.
//

#import "ViewController.h"
#import "YLAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)SimpleAlert:(id)sender {
    YLAlertView *alert = [[YLAlertView alloc] initWithTitle:@"heardTitle" message:@"SimpleAlert \nAlertView A pop-up framework, Can be simple and convenient to join your project" preferredStyle:YLSimpleAlert width:0.9];
    alert.theme = YLBlueAlert;
}
- (IBAction)ConfirmAlert:(id)sender {
    YLAlertView *alert = [[YLAlertView alloc] initWithTitle:@"ConfirmAlert" message:@"AlertView A pop-up framework, Can be simple and convenient to join your project" preferredStyle:YLConfirmAlert];
    alert.theme = YLPurple1Alert;
    [alert addConfirmButtonWithTitle:@"确认" confirmHandler:^{
        NSLog(@"Click on the Ok");
    }];
}
- (IBAction)CancelAndConfirmAlert:(id)sender {
    YLAlertView *alert = [[YLAlertView alloc] initWithTitle:@"CancelAndConfirmAlert" message:@"AlertView A pop-up framework, Can be simple and convenient to join your project" preferredStyle:YLCancelAndConfirmAlert];
    alert.theme = YLPurple1Alert;
    [alert addConfirmButtonWithTitle:@"OK👌" confirmHandler:^{
        NSLog(@"科科达  OK");
    }];
    [alert addCancelButtonWithTitle:@"NO NO NO" cancelHandler:^{
        NSLog(@"💔 取消");
    }];
}

- (IBAction)myButton:(id)sender {
    
    // 苹果的方法
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"OC" message:@"iPhone method" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"又要" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了【按钮】按钮");
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"按钮" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"点击了【按钮】按钮");
    }]];
    
    // 在当前控制器上面弹出另一个控制器：alertController  显示
    [self presentViewController:alert animated:YES completion:nil];
}

@end
