class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
