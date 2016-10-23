//
//  YLAlertView.m
//  YLAlert
//
//  Created by 邵银岭 on 2016/10/11.
//  Copyright © 2016年 邵银岭. All rights reserved.
//

#import "YLAlertView.h"
#import "HexColors.h"
#import "Masonry.h"

@interface YLAlertView ()
@property(nonatomic,strong)UILabel *headerTitleLabel;
@property(nonatomic,strong)UILabel *contentTextLabel;
@property(nonatomic,strong)UIButton *closedButton;
@property(nonatomic,strong)UIButton *confirmButton;
@property(nonatomic,strong)UIButton *cancelButton;
@property(nonatomic,strong)UIView *mainView;

/**
 确认按钮回调
 */
@property (nonatomic, copy) void(^confirmButtonBlock)();
/**
 返回按钮回调
 */
@property (nonatomic, copy) void(^cancelButtonBlock)();
@end

@implementation YLAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(YLAlertStyle)preferredStyle {
    self = [super init];
    if (self) {
        [self initWindow:preferredStyle];
        [self.headerTitleLabel setText:title];
        [self.contentTextLabel setText:message];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(YLAlertStyle)preferredStyle width:(CGFloat)width{
    self = [super init];
    if (self) {
        [self initWindow:preferredStyle];
        [self.headerTitleLabel setText:title];
        [self.contentTextLabel setText:message];
        [self setAlertWidth:width];
    }
    return self;
}

-(void)setAlertWidth:(CGFloat)width{
    
    [self.mainView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (width > 1) {
            make.width.offset(width);
        }
        else if(width > 0 && width <= 1){
            make.width.offset([UIScreen mainScreen].bounds.size.width * width);
        }
        else{
            make.width.offset([UIScreen mainScreen].bounds.size.width * 0.7);
        }
    }];
}

-(void)setTheme:(YLAlertTheme)theme{
    
    switch (theme) {
        case YLYellowAlert://#fddb43
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#fddb43"]];
            [_confirmButton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"#3d3d3d"] forState:UIControlStateNormal];
            break;
        case YLGreenAlert://#4CBE77
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#4CBE77"]];
            [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case YLBlueAlert://#295DC0
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#295DC0"]];
            [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case YLPurple1Alert://#74225C
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#74225C"]];
            [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case YLPurple2Alert://#B655FF
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#B655FF"]];
            [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            break;
    }
}

-(void)animateSenior{

    self.mainView.transform = CGAffineTransformMakeTranslation(0, 600);
    // Damping:弹性系数，越小，弹簧效果越明显
    // SpringVelocity:弹簧初始化速度
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.mainView.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
    }];
}

#pragma mark -初始化UI
-(void)initWindow:(YLAlertStyle)style{
    
    switch (style) {
        case YLSimpleAlert:
            [self viewInitUI];
            [self simpleAlertViewInitUI];
            [self animateSenior];
            break;
        case YLConfirmAlert:
            [self viewInitUI];
            [self confirmAlertViewInitUI];
            [self animateSenior];
            break;
        case YLCancelAndConfirmAlert:
            [self viewInitUI];
            [self cancelAndConfirmAlertViewInitUI];
            [self animateSenior];
            break;
    }
}

-(void)viewInitUI{
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [window addSubview:self];
    [self addSubview:self.mainView];
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [self.mainView insertSubview:self.closedButton atIndex:999];
    [self.mainView addSubview:self.headerTitleLabel];
    [self.mainView insertSubview:self.contentView atIndex:0];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
    }];
    self.mainView.translatesAutoresizingMaskIntoConstraints =NO;
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.mainView.superview);
        make.width.offset([UIScreen mainScreen].bounds.size.width * 0.7);
    }];
    
    [self.closedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainView);
        make.right.equalTo(self.mainView);
        make.width.height.offset(35);
    }];
    [self.headerTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainView).offset(10);
        make.left.equalTo(self.mainView).offset(15);
        make.right.equalTo(self.mainView).offset(-30);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerTitleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.headerTitleLabel);
        make.right.equalTo(self.mainView).offset(-15);
        make.bottom.equalTo(self.mainView).offset(-10);
    }];
}

