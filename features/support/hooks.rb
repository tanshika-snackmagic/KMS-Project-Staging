Before do
	Selenium::WebDriver::Chrome::Service.driver_path = '/usr/local/bin/chromedriver'
	Capybara.page.current_window.maximize
end

After do |scenario|
  if scenario.failed?
    page.driver.browser.manage.window.maximize
    page.driver.browser.save_screenshot("#{scenario.name}.png")
  end
end