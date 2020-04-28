require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
@browser = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행

url = "https://ridibooks.com/bestsellers/general"
page = 1

loop do 
    @browser.get url + "?page=#{page}"
                 
    lists_path = "/html/body/div[3]/div[1]/div/div/section/div[2]/div"
    lists = @browser.find_elements(xpath: lists_path)
    
    break if lists.length == 0
    
    lists.each do |item|
        rank = item.find_element(class: "book_ranking").text
        title = item.find_element(class: "title_text").text
        p "#{rank}위 #{title}"
    end
    
    page = page + 1
end