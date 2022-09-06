local composer  = require( "composer" )
local widget    = require( "widget" )  
native.setProperty("androidSystemUiVisibility", "immersiveSticky")
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view 
    
    local background = display.newImageRect( sceneGroup, "images/background/b1.png" ,display.contentWidth,display.contentHeight )
    audio.play(music,{channel=1,loops=-1})
    audio.setVolume(0.2,{channel=1})
    background.x = display.contentCenterX
    background.y = display.contentCenterY
end

function scene:show(event)
    local sceneGroup = self.view  
    local function goto_list(event)
        composer.gotoScene("default.listt", options)
    end
    
    local function goto_set(event)
       composer.gotoScene("default.setting", options)
    end
    display.setStatusBar( display.HiddenStatusBar )
  local button_level1 = widget.newButton
    {
        defaultFile = "images/level/START.png",
        overFile = "images/level/START.png",
        emboss = true,
        onPress = goto_list,
    }
    button_level1.x = display.contentCenterX
    button_level1.y = display.contentCenterY+display.contentHeight/10
    
    local button_level2 = widget.newButton
    {
        defaultFile = "images/level/SET.png",
        overFile = "images/level/SET.png",
        emboss = true,
        onPress = goto_set,
    }
    button_level2.x = display.contentCenterX
    button_level2.y =  button_level1.y+display.contentHeight/6
    sceneGroup:insert(button_level1)
    sceneGroup:insert(button_level2)
end

function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then 
    elseif ( phase == "did" ) then
        composer.removeScene("default.list")
    end
end

function scene:destroy( event )

        local sceneGroup = self.view   
        sceneGroup:removeSelf()
        sceneGroup = nil
        
        local beamGroup = self.view   
        beamGroup:removeSelf()
        beamGroup = nil   
end
-- -------------------------------------------------------------------------------
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -------------------------------------------------------------------------------
return scene