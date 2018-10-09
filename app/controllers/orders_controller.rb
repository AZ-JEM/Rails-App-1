class OrdersController < ApplicationController

  # Authentication
  # user must be present for any action
  before_action :authenticate_user!
  # Authorization
  # user scoped actions (ability.rb)
  load_and_authorize_resource

  def index
    # set title
    # @page_title = "Orders"
    # Exercise 4.6
    # @orders = Order.all
    @orders = Order.includes(:product).all
  end

  def show
    # Exercise 4.6
    @order = Order.find(params[:id])
    # set title
    # @page_title = @order.product.name
  end

  # -------------------------------------------------- /
  # JEM : 180829
  # I suppose that now is the time...
  # -------------------------------------------------- /
  def new
    @order = Order.new
  end

  # JEM : 180829
  def create
    # bare minimum...
    # @order = Order.new(params.require(:order).permit(:user_id, :prod_id, :price))
    @order = Order.new(order_params)
    @order.save
  end

  # JEM : 180829
  def destroy
    @order.destroy
  end

# JEM : 180829
private

  def order_params
    params.require(:order).permit(:user_id, :prod_id, :price)
  end

end
