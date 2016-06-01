class Basket

  attr_reader :items, :subtotal

  def initialize(promotional_rules,total_items = TotalItems, item_discounts = ItemDiscounts)
    @total_items = total_items.new
    @item_discounts = item_discounts.new
    @promotional_rules = promotional_rules
    @items = []
    @subtotal = 0
  end

  def store(item_info)
    items << item_info[0]
    update_subtotal
  end

  def update_subtotal
    @subtotal = @total_items.calculate(items)
  end

  def finalize
    @item_discounts.new_discounts(items,subtotal, @promotional_rules)
  end

end
