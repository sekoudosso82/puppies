class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.belongs_to :owner, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.string :color
      t.float :weight

      t.timestamps
    end
  end
end
