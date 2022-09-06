display.setStatusBar(display.HiddenStatusBar)

local widget = require( "widget" )
local physics = require("physics")
local composer = require("composer")
physics.start()
physics.setGravity(0, 0)
local scene = composer.newScene()




function scene:create( event )

    local sceneGroup = self.view
    local background = display.newImageRect( sceneGroup, "images/background/b2.png" ,display.contentWidth,display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    print("level 2")
    if ( phase == "will" ) then 
    elseif ( phase == "did" ) then
        --wall
        local wall_l = display.newImageRect(sceneGroup, "images/level/wall_hor.png", 1080, 20)
        wall_l.x = display.contentCenterX
        wall_l.y = 10
        physics.addBody(wall_l, "static", {density = 1, friction = 0, bounce = 1})
        local wall_3 = display.newImageRect(sceneGroup, "images/level/wall_ver.png", 20, 2160)
        wall_3.x = 10
        wall_3.y = display.contentCenterY
        physics.addBody(wall_3, "static", {density = 1, friction = 0, bounce = 1})
        local wall_4 = display.newImageRect(sceneGroup, "images/level/wall_ver.png", 20, 2160)
        wall_4.x = display.contentWidth-20
        wall_4.y = display.contentCenterY
        physics.addBody(wall_4, "static", {density = 1, friction = 0, bounce = 1})
        
        local i
        print(math.floor(display.contentWidth/200))
        local remain_ball = amount
        local remain = display.newText(sceneGroup, "ball x",600,1840,system.nativeFont,100)
        local remain_print = display.newText(sceneGroup, remain_ball,800,1840,system.nativeFont,100)
        remain:setFillColor(0, 0, 0)
        remain_print:setFillColor(0, 0, 0)
        
        --bars
        local bar = display.newImageRect(sceneGroup, "images/level/bar.png", 400, 70)
        bar.x = display.contentCenterX
        bar.y = 1400+display.contentHeight/18
        physics.addBody(bar, "static", {density = 1, friction = 0, bounce = 1})
        
        --produce bricks
        local brick_count = 0
        local function createBrick(x, y)
            brickpic = math.random( 2 )
          if brickpic== 1 then 
            local brick = display.newImageRect(sceneGroup, "images/brick/brick.png", 200, 100)
            brick.name = "brick"
            brick.x = x
            brick.y = y
            physics.addBody(brick, "static", {density = 1, friction = 0, bounce = 1})
            brick_count = brick_count + 1
          else
            local brick = display.newImageRect(sceneGroup, "images/brick/brick2.png", 200, 100)
            brick.name = "brick"
            brick.x = x
            brick.y = y
            physics.addBody(brick, "static", {density = 1, friction = 0, bounce = 1})
            brick_count = brick_count + 1
           end
        end
        local function createObstacle(x, y)
            local brick = display.newImageRect(sceneGroup, "images/brick/unb.png", 200, 100)
            brick.x = x
            brick.y = y
            physics.addBody(brick, "static", {density = 1, friction = 0, bounce = 1})
        end
        
        createBrick(display.contentCenterX, 100+display.contentHeight/18)
        createBrick(display.contentCenterX - 200, 200+display.contentHeight/18)
        createBrick(display.contentCenterX + 200, 200+display.contentHeight/18)
        createBrick(display.contentCenterX - 400, 300+display.contentHeight/18)
        createBrick(display.contentCenterX + 400, 300+display.contentHeight/18)
        createBrick(display.contentCenterX - 200, 300+display.contentHeight/18)
        createBrick(display.contentCenterX + 200, 300+display.contentHeight/18)
        createBrick(display.contentCenterX, 400+display.contentHeight/18)
        createObstacle(display.contentCenterX - 200, 500+display.contentHeight/18)
        createObstacle(display.contentCenterX - 400, 500+display.contentHeight/18)
        createObstacle(display.contentCenterX + 200, 500+display.contentHeight/18)
        createObstacle(display.contentCenterX + 400, 500+display.contentHeight/18)
        




        print("brick_count:"..brick_count)
        print(display.contentHeight)
        
        local function next(event)
            composer.gotoScene("default.level3", options)
        end
        --remoce a brick
        local function removeBrick(event)
                --print("remove!")
                --print("hit"..event.other.name)
                if event.other.name == "brick" then
                        audio.play(pop_music, {channel=2,loops=1})
                        audio.setVolume(1, {channel=2})
                        --bar.xScale = bar.xScale + 0.1
                        event.other:removeSelf()
                        event.other = nil
                        brick_count = brick_count - 1
                        if brick_count == 0 then
                                local complete = display.newText("    Level\nComplete!", display.contentCenterX, 0.5 * display.contentCenterY, system.nativeFont, 200)
                                complete:setFillColor(0, 0, 0)
                                sceneGroup:insert(complete)
                                
                                local button_next = widget.newButton
                                {
                                        defaultFile = "images/level/next.png",
                                        overFile = "images/level/next.png",
                                        --label = "NEXT!",
                                        font = native.systemFont,
                                        labelColor = { default = { 0, 0, 0 } },
                                        fontSize = 100,
                                        emboss = true,
                                        onPress = next,
                                       --onRelease = ,
                                }
                                button_next.x = display.contentCenterX
                                button_next.y = display.contentCenterY
                                sceneGroup:insert(button_next)
                        end
                end
        end
        
        local bar_fire = function(event)
                --produceBall()
                if remain_ball > 0 then
                    if balltype == 1 then 
                        local ball = display.newImageRect(sceneGroup, "images/ball/bball.png", 70, 70)
                        ball.x = bar.x
                        ball.y = bar.y-20
                        physics.addBody(ball,"circle",
                            {density = 1, friction = 1, bounce = 1,radius =35}
                        )
                        ball:setLinearVelocity(1500, -2500)
                        remain_ball = remain_ball - 1
                        remain_print.text = remain_ball
                        if remain_ball == 0 and brick_count > 0 then
                                local no_ball = display.newText(sceneGroup, "No more ball!",display.contentCenterX,display.contentCenterY,system.nativeFont,100)
                                no_ball:setFillColor(255, 0, 0)
                        end
                        ball:addEventListener("collision", removeBrick)
                  elseif balltype ==2 then
                        local ball = display.newImageRect(sceneGroup, "images/ball/rball.png", 70, 70)
                        ball.x = bar.x
                        ball.y = bar.y-20
                        physics.addBody(ball,"circle",
                            {density = 1, friction = 1, bounce = 1,radius =35}
                        )
                        ball:setLinearVelocity(1500, -2500)
                        remain_ball = remain_ball - 1
                        remain_print.text = remain_ball     
                        if remain_ball == 0 and brick_count > 0 then
                                local no_ball = display.newText(sceneGroup, "No more ball!",display.contentCenterX,display.contentCenterY,system.nativeFont,100)
                                no_ball:setFillColor(255, 0, 0)
                        end
                        ball:addEventListener("collision", removeBrick)
                  elseif balltype ==0 then
                        local ball = display.newImageRect(sceneGroup, "images/ball/vat.png", 100, 100)
                        ball.x = bar.x
                        ball.y = bar.y-20
                        physics.addBody(ball,"circle",
                            {density = 1, friction = 1, bounce = 1,radius =35}
                        )
                        ball:setLinearVelocity(1500, -2500)
                        remain_ball = remain_ball - 1
                        remain_print.text = remain_ball     
                        if remain_ball == 0 and brick_count > 0 then
                                local no_ball = display.newText(sceneGroup, "No more ball!",display.contentCenterX,display.contentCenterY,system.nativeFont,100)
                                no_ball:setFillColor(255, 0, 0)
                        end
                        ball:addEventListener("collision", removeBrick)
                     end 
                end
        end
        if mode == 0 then 
          local bar_left = function(event)
                bar.x = bar.x - 50
                tempX = bar.x      
          end
         local bar_right = function(event)
                bar.x = bar.x + 50
                tempX = bar.x
         end
          local button_fire = widget.newButton
          {
                defaultFile = "images/level/button_off.png",
               overFile = "images/level/button_on.png",
                --label = "FIRE!",
                font = native.systemFont,
                labelColor = { default = { 0, 0, 0 } },
                fontSize = 100,
                emboss = true,
               onPress = bar_fire,
               --onRelease = b_Release,
          }
          button_fire.x = 540; button_fire.y = 1700
          sceneGroup:insert(button_fire)
          local button_left = widget.newButton
          {
                defaultFile = "images/level/left_off.png",
                overFile = "images/level/left_on.png",
                emboss = true,
                --onPress = bar_left,
          }
          local button_right = widget.newButton
          {
                defaultFile = "images/level/right_off.png",
                overFile = "images/level/right_on.png",
                emboss = true,
                --onPress = bar_right,
          }
          sceneGroup:insert(button_left)
          sceneGroup:insert(button_right)
        
          button_left.x = 180; button_left.y = 1700
          button_right.x = 900; button_right.y = 1700 
        
          --move_bar
          local leftPressed = false
          local rightPressed = false
          local function movebar_left(event)
                  if leftPressed and bar.x - 215 >= 0 then
                        bar.x = bar.x - 40
                  end
          end
          local function movebar_right(event)
                  if rightPressed and bar.x + 225 <= display.contentWidth then
                        bar.x = bar.x + 40
                  end
          end
          local function touch_left(event)
                  if event.phase == "began" then
                        leftPressed = true
                  elseif event.phase == "ended" then
                        leftPressed = false
                  end
          end
          local function touch_right(event)
                  if event.phase == "began" then
                        rightPressed = true
                  elseif event.phase == "ended" then
                        rightPressed = false
                  end
          end
          button_left:addEventListener("touch", touch_left)
          button_right:addEventListener("touch", touch_right)
          Runtime:addEventListener("enterFrame", movebar_left)
          Runtime:addEventListener("enterFrame", movebar_right)
        else 
            local function dragbar(event)
            local barr = event.target -- the object which was touched/tapped
            local phase = event.phase   -- began/moved/ended/cancelled
            if ( "began" == phase ) then
            display.currentStage:setFocus( barr )
            barr.touchOffsetX = event.x - barr.x
            barr.touchOffsetY = event.y - barr.y           
            elseif ( "moved" == phase and barr.touchOffsetX and barr.touchOffsetY ) then
            barr.x = event.x - barr.touchOffsetX
            elseif ( "ended" == phase or "cancelled" == phase ) then
            display.currentStage:setFocus( nil )
            --local function drag_bar  
            local drag_barr = display.newImageRect(sceneGroup, "images/level/bar.png", 400, 70)
              drag_barr.x = barr.x
              drag_barr.y = barr.y
            local onTouch = function(event) 
                      bar_fire()
                      drag_barr:removeSelf()
                      drag_barr = nil  
             end 
            drag_barr:addEventListener("touch", onTouch)
            --end
            end
            return true        
            end
            bar:addEventListener( "touch", dragbar )        
        end             
    end
         local function goto_title(event)
        composer.gotoScene("default.title", options)
    end
    
    local button_level1 = widget.newButton
    {
        defaultFile = "images/gen/back.png",
        overFile = "images/gen/back.png",
        emboss = true,
        onPress = goto_title,
    }
    button_level1.x = display.contentWidth-display.contentWidth/10
    button_level1.y = display.contentHeight/20
    sceneGroup:insert(button_level1)
end




function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then 
    elseif ( phase == "did" ) then
        composer.removeScene("default.level2")
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