class AddFileNameColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :upload_files, :file_name, :string
  end
end
