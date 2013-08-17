(function() {

  if (typeof lapser === "undefined" || lapser === null) lapser = {};

  if (lapser.timer == null) lapser.timer = {};

  lapser.timer.controller = function(_arg) {
    var changePage, laps, views;
    views = _arg.views, changePage = _arg.changePage;
    laps = [];
    views.homePage.bind("start", function() {
      return changePage("timerForm");
    });
    views.timerForm.bind("capture", function() {
      laps.push({
        time: Date(),
        label: 'no label'
      });
      return views.timerForm.render({
        "laps": laps
      });
    });
    return views.homePage.render("Hello from controller");
  };

}).call(this);
