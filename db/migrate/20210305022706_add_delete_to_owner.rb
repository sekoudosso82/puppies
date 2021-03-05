class AddDeleteToOwner < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :is_deleted, :boolean, default: false 
  end
end
