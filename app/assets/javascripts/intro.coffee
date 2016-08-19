# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready turbolinks:load', (event) ->
  $('#js-attitude').hide()
  $('#spacing').hide()
  $('#NextButton').hide()
  $('#js-loans').change ->
    has_loans = undefined
    has_loans = undefined
    has_loans = $('#js-loans :selected').text()
    if has_loans == 'have student loans'
      $('#spacing').show()
      $('#js-attitude').show()
      return $('#js-attitude').change(->
        $('#NextButton').show()
      )
    else
      $('#js-attitude').hide()
      $('#NextButton').show()
    