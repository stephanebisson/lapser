lapser ?= {}
lapser.timer ?= {}

lapser.timer.controller = ({views, changePage}) ->

  laps = []

  formatTime = (moment) ->
    moment.format('HH:mm:ss:SS')

  updateClock = ->
    views.timerForm.render "clock": formatTime(moment())

  record = (label) ->
    now = formatTime moment()
    laps.push
      label: label
      time: now
      timeFromLast: now
      timeFromStart: now

  views.homePage.bind "start", ->
    record "Start"
    changePage "timerForm"
    setInterval updateClock, 100
    views.timerForm.render "laps": laps

  views.timerForm.bind "capture", ->
    views.timerForm.get "label", (label) ->
      record label || 'Lap'
      views.timerForm.render "laps": laps
