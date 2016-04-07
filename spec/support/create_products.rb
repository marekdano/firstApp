def create_products
  @product1 = FactoryGirl.create(:product)
  @product2 = FactoryGirl.create(:product, name: "bike", price: 109.00)
  @product3 = FactoryGirl.create(:product, name: "white bike", price: 29.99)
end