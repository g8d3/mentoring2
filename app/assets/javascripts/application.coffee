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
# require interact-1.2.4.min
# require jquery-ui
# require jquery.gridster
# require jquery_ujs
# require turbolinks
# require bootstrap
#= require mousetrap.min
#= require mousetrap-global-bind.min
# require_tree .

$(document).on 'page:change', ->
	$(document).trigger('ready')

drag = (sel, snapx, snapy) ->
	gridWidth = snapx
	gridHeight = snapy
	Draggable.create sel,
		type: 'x,y'
		edgeResistance: 0.65
		bounds: '#header .content'
		throwProps: true
		snap:
			x: (endValue) ->
				Math.round(endValue / gridWidth) * gridWidth
			y: (endValue) ->
				Math.round(endValue / gridHeight) * gridHeight

$ ->
	drag "#header h1", 60, 60
	Draggable.create ".image.phone",
		type: "x,y"
		# edgeResistance: 0.65
		# bounds:"#container"
		throwProps:true

	# interact('.image.phone').draggable({})

timeout = null

# TODO: bug, saves after 7 seconds event when using shortcut 
save = (time = 1000) ->
	clearTimeout timeout if timeout
	_save = ->
		$.post '/save.json', path: $('body').attr('save'), data: $('html').html(), (res) ->
	timeout = setTimeout _save, time

$(document).keyup -> save(7000)

Mousetrap.bindGlobal 'ctrl+shift+s', save
