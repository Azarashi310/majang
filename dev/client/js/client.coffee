#SendMessage = require('./_module/_sendMessage.coffee')
UserList = require('./_util/_getClientLIst.coffee')
Trump = require('./_game/_trump.coffee')
$ ->
  #server.jsでサーバを立ててる時に奴に接続する
  socket = io.connect('http://localhost:3000')
  #トランプモジュール
  trump = new Trump($('#trump .mycards'),$('#trump .enemycards'),socket)
  trump.init()
  #ユーザー一覧取得
  userList = new UserList(socket,$('#util .userlist'))
  userList.init()
  #メッセージ送信モジュール
#  sendMessage = new SendMessage($('form'),$('input[name="message"]'),$('ul'),socket)
#  sendMessage.init()
