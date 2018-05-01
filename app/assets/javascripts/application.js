// This is a manifest file that'll be compiled into application.js, which will include all thee files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require_tree .

// ====================================================================== /
//  Turbolinks 5 event structure (chronological)
// ====================================================================== /
/*
document.addEventListener('turbolinks:click', function() {
  // var x = document.getElementById('view-container');
  // x.classList.toggle('exit');
  // console.log('*click');
});

document.addEventListener('turbolinks:before-visit', function() {
  // console.log('*before-visit');
});

document.addEventListener('turbolinks:visit', function() {
  // console.log('*visit');
});

document.addEventListener('turbolinks:request-start', function() {
  // console.log('*request-start');
});

document.addEventListener('turbolinks:request-end', function() {
  // console.log('*request-end');
});

document.addEventListener('turbolinks:before-cache', function() {
  // console.log('*before-cache');
});

document.addEventListener('turbolinks:before-render', function() {
  // console.log('*before-render');
});

document.addEventListener('turbolinks:render', function() {
  // console.log('*render');
});
*/

$(document).on('turbolinks:load', function() {
  // enable tooltips :
  $('[toggle="tooltip"]').tooltip();
  //  apply fade-in animation :
  $('#view-container').toggleClass('enter');
});

// document.addEventListener('turbolinks:load', function() {
// document.getElementById('view-container').classList.toggle('enter');
