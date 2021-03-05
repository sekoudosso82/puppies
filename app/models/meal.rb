class Meal < ApplicationRecord
  belongs_to :dog
  
  scope :active, -> { where(is_deleted: false) }

end
