SendMessage = require('./_module/_sendMessage.coffee')
$ ->
  #server.jsでサーバを立ててる時に奴に接続する
  socket = io.connect('http://localhost:3000')
  #チャットエリアにメッセージ追加
  sendMessage = new SendMessage($('form'),$('input[name="message"]'),$('ul'),socket)
  sendMessage.init()