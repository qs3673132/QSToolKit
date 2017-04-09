#
#  Be sure to run `pod spec lint QSToolKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "QSToolKit"
  s.version      = "0.0.1"
  s.summary      = "some tools"
  s.homepage     = "https://github.com/qs3673132/QSToolKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "qs3673132" => "791956776@qq.com" }
  s.source       = { :git => "https://github.com/qs3673132/QSToolKit.git", :tag => "#{s.version}" }

  s.source_files = 'QSToolKit/**/*.{h,m}'
  s.public_header_files = 'QSToolKit/**/*.{h}'
  s.requires_arc  = true
  s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

end
