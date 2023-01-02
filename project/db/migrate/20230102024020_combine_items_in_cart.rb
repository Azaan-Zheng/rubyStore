class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up
    # replace multiple items for a single product in a cart with a
    # single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.items.where(product_id: product_id).delete_all

          # replace with a single item
          item = cart.items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # split items with quantity>1 into multiple items
    Item.where("quantity>1").each do |item|
      # add individual items
      item.quantity.times do 
        Item.create(
          cart_id: item.cart_id,
          product_id: item.product_id,
          quantity: 1
        )
      end

      # remove original item
      item.destroy
    end
  end
end
