require "selenium-webdriver"

URL = "https://reserve.tokyodisneyresort.jp/ticket/search/"
# "https://www.tokyodisneyresort.jp/ticket/index.html"
#"https://reserve.tokyodisneyresort.jp/ticket/search/?outside=1&route=2&parkTicketGroupCd=020&useDateFrom=20211206"

def main
  #driver = get_driver
  driver = Selenium::WebDriver.for :chrome
  driver.manage.timeouts.implicit_wait = 600000
  #wait = Selenium::WebDriver::Wait.new(timeout: 60)
  while true
    driver.navigate.to(URL)
    message = driver.find_elements(class: "textalign")
    busy_message = "ただいまアクセスが集中しており、サイトにつながりにくい状態となっています。\nご不便をおかけしてしまい、申し訳ございません。\nお手数をおかけしますが、しばらく時間をおいてから再度アクセスしていただきますようお願いいたします。\n※午前3時～午前5時は、システムメンテナンスのためご利用いただけません。"
    if message.size > 0 && message[0].text == busy_message
      #driver.navigate.refresh
      sleep 1
    else
      sleep 100000
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
#   busy_message = "ただいまアクセスが集中しており、サイトにつながりにくい状態となっています。\nご不便をおかけしてしまい、申し訳ございません。\nお手数をおかけしますが、しばらく時間をおいてから再度アクセスしていただきますようお願いいたします。\n※午前3時～午前5時は、システムメンテナンスのためご利用いただけません。"
#   tmp = []
#   if message.size > 0 && message[0].text.find("アクセスが集中")
#     True
#   else
#     False
#   end
# end

main
