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

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    
    #ActionMailer::Base.mail(:from => @email, 
    #  :to => 'mk.dano@gmail.com',
    #  :subject => "A new message contact form message from #{@name}",
    #  :body => @message).deliver_now
    
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
