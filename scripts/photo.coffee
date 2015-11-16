photos = [
	"http://www.fredericwong.com/css/images/archive/Frederic_332.jpg",
	"http://www.fredericwong.com/css/images/archive/Frederic_090.jpg",
	"http://www.fredericwong.com/css/images/archive/Frederic_005.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_010.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_015.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_020.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_025.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_030.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_035.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_040.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_045.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_050.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_055.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_060.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_065.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_070.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_075.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_080.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_085.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_090.jpg",
  "http://www.fredericwong.com/css/images/archive/Frederic_095.jpg",
]

module.exports = (robot) ->
	robot.hear /(.*)(photo|image|photoshoot|mugshot|portrait|pose)(.*)/i, (msg) ->
			msg.send 'This is a beautiful photo of Frederic Bouchard Wong : ' . msg.random photos
