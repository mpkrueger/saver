# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready turbolinks:load', (event) ->
  $('#email-fields-area').hide()
  $('a[href^="#email-fields"]').on 'click', (e) ->
	  e.preventDefault()
	  $("#email-fields-area").fadeIn(500);

	  target = @hash
	  $target = $(target)

	  $('html, body').stop().animate {
	    'scrollTop': $target.offset().top
	  }, 0, ->
	    window.location.hash = target