class HomeController < ApplicationController
  def index
    @random_total_products = Random.new.rand(2..Product.count)
    @products = Product.limit(@random_total_products)
    #@products = Product.limit(3)
  end

  def about
  end

  def contact
  end
end
