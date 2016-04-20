class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  mount_uploader :image_url, ImageUploader

  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy

  
  validates :name, :description, :image_url, presence: true
  validates :price, numericality: true, format: {with: /\A\d+(?:\.\d{0,2})?\z/, message: "only two decimal places allowed"}

  def average_rating 
    comments.average(:rating).to_f
  end
  
end
