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
//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require chartkick
//= require underscore
//= require jquery.validate
//= require jquery.validate.localization/messages_es
//= require gmaps/google
//= require bootstrap
//= require scrollreveal
//= require jquery.magnific-popup
//= require creative
//= require_tree .


$(document).on('turbolinks:load',function(){
  $('#communes').hide();
  var communes;
  communes = $('#publication_commune_id').html();
  return $('#publication_region_id').change(function() {
    var escaped_region, options, region;
    region = $('#publication_region_id :selected').text();
    escaped_region = region.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(communes).filter("optgroup[label='" + escaped_region + "']").html();
    if (options) {
      $('#publication_commune_id').html(options);
      return $('#communes').show();
    } else {
      $('#publication_commune_id').empty();
      return $('#communes').hide();
    }
  });
});

