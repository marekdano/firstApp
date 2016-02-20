require 'rails_helper'

describe Comment do 
  context "when the comment" do
    it "returns the invalid body if the text is empty" do
      expect(Comment.new(body: "")).not_to be_valid
    end
    
    it "returns the invalid rating if the number wasn't entered" do
      expect(Comment.new(rating: "rating")).not_to be_valid
    end

    it "returns the invalid rating if the number was an empty string" do
      expect(Comment.new(rating: "")).not_to be_valid
    end

    it "returns the invalid rating if the number was a float number" do
      expect(Comment.new(rating: 9.99)).not_to be_valid
    end
  end
end