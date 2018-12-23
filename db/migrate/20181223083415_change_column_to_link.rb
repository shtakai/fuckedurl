class ChangeColumnToLink < ActiveRecord::Migration[5.2]
  def change
    rename_column :links, :short_url, :short_id
    rename_column :links, :real_url, :url
  end
end
