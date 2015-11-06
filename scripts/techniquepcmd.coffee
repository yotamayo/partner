module.exports = (robot) ->
	robot.respond /(.*)(\?\?)/i, (msg) ->
			msg.send 'Utilise la technique PCMD.'
