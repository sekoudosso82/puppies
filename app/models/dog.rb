class Dog < ApplicationRecord
  belongs_to :owner

  has_many :meals, dependent: :destroy

end
