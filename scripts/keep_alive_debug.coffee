module.exports = (robot) ->
  wakeUpTime = (process.env.HUBOT_HEROKU_WAKEUP_TIME or '6:00').split(':')
  sleepTime = (process.env.HUBOT_HEROKU_SLEEP_TIME or '22:00').split(':')

  wakeUpOffset = 60 * wakeUpTime[0]  + 1 * wakeUpTime[1]
  sleepOffset  = 60 * sleepTime[0]   + 1 * sleepTime[1]

  keepaliveUrl = process.env.HUBOT_HEROKU_KEEPALIVE_URL or process.env.HEROKU_URL
  if keepaliveUrl and not keepaliveUrl.match(/\/$/)
    keepaliveUrl = "#{keepaliveUrl}/"

  # interval, in minutes
  keepaliveInterval = if process.env.HUBOT_HEROKU_KEEPALIVE_INTERVAL?
                        parseFloat process.env.HUBOT_HEROKU_KEEPALIVE_INTERVAL
                      else
                        5

  unless keepaliveUrl?
    robot.logger.error "hubot-heroku-alive included, but missing HUBOT_HEROKU_KEEPALIVE_URL. `heroku config:set HUBOT_HEROKU_KEEPALIVE_URL=$(heroku apps:info -s  | grep web_url | cut -d= -f2)`"
    return

  # check for legacy heroku keepalive from robot.coffee, and remove it
  if robot.pingIntervalId
    clearInterval(robot.pingIntervalId)

  if keepaliveInterval > 0.0
    robot.herokuKeepaliveIntervalId = setInterval =>
      robot.logger.info 'keepalive ping'

      now = new Date()
      nowOffset    = 60 * now.getHours() + now.getMinutes()

      if (nowOffset >= wakeUpOffset && nowOffset < sleepOffset)
        robot.http("#{keepaliveUrl}heroku/keepalive").post() (err, res, body) =>
          if err?
            robot.logger.info "keepalive pong: #{err}"
            robot.emit 'error', err
          else
            robot.logger.info "keepalive pong: #{res.statusCode} #{body}"
      else
        robot.logger.info "Skipping keep alive, time to rest. #{nowOffset} #{wakeUpOffset} (#{process.env.HUBOT_HEROKU_WAKEUP_TIME})  #{sleepOffset} (#{process.env.HUBOT_HEROKU_SLEEP_TIME})"

    , keepaliveInterval * 60 * 1000
  else
    robot.logger.info "hubot-heroku-keepalive is #{keepaliveInterval}, so not keeping alive"
