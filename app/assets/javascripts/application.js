// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require intro

function hasNoHtml5Validation () {
 return typeof(document.createElement('input').checkValidity) === 'function';
}


var ready = function() {
  jQuery('.skillrow').each(function() {
    jQuery(this).find('.skillbar-bar').animate({
      width: jQuery(this).attr('data-percent')
    }, 100);
  });

  jQuery('#dropdown').on("change", function() {
      
    $('#SubmitButton').hide(0).delay(0).fadeIn(0).removeClass('hidden');

  });

  if(hasNoHtml5Validation()){
   
    jQuery('form').submit(function(){
      var is_valid = true;
        jQuery('[required]', this).each(function(){
          if(this.value == ''){
            alert('Please choose a valid option');
            is_valid = false;
          }
        });
      return is_valid;
    });
  };
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
