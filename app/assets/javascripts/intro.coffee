# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready turbolinks:load', (event) ->
  $('#student-attitude').hide()
  $('#spacing').hide()
  $('#NextButton').hide()
  $('#student-loans').change ->
    has_loans = $('#student-loans :selected').text()
    if has_loans == 'I have student loans'
      $('#spacing').show()
      $('#student-attitude').show()
      return $('#student-attitude').change(->
        $('#NextButton').show()
      )
    else
      $('#spacing').hide()
      $('#student-attitude').hide()
      $('#NextButton').show()
    

  $('#cc-attitude').hide()
  $('#spacing').hide()
  $('#NextButton').hide()
  $('#cc-loans').change ->
    has_loans = $('#cc-loans :selected').text()
    if has_loans == "I owe less than $1000" || has_loans == "I owe $1000 to $5000" || has_loans == "I owe over $5000"
      $('#spacing').show()
      $('#cc-attitude').show()
      return $('#cc-attitude').change(->
        $('#NextButton').show()
      )
    else
      $('#spacing').hide()
      $('#cc-attitude').hide()
      $('#NextButton').show()