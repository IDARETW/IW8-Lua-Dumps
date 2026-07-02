module(..., package.seeall)

local var_0_0 = "partyWidgetTalkers_enableAI"
local var_0_1 = 3000
local var_0_2 = 3000

local function var_0_3(arg_1_0)
	local var_1_0 = {
		{
			gamertag = "Garrett",
			isTalking = false,
			xuidString = "x1"
		},
		{
			gamertag = "Raz",
			isTalking = false,
			xuidString = "x2"
		},
		{
			gamertag = "Cody",
			isTalking = false,
			xuidString = "x3"
		},
		{
			gamertag = "Aleks",
			isTalking = false,
			xuidString = "x4"
		},
		{
			gamertag = "Jim",
			isTalking = false,
			xuidString = "x5"
		},
		{
			gamertag = "Kyle",
			isTalking = false,
			xuidString = "x6"
		},
		{
			gamertag = "[WWWWW]WWWWWWWWWWWWWWWW",
			isTalking = false,
			xuidString = "x7"
		}
	}
	local var_1_1
	local var_1_2

	local function var_1_3(arg_2_0)
		arg_2_0.isTalking = false

		if arg_2_0.quietTime <= 0 then
			var_1_1(arg_2_0)
		else
			arg_2_0.element:Wait(arg_2_0.quietTime).onComplete = function()
				var_1_1(arg_2_0)
			end
		end
	end

	function var_1_1(arg_4_0)
		arg_4_0.isTalking = true

		if arg_4_0.talkTime <= 0 then
			var_1_3(arg_4_0)
		else
			arg_4_0.element:Wait(arg_4_0.talkTime).onComplete = function()
				var_1_3(arg_4_0)
			end
		end
	end

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		iter_1_1.element = LUI.UIElement.new()
		iter_1_1.element.id = "AITalker_" .. iter_1_0

		arg_1_0:addElement(iter_1_1.element)

		if not iter_1_1.talkTime then
			iter_1_1.talkTime = math.random(0, var_0_1)
		end

		if not iter_1_1.quietTime then
			iter_1_1.quietTime = math.random(0, var_0_2)
		end

		var_1_1(iter_1_1)
	end

	return var_1_0
end

local var_0_4 = 250
local var_0_5 = 1000

local function var_0_6(arg_6_0)
	local var_6_0 = arg_6_0._replaceIndex + 1

	if var_6_0 > #arg_6_0._talkers then
		var_6_0 = 1
	end

	arg_6_0._replaceIndex = var_6_0
end

local function var_0_7(arg_7_0)
	local var_7_0 = arg_7_0._talkerQueue:Pop()

	while var_7_0 do
		arg_7_0._queuedTalkers[var_7_0.xuidString] = false

		if not arg_7_0._visibleTalkers[var_7_0.xuidString] then
			break
		end

		var_7_0 = arg_7_0._talkerQueue:Pop()
	end

	return var_7_0
end

