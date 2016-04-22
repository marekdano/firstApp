FactoryGirl.define do
  
  factory :order do 
    user { create(:user) }
    product { create(:product) }
    total 100.99
  end
end