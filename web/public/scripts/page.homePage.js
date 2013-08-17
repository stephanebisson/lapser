(function() {

  if (calatrava.pageView == null) calatrava.pageView = {};

  calatrava.pageView.homePage = function() {
    var $p, $page;
    $page = $('#homePage');
    $p = function(sel) {
      return $(sel, $page);
    };
    return {
      bind: function(event, handler) {
        console.log("event: " + event);
        switch (event) {
          case 'start':
            return $p("#start").off('click').on('click', handler);
        }
      },
      render: function(message) {
        console.log('rendering...', message);
        return $p("#message").text(message);
      },
      get: function(field) {
        console.log('getting...', field);
        return $page.find("#" + field).val();
      },
      show: function() {
        console.log('showing...');
        return $page.show();
      },
      hide: function() {
        console.log('hiding...');
        return $page.hide();
      }
    };
  };

}).call(this);
