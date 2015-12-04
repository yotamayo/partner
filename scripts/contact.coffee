module.exports = (robot) ->
  robot.hear /(.*)(\!\!)/i, (msg) ->
    msg.send 'Calm down there tiger! You can contact me anytime anytime with these infos ;) - c: 1-514-249-2344 e: FREDERIC.BOUCHARD-WONG@FREDERICWONG.COM'
