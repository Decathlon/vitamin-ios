Pod::Spec.new do |s|

  s.name         = "VitaminSwiftUI"
  s.version      = "0.8.0"
  s.summary      = "The iOS implement of Decathlon's design system"

  s.homepage     = "https://github.com/Decathlon/vitamin-ios"

  s.license     = { :type => "Apache 2.0", :file => "LICENSE" }

  s.author       = { "Decathlon" => "designsystem@decathlon.net" }

  s.platform     = :ios, "13.0"
  s.ios.deployment_target = '13.0'

  s.source           = { :git => 'https://github.com/Decathlon/vitamin-ios.git', :tag => s.version.to_s }
  s.swift_version    = '5.3'

  s.source_files     = 'Sources/VitaminSwiftUI/**/*.swift'
  s.dependency         'VitaminCore', s.version.to_s

end
