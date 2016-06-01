require 'item_discounts'

describe ItemDiscounts do

  subject(:itemdiscounts){described_class.new}

  it 'calculates 10% discount' do
    expect(itemdiscounts.percent_off(100,60,20)).to eq(20)
  end

end
