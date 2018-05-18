# ZZZBatteryView
电池电量的显示，用于在横版，大屏 顶部电池状态栏 不显示，需要看电池电量的情况。

引用：
1、复制 ZZZBatteryView 文件夹到 工程。
2、 或者使用pod： pod 'ZZZBatteryView'

使用：
ZZZBatteryView *battery = [ZZZBatteryView batteryView];
//设置大小 或者约束。
battery.frame = CGRectMake(100, 100, 26, 11);
//添加到父view
[self.view addSubview:battery];

