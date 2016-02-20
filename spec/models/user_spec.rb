require 'rails_helper'

describe User do 
  context "when the user" do

    it "returns the invalid first name if it's an integer" do
      expect(User.new(first_name: 34)).not_to be_valid
    end

    it "returns the invalid first name if it's empty string" do
      expect(User.new(first_name: "")).not_to be_valid
    end

    it "returns the invalid last name" do
      expect(User.new(last_name: 34)).not_to be_valid
    end

    it "returns the invalid last name if it's an integer" do
      expect(User.new(last_name: "")).not_to be_valid
    end
  end

  it "should not validate users without an email address" do
    @user = FactoryGirl.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end

  it "should not validate users without a password" do
    @user = FactoryGirl.build(:user, password: "")
    expect(@user).to_not be_valid
  end
end