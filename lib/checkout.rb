class Checkout

  def initialize(promotional_rules, product_list = ProductList.new,basket = Basket.new)
    @product_list = product_list
    @basket = basket
    @promotional_rules = promotional_rules
  end

  def store(item_code)
    item = @product_list.find_item(item_code)
    @basket.store(item)
  end

  def total
    subtotal - discount_amount
  end

  private

  def subtotal
    @basket.request_subtotal
  end

  def discount_amount
    discount_amount = 0
    @promotional_rules.each {|discount| discount_amount += discount.calculate_discount(@basket)}
    discount_amount
  end

end
