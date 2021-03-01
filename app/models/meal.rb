class Meal < ApplicationRecord
  belongs_to :dog

  # validates :finished, inclusion: { in: [ true, false ] }
end
