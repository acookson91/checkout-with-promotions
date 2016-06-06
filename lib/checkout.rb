require_relative 'product_list'
require_relative 'basket'
require_relative 'multi_discount'
require_relative 'percentage_discount'

class Checkout

  def initialize(promotional_rules = [], product_list = ProductList.new,basket = Basket.new)
    @product_list = product_list
    @basket = basket
    @promotional_rules = promotional_rules
  end

  def scan(item_code)
    raise "Item code must be a string" unless item_code.class == String
    item = @product_list.find_item(item_code)
    @basket.store(item)
  end

  def total
    apply_discount
    '£' + subtotal.round(2).to_s
  end

  private

  def subtotal
    @basket.request_subtotal
  end

  def apply_discount
      if @promotional_rules.empty?
        0
      else
      @promotional_rules.each do |discount|
        discount_total = 0
        discount_total += discount.calculate_discount(@basket)
        add_discount(discount_total)
      end
    end
  end

  def add_discount(discount_total)
    @basket.apply_discount(discount_total)
  end

end
