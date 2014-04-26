# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.answer').bind('click', () ->
    $(this).css({'background': 'green'})
    console.log($('.question_text').attr('id'))
    console.log($(this).attr('id'))
    $.ajax(
      type: 'GET',
      url: "/api/choose_answer",
      datatype: 'json',
      data: { id: $('.question_text').attr('id'), answer_id: $(this).attr('id') }
      success: (data) ->
        console.log(data)
        if (data["correct"] == true)
          $.ajax(
            type: 'GET'
            url: "/api/next_question",
            success: (data) ->
              console.log('here?')
              window.location.replace(data["url"])
          )
    )
  )

