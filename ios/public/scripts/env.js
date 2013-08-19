(function() {

  if (typeof example === "undefined" || example === null) example = {};

  if (example.converter == null) example.converter = {};

  if (_.isUndefined(example.converter.apiEndpoint)) {
    example.converter.apiEndpoint = "http://rate-exchange.appspot.com";
  }

}).call(this);
