
if Rails.env.production?
  Rails.configuration.stripe = {
    #:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    #:secret_key => ENV['STRIPE_SECRET_KEY']
    :publishable_key => 'pk_test_DAAbQhPBQgC8ivtmlB74vdE7',
    :secret_key => 'sk_test_56ZiqgZPEetWddXR1346wSYB'
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_DAAbQhPBQgC8ivtmlB74vdE7',
    :secret_key => 'sk_test_56ZiqgZPEetWddXR1346wSYB'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]