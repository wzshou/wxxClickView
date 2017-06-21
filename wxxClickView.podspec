Pod::Spec.new do |s|
  s.name             = 'wxxClickView'
  s.version          = '0.1.0'
  s.summary          = '此分类是专门处理控件点击的响应事件,不用麻烦的设置代理或者 block,而且还可以获取 tableView 的indexPath 只要将此控件设置成属性,然在控制器实现:wxxCilck(属性名){}.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wzshou/wxxClickView.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1224708605@qq.com' => '1224708605@qq.com' }
  s.source           = { :git => 'https://github.com/wzshou/wxxClickView.git', :tag => '0.1.0' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'wxxClickView/Classes/**/*'
  
  # s.resource_bundles = {
  # 'wxxClickView' => ['wxxClickView/Assets/*.png']
  # }

  s.public_header_files = 'wxxClickView/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
