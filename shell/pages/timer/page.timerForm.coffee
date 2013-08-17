calatrava.pageView ?= {}

calatrava.pageView.timerForm = ->

  $page = $('#timerForm')
  $p = (sel)-> $(sel, $page)

  renderLaps = (p, data) ->
    p.empty().html ich.lapsTmpl
      laps: data

  renderSection = (key, data) ->
    switch key
      when 'laps' then renderLaps($p('#laps'), data)
      when 'clock' then $p('#clock').text(data)

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

  hide: ->
    # console.log('hiding...')
    $page.hide()
