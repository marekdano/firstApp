class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :body, :user, :product, presence: true
  validates :rating, numericality: { only_integer: true }
  
end
