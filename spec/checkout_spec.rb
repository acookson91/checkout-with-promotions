require 'checkout'

describe Checkout do

  subject(:checkout){described_class.new(promotional_rules,product_list_class,basket_class)}
  let(:product_list_class){double:product_list_class, new: product_list}
  let(:product_list){double:product_list, find_item:nil}
  let(:basket_class){double:basket_class, new: basket}
  let(:basket){double:basket, store: nil, finalize: nil}
  let(:promotional_rules){double:promotional_rules}

  context 'scan' do
    it 'scans object and calls for product to be checked' do
      item = 'item'
      expect(product_list).to receive(:find_item).with(item)
      checkout.store(item)
    end
  end

  context 'add product' do
    it 'adds product to basket' do
      item = '001'
      expect(basket).to receive(:store)
      checkout.store(item)
    end
  end

  context 'final amount' do
    it 'request total amount' do
      expect(basket).to receive(:finalize).with(promotional_rules)
      checkout.total
    end
  end

end
