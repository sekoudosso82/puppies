class Owner < ApplicationRecord 
    has_many :dogs  
    validates :email, uniqueness: true

end
