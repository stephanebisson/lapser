lapser ?= {}
lapser.timer ?= {}

lapser.timer.start = ->
  lapser.timer.controller
    views:
      homePage: calatrava.bridge.pages.pageNamed "homePage"
      timerForm: calatrava.bridge.pages.pageNamed "timerForm"
    changePage: calatrava.bridge.changePage

  calatrava.bridge.changePage "homePage"
