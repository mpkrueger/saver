# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready turbolinks:load', (event) ->
  $('#bill-upload').hide()
  $('a[href^="#bill-upload"]').on 'click', (e) ->
	  e.preventDefault()
	  $("#bill-upload").fadeIn(200);
	  $('#consent').hide()
	  $('#bill-terms').hide()