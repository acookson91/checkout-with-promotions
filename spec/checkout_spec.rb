require 'checkout'

describe Checkout do

  subject(:checkout){described_class.new(product_list_class)}
  let(:product_list_class){double:product_list_class, new: product_list}
  let(:product_list){double:product_list, find_item:nil}

  context 'scan' do
    it 'scans object and calls for product to be checked' do
      item = 'item'
      expect(product_list).to receive(:find_item).with(item)
      checkout.store(item)
    end
  end

end
