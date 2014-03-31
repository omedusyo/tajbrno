(function () {
  var notice = $('#notice').text();

  notif({
    msg:  "<b>Success:</b> " + notice,
    type: 'success'
  });
})();

