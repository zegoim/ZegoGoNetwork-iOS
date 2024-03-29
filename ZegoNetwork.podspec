#
# Be sure to run `pod lib lint ZegoNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZegoNetwork'
  s.version          = '0.1.1'
  s.summary          = 'Networking based on YTKNetwork. Did some simple encapsulation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zegoim/ZegoGoNetwork-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vicwan' => 'vicwan@zego.im' }
  s.source           = { :git => 'https://github.com/zegoim/ZegoGoNetwork-iOS.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'ZegoNetwork/Classes/**/*'
  
  s.dependency 'YTKNetwork'
  
end
