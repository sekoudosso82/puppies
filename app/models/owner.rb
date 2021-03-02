class Owner < ApplicationRecord

    has_many :dogs, dependent: :destroy 

    has_one_attached :owner_image 

    validates :email, uniqueness: true

end
