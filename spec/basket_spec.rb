require 'basket'

describe Basket do

  subject(:basket){described_class.new}
  context 'stores items' do
    it 'starts with a empty item array' do
      expect(basket.items).to eq([])
    end
  end

end
