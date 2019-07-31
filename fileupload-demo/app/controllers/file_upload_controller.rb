class FileUploadController < ApplicationController
  def index
  end

  def create(upload_file)
    UploadFile.create(upload_file)
    render json: {"message": "create called"}
  end
end
