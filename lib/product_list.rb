class ProductList

  ITEMS = [
          {product_code: '001',name:'Lavender heart', price:'9.25'},
          {product_code: '002',name:'cufflinks', price:'45.00'},
          {product_code: '003',name:'Kids T-shirt', price:'19.95'}
        ]

  def find_item(item_code)
    if ITEMS.select { |x| x[:product_code] == item_code }.empty? == true
      raise ('There is no data on this item')
    end
  end

end
