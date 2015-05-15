Pod::Spec.new do |s|
s.name				= 'STCommonUtil'
s.version			= '0.13'
s.summary			= 'my common util'
s.homepage			= 'https://github.com/shiqyn/STCommonUtil'
s.license			= 'MIT'

s.authors			= { 'Shiqyn' => 'shiqyn@gmail.com'}

s.source			= { :git => 'https://github.com/shiqyn/STCommonUtil.git' }
s.platform			= :ios, '6.0'
s.source_files		= 'STCommonUtil/*'
s.frameworks		= 'CoreGraphics'
s.dependency "MBProgressHUD"
s.requires_arc		= true
end
