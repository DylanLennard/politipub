// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require ckeditor/init
//= require_tree .

function sideMenu(){
	$(document).ready(function() {
        $("#squares").bind('click',function(){
        	$(this).toggleClass("rotated");
        	$(".side-menu").toggleClass("menu-open");
        	$(".main").toggleClass("main-open");
        	return false;
        });
        $(".overlay").ready(function() { 
		$('.overlay').fadeOut(2500)});
    });
}

function adminTabs(tabName) {
	var i;
	var x = document.getElementsByClassName('admin-tab');

	for (i = 0; i < x.length; i++) {
		x[i].style.display = 'none';
	}

	document.getElementById(tabName).style.display = 'block';
}