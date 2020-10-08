platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

def testing_pods
  pod 'Quick'
  pod 'Nimble'
  pod 'Sourcery'
  pod 'OHHTTPStubs/Swift'
end

target 'DeeMoney' do
  pod 'NimbleExtension', :git => 'https://github.com/nimblehq/NimbleExtension', :branch => 'master'

  pod 'SnapKit'
  pod 'Alamofire'
  pod 'IQKeyboardManagerSwift'
  pod 'SwiftLint'
      
  pod 'R.swift'

  pod 'Firebase/Crashlytics'
  pod 'Firebase/Performance'
  pod 'Firebase/Analytics'

 target 'DeeMoneyTests' do
  testing_pods
 end
 target 'DeeMoneyUITests' do
  testing_pods
 end


end
      
