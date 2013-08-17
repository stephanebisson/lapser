calatrava.pageView ?= {}

calatrava.pageView.homePage = ->

  $page = $('#homePage')
  $p = (sel)-> $(sel, $page)

  bind: (event, handler) ->
    # console.log "event: #{event}"
    switch event
      when 'start' then $p("#start").off('click').on 'click', handler

  render: (message) ->
    # console.log('rendering...', message)
    $p("#message").text(message)

  get: (field) ->
    # console.log('getting...', field)
    $page.find("#" + field).val()

  show: ->
    # console.log('showing...')
    $page.show()

  hide: ->
    # console.log('hiding...')
    $page.hide()
