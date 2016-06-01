require 'total_items'

describe TotalItems do

  subject(:totalitems){described_class.new}

  context 'total' do
    it 'works out total before discount' do
      product_info = {product_code: '001',name:'Lavender heart', price:'9.25'}
      items = [product_info,product_info]
      expect(totalitems.calculate(items)).to eq(18.50)
    end
  end

end
