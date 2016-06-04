describe MultiDiscount do

  subject(:multidiscount){described_class.new}

  it 'calculates multibuy discount' do
    items1 = {product_code: '001',name:'Lavender heart', price:'9.25'}
    items2 = {product_code: '001',name:'Lavender heart', price:'9.25'}
    items3 = {product_code: '002',name:'Personalised cufflinks', price:'45'}
    items = [items1,items2,items3]
    product_code = '001'
    quantity = 2
    discount = 2
    expect(multidiscount.calculate_discount(items,product_code,quantity,discount)).to eq(4)
  end

end
