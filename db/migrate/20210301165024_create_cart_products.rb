class CreateCartProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_products do |t|
      t.references :product
      t.references :cart
      
      t.timestamps
    end
  end
end
