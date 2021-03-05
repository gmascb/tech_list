class CreateCartContributors < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_contributors do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
