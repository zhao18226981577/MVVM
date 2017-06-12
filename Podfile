platform :ios, ‘8.0’
use_frameworks!
target ‘MVVM’ do
pod 'AFNetworking'
pod 'SDWebImage', '~>3.7'
pod 'MJRefresh'
pod 'MBProgressHUD'
pod 'MJExtension'
end
post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['ENABLE_BITCODE'] = 'NO'
end
end
end