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
  $('#cc-spacing').hide()
  $('#cc-NextButton').hide()
  $('#cc-loans').change ->
    has_loans = $('#cc-loans :selected').text()
    if has_loans == "I owe less than $1000" || has_loans == "I owe $1000 to $5000" || has_loans == "I owe over $5000"
      $('#cc-spacing').show()
      $('#cc-attitude').show()
      return $('#cc-attitude').change(->
        $('#cc-NextButton').show()
      )
    else
      $('#cc-spacing').hide()
      $('#cc-attitude').hide()
      $('#cc-NextButton').show()

  $('#none').hide()
  $('#hundreds').hide()
  $('#thousands').hide()
  $('#tensofthousands').hide()
  $('#NextButton').hide()
  $('#savings-amount').change ->
    has_savings = $('#savings-amount :selected').text()
    if has_savings == 'Someone raided my piggy bank'
      $('#hundreds').hide()
      $('#thousands').hide()
      $('#tensofthousands').hide()
      $('#none').show()
      $('#NextButton').show()
    else if has_savings == 'I have hundreds'
      $('#none').hide()
      $('#thousands').hide()
      $('#tensofthousands').hide()
      $('#hundreds').show()
      $('#NextButton').show()
    else if has_savings == 'I have thousands'
      $('#none').hide()
      $('#hundreds').hide()
      $('#tensofthousands').hide()
      $('#thousands').show()
      $('#NextButton').show()
    else if has_savings == 'I have tens of thousands'
      $('#none').hide()
      $('#thousands').hide()
      $('#hundreds').hide()
      $('#tensofthousands').show()
      $('#NextButton').show()
    window.scrollTo(0, document.body.scrollHeight);



  $('#little').hide()
  $('#none').hide()
  $('#NextButton').hide()
  $('#savings-habits').change ->
    savings_habits = $('#savings-habits :selected').text()
    if savings_habits == 'none'
      $('#little').hide()
      $('#none').show()
      $('#NextButton').show()
    else if savings_habits == 'a little'
      $('#none').hide()
      $('#little').show()
      $('#NextButton').show()
    else if savings_habits == 'a lot'
      $('#none').hide()
      $('#little').hide()
      $('#NextButton').show()
    window.scrollTo(0, document.body.scrollHeight);