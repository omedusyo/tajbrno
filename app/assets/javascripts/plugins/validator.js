// helper plugin for easier validation of strings
//
// ex. usage:
// validator("hello, world!").length(3, 256).format(/[a-b, !]+/).is_valid() --> true
var validator = function (str) {
  var validity = true;
  return {
    // checks if the string length is between a and b
    length: function (a, b) {
      if (validity) {
        validity = str.length >= a && str.length <= b;
      }

      return this;
    },
    format: function (re) {
      if (validity) {
        validity = re.test(str);
      }

      return this;
    },
    is_valid: function () {
      return validity;
    }
  };
};

