// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require masonry/jquery.masonry
//= require dropzone
//= require_tree .

$(document).ready(function(){
  //disabole auto discover
  Dropzone.autoDiscover = false;

  var Dropzone = new Dropzone (".dropzone", {
    maxFilesize: 256, // Set the maximum file size to 256 MB
    paramName: "product[image]", //Rails expects the file upload to be something like model[field_name]
    addRemoveLinks: false // Don't show remove links on dropzone itself.
  });

  dropzone.on("success", function(file) {
    this.removeFile(file)
    $.getScript("/products")
  })
});

var desktops = document.querySelectorAll('.desktop');

function hide(element) {
  element.style.setProperty('left', '-100%', element.style.getPropertyPriority('left'));
}

function hideAll() {
  for (var i = 0; i < desktops.length; i++) {
    hide(desktops[i]);
  }
}

function show(element) {
  element.style.setProperty('left', '0', element.style.getPropertyPriority('left'));
}

document.getElementById('link-one').addEventListener('click', function () {
  hideAll();
  show(document.getElementById('one'));
}, false);

document.getElementById('link-two').addEventListener('click', function () {
  hideAll();
  show(document.getElementById('two'));
}, false);

document.getElementById('link-three').addEventListener('click', function () {
  hideAll();
  show(document.getElementById('three'));
}, false);

document.getElementById('link-four').addEventListener('click', function () {
  hideAll();
  show(document.getElementById('four'));
}, false);

document.getElementById('link-five').addEventListener('click', function () {
  hideAll();
  show(document.getElementById('five'));
}, false);

show(document.getElementById('one'));
