class SimplePagesController < ApplicationController

  def index
  end

  # Exercise 4.3
  def landing_page
    @featured_product = Product.first
  end

end
