require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |x|
    x.default_driver = :selenium_chrome
    x.app_host = 'http://enjoeat-sp3.herokuapp.com'
    x.default_max_wait_time = 10
end
