io = require('socket.io')()
GetClient = require('./_util/getClient.coffee')
TrumpServer = require('./_game/_trumpServer')
cards = []
clientsList = {};
io.on 'connection',(socket,name)->
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
	socket.on 'disconnect', ->


io.listen 3000