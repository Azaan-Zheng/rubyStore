class Product < ApplicationRecord

    has_many :items
    before_destroy :ensure_not_referenced_by_any_item

    validates :title, :description, :image_url, :presence => true
    validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
    validates :title, :uniqueness => true
    validates :image_url, format: {
        with:    %r{\.(gif|jpg|png)\z}i,
        message: '应为gif,png或jpg格式图片'
    }


    private

        def ensure_not_referenced_by_any_item
            unless line_items.empty?
                errors.add(:base, 'Line Items present')
                throw :abort
            end
        end
end