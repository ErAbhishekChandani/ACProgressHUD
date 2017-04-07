Pod::Spec.new do |s|

s.name         = "ACProgressHUD-Swift"
s.version      = "1.0"
s.summary      = "Lightweight ProgressHud for iOS apps in swift with some very awesome animations."
s.description  = <<-DESC
ACProgress HUD is lightweight library to show progress HUD in iOS apps with some very awesome animations and fully customizable appereance e.g. customize the show animation, dismiss animation, change the background color of HUD view, change the progress text, change the indicator color, show or hid dim background , change the transperancy of Background, Show Blur background etc.
DESC

s.homepage     = "https://github.com/ErAbhishekChandani/ACProgressHUD"
s.license      = "MIT"
s.author             = { "Abhishek" => "chandani.abhishek440@gmail.com" }
s.platform     = :ios
s.platform     = :ios, "8.0"

s.source       = { :git => "https://github.com/ErAbhishekChandani/ACProgressHUD.git", :tag => s.version }

s.source_files = 'Source/*.swift'
s.resources    = 'Source/*.xib'

end
