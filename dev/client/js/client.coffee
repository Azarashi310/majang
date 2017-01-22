#SendMessage = require('./_module/_sendMessage.coffee')
UserList = require('./_util/_getClientLIst.coffee')
Trump = require('./_game/_trump.coffee')
InputProcess = require('./_util/inputProcess')
ChangeMode = require('./_util/changeMode')
SocketModule = require("./_util/_socket")
$ ->
	#constructer
	@name = ""
	@socket
	inputProcess = new InputProcess()
	changeMode = new ChangeMode()
	socketModule = new SocketModule()
	$('#input .submit').on 'click',this, (e)->
		_this = e.data
		_this.name = inputProcess.nameInputProcess($('#input .value'))
		if _this.name != ""
			changeMode.changeClass("top")
			_this.socket = socketModule.init('http://localhost:3000',_this.name)
			console.log _this.socket
			#ユーザー一覧取得
			userList = new UserList(_this.socket, $('#util .userlist'))
			userList.init()
	game: ->
		#トランプモジュール
		trump = new Trump($('#trump .mycards'), $('#trump .enemycards'), socket)
		trump.init()
	message: ->
		#メッセージ送信モジュール
		#  sendMessage = new SendMessage($('form'),$('input[name="message"]'),$('ul'),socket)
		#  sendMessage.init()