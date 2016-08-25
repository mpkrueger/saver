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
        if invest == "Yes, let\'s invest $500"
          $('#choice-no').hide()
          $('#choice-yes').show()
          $('#NextButton').show()
        else if invest == "No thanks, let\'s do something else"
          $('#choice-yes').hide()
          $('#choice-no').show()
          $('#NextButton').show()

  $('#spacing').hide()
  $('#matching').hide()
  $('#offers-401k').hide()
  $('#no-401k').hide()
  $('#NextButton').hide()
  $('#401k').change ->
    has_401k = $('#401k :selected').text()
    if has_401k == 'offers a 401(k)'
      $('#no-401k').hide()
      $('#offers-401k').hide()
      $('#spacing').show()
      $('#matching').show()
      return $('#matching').change ->
        $('#offers-401k').show()
        $('#NextButton').show()
    else if has_401k == 'doesn\'t offer a 401(k)'
      $('#spacing').hide()
      $('#matching').hide()
      $('#offers-401k').hide()
      $('#no-401k').show()
      $('#NextButton').show()