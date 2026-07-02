module(..., package.seeall)

local var_0_0 = {
	REVERSE = 2,
	OSCILLATE = 3,
	RANDOM = 4,
	FORWARD = 1
}

local function var_0_1(arg_1_0)
	assert(arg_1_0._rowCount > 0, "Sprite -> GenerateFrameData -> self._rowCount must be a positive, non-zero number")
	assert(arg_1_0._columnCount > 0, "Sprite -> GenerateFrameData -> self._columnCount must be a positive, non-zero number")

	local var_1_0 = {}

	for iter_1_0 = 1, arg_1_0._frameCount do
		var_1_0[iter_1_0] = {}
		var_1_0[iter_1_0].uMin = 1 / arg_1_0._columnCount * (iter_1_0 - 1)
		var_1_0[iter_1_0].uMax = 1 / arg_1_0._columnCount * iter_1_0
		var_1_0[iter_1_0].vMin = 1 / arg_1_0._rowCount * math.floor((iter_1_0 - 1) / arg_1_0._columnCount)
		var_1_0[iter_1_0].vMax = 1 / arg_1_0._rowCount * math.ceil(iter_1_0 / arg_1_0._columnCount)
	end

	return var_1_0
end

local function var_0_2(arg_2_0, arg_2_1)
	arg_2_0.SpriteSheet:SetUMin(arg_2_0._frames[arg_2_1].uMin)
	arg_2_0.SpriteSheet:SetUMax(arg_2_0._frames[arg_2_1].uMax)
	arg_2_0.SpriteSheet:SetVMin(arg_2_0._frames[arg_2_1].vMin)
	arg_2_0.SpriteSheet:SetVMax(arg_2_0._frames[arg_2_1].vMax)
end

local function var_0_3(arg_3_0, arg_3_1)
	assert(arg_3_1 <= arg_3_0._frameCount, "You requested a frame number that exceeds the total number of frames in the animation.")
	var_0_2(arg_3_0, arg_3_1)
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	if arg_4_1 and arg_4_0._reset or arg_4_1 and not arg_4_0._paused then
		arg_4_0._currentFrame = arg_4_4 > 0 and arg_4_1 or arg_4_2
		arg_4_0._startingFrame = arg_4_1
	end

	arg_4_0._endingFrame = arg_4_2 or arg_4_0._frameCount

	local var_4_0 = arg_4_0._currentFrame

	var_0_2(arg_4_0, var_4_0)

	if arg_4_0._currentFrame < arg_4_0._endingFrame and arg_4_4 > 0 or arg_4_0._currentFrame > arg_4_0._startingFrame and arg_4_4 < 0 then
		arg_4_0._currentFrame = arg_4_0._currentFrame + arg_4_4
		arg_4_0._animComplete = false
	elseif arg_4_0._currentFrame == arg_4_0._endingFrame and arg_4_3 and arg_4_4 > 0 then
		arg_4_0._currentFrame = arg_4_0._startingFrame
		arg_4_0._animComplete = false
	elseif arg_4_0._currentFrame == arg_4_0._startingFrame and arg_4_3 and arg_4_4 < 0 then
		arg_4_0._currentFrame = arg_4_0._endingFrame
		arg_4_0._animComplete = false
	else
		arg_4_0._animComplete = true

		if arg_4_0._onAnimComplete then
			arg_4_0._onAnimComplete()
		end

		return
	end
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if arg_5_0._currentFrame == 0 and direction < 0 and (not arg_5_3 or arg_5_0._animComplete) then
		return
	end

	if arg_5_1 and arg_5_0._reset or arg_5_1 and not arg_5_0._paused then
		arg_5_0._currentFrame = arg_5_1
		arg_5_0._startingFrame = arg_5_1
	end

	arg_5_0._endingFrame = arg_5_2 or arg_5_0._frameCount

	local var_5_0 = arg_5_0._currentFrame

	var_0_2(arg_5_0, var_5_0)

	local var_5_1 = arg_5_0._currentFrame
	local var_5_2 = arg_5_0._startingFrame
	local var_5_3 = arg_5_0._endingFrame
	local var_5_4 = arg_5_0._oscillateDirection > 0
	local var_5_5 = arg_5_0._oscillateDirection < 0

	if var_5_1 < var_5_3 and var_5_4 or var_5_2 < var_5_1 and var_5_5 then
		arg_5_0._currentFrame = var_5_1 + arg_5_0._oscillateDirection
		arg_5_0._animComplete = false
	elseif var_5_1 == var_5_3 and var_5_4 then
		arg_5_0._oscillateDirection = -1
		arg_5_0._currentFrame = var_5_1 + arg_5_0._oscillateDirection
		arg_5_0._animComplete = false
	elseif var_5_1 == var_5_2 and arg_5_3 and var_5_5 then
		arg_5_0._oscillateDirection = 1
		arg_5_0._currentFrame = var_5_1 + arg_5_0._oscillateDirection
		arg_5_0._animComplete = false
	else
		arg_5_0._currentFrame = 1
		arg_5_0._oscillateDirection = 1
		arg_5_0._animComplete = true

		return
	end
