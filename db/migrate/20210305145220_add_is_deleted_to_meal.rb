class AddIsDeletedToMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :is_deleted, :boolean, default: false
  end
end
