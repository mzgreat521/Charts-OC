Pod::Spec.new do |s|
  s.name         = "Charts-OC"
  s.version      = "0.0.1"
  s.summary      = “the OC version charts based on ‘Charts’”

  s.homepage     = "https://github.com/mzgreat521/Charts-OC"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "meizhu" => "meizhu882003@126.com" }
  s.platform     = :ios, “8.0”

  s.source       = { :git => "https://github.com/mzgreat521/Charts-OC.git", :tag => “v#{s.version}" }
  s.source_files = "Charts-OC", "Charts-OC/**/*.{h,m}"
  # s.public_header_files = "Classes/**/*.h"

  s.requires_arc = true
end