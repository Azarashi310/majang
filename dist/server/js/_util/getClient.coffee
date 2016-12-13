class GetClient
	constructor:(io)->
		@clients
		@count
		@io = io
	init:->
		
	clientCount: ->
		@clients = Object.keys(@io.sockets.connected);
		return @clients
module.exports = GetClient