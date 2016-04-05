require "rails_helper"


describe "the signin process", :type => :feature do
  let(:user) { FactoryGirl.create(:user) } 
  
  before do
    @product1 = FactoryGirl.create(:product) 
    @product2 = FactoryGirl.create(:product, name: "Beautiful bike", price: 109.00)
  end

  it "Do signs me in" do
    visit '/login'
    within("#new_user") do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "NOT signs me in" do
    visit '/login'
    within("#new_user") do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => "wrong-password"
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid email or password'
  end

end