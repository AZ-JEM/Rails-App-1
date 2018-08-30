class PaymentsController < ApplicationController
  # ---------------------------------------------------------------------- /
  # CF sample skeleton...
  # ---------------------------------------------------------------------- /
  def create

    @product = Product.find(params[:product_id])
    @user = current_user

    # puts '*' * 100
    # puts @user.id
    # puts @product.id
    # puts @product.price
    # puts '*' * 100

    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        # amount in cents, again
        amount: (@product.price * 100).to_int,
        currency: "usd",
        source: token,
        description: params[:stripeEmail]
      )

      # create new order...
      if charge.paid
        Order.create(user_id: @user.id, product_id: @product.id, total: @product.price)
        flash.notice = "Thank you for your purchase!"
      end

    # Handle errors...
    # The card has been declined
    rescue Stripe::CardError => e
    body = e.json_body
    err = body[:error]
    flash.alert = "Error processing payment: #{err[:message]}"

    # Too many requests made to the API too quickly
    rescue Stripe::RateLimitError => e
    flash.alert = "Request limit"

    # Invalid parameters were supplied to Stripe's API
    rescue Stripe::InvalidRequestError => e
    flash.alert = "Bad parameters"

    # Authentication with Stripe's API failed
    # (maybe you changed API keys recently)
    rescue Stripe::AuthenticationError => e
    flash.alert = "Authentication failure"

    # Network communication with Stripe failed
    rescue Stripe::APIConnectionError => e
    flash.alert = "Communication failure"

    # Display a very generic error to the user, and maybe send
    # yourself an email
    rescue Stripe::StripeError => e
    flash.alert = "Generic error"

    # Something else happened, completely unrelated to Stripe
    rescue => e
    flash.alert = "Unknown error"

    end

    # return to product page...
    redirect_to product_path(@product)

  end

end
