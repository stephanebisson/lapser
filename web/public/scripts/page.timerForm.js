(function() {
  var __hasProp = Object.prototype.hasOwnProperty;

  if (calatrava.pageView == null) calatrava.pageView = {};

  calatrava.pageView.timerForm = function() {
    var $p, $page, renderLaps, renderSection;
    $page = $('#timerForm');
    $p = function(sel) {
      return $(sel, $page);
    };
    renderLaps = function(p, data) {
      return p.empty().html(ich.lapsTmpl({
        laps: data
      }));
    };
    renderSection = function(key, data) {
      switch (key) {
        case 'laps':
          return renderLaps($p('#laps'), data);
      }
    };
    return {
      bind: function(event, handler) {
        console.log("event: " + event);
        switch (event) {
          case 'capture':
            return $p("#capture").off('click').on('click', handler);
        }
      },
      render: function(message) {
        var data, section, _results;
        console.log('rendering...', message);
        _results = [];
        for (section in message) {
          if (!__hasProp.call(message, section)) continue;
          data = message[section];
          _results.push(renderSection(section, data));
        }
        return _results;
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
