class ProductList

  ITEMS = [
          {product_code: '001',name:'Lavender heart', price:'9.25'},
          {product_code: '002',name:'cufflinks', price:'45.00'},
          {product_code: '003',name:'Kids T-shirt', price:'19.95'}
        ]

  def find_item(item)
    raise ('There is no data on this item') if invaild_item?(item)
    selected_item(item)
  end

    private

  def invaild_item?(item)
    selected_item(item).empty? == true
  end

  def selected_item(item)
    ITEMS.select { |x| x[:product_code] == item }
  end

end
