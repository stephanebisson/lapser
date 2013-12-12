lapser ?= {}
lapser.timer ?= {}

lapser.timer.controller = ({views, changePage}) ->

  laps = []

  formatTime = (moment) ->
    moment.format('HH:mm:ss:SS')

  formatTimeDiff = (now, before) ->
    Math.round(now.clone().diff(before) / 1000)

  updateClock = ->
    views.timerForm.render "clock-fg": formatTime(moment())

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
    recordStart()
    changePage "timerForm"
    # setInterval updateClock, 10
    updateClock()
    views.timerForm.render "laps": laps

  views.timerForm.bind "capture", ->
    views.timerForm.get "label", (label) ->
      recordNext label
      views.timerForm.render "laps": laps
