require 'percentage_discount'

describe PercentageDiscount do

  limit = 50
  percentage = 50
  subject(:percentage_discount){described_class.new(limit,percentage)}
  let(:basket){double:basket, request_subtotal: 60}

  context 'percentage discount' do

    it 'calculates 10% discount if limit mate' do
      expect(percentage_discount.calculate_discount(basket)).to eq(30)
    end

  end

end
