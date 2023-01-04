class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    
    USER_TYPES = [1, 2]

    has_many :orders, dependent: :destroy
    has_one :cart, dependent: :destroy
    has_one :starfold, dependent: :destroy
    
    validates :thename, :thetype, :thephone, :presence => true 
    validates :thetype, :inclusion => USER_TYPES
    validates :thename, :uniqueness => true

    before_create :ensure_has_a_admin

    protected
      def ensure_has_a_admin
        if User.count == 0
          self.thetype = 2
        end
      end

      def own_orders
        @orders
      end
end
