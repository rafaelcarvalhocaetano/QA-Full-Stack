require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |x|
    x.default_driver = :selenium_chrome
    x.app_host = 'http://enjoeat-sp1.herokuapp.com'
end
