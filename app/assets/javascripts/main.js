$(document).ready(function () {
  // enable styling of file input button
  $('.img_uploader').prettyUploader();

  // enable datetime picker
  (function () {
    var datetime_trigger = '#reservation_date div'
    var datetime_input   = '#reservation_date input'

    $(datetime_input).datetimepicker({
      format: 'd.m.Y H:i'
    });

    $(datetime_trigger).click(function () {
      $(datetime_input).datetimepicker('show');
    });
  })();
});

