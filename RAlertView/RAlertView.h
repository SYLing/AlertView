//
//  RAlertView.h
//  RAlert
//
//  Created by 邵银岭 on 2016/10/11.
//  Copyright © 2016年 邵银岭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HexColors.h"
#import "Masonry.h"

typedef NS_ENUM(NSInteger,AlertStyle) {
    SimpleAlert = 0,
    ConfirmAlert,
    CancelAndConfirmAlert,
};
typedef NS_ENUM(NSInteger,AlertTheme) {
    YellowAlert = 0,
    GreenAlert,
    BlueAlert,
    Purple1Alert,
    Purple2Alert,
};

@interface RAlertView : UIView
- (instancetype)initWithStyle:(AlertStyle)style;
- (instancetype)initWithStyle:(AlertStyle)style width:(CGFloat)width;
- (void)exit;
@property (nonatomic, copy) void(^confirmButtonBlock)();
@property (nonatomic, copy) void(^cancelWindowBlock)();
@property (nonatomic,assign)AlertTheme theme;
@property (nonatomic,strong)NSString *headerTitle;
@property (nonatomic,strong)NSString *contentText;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)NSString *confirmButtonText;
@property (nonatomic,strong)NSString *cancelButtonText;

@end
