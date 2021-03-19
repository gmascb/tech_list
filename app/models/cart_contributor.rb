class CartContributor < ApplicationRecord
  belongs_to :cart

  scope :my_carts, -> (user_id){
    where(user_id: user_id)
  }

end
