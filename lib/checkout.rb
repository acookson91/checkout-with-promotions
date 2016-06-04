class Checkout

  def initialize(promotional_rules, product_list = ProductList.new,basket = Basket)
    @product_list = product_list
    @basket = basket.new(promotional_rules)
    @promotional_rules = promotional_rules
  end

  def store(item_code)
    item = @product_list.find_item(item_code)
    @basket.store(item)
  end

  def total
    @promotional_rules.each do |discount|
      discount.calculate_discount(@basket)
    end
  end

end
