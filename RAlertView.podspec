Pod::Spec.new do |s|

  s.name         = "RAlertView"
  s.version      = "0.0.5"
  s.summary      = "custom of AlertView."

  s.ios.deployment_target = "7.0"

s.homepage     = "https://github.com/SYLing/AlertView"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "邵银岭" => "534585931@qq.com" }
s.source       = { :git => "https://github.com/SYLing/AlertView.git", :tag => s.version }
s.source_files  = "RAlertView"
s.requires_arc = true
s.social_media_url  = "https://github.com/SYLing"
s.dependency = "HexColors.h"
s.dependency = "Masonry.h"

end
