local composer  = require( "composer" )
local widget    = require( "widget" )  
native.setProperty("androidSystemUiVisibility", "immersiveSticky")
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view 
    
    local background = display.newImageRect( sceneGroup, "images/background/b1.png" ,display.contentWidth,display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
end

function scene:show(event)
    local sceneGroup = self.view
    
    --local smile = display.newImageRect(sceneGroup, "images/smile.png", 1200, 1200)
    --smile.x = display.contentCenterX
   -- smile.y = display.contentCenterY * 1.25
    
    
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
        defaultFile = "images/level/option_1.png",
        overFile = "images/level/option_1.png",
        emboss = true,
        onPress = goto_one,
    }
    button_level1.x = display.contentCenterX-display.contentWidth/4
    button_level1.y = display.contentHeight/6
    
    local button_level2 = widget.newButton
    {
        defaultFile = "images/level/option_2.png",
        overFile = "images/level/option_2.png",
        emboss = true,
        onPress = goto_two,
    }
    button_level2.x = display.contentCenterX
    button_level2.y = display.contentHeight/6
    
    local button_level3 = widget.newButton
    {
        defaultFile = "images/level/option_3.png",
        overFile = "images/level/option_3.png",
        emboss = true,
        onPress = goto_three,
    }
    button_level3.x = display.contentCenterX+display.contentWidth/4
    button_level3.y = display.contentHeight/6
    
    local button_level4 = widget.newButton
    {
        defaultFile = "images/level/option_4.png",
        overFile = "images/level/option_4.png",
        emboss = true,
        onPress = goto_four,
    }
    button_level4.x = display.contentCenterX-display.contentWidth/4
    button_level4.y = button_level3.y+display.contentHeight/6
    
    local button_level5 = widget.newButton
    {
        defaultFile = "images/level/option_5.png",
        overFile = "images/level/option_5.png",
        emboss = true,
        onPress = goto_five,
    }
    button_level5.x = display.contentCenterX
    button_level5.y = button_level3.y+display.contentHeight/6
    
    local button_level6 = widget.newButton
    {
        defaultFile = "images/level/option_6.png",
        overFile = "images/level/option_6.png",
        emboss = true,
        onPress = goto_six,
    }
    button_level6.x = display.contentCenterX+display.contentWidth/4
    button_level6.y = button_level3.y+display.contentHeight/6
    local function goto_title(event)
        composer.gotoScene("default.title", options)
    end
    
    local button_level = widget.newButton
    {
        defaultFile = "images/gen/back.png",
        overFile = "images/gen/back.png",
        emboss = true,
        onPress = goto_title,
    }
    
    button_level.x = display.contentWidth-display.contentWidth/10
    button_level.y = display.contentHeight/20
    sceneGroup:insert(button_level)
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