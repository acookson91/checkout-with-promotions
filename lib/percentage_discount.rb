class PercentageDiscount

  def initialize(limit,percentage)
    @limit = limit
    @percentage = percentage
  end

  def calculate_discount(basket)
    if basket.request_subtotal >= @limit
      percent(@percentage) * basket.request_subtotal
    end
  end

  private

  def percent(percentage)
    percentage/100.to_f
  end

end