end

local function var_0_6(arg_6_0)
	local var_6_0 = math.random(1, arg_6_0._frameCount)

	var_0_2(arg_6_0, var_6_0)

	arg_6_0._currentFrame = var_6_0
end

local var_0_7

local function var_0_8(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	assert(arg_7_0._playbackRate > 0, "Sprite -> PlayUpdate -> self._playbackRate must be a positive, non-zero number")

	if arg_7_4 == var_0_0.RANDOM then
		var_0_6(arg_7_0)
	elseif arg_7_4 == var_0_0.OSCILLATE then
		var_0_5(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	else
		local var_7_0 = arg_7_4 == var_0_0.FORWARD and 1 or -1

		var_0_4(arg_7_0, arg_7_1, arg_7_2, arg_7_3, var_7_0)
	end

	local var_7_1 = 1000 / arg_7_0._playbackRate

	arg_7_0:Wait(var_7_1, true).onComplete = function()
		if not arg_7_0._animComplete then
			var_0_8(arg_7_0, nil, arg_7_2, arg_7_3, arg_7_4)

			arg_7_0._paused = false
		end
	end
end

local function var_0_9(arg_9_0, arg_9_1)
	if arg_9_1 then
		assert(arg_9_1 and type(arg_9_1) == "table", "SPRITE UI ERROR: 'spriteOptions' passed is not a table")

		arg_9_0._startingFrame = arg_9_1.startingFrame or arg_9_0._startingFrame
		arg_9_0._looping = arg_9_1.looping or arg_9_0._looping
		arg_9_0._playbackRate = arg_9_1.playbackRate or arg_9_0._playbackRate
		arg_9_0._reset = arg_9_1.reset or arg_9_0._reset

		if arg_9_1.image then
			arg_9_0.SpriteSheet:setImage(RegisterMaterial(arg_9_1.image))
		end

		if arg_9_0._columnCount ~= arg_9_1.columns or arg_9_0._rowCount ~= arg_9_1.rows then
			arg_9_0._columnCount = arg_9_1.columns or arg_9_0._columnCount
			arg_9_0._rowCount = arg_9_1.rows or arg_9_0._rowCount
			arg_9_0._frameCount = arg_9_0._columnCount * arg_9_0._rowCount
			arg_9_0._frames = var_0_1(arg_9_0)
		end

		local var_9_0 = 0

		if arg_9_1.endingFrame ~= var_9_0 then
			arg_9_0._endingFrame = arg_9_1.endingFrame
		else
			arg_9_0._endingFrame = arg_9_0._frameCount
		end
	end
end

local function var_0_10(arg_10_0, arg_10_1)
	arg_10_0._animComplete = false

	var_0_9(arg_10_0, arg_10_1)
	var_0_8(arg_10_0, arg_10_0._startingFrame, arg_10_0._endingFrame, arg_10_0._looping, var_0_0.FORWARD)
end

local function var_0_11(arg_11_0, arg_11_1)
	if arg_11_1.startingFrame and arg_11_1.endingFrame then
		assert(arg_11_1.startingFrame < arg_11_1.endingFrame, "SPRITE UI ERROR: Play Reverse ( startingFrame > endingFrame )")
	end

	arg_11_0._animComplete = false

	var_0_9(arg_11_0, arg_11_1)
	var_0_8(arg_11_0, arg_11_0._startingFrame, arg_11_0._endingFrame, arg_11_0._looping, var_0_0.REVERSE)
end

local function var_0_12(arg_12_0, arg_12_1)
	arg_12_0._animComplete = false

	var_0_9(arg_12_0, arg_12_1)
	var_0_8(arg_12_0, arg_12_0._startingFrame, arg_12_0._endingFrame, arg_12_0._looping, var_0_0.OSCILLATE)
end

local function var_0_13(arg_13_0)
	arg_13_0._animComplete = false

	var_0_8(arg_13_0, nil, nil, nil, var_0_0.RANDOM)
end

local function var_0_14(arg_14_0, arg_14_1)
	arg_14_0._animComplete = true
	arg_14_0._paused = true

	if arg_14_1 and arg_14_1.stopFrame then
		arg_14_0._currentFrame = arg_14_1.stopFrame

		var_0_3(arg_14_0, arg_14_1.stopFrame)
	end
end

local function var_0_15(arg_15_0, arg_15_1)
	arg_15_0._playbackRate = arg_15_1 > 0 and arg_15_1 or 1
end

local function var_0_16(arg_16_0, arg_16_1)
	arg_16_0.SpriteSheet:SetBlendMode(arg_16_1)
end

local function var_0_17(arg_17_0, arg_17_1)
	var_0_9(arg_17_0, arg_17_1)
end

local function var_0_18(arg_18_0, arg_18_1, arg_18_2)
	assert(arg_18_2, "Sprite -> PostLoadFunc -> options is nil and expected not to be")
	assert(arg_18_2.columns, "Sprite -> PostLoadFunc -> options.columns is nil and expected not to be")
	assert(arg_18_2.rows, "Sprite -> PostLoadFunc -> options.rows is nil and expected not to be")
	assert(arg_18_2.playbackRate, "Sprite -> PostLoadFunc -> options.playbackRate is nil and expected not to be")
	assert(arg_18_2.playMode, "Sprite -> PostLoadFunc -> options.playMode is nil, and expected not to be")
	assert(arg_18_2.startingFrame, "Sprite -> PostLoadFunc -> options.startingFrame is nil, and expected not to be")
	assert(arg_18_2.endingFrame, "Sprite -> PostLoadFunc -> options.endingFrame is nil, and expected not to be")
	assert(arg_18_2.material and arg_18_2.material ~= "", "Sprite -> PostLoadFunc -> options.material is nil or empty, and expected not to be")

	arg_18_0.Play = var_0_10
	arg_18_0.PlayReverse = var_0_11
	arg_18_0.PlayOscillate = var_0_12
	arg_18_0.PlayRandom = var_0_13
	arg_18_0.Pause = var_0_14
	arg_18_0.SetPlaybackRate = var_0_15
	arg_18_0.SetSpriteBlendMode = var_0_16
	arg_18_0.InitSpriteSheetOptions = var_0_17
	arg_18_0.StopOnFrame = var_0_3
	arg_18_0._columnCount = arg_18_2.columns
	arg_18_0._rowCount = arg_18_2.rows
	arg_18_0._frameCount = arg_18_0._columnCount * arg_18_0._rowCount
	arg_18_0._playbackRate = arg_18_2.playbackRate
	arg_18_0._frames = var_0_1(arg_18_0)
	arg_18_0._currentFrame = arg_18_2.startingFrame
	arg_18_0._startingFrame = arg_18_2.startingFrame
	arg_18_0._looping = arg_18_2.shouldLoop

	local var_18_0 = 0

	if arg_18_2.endingFrame ~= var_18_0 then
		arg_18_0._endingFrame = arg_18_2.endingFrame
	else
		arg_18_0._endingFrame = arg_18_0._frameCount
	end

	arg_18_0._reset = false
	arg_18_0._paused = false
	arg_18_0._animComplete = false
	arg_18_0._onAnimComplete = nil
	arg_18_0._oscillateDirection = var_0_0.FORWARD

	arg_18_0.SpriteSheet:setImage(RegisterMaterial(arg_18_2.material))
	arg_18_0.SpriteSheet:SetUMin(arg_18_0._frames[1].uMin)
	arg_18_0.SpriteSheet:SetUMax(arg_18_0._frames[1].uMax)
	arg_18_0.SpriteSheet:SetVMin(arg_18_0._frames[1].vMin)
	arg_18_0.SpriteSheet:SetVMax(arg_18_0._frames[1].vMax)

	if not arg_18_2.shouldDisablePlayOnCreation then
		if arg_18_2.playMode == var_0_0.RANDOM then
			var_0_13(arg_18_0)
		else
			var_0_8(arg_18_0, arg_18_0._startingFrame, arg_18_0._endingFrame, arg_18_0._looping, arg_18_2.playMode)
		end
	end
end

function Sprite(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIElement.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p)

	var_19_0.id = "Sprite"

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = LUI.UIImage.new()

	var_19_4.id = "SpriteSheet"

	var_19_0:addElement(var_19_4)

	var_19_0.SpriteSheet = var_19_4

	var_0_18(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("Sprite", Sprite)
LockTable(_M)
