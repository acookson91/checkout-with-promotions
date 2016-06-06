require 'basket'
require 'pry'

describe Basket do

  subject(:basket){described_class.new}

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


  context 'total' do
    it 'works out total before discount' do
      item_info = [{product_code: '001',name:'Lavender heart', price:'9.25'}]
      basket.store(item_info)
      expect(basket.update_subtotal).to eq(9.25)
    end

    it 'reduces subtotal by discount amount' do
      item_info = [{product_code: '001',name:'Lavender heart', price:'9.25'}]
      discount = 5
      basket.store(item_info)
      basket.apply_discount(discount)
      expect(basket.request_subtotal).to eq(4.25)
    end
  end

end
