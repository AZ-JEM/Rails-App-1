class PaymentsController < ApplicationController
  # ---------------------------------------------------------------------- /
  # CF sample skeleton...
  # ---------------------------------------------------------------------- /
  def create

    @product = Product.find(params[:product_id])
    @user = current_user

    puts '*' * 100
    puts @user.id
    puts @product.id
    puts @product.price
    puts '*' * 100

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
      end

    # Handle errors...
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    # Success...
    redirect_to product_path(@product), notice: 'Thank you for your purchase!'

  end

end
