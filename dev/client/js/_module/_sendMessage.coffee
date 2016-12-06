class SendMessage
  constructor: (button, inputArea, textArea, socket)->
    @form = button
    @input = inputArea
    @$list = textArea
    @text = ''
    @socket = socket
  init: ->
    _this = @
    @form.on 'submit', this, @inputButtonClick
    @socket.on 'text', (text)->
      console.log _this
      _this.createText(text)

  createText: (text) ->
    @$li = $('<li>').text(text)
    @$list.append(@$li)
  inputButtonClick: (e) ->
    _this = e.data
    e.preventDefault()
    _this.text = _this.input.val()
    _this.socket.emit 'text', _this.text
    _this.input.val('')
    _this.createText(_this.text)
    
module.exports = SendMessage