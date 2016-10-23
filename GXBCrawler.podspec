Pod::Spec.new do |s|
  s.name             = "GXBCrawler"
  s.version          = "0.1.0"
  s.summary          = "A short description of GXBCrawler."
  s.description      = <<-DESC
                       An optional longer description of GXBCrawler

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "http://139.224.19.87/ios/ios-crawler-sdk"
  s.license          = 'MIT'
  s.author           = { "gxb" => "gxb@gmail.com" }
  s.source           = { :git => "http://iZ11ro8cf9xZ/ios/ios-crawler-sdk.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  #s.public_header_files = 'GXBCrawler/GXBSpider.h'

  #s.source_files       = 'GXBCrawler/**/*.{h,m}'
  s.vendored_frameworks = 'Products/GXBCrawler.framework'
  s.resources           = 'Resources/GXBCrawler.bundle'
  s.source_files        = 'Products/GXBCrawler.framework/Header/*.h'

  s.dependency 'AFNetworking'
  s.dependency 'JSONModel'
  s.dependency 'MBProgressHUD'
end