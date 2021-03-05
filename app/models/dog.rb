class Dog < ApplicationRecord

  has_one_attached :dog_image 

  belongs_to :owner

  has_many :meals, dependent: :destroy

  scope :active, -> { where(is_deleted: false) }

end
