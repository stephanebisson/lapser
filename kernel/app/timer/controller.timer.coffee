lapser ?= {}
lapser.timer ?= {}

lapser.timer.controller = ({views, changePage}) ->

  laps = []

  record = (label) ->
    now = moment()
    laps.push
      label: label
      time: moment()

  views.homePage.bind "start", ->
    record "Start"
    changePage "timerForm"
    views.timerForm.render "laps": laps

  views.timerForm.bind "capture", ->
    views.timerForm.get "label", (label) ->
      record label || 'Lap'
      views.timerForm.render "laps": laps

  views.homePage.render "Hello from controller"
