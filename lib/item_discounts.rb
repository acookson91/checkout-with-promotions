class ItemDiscounts

  def percent_off(subtotal,limit,percentage)
    if subtotal >= limit
      percent(percentage) * subtotal
    end
  end

  def multibuy(items,product_code,quantity,discount)
    if items.select {|x| x[:product_code] == product_code}.count >= quantity
      items.select {|x| x[:product_code] == product_code}.count * discount
    end
  end

  private

  def percent(percentage)
    percentage/100.to_f
  end
end
