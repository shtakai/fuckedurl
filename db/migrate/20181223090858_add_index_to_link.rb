class AddIndexToLink < ActiveRecord::Migration[5.2]
  def change
    add_index :links, :url, unique: true
    add_index :links, :short_id, unique: true
  end
end
