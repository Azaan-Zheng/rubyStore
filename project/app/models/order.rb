class Order < ApplicationRecord
    PAYMENT_TYPES = ["微信", "支付宝"]
    ORDER_STATUSES = ["待发货","待收货","已完成"]

    belongs_to :user
    has_many :items, dependent: :destroy
    validates :name, :address, :email, :pay_type, :order_time, :total_price, :order_status, :presence => true
    validates :pay_type, :inclusion => PAYMENT_TYPES

    def add_items_from_cart(cart)
        cart.items.each do |item|
            item.cart_id = nil
            items << item
        end
    end
    
end
