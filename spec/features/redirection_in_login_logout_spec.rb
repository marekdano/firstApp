require "rails_helper"

describe "display products page" do
  before do
    create_products
    @user = FactoryGirl.create(:user)
  end

  it "when user logs in" do
    visit "/products"
    visit "/login"
    within("#new_user") do
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
    end
    click_button "Log in"
    expect(page).to have_current_path("/products")
  end

  it "when user logs out" do
    visit "/products"
    visit "/login"
    within("#new_user") do
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
    end
    click_button "Log in"
    visit "/products/3"
    click_link "Logout"
    expect(page).to have_current_path("/products/3")
  end
end