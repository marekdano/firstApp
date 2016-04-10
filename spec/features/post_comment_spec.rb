require "rails_helper"

describe "submit a message" do
  before do
    create_products
  end
  
  it "comment body is empty" do
    login_user
    visit "/products/bike"
    within("#new-comment-box") do
      fill_in 'comment_body', :with => ""
      fill_in 'rating', :with => ""
    end
    click_button 'Submit'

    expect(page).to have_content "Comment cannot be blank and rating should be selected."
  end
end