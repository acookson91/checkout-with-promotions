class Basket

  attr_reader :items

  def initialize(total_items = TotalItems)
    @total_items = total_items.new
    @items = []
  end

  def store(item_info)
    @items << item_info[0]
  end

  def subtotal
    @total_items.calculate(@items)
  end

end
