class ApplicationMailer < ActionMailer::Base
  default from: "firstApp@heroku.com"
  layout 'mailer'
end
