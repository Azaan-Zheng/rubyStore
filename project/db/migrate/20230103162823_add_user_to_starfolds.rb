class AddUserToStarfolds < ActiveRecord::Migration[7.0]
  def change
    add_reference :starfolds, :user, null: false, foreign_key: true
  end
end
