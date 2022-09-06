local composer  = require( "composer" )
local widget    = require( "widget" )  

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view 
    
    local background = display.newImageRect( sceneGroup, "images/background/b1.png" ,display.contentWidth,display.contentHeight )
    background.x = display.contentCenterX
    background.y = display.contentCenterY
    sceneGroup:insert(background)
end

function scene:show(event)
    local sceneGroup = self.view
       
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
     
   
    
    --
    --background 
     local backgrou = display.newImageRect( "images/set/bb.png", 1000, 350 )
          backgrou.x = display.contentCenterX
          backgrou.y = display.contentCenterY-display.contentHeight/20-display.contentHeight/5

    local bamount = display.newImageRect( "images/set/bb.png", 1000, 350 )
          bamount.x = display.contentCenterX
          bamount.y = backgrou.y+display.contentHeight/5

    local bball = display.newImageRect( "images/set/bb.png", 1000, 350 )
          bball.x = display.contentCenterX
         bball.y = bamount.y+display.contentHeight/5

   local bmode = display.newImageRect( "images/set/bb.png", 1000, 350 )
          bmode.x = display.contentCenterX
          bmode.y = bball.y+display.contentHeight/5
      
      sceneGroup:insert(bmode)
      sceneGroup:insert(bball)
      sceneGroup:insert(bamount)
      sceneGroup:insert(backgrou)
    -- amount
--local amountdis = display.newText(amount,display.contentCenterX,bamount.y,system.nativeFont,100)
--amountdis.text =amount
            --local modepicd = display.newImageRect( "images/bn.png", 600, 250 )
           -- modepicd.x = display.contentCenterX
            --modepicd.y = bamount.y
--local amountdis = display.newText(amount,display.contentCenterX,bamount.y,system.nativeFont,100)    
local function nump (event)
if amount ==5 then
local numpi = display.newImageRect( "images/set/5.png", 300, 300  )
numpi.x = display.contentCenterX-display.contentWidth/100
numpi.y = bamount.y--display.contentHeight/200
sceneGroup:insert(numpi)
elseif amount ==10 then 
local numpi = display.newImageRect( "images/set/10.png", 300, 300  )
numpi.x = display.contentCenterX-display.contentWidth/100
numpi.y = bamount.y--display.contentHeight/200
sceneGroup:insert(numpi)
elseif amount== 15 then 
local numpi = display.newImageRect( "images/set/15.png", 300, 300  )
numpi.x = display.contentCenterX-display.contentWidth/100
numpi.y = bamount.y--display.contentHeight/200
sceneGroup:insert(numpi)
else
local numpi = display.newImageRect( "images/set/20.png", 300, 300 )
numpi.x = display.contentCenterX-display.contentWidth/100
numpi.y = bamount.y--display.contentHeight/200
sceneGroup:insert(numpi)
end 

end
nump()
    local function plus(event)
       if amount<20 then
        amount=amount+5
        nump()
        
      end
    end
    local function minus(event)
      if amount>5 then 
        amount=amount-5
        nump()

      end
    end
    local amountm = widget.newButton
    {
        defaultFile = "images/set/leftu.png",
        overFile = "images/set/left.png",
        emboss = true,
        onPress =minus ,
    }
    amountm.x = display.contentCenterX-display.contentHeight/5
    amountm.y =bamount.y
    local amountp = widget.newButton
    {
        defaultFile = "images/set/rightu.png",
        overFile = "images/set/right.png",
        emboss = true,
        onPress =plus ,
    }
    amountp.x = display.contentCenterX+display.contentHeight/5
    amountp.y =bamount.y 
    sceneGroup:insert(amountm)
    sceneGroup:insert(amountp)
    
    
    
    
    --ball
    
    local function bp(event)
    if balltype==0 then 
      local modepicd = display.newImageRect( "images/set/cat.png", 400, 280)
            modepicd.x = display.contentCenterX-display.contentWidth/200
            modepicd.y = bball.y
            sceneGroup:insert(modepicd)
    elseif balltype==1 then 
      local modepicd = display.newImageRect( "images/set/bball.png", 400, 280 )
            modepicd.x = display.contentCenterX-display.contentWidth/200
            modepicd.y = bball.y
            sceneGroup:insert(modepicd)
    elseif balltype==2 then
      local modepicb = display.newImageRect( "images/set/rball.png", 400, 280 )
            modepicb.x = display.contentCenterX-display.contentWidth/200
            modepicb.y = bball.y
            sceneGroup:insert(modepicb)
    end        
    end
   bp()
    local function bc(event)
        balltype=(balltype+1)%3
        bp()
    end
    local b0 = widget.newButton
    {
        defaultFile = "images/set/leftu.png",
        overFile = "images/set/left.png",
        emboss = true,
        onPress =bc ,
    }
    b0.x = display.contentCenterX-display.contentHeight/5
    b0.y = bball.y
    local b1 = widget.newButton
    {
        defaultFile = "images/set/rightu.png",
        overFile = "images/set/right.png",
        emboss = true,
        onPress =bc ,
    }
    b1.x = display.contentCenterX+display.contentHeight/5
    b1.y =bball.y 
   
    
    --mode
    
    
    
    local function modep(event)
    if mode==1 then 
      local modepicd = display.newImageRect( "images/set/drag.png", 500, 250 )
            modepicd.x = display.contentCenterX
            modepicd.y = bmode.y
            sceneGroup:insert(modepicd)
    else 
      local modepicb = display.newImageRect( "images/set/button1.png", 500, 250 )
            modepicb.x = display.contentCenterX
            modepicb.y = bmode.y
            sceneGroup:insert(modepicb)
    end        
    end
    modep()
    local function modec(event)
        mode=(mode+1)%2
        modep()
    end
    local mode0 = widget.newButton
    {
        defaultFile = "images/set/leftu.png",
        overFile = "images/set/left.png",
        emboss = true,
        onPress =modec ,
    }
    mode0.x = display.contentCenterX-display.contentHeight/5
    mode0.y = bmode.y
    local mode1 = widget.newButton
    {
        defaultFile = "images/set/rightu.png",
        overFile = "images/set/right.png",
        emboss = true,
        onPress =modec ,
    }
    mode1.x = display.contentCenterX+display.contentHeight/5
    mode1.y =bmode.y 
    sceneGroup:insert(button_level1)
    sceneGroup:insert(b1)
    sceneGroup:insert(b0)
    sceneGroup:insert(mode0)
    sceneGroup:insert(mode1)
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