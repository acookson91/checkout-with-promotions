class Checkout


  def initialize(promotional_rules, product_list = ProductList,basket = Basket)
    @product_list = product_list.new
    @basket = basket.new
    @promotional_rules = promotional_rules
  end

  def store(item_code)
    item = @product_list.find_item(item_code)
    @basket.store(item)
  end

  def total
    @basket.finalize(@promotional_rules)
  end

end
