class Basket

  attr_reader :items, :subtotal

  def initialize(promotional_rules = PromotionalRules)
    @promotional_rules = promotional_rules
    @items = []
    @subtotal = 0
  end

  def store(item_info)
    items << item_info[0]
    update_subtotal
  end

  def update_subtotal
    calculate_subtotal(@items)
  end

  def finalize
    @promotional_rules(items)
  end

  private

  def calculate_subtotal(items)
    new_subtotal = 0
    items.each {|item| new_subtotal += item[:price].to_f}
    new_subtotal
  end

end

mutil = Mutli.new(items,product_code,quantity,discount)
mutil.calculate_discount(@items, subtotal)
