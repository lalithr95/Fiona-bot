# Commands:
# hubot deploy

util = require "util"
exec = require("child_process").exec

module.exports = (robot) ->
	robot.respond /deploy/i, (msg) ->

		unless robot.auth.hasRole(msg.envelope.user, 'deploy')
			msg.send "#{msg.envelope.user} You don't have Deploy permissions"
			return

		msg.send "Deploying to Heroku"
		child = exec "./deploy.sh", (err, stdout, stderr) ->
			msg.send err if err
			msg.send stderr if stderr
			msg.send stdout