class Owner < ApplicationRecord

    has_many :dogs, dependent: :destroy

    validates :email, uniqueness: true

end
