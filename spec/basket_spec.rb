require 'basket'

describe Basket do

  context 'storing items' do
    it 'starts with empty basket' do
      expect(basket.items).to eq([])
    end
  end

end
