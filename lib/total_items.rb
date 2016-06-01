class TotalItems

  def calculate(items)
    new_subtotal = 0
    items.each {|x| new_subtotal += x[:price].to_f}
    new_subtotal
  end

end
