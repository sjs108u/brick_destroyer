local composer  = require( "composer" )
local widget    = require( "widget" )  

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view 
    
    local background = display.newImageRect( sceneGroup, "images/background_purple.png" ,display.contentWidth,display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
end

function scene:show(event)
    local sceneGroup = self.view
    
    local smile = display.newImageRect(sceneGroup, "images/smile.png", 1200, 1200)
    smile.x = display.contentCenterX
    smile.y = display.contentCenterY * 1.25
    
    
    local function goto_one(event)
        composer.gotoScene("default.level1", options)
    end
    
    local function goto_two(event)
        composer.gotoScene("default.level2", options)
    end
    
    local function goto_three(event)
        composer.gotoScene("default.level3", options)
    end
    
    local function goto_four(event)
        composer.gotoScene("default.level4", options)
    end
    
    local function goto_five(event)
        composer.gotoScene("default.level5", options)
    end
    
    local function goto_six(event)
        composer.gotoScene("default.level6", options)
    end
    
    local button_level1 = widget.newButton
    {
        defaultFile = "images/option_1.png",
        overFile = "images/option_1.png",
        emboss = true,
        onPress = goto_one,
    }
    button_level1.x = 220
    button_level1.y = 200
    
    local button_level2 = widget.newButton
    {
        defaultFile = "images/option_2.png",
        overFile = "images/option_2.png",
        emboss = true,
        onPress = goto_two,
    }
    button_level2.x = 540
    button_level2.y = 200
    
    local button_level3 = widget.newButton
    {
        defaultFile = "images/option_3.png",
        overFile = "images/option_3.png",
        emboss = true,
        onPress = goto_three,
    }
    button_level3.x = 860
    button_level3.y = 200
    
    local button_level4 = widget.newButton
    {
        defaultFile = "images/option_4.png",
        overFile = "images/option_4.png",
        emboss = true,
        onPress = goto_four,
    }
    button_level4.x = 220
    button_level4.y = 500
    
    local button_level5 = widget.newButton
    {
        defaultFile = "images/option_5.png",
        overFile = "images/option_5.png",
        emboss = true,
        onPress = goto_five,
    }
    button_level5.x = 540
    button_level5.y = 500
    
    local button_level6 = widget.newButton
    {
        defaultFile = "images/option_6.png",
        overFile = "images/option_6.png",
        emboss = true,
        onPress = goto_six,
    }
    button_level6.x = 860
    button_level6.y = 500
    
    sceneGroup:insert(button_level1)
    sceneGroup:insert(button_level2)
    sceneGroup:insert(button_level3)
    sceneGroup:insert(button_level4)
    sceneGroup:insert(button_level5)
    sceneGroup:insert(button_level6)
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