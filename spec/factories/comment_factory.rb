FactoryGirl.define do
  
  factory :comment do 
    rating 3
    user { create(:user) }
    body "Great bike"
  end
end