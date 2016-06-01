class Checkout

  attr_reader :product_list

  def initialize(product_list = ProductList,basket = Basket)
    @product_list = product_list.new
    @basket = basket.new
  end

  def store(item_code)
    item = @product_list.find_item(item_code)
    @basket.store(item)
  end

end
