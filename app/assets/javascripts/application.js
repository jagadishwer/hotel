// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
    // $("#gallery_1").hide();
    $("#gallery_2").hide();
    $("#gallery_3").hide();
    i=0
    $("p").click(function(){
        i+=1
       
        if (i==1)
            $("#gallery_2").show();
        else
            $("#gallery_3").show();
    });
    $("img").click(function(){
        $(this).hide();
    $("#gallery_3").hide();
        
    });
});

