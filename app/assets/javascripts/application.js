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
//= require turbolinks
//= require jquery_ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(function () {
  $('[data-toggle="popover"]').popover()
})


$('.popover-dismiss').popover({
  trigger: 'focus'
})

$(function() {
  $("#body-field").on("keyup", function(){
    var length = $(this).val().length + '/160   Min. 50';
    $("#body-count").html(length);
  });
});

$(function() {
  $("#title-field").on("keyup", function(){
    var length = $(this).val().length + '/45   Min. 1';
    $("#title-count").html(length);
  });
});

window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
}, 4000);


// function expandTextarea('text-area-fix') {
//     document.getElementById('text-area-fix').addEventListener('keyup', function() {
//         this.style.overflow = 'hidden';
//         this.style.height = 0;
//         this.style.height = this.scrollHeight + 'px';
//     }, false);
// }
// expandTextarea('text-area-fix');
//
//
//
//
// var textarea = document.querySelector('textarea');
//
// textarea.addEventListener('keydown', autosize);
//
// function autosize(){
//   var el = this;
//   setTimeout(function(){
//     el.style.cssText = 'height:auto; padding:0';
//     // for box-sizing other than "content-box" use:
//     // el.style.cssText = '-moz-box-sizing:content-box';
//     el.style.cssText = 'height:' + el.scrollHeight + 'px';
//   },0);
// }
