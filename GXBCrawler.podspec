Pod::Spec.new do |s|
  s.name             = "GXBCrawler"
  s.version          = "0.1.0"
  s.summary          = "GXBCrawler SDK"
  s.description      = <<-DESC
                       GXBCrawlerSDK for clients to integrate.
                       DESC
  s.homepage         = "https://github.com/xiayun200825/gxbspider"
  s.license          = 'MIT'
  s.author           = { "gxb" => "gxb@gmail.com" }
  s.source           = { :git => "https://github.com/xiayun200825/gxbspider.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.vendored_frameworks = 'Products/GXBCrawler.framework'
  s.resources           = 'Resources/GXBCrawler.bundle'

  s.dependency 'AFNetworking'
  s.dependency 'JSONModel'
  s.dependency 'MBProgressHUD'
end