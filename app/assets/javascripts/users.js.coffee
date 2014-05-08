ready = ->
  $('.current').bind('click', () ->
    $.ajax(
        type: 'GET',
        url: "/api/next_question",
        success: (data) ->
            window.location.replace(data["url"])
    )
  )

$(document).ready(ready)
$(document).on('page:load', ready)
