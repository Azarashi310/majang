io = require('socket.io')()
TrumpServer = require('./_game/_trumpServer')
io.on 'connection',(socket)->
	cards = []
	trumpServer = new TrumpServer
	cards = trumpServer.init()
	socket.on 'feed',(num)->
		i = 0
		while i < num
			io.sockets.emit 'deal',cards.shift()
			i++
			if i == 5
				io.sockets.emit 'create'
io.listen 3000