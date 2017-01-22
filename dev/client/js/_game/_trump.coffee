class Trump
	constructor: (mycards, enemycards, socket)->
		@cards = mycards
		@enemyCards = enemycards
		@myCards = []
		@initCard = 5
		@socket = socket
	init: ->
		_this = @
		@socket.on 'deal', (card)->
			console.log card
			_this.myCards.push(card)
		@socket.emit 'feed', 5
		@socket.on 'create', ->
			$.each _this.myCards, (index, value) ->
				number = value[1]
				cardkind = value[0]
				$card = $('<li class="card">')
				$enemycard = $('<li class="card enemy">')
				$card.attr('data-kind', cardkind).attr('data-num', number)
				_this.enemyCards.append($enemycard)
				_this.cards.append($card)
module.exports = Trump