class AddIndexForeightKey < ActiveRecord::Migration[5.0]
  def change
    add_index :cart_items   , :cart_id
    add_index :cart_items   , :product_id
    add_index :collections  , :user_id
    add_index :collections  , :product_id
    add_index :comments     , :product_id
    add_index :orders       , :user_id
    add_index :photos       , :product_id
    add_index :product_lists, :order_id
    add_index :products     , :category
  end
end
