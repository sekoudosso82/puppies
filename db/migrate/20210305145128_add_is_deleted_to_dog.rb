class AddIsDeletedToDog < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :is_deleted, :boolean, default: false
  end
end
