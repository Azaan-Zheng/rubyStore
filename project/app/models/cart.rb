class Cart < ApplicationRecord
    belongs_to :user
    has_many :items, dependent: :destroy

    def add_product(product_id)
        current_item = items.find_by_product_id(product_id)
        if current_item
            current_item.quantity += 1
        else
            current_item = items.build(:product_id => product_id)
        end
        current_item
    end

    def total_price
        items.to_a.sum{ |item| item.total_price }
    end
end
