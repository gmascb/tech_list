class Cart < ApplicationRecord

    belongs_to :user

    scope :by_user, -> (user){
        find_or_create_by!(user_id: user.id)
    }


end
