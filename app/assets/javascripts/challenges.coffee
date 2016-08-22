# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready turbolinks:load', (event) ->
  $('#easy-response').hide()
  $('#tough-response').hide()
  $('#hard-response').hide()
  $('#NextButton').hide()
  $('#feeling').change ->
    has_loans = $('#feeling :selected').text()
    if has_loans == 'easy!'
      $('#tough-response').hide()
      $('#hard-response').hide()
      $('#easy-response').show()
      $('#NextButton').show()
    else if has_loans == 'tough, but doable'
      $('#easy-response').hide()
      $('#hard-response').hide()
      $('#tough-response').show()
      $('#NextButton').show()
    else if has_loans == 'really hard!'
      $('#easy-response').hide()
      $('#tough-response').hide()
      $('#hard-response').show()
      $('#NextButton').show()