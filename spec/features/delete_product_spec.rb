require "rails_helper"

describe "delete a product" do
  before do
    create_products
    login_user
    Capybara.current_driver = :selenium
  end

  it "when No comments and orders" do
    visit "/products/1"
    click_link "Delete"
    
    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Are you sure?")
    a.accept
    
    expect(page).to have_current_path "/products"
    expect(page).to have_content "Product was successfully destroyed."
  end

  it "when comments and orders are associated with the product" do
    visit "products/2"
    within("#new-comment-box") do
      fill_in 'comment_body', :with => "nice bike!!!"
    end
    find(:xpath, "//img[@title='poor']").click
    click_button "Submit"
    
    click_link "Delete"
    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Are you sure?")
    a.accept
    
    expect(page).to have_current_path "/products"
    expect(page).to have_content "Product was successfully destroyed."
  end
end