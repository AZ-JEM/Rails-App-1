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
  $('[toggle="tooltip"]').tooltip();  // acceptable
  //  apply fade-in css animation :
  //  Issues on Heroku...
  // $('#view-container').toggleClass('enter');
  // attempt jQuery animations instead :
  // index page flashing on local host (arg)
  // $('#view-container').fadeIn(1000);
  // one to one, though on logs...
  console.log("tl:load...");
});

// document.addEventListener('turbolinks:load', function() {
// document.getElementById('view-container').classList.toggle('enter');
