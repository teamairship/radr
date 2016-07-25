App.site = App.cable.subscriptions.create "SitesChannel",
  received: (data) ->
    $('#name, #url').val('')
    $('#name').focus()
    $('.site-list').prepend(data.site)
    App.status.ping(data.site_id)

  create: (name, url)->
    @perform 'create', name: name, url: url

  destroy: (site_id)->
    site_el = $(".site[data-site-id=#{site_id}]").addClass('animated zoomOut')

    setTimeout( ->
      site_el.animate({ height: 'toggle' })
    , 100)

    @perform 'destroy', id: site_id
