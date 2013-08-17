(function() {

  if (typeof lapser === "undefined" || lapser === null) lapser = {};

  if (lapser.timer == null) lapser.timer = {};

  lapser.timer.start = function() {
    lapser.timer.controller({
      views: {
        homePage: calatrava.bridge.pages.pageNamed("homePage"),
        timerForm: calatrava.bridge.pages.pageNamed("timerForm")
      },
      changePage: calatrava.bridge.changePage
    });
    return calatrava.bridge.changePage("homePage");
  };

}).call(this);
