class FileUploadController < ApplicationController
  def index
    console
    @upload_file = UploadFile.new
  end

  def create
    @upload_file = UploadFile.new(file_name: params[:file])
    @upload_file.save!
    logger.debug(@upload_file.file_name.url)
    render json: {"message": "create called"}
  end
end
