class AddThephoneToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :thephone, :integer
  end
end
