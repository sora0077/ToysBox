#
#  Be sure to run `pod spec lint iTunesMusicKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name         = "ToysBoxKit"
  s.version      = "1.0.0"
  s.summary      = "ToysBoxKit."

  s.description  = <<-DESC
                   Helper Library Kit
                   DESC

  s.homepage     = "https://github.com/sora0077/ToysBoxKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "" => "" }
  s.source       = { :git => "https://github.com/sora0077/ToysBoxKit.git", :tag => "#{s.version}" }

  s.source_files  = "ToysBoxKit/**/*.{swift}"
  s.exclude_files = "Classes/Exclude"

end
