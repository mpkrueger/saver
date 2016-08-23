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



  $('#response').hide()
  $('#all').hide()
  $('#most').hide()
  $('#some').hide()
  $('#verylittle').hide()
  $('#NextButton').hide()
  $('#spending-amount').change ->
    spending = $('#spending-amount :selected').text()
    if spending == 'all'
      $('#verylittle').hide()
      $('#most').hide()
      $('#some').hide()
      $('#all').show()
      $('#response').show()
      $('#NextButton').show()
    else if spending == 'most'
      $('#verylittle').hide()
      $('#some').hide()
      $('#all').hide()
      $('#most').show()
      $('#response').show()
      $('#NextButton').show()
    else if spending == 'some'
      $('#verylittle').hide()
      $('#most').hide()
      $('#all').hide()
      $('#some').show()
      $('#response').show()
      $('#NextButton').show()
    else if spending == 'very little'
      $('#most').hide()
      $('#some').hide()
      $('#all').hide()
      $('#verylittle').show()
      $('#response').show()
      $('#NextButton').show()
    window.scrollTo(0, document.body.scrollHeight);    