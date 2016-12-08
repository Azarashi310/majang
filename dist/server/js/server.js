var io = require('socket.io')();

io.on('connection', function(socket) {

	socket.on('text', function(data) {
		console.log(data);
		socket.broadcast.emit('text', data);
	});
});

io.listen(3000);