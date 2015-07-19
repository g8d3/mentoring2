# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
# require jquery.gridster
# require jquery_ujs
# require turbolinks
#= require bootstrap
# require_tree .

$(document).on 'page:change', ->
	$(document).trigger('ready')

timeout = null
$(document).keyup ->
	clearTimeout timeout if timeout
	setTimeout save, 1000
	
save = ->
	$.post '/save.json', path: 'fractal/index2.html', data: $('html').html(), (res) ->
