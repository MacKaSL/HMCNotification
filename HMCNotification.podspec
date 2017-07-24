Pod::Spec.new do |s|
  s.name         = "HMCNotification"
  s.module_name  = "HMCNotification"
  s.version      = "10.2.0"
  s.summary      = "Custom push style notification"
  s.description  = <<-DESC
                   A simple iOS 8 push notification style control to show quick messages to the user.
                   DESC
  s.homepage     = "https://github.com/MacKaSL/HMCNotification"
  s.license      = { :type => 'MIT' }
  s.author       = { "Himal Madhushan" => "himalmadhushan@icloud.com" }
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/socketio/socket.io-client-swift.git", :tag => 'v10.2.0' }
  s.source_files  = "Source/**/*.{h,m}}"
  s.requires_arc = true
  # s.pod_target_xcconfig = {
  #  'SWIFT_VERSION' => '3.1',
  #  'SWIFT_INCLUDE_PATHS' => '$(PODS_ROOT)/Socket.IO-Client-Swift/zlib'
  #}
  # s.dependency 'Starscream', '~> 0.9' # currently this repo includes Starscream swift files
end