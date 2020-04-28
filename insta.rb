require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
@browser = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행

insta_url = "https://www.instagram.com/jong1no/"

@browser.get insta_url

title_xpath = ""

title = ""

posts_xpath = ""

posts = ""

followers_xpath = ""

followers = ""

follows_xpath = ""

follows = ""

puts "title: #{title}, posts: #{posts}, followers: #{followers}, follows: #{follows}"

@browser.quit