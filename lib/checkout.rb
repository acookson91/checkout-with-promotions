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
    subtotal = @basket.request_subtotal
    discount_amount = 0
    @promotional_rules.each {|discount| discount_amount += discount.calculate_discount(@basket)}
    total = subtotal - discount_amount
  end

end
