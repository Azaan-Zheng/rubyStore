class Product < ApplicationRecord

    PRODUCT_TYPES = ["办公设备", "地方特产", "护理清洁", "家用电器", "粮油调味", "生活日用", "新鲜水果", "运动鞋包"]

    has_many :items
    has_many :sitems
    before_destroy :ensure_not_referenced_by_any_item, :ensure_not_referenced_by_any_sitem

    validates :title, :description, :product_type, :image_url, :presence => true
    validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
    validates :title, :uniqueness => true
    validates :product_type, :inclusion => PRODUCT_TYPES
    validates :image_url, format: {
        with:    %r{\.(gif|jpg|png)\z}i,
        message: '应为gif,png或jpg格式图片'
    }


    private

        def ensure_not_referenced_by_any_item
            unless items.empty?
                errors.add(:base, 'Items present')
                throw :abort
            end
        end

        def ensure_not_referenced_by_any_sitem
            unless sitems.empty?
                errors.add(:base, 'Items present')
                throw :abort
            end
        end
end
