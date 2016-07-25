# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new-site').submit (e) ->
    App.site.create $('#name').val(), $('#url').val()
    e.preventDefault()

  $(document).on 'click', '.destroy-site', (e) ->
    App.site.destroy $(@).data('site-id')
    e.preventDefault()
