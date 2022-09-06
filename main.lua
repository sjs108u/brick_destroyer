native.setProperty("androidSystemUiVisibility", "immersiveSticky")
balltype=1
background=0
mode=1
amount=10

music = audio.loadStream("music/Game Of Dwarves.wav")
pop_music = audio.loadStream("music/pop.mp3")
local composer = require("composer")
composer.gotoScene("default.title", options)

