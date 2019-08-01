class FileUploadController < ApplicationController
  def index
    console
    @upload_file = UploadFile.new
    @upload_files = UploadFile.all
  end

  def create
    @upload_file = UploadFile.new(file_name: params[:file])
    @upload_file.save!
    @upload_file.update_attribute("file_url", @upload_file.file_name.url)
    render json: {"message": "create called"}
  end
end
