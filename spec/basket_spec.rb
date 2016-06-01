require 'basket'
require 'pry'

describe Basket do

  subject(:basket){described_class.new(promotional_rules,total_items_class,item_discounts_class)}
  let(:total_items_class){double:total_items_class, new: totalitems}
  let(:item_discounts_class){double:item_discounts_class, new: itemdiscounts}
  let(:totalitems){double:totalitems, calculate: 18.50 }
  let(:itemdiscounts){double:itemdiscounts, new_discounts: nil}
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

  context 'calculation' do
    it 'sends items for updated subtotal' do
      expect(totalitems).to receive(:calculate).with([])
      basket.update_subtotal
    end

    it 'updates subtotal with total items response' do
      item_info = ['product_info','product_info']
      basket.store(item_info)
      expect(basket.subtotal).to eq(18.50)
    end
  end

  context 'finalize' do
    it 'requests discounts to be made' do
      expect(itemdiscounts).to receive(:new_discounts).with(basket.items,basket.subtotal,promotional_rules)
      basket.finalize
    end
  end

end
