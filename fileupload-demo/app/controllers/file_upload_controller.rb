require 'ostruct'
require 'uri'

class FileUploadController < ApplicationController
  def index
    @upload_file = UploadFile.new
    @upload_files = UploadFile.all
  end

  def create
    @upload_file = UploadFile.new(file: params[:file])
    file_name = File.basename(URI.unescape(@upload_file.file.url))

    @upload_file.save!
    
    @upload_file.update_attribute("file_name", file_name)
    @upload_file.update_attribute("file_url", @upload_file.file.url)
    @upload_file.update_attribute("file_size", @upload_file.file.size)

    file_json = {
      "file_name" => file_name,
      "file_url" => @upload_file.file_url,
      "file_size" => @upload_file.file.size,
      "created_at" => Time.now()
    }
    render :json => file_json
  end

  def render_uploaded_file_html
    file = OpenStruct.new(params['file'])
    logger.debug(file)
    render partial: "uploaded_file", :locals => { :file => file}
  end
end
