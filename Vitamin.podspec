Pod::Spec.new do |s|

  s.name         = "Vitamin"
  s.version      = "0.6.0"
  s.summary      = "The iOS implement of Decathlon's design system"

  s.homepage     = "https://github.com/Decathlon/vitamin-ios"

  s.license     = { :type => "Apache 2.0", :file => "LICENSE" }

  s.author       = { "Decathlon" => "designsystem@decathlon.net" }

  s.platform     = :ios, "10.0"
  s.ios.deployment_target = '10.0'

  s.source           = { :git => 'https://github.com/Decathlon/vitamin-ios.git', :tag => s.version.to_s }
  s.swift_version    = '5.3'

  s.default_subspecs = "UIKit"

  s.subspec "Core" do |spec|
    spec.source_files   = 'Sources/VitaminCore/**/*.swift'
    spec.resources      = 'Sources/VitaminCore/**/*.{xcassets,ttf}'
  end

  s.subspec "UIKit" do |spec|
    spec.source_files   = 'Sources/VitaminUIKit/**/*.swift'
    spec.resources      = 'Sources/VitaminUIKit/**/*.xib'
    spec.dependency     "Vitamin/Common"
  end

  s.subspec "SwiftUI" do |spec|
    spec.source_files   = 'Sources/VitaminSwiftUI/**/*.swift'
    spec.dependency     "Vitamin/Common"
  end

end
