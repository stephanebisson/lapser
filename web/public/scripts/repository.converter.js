(function() {

  if (typeof example === "undefined" || example === null) example = {};

  if (example.converter == null) example.converter = {};

  example.converter.repository = function(ajax) {
    return {
      exchangeRate: function(options) {
        return ajax({
          url: "" + example.converter.apiEndpoint + "/currency?from=" + options.from + "&to=" + options.to,
          method: "GET",
          success: function(response) {
            return options.ifSucceeded(JSON.parse(response).rate);
          },
          failure: options.elseFailed
        });
      }
    };
  };

}).call(this);
