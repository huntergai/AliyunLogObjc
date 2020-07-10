#
# Be sure to run `pod lib lint AliyunLogObjc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'AliyunSlsObjc-hunter'
    s.version          = '2.0.0'
    s.summary          = 'Aliyun Sls Log SDK for iOS'
  
    s.description      = <<-DESC
For the official Aliyun Sls SDK is written in Swift 2.3, it's improper for objc app to be packaged with the large Swift Core Lib and Swift Foundation Lib, about 30 Mb.

This SDK is mostly interpreted from the official one, but the quality of code has been improved compared with the unreasonable style in the original one.
                         DESC
  
    s.homepage         = 'https://github.com/huntergai/AliyunLogObjc'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'lujiajing1126' => 'lujiajing1126@gmail.com' }
    s.source           = { :git => 'https://github.com/huntergai/AliyunLogObjc.git', :tag => s.version.to_s }
  
    s.ios.deployment_target = '8.0'
    s.module_name = 'AliyunSlsObjc-hunter'
    s.header_dir   = "AliyunSlsObjc-hunter"
  
    s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1' }
  
    s.source_files = 'AliyunSlsObjc-hunter/**/*.{h,m}'
    s.exclude_files = 'AliyunSlsObjc-hunter/**/*.pbobjc.{h,m}'
    s.requires_arc = true
    s.prepare_command = 'protoc -I "./AliyunSlsObjc-hunter" --objc_out="./AliyunSlsObjc-hunter/serde" "./AliyunSlsObjc-hunter/sls.proto"'

    s.subspec 'no-arc' do |sp|
      sp.source_files = 'AliyunSlsObjc-hunter/**/*.pbobjc.{h,m}'
      sp.requires_arc = false
    end

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'Protobuf', '~> 3.11.3'
  end