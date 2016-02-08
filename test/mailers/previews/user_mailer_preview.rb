
# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("john@example.com", "John", "Hello World!")
  end

  def welcome 
    user = User.new
    user.email = "john@example.com"
    UserMailer.welcome(user)
  end

  class User
    attr_accessor :email
  end
end