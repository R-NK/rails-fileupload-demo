require 'time'

module FileUploadHelper
  def is_file_expired?(file)
    created_at = nil
    logger.debug(file.created_at.class)
    if file.created_at.kind_of?(ActiveSupport::TimeWithZone)
      created_at = file.created_at
    else
      created_at = Time.parse(file.created_at)
    end
    expired_at = created_at + 10.minutes
    logger.debug(file.file_name)
    logger.debug(file.created_at)
    logger.debug(created_at)
    logger.debug(expired_at)
    return Time.now > expired_at
  end
end
