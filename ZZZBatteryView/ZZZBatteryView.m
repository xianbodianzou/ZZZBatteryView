//
//  BatteryView.m
//  dianchi
//
//  Created by shgbit on 2018/5/16.
//  Copyright © 2018年 shgbit. All rights reserved.
//

#import "ZZZBatteryView.h"

@interface ZZZBatteryView()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *conBatWith;
@property (weak, nonatomic) IBOutlet UIView *fullviewBg;
@property (weak, nonatomic) IBOutlet UIView *xianshiView;
@property (weak, nonatomic) IBOutlet UIImageView *stateImage;

@end
∫

/**
 >20%绿色
 <20%红色报警。
 */
@implementation ZZZBatteryView

+(instancetype)batteryView{
    
    return  [[[NSBundle bundleForClass:self]  loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(void)didMoveToSuperview{
    
    //电池图片重置。
    self.stateImage.image  = [UIImage imageNamed: [@"ZZZBattery.bundle" stringByAppendingPathComponent:@"eQuantity"] inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
    //通知注册
    //设置电池通知启动
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    //初始设置
    [self setBetteyValue:[UIDevice currentDevice].batteryLevel];
    //先清除通知
    [[NSNotificationCenter defaultCenter ] removeObserver:self];
    //再重新注册通知。
    //电池剩余电量
    
    //监视电池剩余电量
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(InfoNotificationAction_UIDeviceBatteryLevelDidChangeNotification:) name:UIDeviceBatteryLevelDidChangeNotification object:nil];
    
//    //监视充电状态
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(InfoNotificationAction_UIDeviceBatteryLevelDidChangeNotification:) name:UIDeviceBatteryStateDidChangeNotification object:nil];
}

- (void)InfoNotificationAction_UIDeviceBatteryLevelDidChangeNotification:(NSNotification *)notification{
    NSLog(@"电池电量：%.2f", [UIDevice currentDevice].batteryLevel);
    [self setBetteyValue:[UIDevice currentDevice].batteryLevel];
}

//- (void)InfoNotificationAction_UIDeviceBatteryStateDidChangeNotificationtion:(NSNotification *)notification{
//    UIDeviceBatteryState batteryState = [UIDevice currentDevice].batteryState;
//    if(batteryState == UIDeviceBatteryStateFull){
//
//    }
//    else if(batteryState==UIDeviceBatteryStateCharging){
//
//    }
//    else if(batteryState ==UIDeviceBatteryStateUnplugged){
//
//    }
//
//    NSLog(@"电池状态：%d",(int)batteryState);
//}

-(void)removeFromSuperview{
    [[NSNotificationCenter defaultCenter ] removeObserver:self];
}

-(void)setBetteyValue:(CGFloat)value{
    //模拟器取不到电量 改为1.0
    if(value ==-1){
        value = 1.0f;
    }
    
    [NSLayoutConstraint deactivateConstraints:@[self.conBatWith]];
    
    if(value<0.2){
        self.xianshiView.backgroundColor = [UIColor redColor];
    }
    else{
        self.xianshiView.backgroundColor = [UIColor greenColor];
    }
    
    NSLayoutConstraint *cc =  [NSLayoutConstraint constraintWithItem:self.xianshiView attribute:NSLayoutAttributeWidth relatedBy:0 toItem:self.fullviewBg attribute:NSLayoutAttributeWidth multiplier:value constant:0];
    self.conBatWith = cc;
    [self addConstraint:cc];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
