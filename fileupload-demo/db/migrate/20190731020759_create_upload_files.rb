class CreateUploadFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :upload_files do |t|
      t.string :file_name
      t.string :file_url

      t.timestamps
    end
  end
end