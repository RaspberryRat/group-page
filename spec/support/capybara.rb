require 'capybara/rspec'
require 'webdrivers'

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new(args: ['--disable-dev-shm-usage', '--no-sandbox', '--disable-gpu', '--window-size=1400,1400'])
  )
end

Capybara.javascript_driver = :selenium_chrome