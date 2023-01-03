class Starfold < ApplicationRecord
    belongs_to :user
    has_many :sitems, dependent: :destroy

    def add_product(product_id)
        current_sitem = sitems.find_by_product_id(product_id)
        if current_sitem
            current_sitem
        else
            current_sitem = sitems.build(:product_id => product_id)
        end
        current_sitem
    end
end
