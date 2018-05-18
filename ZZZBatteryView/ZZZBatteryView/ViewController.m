//
//  ViewController.m
//  ZZZBatteryView
//
//  Created by shgbit on 2018/5/18.
//  Copyright © 2018年 shgbit. All rights reserved.
//

#import "ViewController.h"
#import "ZZZBatteryView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ZZZBatteryView *battery = [ZZZBatteryView batteryView];
    
    [self.view addSubview:battery];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
