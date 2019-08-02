# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  Dropzone.autoDiscover = false
  new Dropzone '#upload-dropzone',
    uploadMultiple: false
    paramName: 'file'
    clickable: false
    createImageThumbnails: false
    previewTemplate: '<div class="uploaded-image"><span data-dz-name></span> <strong class="dz-size" data-dz-size></strong><div class="dz-error-message" data-dz-errormessage></div><div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress></span></div></div>'
    init: ->
      @on 'success', (file, json) ->
        $.ajax
          url: "/render_uploaded_file_html",
          data: { file: json },
        .done (html) ->
          # アップロードしたファイルのHTMLが返ってくるので、ファイルリストの要素に追加
          $("#file-list").append html
        .fail (response) ->
          console.log(response)
        
    dictDefaultMessage: '''
      <i class="fa fa-file-o fa-2x"></i><br>
      <br>
      ファイルをここにドラッグアンドドロップしてください<br>
    ''' 
  return