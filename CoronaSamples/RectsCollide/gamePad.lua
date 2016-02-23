------------------------------------------------------------------------
-- gamePad.lua
--
-- You can use this module to create an on-screen D-pad controller which
-- would be suitable for mobile devices that don't have a physical 
-- keyboard.
--
-- Example Usage:
--
-- Include the "gamePad" library in your scene.
--
--     local gamePad = require( "gamePad" )
--
-- Use the gamePad to create a new gamePad for the player.
-- This one is sized at 450, uses the image "pad.png" for the graphics
-- and has an alpha value of 0.5 so it will blend into the scene's art.
--
--     local playerGamePad = gamePad.newGamePad( 450, "pad.png", 0.5 )
------------------------------------------------------------------------

local M = {}

local padSize
local padImage
local padGroup
local padGraphic

local padButtonUp
local padButtonDown
local padButtonLeft
local padButtonRight

local padButtonUpLeft
local padButtonUpRight
local padButtonDownLeft
local padButtonDownRight

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local originX = display.screenOriginX
local originY = display.screenOriginY
local width = display.actualContentWidth
local height = display.actualContentHeight

-- Set movement magnitudes
local movementX = 0
local movementY = 0

-- Movement property variables
M.isMoving = false
M.isMovingUp = false
M.isMovingDown = false
M.isMovingLeft = false
M.isMovingRight = false

------------------------------------------------------------------------
--
------------------------------------------------------------------------
local function setMovement( x, y )

	local updatedMovement = false

	-- Horizontal movement checks
	if movementX ~= x and x ~= nil then
		movementX = x
		updatedMovement = true
	end

	-- Vertical movement checks
	if movementY ~= y and y ~= nil then
		movementY = y
		updatedMovement = true
	end

	-- Since key events can fire multiple times with the same values,
	-- just return if nothing is actually changing.
	if not updatedMovement then
		return
	end

	-- If the player is moving along X - determine direction.
	if movementX ~= 0 then

		if movementX > 0 then
			M.isMovingRight = true
		else
			M.isMovingLeft = true
		end
	end

	-- If the player is moving along Y - determine direction.
	if movementY ~= 0 then

		if movementY > 0 then
			M.isMovingDown = true
		else
			M.isMovingUp = true
		end

	end

	-- Is the player moving or not?
	if movementX == 0 and movementY == 0 then
		M.isMoving = false
	else
		M.isMoving = true
	end

	-- If the player is not moving along X - reset left and right.
	if movementX == 0 then
		M.isMovingLeft = false
		M.isMovingRight = false
	end

	-- If the player is not moving along Y - reset up and down.
	if movementY == 0 then
		M.isMovingUp = false
		M.isMovingDown = false
	end

end

------------------------------------------------------------------------
--
------------------------------------------------------------------------
local function onTouchPad( event )

	local phase = event.phase
	local targetID = event.target.id

	if "began" == phase or "moved" == phase then

		if "up" == targetID then
			setMovement( 0, -1 )
		elseif "down" == targetID then
			setMovement( 0, 1 )
		elseif "left" == targetID then
			setMovement( -1, 0 )
		elseif "right" == targetID then
			setMovement( 1, 0 )
		elseif "up_left" == targetID then
			setMovement( -1, -1 )
		elseif "up_right" == targetID then
			setMovement( 1, -1 )
		elseif "down_left" == targetID then
			setMovement( -1, 1 )
		elseif "down_right" == targetID then
			setMovement( 1, 1 )
		elseif "padGraphic" == targetID then
			setMovement( 0, 0 )
		end

	elseif "ended" == phase or "cancelled"  == phase then

		if "up" == targetID or "down" == targetID then
			setMovement( nil, 0 )
		elseif "left" == targetID or "right" == targetID then
			setMovement( 0, nil )
		else
			setMovement( 0, 0 )
		end

	end

	return true

end

------------------------------------------------------------------------
-- Creates one of the invisible virtual D-pad buttons that lays on top 
-- the pad graphic.
------------------------------------------------------------------------
local function createPadButton( buttonID, offsetX, offsetY )

	local btn = display.newRect( padGroup,
		                         padGraphic.x + offsetX,
		                         padGraphic.y + offsetY,
		                         padSize/5,
		                         padSize/5 )

	btn:addEventListener( "touch", onTouchPad )
	btn.id = buttonID
	btn.isVisible = false
	btn.isHitTestable = true

	return btn

end

------------------------------------------------------------------------
-- Create a new game pad.
------------------------------------------------------------------------
M.newGamePad = function( size, image, alpha )

	padSize = size
	padImage = image

	if alpha == nil then
		alpha = 1.0
	end

	padGroup = display.newGroup()

	-- Create the visuals for the on-screen D-pad.
	padGraphic = display.newImageRect( padGroup, padImage, padSize, padSize )
	padGraphic.x = originX + padSize/2 - 60
	padGraphic.y = height + originY - padSize/2 + 60
	padGraphic.alpha = alpha
	padGraphic.id = "padGraphic"
	padGraphic:addEventListener( "touch", onTouchPad )

	-- Create buttons for handling the D-pad input
	padButtonUp = createPadButton( "up", 0, padSize/-5 )
	padButtonDown = createPadButton( "down", 0, padSize/5 )
	padButtonLeft = createPadButton( "left", padSize/-5, 0 )
	padButtonRight = createPadButton( "right", padSize/5, 0 )
	padButtonUpLeft = createPadButton( "up_left", padSize/-5, padSize/-5 )
	padButtonUpRight = createPadButton( "up_right", padSize/5, padSize/-5 )
	padButtonDownLeft = createPadButton( "down_left", padSize/-5, padSize/5 )
	padButtonDownRight = createPadButton( "down_right", padSize/5, padSize/5 )

	return M

end

return M
