module.exports = (robot) ->
	robot.respond /deep/i, (res) ->
		res.send "Thanks for ping"

