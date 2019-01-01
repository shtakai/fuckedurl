class RenameColmnToLink < ActiveRecord::Migration[5.2]
  def change
    rename_column :links, :redirect, :generated
    change_column_default :links, :generated, 0
  end
end
