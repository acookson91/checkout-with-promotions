require 'multi_discount'

describe MultiDiscount do

  product_code = '001'
  quantity = 2
  discount = 2
  subject(:multidiscount){described_class.new(product_code,quantity,discount)}
  items1 = {product_code: '001',name:'Lavender heart', price:'9.25'}
  items2 = {product_code: '001',name:'Lavender heart', price:'9.25'}
  items3 = {product_code: '002',name:'Personalised cufflinks', price:'45'}
  let(:basket){double:basket, items: [items1,items2,items3]}

  context 'calculates multibuy discount' do

    it 'calculates multibuy discount' do
      expect(multidiscount.calculate_discount(basket)).to eq(4)
    end

  end

end
