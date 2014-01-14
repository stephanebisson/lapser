calatrava.pageView ?= {}

calatrava.pageView.timerForm = ->

  $page = $('#timerForm')
  $p = (sel)-> $(sel, $page)
  visible = false

  renderLaps = (p, data) ->
    p.empty().html ich.lapsTmpl
      laps: data

  renderSection = (key, data) ->
    switch key
      when 'laps' then renderLaps($p('#laps'), data)
      when 'clock' then $p('#clock-fg').text(data)
      when 'label' then $p('#label').val(data)

  formatTime = (moment) ->
    moment.format('HH:mm:ss:SS')

  updateClock = ->
    renderSection "clock", formatTime(moment())

  updateClockLater = ->
    updateClock()
    calatrava.bridge.timers.start 1, updateClockLater if visible

  bind: (event, handler) ->
    # console.log "event: #{event}"
    switch event
      when 'capture' then $p("#capture").off('click').on 'click', handler

  render: (message) ->
    # console.log('rendering...', message)
    renderSection(section, data) for own section,data of message

  get: (field) ->
    # console.log('getting...', field)
    $page.find("#" + field).val()

  show: ->
    # console.log('showing...')
    $page.show()
    visible = true
    updateClockLater()

  hide: ->
    # console.log('hiding...')
    visible = false
    $page.hide()
