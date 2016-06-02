require 'basket'
require 'pry'

describe Basket do

  subject(:basket){described_class.new(promotional_rules)}
  let(:promotional_rules){double:promotional_rules}

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

  # context 'finalize' do
  #   it 'requests discounts to be made' do
  #     expect(itemdiscounts).to receive(:new_discounts).with(basket.items,basket.subtotal,promotional_rules)
  #     basket.finalize
  #   end
  # end

  context 'total' do
    it 'works out total before discount' do
      item_info = [{product_code: '001',name:'Lavender heart', price:'9.25'}]
      basket.store(item_info)
      expect(basket.update_subtotal).to eq(9.25)
    end
  end

end