local function var_0_8(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0._talkers[arg_8_0._replaceIndex]

	arg_8_0._visibleTalkers[var_8_0.xuidString] = false
	var_8_0.xuidString = arg_8_1.xuidString
	var_8_0.gamertag = arg_8_1.gamertag
	arg_8_0._visibleTalkers[arg_8_1.xuidString] = true

	var_0_6(arg_8_0)
end

local function var_0_9(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0._talkers) do
		if not iter_9_1.xuidString then
			iter_9_1.xuidString = arg_9_1.xuidString
			iter_9_1.gamertag = arg_9_1.gamertag
			arg_9_0._visibleTalkers[iter_9_1.xuidString] = true
			arg_9_0._numVisibleTalkers = arg_9_0._numVisibleTalkers + 1

			return
		end
	end
end

local function var_0_10(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0._talkers[arg_10_1].xuidString

	arg_10_0._visibleTalkers[var_10_0] = false
	arg_10_0._numVisibleTalkers = arg_10_0._numVisibleTalkers - 1

	for iter_10_0 = arg_10_1, #arg_10_0._talkers do
		local var_10_1 = arg_10_0._talkers[iter_10_0]

		if iter_10_0 < #arg_10_0._talkers then
			var_10_1.xuidString = arg_10_0._talkers[iter_10_0 + 1].xuidString
			var_10_1.gamertag = arg_10_0._talkers[iter_10_0 + 1].gamertag
		else
			var_10_1.xuidString = nil
			var_10_1.gamertag = nil
		end
	end

	if arg_10_0._replaceIndex > 1 then
		arg_10_0._replaceIndex = arg_10_0._replaceIndex - 1
	end
end

local function var_0_11(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0._talkers) do
		if iter_11_1.xuidString and not arg_11_0._activeTalkers[iter_11_1.xuidString] then
			var_0_10(arg_11_0, iter_11_0)
		end
	end
end

local function var_0_12(arg_12_0)
	var_0_11(arg_12_0)

	local var_12_0 = var_0_7(arg_12_0)

	if var_12_0 then
		if arg_12_0._numVisibleTalkers == #arg_12_0._talkers then
			var_0_8(arg_12_0, var_12_0)
		else
			var_0_9(arg_12_0, var_12_0)
		end
	end

	local var_12_1 = 0
	local var_12_2 = 0

	for iter_12_0, iter_12_1 in pairs(arg_12_0._talkers) do
		if iter_12_1.gamertag then
			iter_12_1:setText(Engine.CBBHFCGDIC("LUA_MENU/TALKER_X", Engine.JCBDICCAH(iter_12_1.gamertag)))
			iter_12_1:SetAlpha(1)

			var_12_1 = var_12_1 + 1

			local var_12_3 = LAYOUT.GetTextWidth(iter_12_1)

			if var_12_2 < var_12_3 then
				var_12_2 = var_12_3
			end
		else
			iter_12_1:setText("")
			iter_12_1:SetAlpha(0)
		end
	end

	local var_12_4 = 5 * _1080p

	arg_12_0.Background:SetLeft(-var_12_2 - var_12_4)
	ACTIONS.AnimateSequence(arg_12_0, "TalkerX" .. var_12_1)
end

local var_0_13

local function var_0_14(arg_13_0)
	local var_13_0 = math.random(var_0_4, var_0_5)

	arg_13_0:Wait(var_13_0).onComplete = function()
		return var_0_14(arg_13_0)
	end

	local var_13_1

	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE(var_0_0) == true then
		var_13_1 = arg_13_0._aiTalkers
	else
		var_13_1 = Friends.BJDEIGDDCD()
	end

	arg_13_0._activeTalkers = {}

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		if iter_13_1.isTalking then
			arg_13_0._activeTalkers[iter_13_1.xuidString] = iter_13_1

			if not arg_13_0._queuedTalkers[iter_13_1.xuidString] then
				arg_13_0._queuedTalkers[iter_13_1.xuidString] = true

				arg_13_0._talkerQueue:Push(iter_13_1)
			end
		end
	end

	var_0_12(arg_13_0)
end

local function var_0_15(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._replaceIndex = 1
	arg_15_0._numVisibleTalkers = 0
	arg_15_0._visibleTalkers = {}
	arg_15_0._queuedTalkers = {}
	arg_15_0._talkerQueue = LUI.CreateQueue()

	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE(var_0_0) == true then
		arg_15_0._aiTalkers = var_0_3(arg_15_0)
	end

	arg_15_0._talkers = {
		arg_15_0.Talker1,
		arg_15_0.Talker2,
		arg_15_0.Talker3
	}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0._talkers) do
		iter_15_1:setText("")
		iter_15_1:SetAlpha(0)
	end

	var_0_14(arg_15_0)
end

function SocialPartyWidgetTalkers(arg_16_0, arg_16_1)
	local var_16_0 = LUI.UIElement.new()

	var_16_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 360 * _1080p, 0, 63 * _1080p)

	var_16_0.id = "SocialPartyWidgetTalkers"
	var_16_0._animationSets = var_16_0._animationSets or {}
	var_16_0._sequences = var_16_0._sequences or {}

	local var_16_1 = arg_16_1 and arg_16_1.controllerIndex

	if not var_16_1 and not Engine.DDJFBBJAIG() then
		var_16_1 = var_16_0:getRootController()
	end

	assert(var_16_1)

	local var_16_2 = var_16_0
	local var_16_3
	local var_16_4 = LUI.UIImage.new()

	var_16_4.id = "Background"

	var_16_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_16_4:SetAlpha(0.5, 0)
	var_16_4:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_16_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -360, _1080p * 5, 0, _1080p * 63)
	var_16_0:addElement(var_16_4)

	var_16_0.Background = var_16_4

	local var_16_5
	local var_16_6 = LUI.UIStyledText.new()

	var_16_6.id = "Talker1"

	var_16_6:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_16_6:setText("O>{WWWWW}WWWWWWWWWWWWWWWW", 0)
	var_16_6:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_16_6:SetAlignment(LUI.Alignment.Right)
	var_16_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_16_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 18)
	var_16_0:addElement(var_16_6)

	var_16_0.Talker1 = var_16_6

	local var_16_7
	local var_16_8 = LUI.UIStyledText.new()

	var_16_8.id = "Talker2"

	var_16_8:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_16_8:setText("O>{WWWWW}WWWWWWWWWWWWWWWW", 0)
	var_16_8:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_16_8:SetAlignment(LUI.Alignment.Right)
	var_16_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_16_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 21, _1080p * 39)
	var_16_0:addElement(var_16_8)

	var_16_0.Talker2 = var_16_8

	local var_16_9
	local var_16_10 = LUI.UIStyledText.new()

	var_16_10.id = "Talker3"

	var_16_10:SetRGBFromTable(SWATCHES.HUD.normal, 0)
	var_16_10:setText("O>{WWWWW}WWWWWWWWWWWWWWWW", 0)
	var_16_10:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_16_10:SetAlignment(LUI.Alignment.Right)
	var_16_10:SetVerticalAlignment(LUI.Alignment.Center)
	var_16_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 42, _1080p * 60)
	var_16_0:addElement(var_16_10)

	var_16_0.Talker3 = var_16_10

	local function var_16_11()
		return
	end

	var_16_0._sequences.DefaultSequence = var_16_11

	local var_16_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("TalkerX1", var_16_12)

	local function var_16_13()
		var_16_4:AnimateSequence("TalkerX1")
	end

	var_16_0._sequences.TalkerX1 = var_16_13

	local var_16_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("TalkerX2", var_16_14)

	local function var_16_15()
		var_16_4:AnimateSequence("TalkerX2")
	end

	var_16_0._sequences.TalkerX2 = var_16_15

	local var_16_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 63
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("TalkerX3", var_16_16)

	local function var_16_17()
		var_16_4:AnimateSequence("TalkerX3")
	end

	var_16_0._sequences.TalkerX3 = var_16_17

	local var_16_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_16_4:RegisterAnimationSequence("TalkerX0", var_16_18)

	local function var_16_19()
		var_16_4:AnimateSequence("TalkerX0")
	end

	var_16_0._sequences.TalkerX0 = var_16_19

	var_0_15(var_16_0, var_16_1, arg_16_1)

	return var_16_0
end

MenuBuilder.registerType("SocialPartyWidgetTalkers", SocialPartyWidgetTalkers)
LockTable(_M)
