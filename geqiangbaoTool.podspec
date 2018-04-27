Pod::Spec.new do |s|
s.name         = "geqiangbaoTool" # 项目名称
s.version      = "1.0.0"        # 版本号 与 你仓库的 标签号 对应
s.license      = "MIT"          # 开源证书
s.summary      = "字符串常用工具" # 项目简介

s.homepage     = "https://github.com/shuyangxiaobao/geqiangbaoTool" # 你的主页
s.source       = { :git => "https://github.com/shuyangxiaobao/geqiangbaoTool.git", :tag => "#{s.version}" }#你的仓库地址，不能用SSH地址
s.source_files = "geqiangbaoTool/*.{h,m}" # 你代码的位置， GQBPhoneNumTF/*.{h,m} 表示 GQBPhoneNumTF 文件夹下所有的.h和.m文件
s.requires_arc = true # 是否启用ARC
s.platform     = :ios, "7.0" #平台及支持的最低版本
s.frameworks   = "UIKit", "Foundation" #支持的框架

# User
s.author             = { "GQB" => "825065886@qq.com" } # 作者信息

end
