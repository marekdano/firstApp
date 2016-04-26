require "rails_helper"

describe "display list of orders" do
  
  before do
    @order = FactoryGirl.create(:order)
    @product =  FactoryGirl.create(:product)
  end

  # it "when admin is logged in" do
  #   login_admin
  #   visit "/orders"
  #   #within('form') do
  #     fill_in 'input', :with => 100.99
  #     select('bike', :from => 'select')
  #     #find('product-name').find(:xpath, 'option[1]').select_option
  #   #end   
  #   click_button "+"
  #   expect(page).to have_content "100.99"
  # end
end