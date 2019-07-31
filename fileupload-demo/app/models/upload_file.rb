class UploadFile < ApplicationRecord
    mount_uploader :file_name, FileUploader
end
