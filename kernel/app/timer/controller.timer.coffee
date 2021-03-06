lapser ?= {}
lapser.timer ?= {}

lapser.timer.controller = ({views, changePage}) ->

  laps = []
  visible = false

  formatTime = (moment) ->
    moment.format('HH:mm:ss:SS')

  formatTimeDiff = (now, before) ->
    Math.round(now.clone().diff(before) / 1000)

  updateClock = ->
    views.timerForm.render "clock": formatTime(moment())

  startTimer = ->
    unless visible
      visible = true
      updateClockLater()    

  stopTimer = ->
    visible = false

  updateClockLater = ->
    updateClock()
    calatrava.bridge.timers.start 0.1, updateClockLater if visible

  record = (label, now, last, first) ->
    laps.push
      label: label
      timeRaw: now
      time: formatTime now
      timeFromLast: formatTimeDiff now, last
      timeFromStart: formatTimeDiff now, first

  recordStart = ->
    now = moment()
    record 'START', now, now, now

  recordNext = (label) ->
    now = moment()
    record label || "Lap ##{laps.length}", now, _.last(laps).timeRaw, _.first(laps).timeRaw

  views.homePage.bind "start", ->
    laps = []
    changePage "timerForm"
    recordStart()
    views.timerForm.render "laps": laps

  views.timerForm.bind "pageOpened", ->
    startTimer()

  views.timerForm.bind "hide", ->
    stopTimer()

  views.timerForm.bind "capture", ->
    views.timerForm.get "label", (label) ->
      recordNext label
      views.timerForm.render "laps": laps
      views.timerForm.render "label": ""




