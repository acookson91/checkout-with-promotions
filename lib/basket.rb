class Basket

  attr_reader :items

  def initialize
    @items = []
  end

  def store(item_info)
    @items << item_info[0]
  end

end
