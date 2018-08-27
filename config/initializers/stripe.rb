# ---------------------------------------------------------------------- /
# Exercise 6.5
# ---------------------------------------------------------------------- /
if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  # Development, Test
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_XUWYp4LY0wRvxpN5LYFQmvAF',
    secret_key: 'sk_test_G2smEBefX56m6F2VaXfC66jl'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# reference as:
# Rails.configuration.stripe[:publishable_key]
