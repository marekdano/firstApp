require 'rails_helper'

describe User do 
  context "when the user" do

    it "returns the invalid first name" do
      expect(User.new(first_name: 34)).not_to be_valid
    end

    it "returns the invalid last name" do
      expect(User.new(last_name: 34)).not_to be_valid
    end
  end

  it "should not validate users without an email address" do
    @user = FactoryGirl.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
end