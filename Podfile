source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

project 'MarvelApp.xcodeproj'
workspace 'MarvelApp.xcworkspace'

use_modular_headers!
inhibit_all_warnings!

abstract_target 'default' do
    # SDK
    pod 'SDK', :path => 'SDK/'
    pod 'Toast-Swift'

    target 'MarvelApp' do
      target 'MarvelAppTests' do
          inherit! :search_paths
          use_frameworks!

          pod 'KIF'
          pod 'Quick'
          pod 'Nimble'
          pod 'Nimble-Snapshots'
      end
    end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'

            myTargets = []

            if myTargets.include? target.name
                config.build_settings['SWIFT_VERSION'] = '4.2'
            end
        end
    end
end
