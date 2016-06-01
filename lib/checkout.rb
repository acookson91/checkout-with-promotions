class Checkout

  attr_reader :product_list

  def initialize(product_list = ProductList)
    @product_list = product_list.new
  end

  def store(item)
    @product_list.find_item(item)
  end


end
