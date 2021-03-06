class Basket

  attr_reader :items, :subtotal

  def initialize
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

  def request_subtotal
    @subtotal
  end

  def apply_discount(discount_amount)
    @subtotal -= discount_amount
  end

  private

  def calculate_subtotal(items)
    new_subtotal = 0
    items.each {|item| new_subtotal += item[:price].to_f}
    @subtotal = new_subtotal
  end

end
