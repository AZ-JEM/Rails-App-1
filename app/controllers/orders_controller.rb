class OrdersController < ApplicationController

  # Authentication
  before_action :authenticate_user!
  # Authorization
  load_and_authorize_resource

  def index
    # set title
    @page_title = "Orders"
    # Exercise 4.6
    # @orders = Order.all
    @orders = Order.includes(:product).all
  end

  def show
    # Exercise 4.6
    @order = Order.find(params[:id])
    # set title
    @page_title = @order.product.name
  end

  def new
  end

  def create
  end

  def destroy
  end

end
