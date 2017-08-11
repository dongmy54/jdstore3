class AddCollectionsCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :collections_count, :integer, default: 0
  end
end
