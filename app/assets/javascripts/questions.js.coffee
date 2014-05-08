# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  lastSelect = null

  switchOn = (newSelection) ->
      newSelection.addClass("answer-selected")
      $('.hint', newSelection).removeClass('hidden')

  switchOff = (lastSelect) ->
      if lastSelect
          lastSelect.removeClass("answer-selected")
          $(".fa", lastSelect).addClass('hidden')
          $(".hint", lastSelect).addClass('hidden')
          $(".label", lastSelect).removeClass('incorrect')
          $(".label", lastSelect).removeClass('correct')


  $('.answer').bind('click', () ->
      switchOff(lastSelect)
      switchOn($(this))
      lastSelect = $(this)

      answer_id = $(this).attr('id')

      $.ajax(
          type: 'GET',
          url: "/api/choose_answer",
          datatype: 'json',
          data: { id: $('.question-text').attr('id'), answer_id: $(this).attr('id') }
          success: (data) ->
              if (data["correct"] == true)
                  answer = $('.answer#'+answer_id)
                  answer.find(".label").addClass('correct')
                  $(".answer#"+answer_id+" .fa-check").removeClass('hidden')
                  $(".answer#"+answer_id+" .hint").text("correct!")
                  $('#next-question').addClass('active')
              else
                  $('.answer#'+answer_id+" .label").addClass('incorrect')
                  if data["hint"]?
                      hint = $('.answer#'+answer_id+' .hint')
                      hint.text(data["hint"])
                      $('.answer#'+answer_id+' .fa-times').removeClass('hidden')
      )
  )

  $('#next-question').bind('click', () ->
      $.ajax(
          type: 'GET'
          url: "/api/next_question",
          data: { id: $('.question-text').attr('id'), answer_id: $('.answer-selected').attr('id') }
          success: (data) ->
              window.location.replace(data["url"])
      )
  )

$(document).ready(ready)
$(document).on('page:load', ready)

  #TODO: need to add this to the next-question button
