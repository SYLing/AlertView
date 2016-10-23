//
//  YLAlertView.h
//  YLAlert
//
//  Created by 邵银岭 on 2016/10/11.
//  Copyright © 2016年 邵银岭. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,YLAlertStyle) {
    YLSimpleAlert = 0,
    YLConfirmAlert,
    YLCancelAndConfirmAlert,
};
typedef NS_ENUM(NSInteger,YLAlertTheme) {
    YLYellowAlert = 0,
    YLGreenAlert,
    YLBlueAlert,
    YLPurple1Alert,
    YLPurple2Alert,
};

@interface YLAlertView : UIView

/**
 初始化方法

 @param title             headerTitle
 @param message           contentText
 @param preferredStyle    样式:枚举值
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(YLAlertStyle)preferredStyle;

/**
 初始化方法

 @param title             headerTitle
 @param message           contentText
 @param preferredStyle    样式:枚举值
 @param width             占屏幕宽度
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(YLAlertStyle)preferredStyle width:(CGFloat)width;

/** 内容视图 */
@property (nonatomic,strong)UIView *contentView;

/** 主题色 */
@property (nonatomic,assign)YLAlertTheme theme;

/** 退出 */
- (void)exit;

/** 确认按钮 */
- (void)addConfirmButtonWithTitle:(NSString *)title confirmHandler:(void (^)())confirmHandler;

/** 返回按钮 */
- (void)addCancelButtonWithTitle:(NSString *)title cancelHandler:(void (^)())cancelHandler;

@end
