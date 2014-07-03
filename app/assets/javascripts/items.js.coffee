# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  url = $('#new_item').prop('action')

  $('#item_content').fileupload(
    url: url
    dataType: 'json'
    done: (e, data) ->
      $.each data.result.files, (index, file) ->
        $('<p/>').text(file.name).appendTo('#files')
    progressall:  (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('#progress .progress-bar').css(
          'width',
          progress + '%'
      )
  ).prop('disabled', !$.support.fileInput)
   .parent().addClass($.support.fileInput ? undefined : 'disabled')
