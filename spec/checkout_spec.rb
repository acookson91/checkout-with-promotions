require 'checkout'

describe Checkout do

  subject(:checkout){described_class.new}
  let(:product_list){double:product_list, find_item:nil}

  context 'scan' do
    it 'scans object and calls for product to be checked' do
      item = 'item'
      expect(product_list).to receive(find_item)
      checkout.store(item)
    end
  end

end
