if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_4wStLdR9HRNfGUO39wC4mz54',
    secret_key: 'sk_test_v1KW4Mgtt3wRRQbjVFrxTq7b'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
