class ChangeMode
	constructor: ->
		@target = $('html')
	init: ->

	changeClass: (mode)->
		if @target.hasClass(mode)
			return
		else
			@target.class = mode
module.exports = ChangeMode