class ChangeFinishedOnType < ActiveRecord::Migration[6.0]
  def change
    change_column :meals, :finished_on, :timestamp
  end
end
