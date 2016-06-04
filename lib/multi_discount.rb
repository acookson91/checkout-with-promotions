class MultiDiscount

  def initialize(product_code,quantity,discount)
    @product_code = product_code
    @quantity = quantity
    @discount = discount
  end

  def calculate_discount(basket)
    if product_count(basket.items,@product_code) >= @quantity
      product_count(basket.items,@product_code) * @discount
    end
  end

  private

  def product_count(items,product_code)
    items.select {|item| item[:product_code] == product_code}.count
  end

end
