# ---------------------------------------------------------------------- /
# Page specific javascript : attempt #1
# ---------------------------------------------------------------------- /
$(document).on 'turbolinks:load', ->
# $(document).on 'page:change', ->

  # report current scope
  # console.log($('body').data('controller'));
  # console.log($('body').data('action'));

  # filter for scope we are targeting :

  # method 1
  # return unless $('body').data('controller') == 'simple_pages' && $('body').data('action') == 'landing_page'

  # method 2
  # return unless $('meta[name=psj]').attr('controller') == 'simple_pages' && $('meta[name=psj]').attr('action') == 'landing_page'

  # method 3 (which can utilize 1 or 2)
  # Page class in init.coffee
  return unless page.controller() == 'simple_pages' && page.action() == 'landing_page'

  # proof we made it...
  # console.log('Arrived at target...');
  # console.log(location.pathname);

  # ...Load to script tag with ID of "sketch" ...
  # $('#sketch').load('clock.js');
