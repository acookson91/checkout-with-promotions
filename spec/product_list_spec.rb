require 'product_list'

describe ProductList do

  subject(:productlist){described_class.new}

  context 'check product' do
    it 'raises error if item is not avalaible' do
      item_code = '004'
      expect{productlist.find_item(item_code)}.to raise_error('There is no data on this item')
    end

    it 'returns the full product, if the item is vaild' do
      item_code = '001'
      expect(productlist.find_item(item_code)).to include({product_code: '001',name:'Lavender heart', price:'9.25'})
    end
  end

end
