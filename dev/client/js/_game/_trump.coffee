class Trump
  constructor: (mycards,enemycards)->
    @cards = mycards
    @enemyCards = enemycards
    @myCards = []
    @initCard = 5
  init: ->
    @myCards = @shuffle()
    @createCard(@myCards)
  shuffle: ->
    cards = []
    counter = 0
    while counter < @initCard
      #createKinds
      rndKind = Math.random() * 4 + 1 << 0
      #createNUm
      rndNum = Math.random() * 13 + 1 << 0
      cards.push [rndKind, rndNum]
      counter++
    return cards
  createCard: (cards) ->
    _this = @
    $.each cards, (index, value) ->
      number = value[1]
      cardkind = _this.sort(value)
      $card = $('<li class="card">')
      $enemycard = $('<li class="card enemy">')
      $card.attr('data-kind',cardkind).attr('data-num',number)
      _this.enemyCards.append($enemycard)
      _this.cards.append($card)
  sort: (card)->
    kind = ''
    kindnum = card[0]
    if(kindnum == 1)
      kind = 's'
    else if(kindnum == 2)
      kind = 'h'
    else if(kindnum == 3)
      kind = 'c'
    else if(kindnum == 4)
      kind = 'd'
    return kind
module.exports = Trump