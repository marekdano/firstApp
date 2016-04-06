require "rails_helper"


describe "the signin process", :type => :feature do
  let(:user) { FactoryGirl.build(:user) } 
  
  before do
    @product1 = FactoryGirl.create(:product) 
    @product2 = FactoryGirl.create(:product, name: "Beautiful bike", price: 109.00)
    Capybara.current_driver = :selenium
  end

  it "Do signs me in" do
    visit '/login'
    within("#new_user") do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
    page.save_screenshot('screenshot_signed_in.png')
  end

  it "NOT signs me in" do
    visit '/login'
    within("#new_user") do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => "wrong-password"
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid email or password'  
    page.save_screenshot('screenshot_signed_in_failed.png')
  end

end