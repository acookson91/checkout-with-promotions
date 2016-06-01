require 'basket'

describe Basket do

  subject(:basket){described_class.new(total_items_class)}
  let(:total_items_class){double:total_items_class, new: totalitems}
  let(:totalitems){double:totalitems, calculate: nil }

  context 'stores items' do
    it 'starts with a empty item array' do
      expect(basket.items).to eq([])
    end

    it 'stores items into array' do
      item_info = [{product_code: '001',name:'Lavender heart', price:'9.25'}]
      basket.store(item_info)
      expect(basket.items).to eq(item_info)
    end
  end

  context 'calculation' do
    it 'sends items for updated subtotal' do
      expect(totalitems).to receive(:calculate).with([])
      basket.subtotal
    end

  end

end
