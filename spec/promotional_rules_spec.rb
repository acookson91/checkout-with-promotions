require 'promotional_rules'

describe PromotionalRules do

  subject(:promotionalrules){described_class.new}

  it 'calculates 10% discount' do
    expect(promotionalrules.percent_off(100,60,20)).to eq(20)
  end

  it 'calculates multibuy discount' do
    items1 = {product_code: '001',name:'Lavender heart', price:'9.25'}
    items2 = {product_code: '001',name:'Lavender heart', price:'9.25'}
    items3 = {product_code: '002',name:'Personalised cufflinks', price:'45'}
    items = [items1,items2,items3]
    product_code = '001'
    quantity = 2
    discount = 2
    expect(promotionalrules.multibuy(items,product_code,quantity,discount)).to eq(4)
  end
end
