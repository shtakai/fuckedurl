class AddDefaultValueToLink < ActiveRecord::Migration[5.2]
  def change
    change_column_default :links, :redirect, 0
  end
end
