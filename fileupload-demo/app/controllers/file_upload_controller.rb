require 'ostruct'
require 'uri'

class FileUploadController < ApplicationController
  def index
    console
    @upload_file = UploadFile.new
    @upload_files = UploadFile.all
  end

  def create
    @upload_file = UploadFile.new(file: params[:file])
    @upload_file.save!
    
    encoded_url = URI.encode(@upload_file.file.url)
    file_name = File.basename(URI.parse(encoded_url).path)
    @upload_file.update_attribute("file_name", file_name)
    @upload_file.update_attribute("file_url", @upload_file.file.url)

    file_json = {
      "file_name" => @upload_file.file_name,
      "file_url" => @upload_file.file_url
    }
    render :json => file_json
  end

  def render_uploaded_file_html
    file = OpenStruct.new(params['file'])
    render partial: "uploaded_file", :locals => { :file => file}
  end
end
