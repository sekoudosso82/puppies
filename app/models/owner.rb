class Owner < ApplicationRecord
    validates :email, uniqueness: true

end
