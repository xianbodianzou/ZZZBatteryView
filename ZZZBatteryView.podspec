

Pod::Spec.new do |s|


  s.name         = "ZZZBatteryView"
  s.version      = "0.0.1"
  s.summary      = "电池电量的显示"

  s.description  = <<-DESC
			电池电量的显示，用于在横版，大屏 顶部电池状态栏 不显示，需要看电池电量的情况。
                   DESC

  s.homepage     = "https://github.com/xianbodianzou/ZZZBatteryView"


  s.license      = "MIT"

  s.author             = { "xianbodianzou" => "280646450@qq.com" }

 
  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/xianbodianzou/ZZZBatteryView.git", :tag => "#{s.version}"}


  s.source_files  =  "ZZZBatteryView/**/*.{h,m}"
  
  s.resource  = "ZZZBatteryView/**/*.{xib,bundle}"
end
