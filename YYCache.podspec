Pod::Spec.new do |s|
  s.name         = 'CBCache'
  s.summary      = 'High performance cache framework for iOS.'
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'cdnbye' => 'service@cdnbye.com' }
  s.social_media_url = 'https://docs.cdnbye.com'
  s.homepage     = 'https://github.com/snowinszu/CBCache'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source       = { :git => 'https://github.com/snowinszu/YYCache.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'YYCache/*.{h,m}'
  s.public_header_files = 'YYCache/*.{h}'
  
  s.libraries = 'sqlite3'
  s.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore' 

end
