module FileUploadHelper
  def is_file_expired?(file)
    expired_at = file.created_at + 10.minutes
    return Time.now > expired_at
  end
end
