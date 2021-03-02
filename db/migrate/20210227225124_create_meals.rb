class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.belongs_to :dog, null: false, foreign_key: true
      t.string :brand
      t.float :quantity
      t.boolean :finished
      t.timestamps :finished_on

      t.timestamps
    end
  end
end
