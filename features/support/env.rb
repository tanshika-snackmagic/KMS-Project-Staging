#encoding: utf-8
require 'capybara/cucumber'
require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'capybara-screenshot/cucumber'
require 'json'
require 'magic_encoding'

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('browser', 'chrome').to_sym
  Capybara::Selenium::Driver.new(app, browser: browser)
end

Capybara.configure do |config|
  config.default_driver = :site_prism
end