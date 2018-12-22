class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :real_url
      t.string :short_url
      t.integer :redirect, limit: 8

      t.timestamps
    end
  end
end
