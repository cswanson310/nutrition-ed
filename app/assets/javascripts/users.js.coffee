$ ->
  $('.current').bind('click', () ->
    $.ajax(
        type: 'GET',
        url: "/api/next_question",
        success: (data) ->
            window.location.replace(data["url"])
    )
  )
