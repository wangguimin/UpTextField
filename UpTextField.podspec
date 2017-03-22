Pod::Spec.new do |s|
  s.name         = "UpTextField"
  s.version      = "1.0.8"
  s.summary      = "A Library for iOS to use for RSA encryptor."
  s.homepage     = "https://github.com/wangguimin/UpTextField"
  s.license      = "MIT"
  s.author             = { "wangguimin" => "870503894@qq.com" }
  s.source       = { :git => "https://github.com/wangguimin/UpTextField.git", :tag => "#{s.version}" }
  s.source_files  = "UpTextField/*.{h,m}"
  s.frameworks   = "Foundation"
  s.platform     = :ios, "8.0"
end
