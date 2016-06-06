require_relative 'product_list'
require_relative 'basket'
require_relative 'multi_discount'
require_relative 'percentage_discount'

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
    discount_total = 0
    @promotional_rules.each {|discount| discount_total += discount.calculate_discount(@basket)}
    discount_total
  end

end
