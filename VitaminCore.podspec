Pod::Spec.new do |s|

  s.name         = "VitaminCore"
  s.version      = "0.6.0"
  s.summary      = "The iOS implement of Decathlon's design system"

  s.homepage     = "https://github.com/Decathlon/vitamin-ios"

  s.license     = { :type => "Apache 2.0", :file => "LICENSE" }

  s.author       = { "Decathlon" => "designsystem@decathlon.net" }

  s.platform     = :ios, "10.0"
  s.ios.deployment_target = '10.0'

  s.source           = { :git => 'https://github.com/Decathlon/vitamin-ios.git', :tag => s.version.to_s }
  s.swift_version    = '5.3'

  s.source_files     = 'Sources/VitaminCore/**/*.swift'
  s.resources        = 'Sources/VitaminCore/**/*.{xcassets,ttf}'

end
