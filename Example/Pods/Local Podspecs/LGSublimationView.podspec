#
# Be sure to run `pod lib lint LGSublimationView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LGSublimationView"
  s.version          = "0.3.0"
  s.summary          = "The LGSublimationView is an alternative to the way a UIScrollView looks when paging."
  s.description      = <<-DESC
The LGSublimationView is an alternative to the way a standard UIScrollView looks when paging. Instead of scrolling the background views of its content view, it just scrolls labels, and the background views 'sublime' from one to another.
                       DESC
  s.homepage         = "https://github.com/lukegeiger/LGSublimationView"
  s.license          = 'MIT'
  s.author           = { "Luke Geiger" => "lukejamesgeiger@gmail.com" }
  s.source           = { :git => "https://github.com/lukegeiger/LGSublimationView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/@lukejgeiger'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'LGSublimationView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
