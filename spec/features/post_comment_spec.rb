require "rails_helper"

describe "submit a message" do
  before do
    create_products
    login_user
    Capybara.default_driver = :selenium
    visit "/products/bike"
  end
  
  it "when comment body is empty" do
    visit "/products/bike"
    within("#new-comment-box") do
      fill_in 'comment_body', :with => ""
    end
    find(:xpath, "//img[@title='poor']").click
    click_button "Submit"

    expect(page).to have_content "Comment cannot be blank and rating should be selected."
  end

  it "when rating is not selected" do
    within("#new-comment-box") do
      fill_in 'comment_body', :with => "nice bike!!!"
    end
    click_button "Submit"

    expect(page).to have_content "Comment cannot be blank and rating should be selected."
  end

 it "when comment is filled and rating is selected" do
  within("#new-comment-box") do
    fill_in 'comment_body', :with => "nice bike!!!"
  end
  find(:xpath, "//img[@title='poor']").click
  click_button "Submit"

  expect(page).to have_content "Thank you for your review!"
end

end