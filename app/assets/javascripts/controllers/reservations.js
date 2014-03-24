// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  // enable datetime picker
  var datetime_trigger = '#reservation_date div'
  var datetime_input   = '#reservation_date input'

  $(datetime_input).datetimepicker({
    format: 'd.m.Y H:i'
  });

  $(datetime_trigger).click(function () {
    $(datetime_input).datetimepicker('show');
  });
});
