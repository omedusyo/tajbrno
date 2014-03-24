// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  $('#login form').validation({
    required: [
      {
        name: 'user[username]'
      },
      {
        name: 'user[password]'
      }
    ],
    fail: function () {
      Gumby.error('Form validation failed');
    }
  });
});
