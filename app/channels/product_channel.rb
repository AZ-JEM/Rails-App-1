# Exercise 6.13 : ActionCable
class ProductChannel < ApplicationCable::Channel

  def subscribed
    # stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # Exercise 6.14
  def listen (data)
    stop_all_streams
    # product id present...
    stream_for data["product_id"]
  end

end
