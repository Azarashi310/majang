class GetClientList
  constructor: (socket,userlist)->
    @socket = socket
    @clientList
    @userlist = userlist
  init: ->
    _this = @
    @socket.on 'clientList',(clientList) ->
      _this.clientList = clientList
      _this.setLists()
  setLists: ->
    _this = @
    @$list
    $.each @clientList,(index,value) ->
      @$list = $('<li class="user">').text(value)
      _this.userlist.append(@$list)

module.exports = GetClientList