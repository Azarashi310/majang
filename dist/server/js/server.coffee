io = require('socket.io')()
GetClient = require('./_util/getClient.coffee')
TrumpServer = require('./_game/_trumpServer')
cards = []
io.on 'connection',(socket)->
	trumpServer = new TrumpServer
	if cards.length < 1
		cards = trumpServer.init()
	getClient = new GetClient(io)
	getClient.init()
	clients = getClient.clientCount()
	console.log clients,cards
	io.sockets.emit 'clientList',clients
	socket.on 'feed',(num)->
		i = 0
		while i < num
			io.to(socket.id).emit 'deal',cards.shift()
			i++
			if i == 5
				io.to(socket.id).emit 'create'
io.listen 3000