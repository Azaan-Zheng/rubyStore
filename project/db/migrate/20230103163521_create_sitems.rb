class CreateSitems < ActiveRecord::Migration[7.0]
  def change
    create_table :sitems do |t|
      t.integer :product_id
      t.integer :starfold_id

      t.timestamps
    end
  end
end
