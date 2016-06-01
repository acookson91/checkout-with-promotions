class Basket

  attr_reader :items, :subtotal

  def initialize(total_items = TotalItems)
    @total_items = total_items.new
    @items = []
    @subtotal = 0
  end

  def store(item_info)
    @items << item_info[0]
    update_subtotal
  end

  def update_subtotal
    @subtotal = @total_items.calculate(@items)
  end

end
