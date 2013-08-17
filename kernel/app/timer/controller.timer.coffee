lapser ?= {}
lapser.timer ?= {}

lapser.timer.controller = ({views, changePage}) ->

  laps = []

  views.homePage.bind "start", ->
    changePage "timerForm"

  views.timerForm.bind "capture", ->
    laps.push
      time: Date()
      label: 'no label'
    views.timerForm.render "laps": laps

  views.homePage.render "Hello from controller"
