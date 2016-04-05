FactoryGirl.define do

  factory :product do
    name "race bike"
    description "This bike you have to have!!!"
    #image_url "https://carosabikes-images.s3.amazonaws.com/uploads/product/image_url/2/bike4.jpg"
    image_url do
      # you'll get an error if the file doesn't exist
      File.open(File.join(Rails.root, 'spec', 'support', 'bike2.jpg'))
    end
    price 9.49
  end
end