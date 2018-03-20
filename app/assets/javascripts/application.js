// This is a manifest file that'll be compiled into application.js, which will include all the files
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
//= require jquery
//= require turbolinks
//= require_tree .

// $('turbolinks:load').ready(function() {
//     $(".search-results").click(function() {
//       alert('Page loaded.')
//     });
//   },
console.log('JS loaded...');
$(document).on('turbolinks:load', function() {
  $.ajax({
    // url: 'https://jobs.github.com/positions.json?search=<%= Search.last_keyword',
    url: 'https://jobs.github.com/positions.json?search=denver',
    dataType: 'jsonp',
    success: function(data) {
      for (let i = 0; i < data.length; i++) {
        console.log(data[i].company);
        $('.results-table')
          .find('tbody:last')
          .append('<tr>' + data[i].company + '</tr>')
          .append('<tr>' + data[i].company_url + '</tr>')
          .append('<tr>' + data[i].location + '</tr>')
          .append('<tr>' + data[i].created_at + '</tr>')
          .append('<tr>' + data[i].title + '</tr>')
          .append('<tr>' + data[i].position + '</tr>');
      }
    }
  });
});
