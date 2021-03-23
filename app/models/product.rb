class Product < ApplicationRecord

    validates :name, :category, presence: true

end
