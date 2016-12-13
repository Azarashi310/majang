io = require('socket.io')()
GetClient = require('./_util/getClient.coffee')
TrumpServer = require('./_game/_trumpServer')
io.on 'connection',(socket)->
	cards = []
	trumpServer = new TrumpServer
	cards = trumpServer.init()
	getClient = new GetClient(io)
	getClient.init()
	clients = getClient.clientCount()
	console.log clients
	io.sockets.emit 'clientList',clients
	socket.on 'feed',(num)->
		i = 0
		while i < num
			io.sockets.emit 'deal',cards.shift()
			i++
			if i == 5
				io.sockets.emit 'create'
io.listen 3000