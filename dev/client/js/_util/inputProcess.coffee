class InputProcess
	constructor:->

	init:->

	nameInputProcess: (target)->
		@name = $(target).val()
		if @name.length < 1
			alert('名前を入力してください')
			return ""
		else
			alert('ようこそ '+@name+' さん')
			return @name
module.exports = InputProcess