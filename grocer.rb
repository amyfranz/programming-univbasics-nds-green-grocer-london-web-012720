def find_item_by_name_in_collection(name, collection)
  i = 0
  item_hash = nil
  while i < collection.length do
    if collection[i][:item] == name
      item_hash = collection[i]
    end
    i += 1
  end
  return item_hash
end

def consolidate_cart(cart)
  new_cart = []
  i = 0
  while i < cart.length do
    new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    if new_cart_item != nil
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
      new_cart << new_cart_item
    end
    i+= 1 
  end
  return new_cart
end

def apply_coupons(cart, coupons)
  i = 0
  while i < coupons.length do
    new_item = find_item_by_name_in_collection(coupons[i][:item],cart)
    coup_item_name= "#{coupons[i][:item]} W/COUPON"
    cart_item_w_coupon = find_item_by_name_in_collection(coup_item_name, cart)
    if new_item && new_item[:count] >= coupons[i][:num]
      if cart_item_w_coupon != nil
        cart_item_w_coupon[:count] += cart_item_w_coupon[i][:num]
        new_item[:count] -= cart_item_w_coupon[i][:num]
      else
        cart_item_w_coupon = {
          :item => coup_item_name,
          :price => coupons[i][:cost]/coupons[i][:num],
          :clearance => new_item[:clearance],
          :count => coupons[i][:num]
        }
        cart << cart_item_w_coupon
        new_item[:count] -= coupons[i][:num]
      end
    end
    i += 1
  end
  return cart
end

def apply_clearance(cart)
  i = 0 
  while i < cart.length do
    
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
