// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

ready = function () {
  if ($("#home-div").length > 0) {
    //if it exists
    $('#home').addClass('active-nav');
  } else if ($("#kids-div").length > 0) {
    $('#kids').addClass('active-nav');
  } else if ($("#parents-div").length > 0) {
    $('#parents').addClass('active-nav');
  }
}

$(document).ready(ready);
$(document).on('page:load', ready);
