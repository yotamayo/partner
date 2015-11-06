module.exports = (robot) ->
	robot.hear /(.*)(\?\?)/i, (msg) ->
			msg.send 'Utilise la technique PCMD.'
