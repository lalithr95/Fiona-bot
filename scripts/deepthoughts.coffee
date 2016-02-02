module.exports = (robot) ->
	robot.respond /deep/i, (msg) ->
		msg.http('http://andymatthews.net/code/deepthoughts/get.cfm')
			.get()(error, response, body) ->
				msg.send body