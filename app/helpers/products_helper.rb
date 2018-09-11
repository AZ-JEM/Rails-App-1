module ProductsHelper
  # Exercise 6.11 : Caching
  def cache_key_for_products
    count          = @products
    # No, I'm not sure exactly what's happening in this line...
    # But I believe it returns the update time stamp in universal coordinated time :
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    # return the cache key
    key = "products/all-#{count}-#{max_updated_at}"

    puts '*' * 100
    puts key
    puts '*' * 100

    key
  end
end
