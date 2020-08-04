Pod::Spec.new do |s|
  s.authors      = "Mengzhu"
  s.name         = "MZRouter"
  s.version      = "0.0.1"
  s.summary      = "MZRouter iOS MZ's Router Framework"
  s.description  = "MZRouter iOS MZ's Router Framework, MZRouter Server Function"
  s.homepage     = "http://www.zmengzhu.com"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "sunxianhao" => "sunxianhao@rd.zmengzhu.com" }
  s.source       = { :git => "https://github.com/mengzhuSDK/MZRouter-iOS.git", :tag => "#{s.version}" }
  s.requires_arc = true  
  s.ios.deployment_target = '8.0'
  s.frameworks = 'Foundation'
  s.source_files = 'MZRouter/*'
  # s.public_header_files = 'MZRouter/*.h'
  end