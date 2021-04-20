class CartContributor < ApplicationRecord
  belongs_to :cart

  scope :my_carts, -> (user_id){
    where(user_id: user_id)
  }

  scope :by_cart, -> (cart_id){
    where(cart_id: cart_id)
  }

end
