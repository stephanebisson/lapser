(function() {

  if (typeof example === "undefined" || example === null) example = {};

  if (example.converter == null) example.converter = {};

  if (typeof calatrava === "undefined" || calatrava === null) calatrava = {};

  example.converter.apiEndpoint = "";

  $(document).ready(function() {
    return $('body > .container > .page').hide();
  });

  window.onpopstate = function(event) {
    if (event.state) return calatrava.bridge.changePage(event.state.page);
  };

}).call(this);
