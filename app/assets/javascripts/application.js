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
  let lastSearch = $('.search-results').data('last-search');
  $.ajax({
    url: 'https://jobs.github.com/positions.json?search=' + lastSearch,
    dataType: 'jsonp',
    success: function(data) {
      for (let i = 0; i < data.length; i++) {
        let newRowContent =
          '<tr><td>' +
          data[i].company +
          '</td><td>' +
          data[i].company_url +
          '</td><td>' +
          data[i].location +
          '</td><td>' +
          data[i].created_at +
          '</td><td>' +
          data[i].title +
          '</td></tr>';
        $('.results-table tbody').append(newRowContent);
      }
      let searchHistory = $('.search-history').data('search-history');
      for (let i = 0; i < searchHistory.length; i++) {
        let history = searchHistory[i][0] + ' on ' + searchHistory[i][1];
        $('.search-history ul').append('<li>' + history + '</li>');
      }
    }
  });
});
