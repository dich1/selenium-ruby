#!/usr/bin/env ruby

require 'selenium-webdriver'

# driver = Selenium::WebDriver.for :firefox
driver = Selenium::WebDriver.for :chrome, switches: %w[--no-sandbox]

driver.navigate.to "https://www.google.com/"
driver.save_screenshot("./screenshot.png")

driver.quit
