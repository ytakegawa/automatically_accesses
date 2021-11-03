require "selenium-webdriver"

URL = "https://www.tokyodisneyresort.jp/ticket/index.html"

def main
  #driver = get_driver
  driver = Selenium::WebDriver.for :chrome
  driver.navigate.to(URL)
  driver.manage.timeouts.implicit_wait = 60
  message = driver.find_elements(class: "textalign")
  #timer = 0
  while true
    if message.size > 0 && message[0].text.find("アクセスが集中")
      timer.sleep(0.5)
      driver.navigate.refresh
    else
      break
      #driver.close
    end
  end
end

# def get_driver
#   #options = Options()
#   #options.add_argument('--headless')
#   driver = Selenium::WebDriver.for :chrome
#   #driver = webdriver.Chrome(ChromeDriverManager().install())
#   driver.manage.timeouts.page_load(600)
#   #driver.implicitly_wait(1)
#   Edriver.set_script_timeout(600)
# end

# def is_busy(driver)
#   message = driver.find_elements(class: "textalign")
#   if message.size > 0 && message[0].text.find("アクセスが集中")
#     True
#   else
#     False
#   end
# end

main
