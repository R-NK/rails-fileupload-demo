class RenameFileName < ActiveRecord::Migration[5.0]
  def change
    rename_column :upload_files, :file_name, :file
  end
end
