class GetClient
	constructor:(io)->
		@clients
		@count
		@io = io
	init:->
		@clients = @io.sockets.clients()
		@count = @clients.length
		console.log @count
	clientCount: ->
		return @count
module.exports = GetClient