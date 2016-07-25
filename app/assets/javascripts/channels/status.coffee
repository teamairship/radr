App.status = App.cable.subscriptions.create "StatusChannel",
  connected: ->
    console.log "Radr is connected..."

    if $('.sites.index').length
      @ping()

  received: (data) ->
    site_el = ".site[data-site-id=#{data.site_id}]"
    $(site_el).replaceWith(data.site)
    $(site_el).addClass('animated pulse')
    $(site_el).find('.loader').removeClass('loading')

  ping: (site_id)->
    selector = if site_id then ".site[data-site-id=#{site_id}]" else '.site'

    $(selector)
      .removeClass('alert-error')
      .removeClass('alert-success')
      .addClass('alert-info')

    $(selector).find('.loader').addClass('loading')

    @perform 'ping', site_id: site_id
