# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.answer').bind('click', () ->
    answer_id = $(this).attr('id')
    $.ajax(
      type: 'GET',
      url: "/api/choose_answer",
      datatype: 'json',
      data: { id: $('.question_text').attr('id'), answer_id: $(this).attr('id') }
      success: (data) ->
        console.log(data)
        if (data["correct"] == true)
          $('.answer#'+answer_id+" .label").css({'background': 'green'})
          $.ajax(
            type: 'GET'
            url: "/api/next_question",
            data: { id: $('.question_text').attr('id'), answer_id: $(this).attr('id') }
            success: (data) ->
              window.location.replace(data["url"])
          )
        else
          $('.answer#'+answer_id+" .label").css({'background': 'red'})
          if data["hint"]?
            $('.hint').text(data["hint"])
    )
  )

