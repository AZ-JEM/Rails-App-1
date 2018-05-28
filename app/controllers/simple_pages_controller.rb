class SimplePagesController < ApplicationController

  def index
  end

  def landing_page
    # Exercise 4.3
    # @featured_product = Product.first
    # Exercise 4.4
    @products = Product.limit(10)
  end

  def demo
  end

end
