#
#  Be sure to run `pod spec lint wxxClickView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

 s.name         = "wxxClickView"
  s.version      = "0.0.1"
  s.summary      = " 此分类是专门处理控件点击的响应事件,不用麻烦的设置代理或者 block,而且还可以获取 tableView 的indexPath 只要将此控件设置成属性,然在控制器实现:wxxCilck(属性名){}

  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/wzshou/wxxClickView.git"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "wzs" => "1224708605@qq.com" }
  s.source       = { :git => "https://github.com/wzshou/wxxClickView.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'

  s.source_files  = 'wxxClickView/Classes/**/*'

  s.resource_bundles = {
     'wxxClickView' => ['wxxClickView/Assets/*.png']
  }

  s.public_header_files = 'wxxClickView/Classes/**/*.h'
  s.frameworks = 'UIKit'




end
