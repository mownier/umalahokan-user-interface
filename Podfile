platform :ios, '9.0'
use_frameworks!
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

def firebase_pods
    pod 'Firebase/Database'
    pod 'Firebase/Auth'
    pod 'Firebase/Storage'
end

target 'UserInterface' do
    pod 'Viper', :git => 'https://github.com/mownier/viper.git', :tag => '1.1.1'
    firebase_pods
    
    target 'UserInterfaceTests' do
        inherit! :search_paths
        firebase_pods
    end
    
    target 'UserInterfaceUITests' do
        inherit! :search_paths
        firebase_pods
    end
end