-(void)simpleAlertViewInitUI{
    
    [self.contentTextLabel setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:self.contentTextLabel];
    [self.contentTextLabel sizeToFit];
    
    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

-(void)confirmAlertViewInitUI{
    
    [self.mainView addSubview:self.confirmButton];
    [self.contentView addSubview:self.contentTextLabel];
    
    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentTextLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.mainView);
        make.bottom.equalTo(self.mainView);
        make.height.offset(40);
    }];
}

-(void)cancelAndConfirmAlertViewInitUI{
    [self.mainView addSubview:self.cancelButton];
    [self.mainView addSubview:self.confirmButton];
    [self.contentView addSubview:self.contentTextLabel];
    
    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    
    NSMutableArray *arrayM = @[].mutableCopy;
    [arrayM addObject:self.cancelButton];
    [arrayM addObject:self.confirmButton];
    
    [arrayM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [arrayM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.bottom.equalTo(self.mainView);
        make.top.equalTo(self.contentTextLabel.mas_bottom).offset(10);
    }];
}

#pragma mark -事件处理
-(void)exit{
    [self removeFromSuperview];
}

- (void)addConfirmButtonWithTitle:(NSString *)title confirmHandler:(void (^)())confirmHandler {
    [self.confirmButton setTitle:title forState:UIControlStateNormal];
    self.confirmButtonBlock = confirmHandler;
}

- (void)addCancelButtonWithTitle:(NSString *)title cancelHandler:(void (^)())cancelHandler
{
    [self.cancelButton setTitle:title forState:UIControlStateNormal];
    self.cancelButtonBlock = cancelHandler;
}

-(void)closedButtonClick:(UIButton *)sender{
    [self exit];
}

-(void)confirmButtonClick:(UIButton*)sender{

    !self.confirmButtonBlock ? : self.confirmButtonBlock();
    [self exit];
}
-(void)cancelButtonClick:(UIButton*)sender{
    
    !self.cancelButtonBlock ? : self.cancelButtonBlock();
    [self exit];
}

#pragma mark -视图
-(UIView*)mainView{
    if (_mainView == nil) {
        _mainView = [[UIView alloc]init];
        [_mainView setBackgroundColor:[UIColor whiteColor]];
        [_mainView.layer setMasksToBounds:YES];
        [_mainView.layer setCornerRadius:4];
    }
    return _mainView;
}
-(UIButton *)confirmButton{
    if(_confirmButton == nil){
        _confirmButton = [[UIButton alloc]init];
        [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#fddb43"]];
        [_confirmButton setTitle:@"Ok" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"#3d3d3d"] forState:UIControlStateNormal];
        [_confirmButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_confirmButton addTarget:self action:@selector(confirmButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}
-(UIButton *)cancelButton{
    if(_cancelButton == nil){
        _cancelButton = [[UIButton alloc]init];
        [_cancelButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#EBECED"]];
        [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"#3d3d3d"] forState:UIControlStateNormal];
        [_cancelButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

-(UIButton *)closedButton{
    if(_closedButton == nil){
        _closedButton = [[UIButton alloc]init];
        [_closedButton setImage:[UIImage imageNamed:@"closed.png"] forState:UIControlStateNormal];
        [_closedButton addTarget:self action:@selector(closedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closedButton;
}

-(UILabel*)headerTitleLabel {
    if (_headerTitleLabel == nil) {
        _headerTitleLabel = [[UILabel alloc]init];
        [_headerTitleLabel setFont:[UIFont systemFontOfSize:15]];
        [_headerTitleLabel setTextAlignment:NSTextAlignmentCenter];
        [_headerTitleLabel setTextColor:[UIColor hx_colorWithHexRGBAString:@"#3d3d3d"]];
    }
    return _headerTitleLabel;
}

-(UIView *)contentView{
    if(_contentView==nil){
        _contentView =[[UIView alloc]init];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
    }
    return _contentView;
}

-(UILabel*)contentTextLabel {
    if (_contentTextLabel == nil) {
        _contentTextLabel = [[UILabel alloc]init];
        [_contentTextLabel setFont:[UIFont systemFontOfSize:13]];
        [_contentTextLabel setTextColor:[UIColor hx_colorWithHexRGBAString:@"#898989"]];
        _contentTextLabel.numberOfLines = 0;
    }
    return _contentTextLabel;
}

@end
