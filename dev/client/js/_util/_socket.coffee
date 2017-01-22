class SocketModule
	constructor:(url,name) ->
		@url = url
		@name = name
		@socket
	init: ->
		@socket = io.connect(@url,@name)
		return @socket
module.exports = SocketModule