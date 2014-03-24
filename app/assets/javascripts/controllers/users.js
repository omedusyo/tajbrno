// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  // gets an element and returns it's value without trailing whitespace
  var strip = function (el) {
    return el.val().trim();
  };

  var validate = {
    username: function (el) {
      return validator(strip(el)).length(3, 254).format(/^[0-9a-zA-Z_-]+$/).is_valid();
    },
    name: function (el) {
      return validator(strip(el)).length(2, 254).format(/^[a-zA-Z]+$/).is_valid();
    },
    password: function (el) {
      return validator(el.val()).length(6, 254).is_valid();
    },
    password_confirmation: function (el) {
      // getting the value of user[password] input
      var password = $('#signup form input[name="user[password]"]').val();
      return password == el.val();
    }
  };

  $('#signup form').validation({
    required: [
      {
        name: 'user[username]',
        validate: validate.username
      },
      {
        name: 'user[first_name]',
        validate: validate.name
      },
      {
        name: 'user[last_name]',
        validate: validate.name
      },
      {
        name: 'user[password]',
        validate: validate.password
      },
      {
        name: 'user[password_confirmation]',
        validate: validate.password_confirmation
      }
    ]
  });
});
