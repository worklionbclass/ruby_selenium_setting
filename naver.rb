require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
@browser = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행

navertv_url = "https://tv.naver.com/"

@browser.get navertv_url

tops_xpath = "/html/body/div[2]/div[3]/div[2]/div[1]/div/div/ul/li"
tops = @browser.find_elements(xpath: tops_xpath)

next_btn_xpath = "/html/body/div[2]/div[3]/div[2]/div[1]/div/a[2]"
next_btn = @browser.find_element(xpath: next_btn_xpath)

tops.each_with_index do |item, index|
    rank = index + 1
    
    if rank % 5 == 0
        next_btn.click
    end
    
    sleep 0.2
    
    title = item.find_element(tag_name: "tooltip").attribute("title")
    puts "#{rank}: #{title}"
end

@browser.quit