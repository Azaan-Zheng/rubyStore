class AddOrderIdToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :order_id, :integer
  end
end
