class OrdersController < ApplicationController

  def index
    # Exercise 4.6
    # @orders = Order.all
    @orders = Order.includes(:product).all
  end

  def show
    # Exercise 4.6
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

end
