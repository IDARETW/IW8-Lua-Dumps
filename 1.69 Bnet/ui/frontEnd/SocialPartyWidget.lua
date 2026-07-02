module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Layout:EnableSocialMenu(arg_1_1)
end

local function var_0_1(arg_2_0)
	if LUI.IsLastInputGamepad(arg_2_0._controllerIndex) then
		ACTIONS.AnimateSequence(arg_2_0, "JPGamepad")
	else
		ACTIONS.AnimateSequence(arg_2_0, "JPKBM")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.EnableSocialMenu = var_0_0

	if IsLanguageJapanese() and CONDITIONS.IsSeasonalEventActive() then
		arg_3_0._controllerIndex = arg_3_1

		arg_3_0:addAndCallEventHandler("update_input_type", var_0_1)
	end
end

function SocialPartyWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 170 * _1080p)

	var_4_0.id = "SocialPartyWidget"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("SocialPartyWidgetTalkers", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Talkers"

	var_4_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -360, 0, _1080p * 104, _1080p * 167)
	var_4_0:addElement(var_4_4)

	var_4_0.Talkers = var_4_4

	local var_4_5

	if CONDITIONS.IsConsoleGame(var_4_0) then
		var_4_5 = MenuBuilder.BuildRegisteredType("SplitscreenPrompt", {
			controllerIndex = var_4_1
		})
		var_4_5.id = "SplitscreenPrompt"

		var_4_5.PromptText:SetAlignment(LUI.Alignment.Right)
		var_4_5:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -500, 0, _1080p * 64, _1080p * 104)
		var_4_0:addElement(var_4_5)

		var_4_0.SplitscreenPrompt = var_4_5
	end

	local var_4_6
	local var_4_7 = MenuBuilder.BuildRegisteredType("SocialPartyWidgetLayout", {
		controllerIndex = var_4_1
	})

	var_4_7.id = "Layout"

	var_4_7:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -296, 0, 0, _1080p * 64)
	var_4_0:addElement(var_4_7)

	var_4_0.Layout = var_4_7

	local function var_4_8()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_8

	local var_4_9

	if CONDITIONS.IsConsoleGame(var_4_0) then
		local var_4_10 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -819
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -319
			}
		}

		var_4_5:RegisterAnimationSequence("CDLon", var_4_10)
	end

	local function var_4_11()
		if CONDITIONS.IsConsoleGame(var_4_0) then
			var_4_5:AnimateSequence("CDLon")
		end
	end

	var_4_0._sequences.CDLon = var_4_11

	local var_4_12

	if CONDITIONS.IsConsoleGame(var_4_0) then
		local var_4_13 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -500
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Right
			}
		}

		var_4_5:RegisterAnimationSequence("CDLoff", var_4_13)
	end

	local function var_4_14()
		if CONDITIONS.IsConsoleGame(var_4_0) then
			var_4_5:AnimateSequence("CDLoff")
		end
	end

	var_4_0._sequences.CDLoff = var_4_14

	local var_4_15
	local var_4_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -268
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 28
		}
	}

	var_4_7:RegisterAnimationSequence("JPGamepad", var_4_16)

	local function var_4_17()
		var_4_7:AnimateSequence("JPGamepad")
	end

	var_4_0._sequences.JPGamepad = var_4_17

	local var_4_18
	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -296
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_4_7:RegisterAnimationSequence("JPKBM", var_4_19)

	local function var_4_20()
		var_4_7:AnimateSequence("JPKBM")
	end

	var_4_0._sequences.JPKBM = var_4_20

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SocialPartyWidget", SocialPartyWidget)
LockTable(_M)
