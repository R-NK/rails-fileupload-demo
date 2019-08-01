# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  Dropzone.autoDiscover = false
  new Dropzone '#upload-dropzone',
    uploadMultiple: false
    paramName: 'file'
    clickable: false
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