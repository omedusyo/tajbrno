(function ($) {

  // Small plugin, that makes input-file element styling easy.
  // To function it requires input-file element; element that will look like a button
  // and can be styled; an element in which the name of the file should be put.
  // It also requires all those elements to be contained in another element.
  $.fn.prettyUploader = function (options) {

    var defaults = {
      fileField:         'input[type="file"]', // specifies the input-file element
      uploadButton:      'button', // specified the styled button
      fileNameContainer: 'span' // specifies the element, where the file name should be put
    };

    var settings = $.extend({}, defaults, options);
    var $this = $(this);

    var fileField         = $this.find(settings.fileField).eq(0);
    var uploadButton      = $this.find(settings.uploadButton).eq(0);
    var fileNameContainer = $this.find(settings.fileNameContainer).eq(0);

    // if user clicks on the styled button, then
    // this will simulate clicking on real input-file element
    uploadButton.click(function () {
      fileField.trigger('click');
    });

    // in case the value of the input-file element changes
    // this will write the name of the file into specified element
    fileField.change(function () {
      var name = fileField[0].files[0].name;

      fileNameContainer.text(name);
    });

    return this;
  };
})(jQuery);

