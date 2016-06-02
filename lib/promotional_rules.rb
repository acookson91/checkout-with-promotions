class PromotionalRules

  def percent_off(subtotal,limit,percentage)
    if subtotal >= limit
      percent(percentage) * subtotal
    end
  end

  def multibuy(items,product_code,quantity,discount)
    if product_count(items,product_code) >= quantity
      product_count(items,product_code) * discount
    end
  end

  private

  def percent(percentage)
    percentage/100.to_f
  end

  def product_count(items,product_code)
    items.select {|x| x[:product_code] == product_code}.count
  end

end
