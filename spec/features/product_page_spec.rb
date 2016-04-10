require "rails_helper"

describe "display product page" do
  before do
    create_products
    Capybara.current_driver = :selenium
  end

  it "when user is logged in" do
    login_user
    visit "/products/bike"
    page.save_screenshot('screenshot_product_page_user_logged_in.png')
  end

  it "when user is NOT logged in" do
    visit "/products/bike"
    page.save_screenshot('screenshot_product_page_user_NOT_logged_in.png')
  end
end