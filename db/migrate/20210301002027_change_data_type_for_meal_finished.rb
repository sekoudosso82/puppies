class ChangeDataTypeForMealFinished < ActiveRecord::Migration[6.0]
  def change
    change_column :meals, :finished, :boolean, default: true 
  end 
end
