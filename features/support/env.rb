require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"



Capybara.configure do |config|
  @browser = ENV["BROWSER"]
  case @browser
  when 'chrome'
    @driver = :selenium_chrome
  when 'firefox'
    @driver = :selenium_firefox
  when 'chrome_headless'
    @driver = :selenium_chrome_headless
  when 'firefox_headless'
    @driver = :selenium_firefox_headless
  end

  config.default_driver = @driver
  config.app_host = "https://enjoeat-sp4.herokuapp.com"
  config.default_max_wait_time = 10
end
