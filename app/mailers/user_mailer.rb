class UserMailer < ApplicationMailer
  default from: "firstApp@heroku.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
         :to => "mk.dano@gmail.com",
         :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike Shop"
    mail(:to => user.email,
          :subject => "Welcome to #{@appname}!")
  end

  def payment_confirmation(user) 
    @appname = "Carosabikes"
    mail(:to => user.email,
         :subject => "Payment confirmed")
  end
end
