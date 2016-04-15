# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(name: "Black bike", description: "Quisque molestie urna id nisl mollis, sit amet feugiat quam consectetur. \
               Nullam sit amet mauris mauris. Curabitur aliquam suscipit urna, ut elementum massa tempus vitae. \
               Integer commodo justo non sem scelerisque, quis elementum ipsum feugiat. Aliquam erat volutpat.", \
               image_url: File.open(File.join(Rails.root, 'spec', 'support', 'bike2.jpg')), price: "45.99");
#Product.create(name: "White bike", description: "Quisque molestie urna id nisl mollis, sit amet feugiat quam consectetur. Nullam sit amet mauris mauris. Curabitur aliquam suscipit urna, ut elementum massa tempus vitae. Integer commodo justo non sem scelerisque, quis elementum ipsum feugiat. Aliquam erat volutpat.", image_url: "bike4.jpg", price: "45.99");
#Product.create(name: "Bike", description: "Quisque molestie urna id nisl mollis, sit amet feugiat quam consectetur. Nullam sit amet mauris mauris. Curabitur aliquam suscipit urna, ut elementum massa tempus vitae. Integer commodo justo non sem scelerisque, quis elementum ipsum feugiat. Aliquam erat volutpat.", image_url: "bike11.jpg", price: "45.99");

