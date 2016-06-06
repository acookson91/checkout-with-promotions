require 'checkout'

describe Checkout do

  subject(:checkout){described_class.new(promotional_rules,product_list,basket)}
  let(:product_list){double:product_list, find_item: 'item'}
  let(:basket){double:basket, store: nil, request_subtotal: 100, apply_discount: 20}
  let(:multi_discount_instance){double:multi_discount_instance, calculate_discount:10}
  let(:promotional_rules){[multi_discount_instance,multi_discount_instance]}

  context 'scan' do
    it 'scans object and calls for product to be checked' do
      item_code = 'item'
      expect(product_list).to receive(:find_item).with(item_code)
      checkout.scan(item_code)
    end

    it 'raises error if item is not a string' do
      item_code = 001
      expect{checkout.scan(item_code)}.to raise_error("Item code must be a string")
    end
  end

  context 'add product' do
    it 'adds product to basket' do
      item = '001'
      expect(basket).to receive(:store).with('item')
      checkout.scan(item)
    end
  end

  context 'final amount' do

    it 'requests discounts' do
      expect(multi_discount_instance).to receive(:calculate_discount).with(basket)
      expect(basket).to receive(:request_subtotal)
      expect(basket).to receive(:apply_discount)
      checkout.total
    end

    it 'returns final amount after one discount' do
      expect(checkout.total).to eq('£100.0')
    end

  end

end
