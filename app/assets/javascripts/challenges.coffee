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
    
  $('#yes-response').hide()
  $('#no-response').hide()
  $('#depends-response').hide()
  $('#depends-choice').hide()
  $('#choice-no').hide()
  $('#choice-yes').hide()
  $('#NextButton').hide()
  $('#500').change ->
    has_500 = $('#500 :selected').text()
    if has_500 == 'Yes, I do'
      $('#no-response').hide()
      $('#depends-response').hide()
      $('#depends-choice').hide()
      $('#choice-no').hide()
      $('#choice-yes').hide()
      $('#yes-response').show()
      $('#NextButton').show()
    else if has_500 == 'No, I don\'t'
      $('#yes-response').hide()
      $('#depends-response').hide()
      $('#depends-choice').hide()
      $('#choice-no').hide()
      $('#choice-yes').hide()
      $('#no-response').show()
      $('#NextButton').show()
    else if has_500 == 'That depends...'
      $('#yes-response').hide()
      $('#no-response').hide()
      $('#choice-no').hide()
      $('#choice-yes').hide()
      $('#NextButton').hide()
      $('#depends-response').show()
      $('#depends-choice').show()
      return $('#depends-choice').change ->
        invest = $('#depends-choice :selected').text()
        if invest == "Yes, let\'s do it"
          $('#choice-no').hide()
          $('#choice-yes').show()
          $('#NextButton').show()
        else if invest == "No thanks, I\'d rather not right now"
          $('#choice-yes').hide()
          $('#choice-no').show()
          $('#NextButton').show()