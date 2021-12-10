module CartsHelper
  def current_cart
    session[:cart] ||= Array.new
  end

  def find_product_in_cart product
    current_cart.find{|item| item["product_id"] == product.id}
  end

  def get_line_items_in_cart
    cart_items = []
    current_cart.each do |item|
      product = Product.find_by(id: item["product_id"])
      if product
        cart_items << {product: product, quantity: item["quantity"]}
      else
        current_cart.delete(item)
      end
    end
    cart_items
  end

  def line_total_price item
    item[:product].price * item[:quantity]
  end

  def total_of_money
    items = get_line_items_in_cart
    items.reduce(0){|a, e| a + e[:product].price * e[:quantity]}
  end
end
