class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :product_id
      t.string :commenter
      t.text :description
      t.timestamps
    end
  end
end
