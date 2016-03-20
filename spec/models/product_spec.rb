require 'rails_helper'

describe Product do 
  context "when the product has comments" do
    before do
      #@product = Product.create!(name: "race bike", description: "Bla bla", image_url: "bike6.jpg", price: "9.49")
      @product = FactoryGirl.create(:product)
      #@user = User.create!(first_name: "Marek", last_name: "Dano", email: "marek@example.com", password: "abcd1234")
      @user = FactoryGirl.build(:user)
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @product.comments.create!(rating: 3, user: @user, body: "It's quite good bike!")
      @product.comments.create!(rating: 5, user: @user, body: "The best bike!")
    end
   
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "when the product" do
    it "returns the invalid name if the number was added" do
      expect(Product.new(name: 34)).not_to be_valid
    end

    it "returns the invalid name if the empty string was added" do
      expect(Product.new(name: "")).not_to be_valid
    end

    it "returns the invalid description if the number was added" do
      expect(Product.new(description: 34)).not_to be_valid
    end

    it "returns the invalid description if the empty string was added" do
      expect(Product.new(description: "")).not_to be_valid
    end

     it "returns the invalid image url if the empty string was added" do
      expect(Product.new(image_url: "")).not_to be_valid
    end

    it "returns the invalid price if the text was added" do
      expect(Product.new(price: "bike")).not_to be_valid
    end

    it "returns the invalid price if the the empty string was added" do
      expect(Product.new(price: "")).not_to be_valid
    end
  end

  context "when the product" do
    before do
      @product = FactoryGirl.build(:product)
    end

    it "returns a valid product" do
      expect(@product).to be_valid
    end 
  end
end
