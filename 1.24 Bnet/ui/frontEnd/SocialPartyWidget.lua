module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.Layout:EnableSocialMenu(arg_1_1)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.EnableSocialMenu = var_0_0
end

function SocialPartyWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 170 * _1080p)

	var_3_0.id = "SocialPartyWidget"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("SocialPartyWidgetTalkers", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Talkers"

	var_3_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -360, 0, _1080p * 104, _1080p * 167)
	var_3_0:addElement(var_3_4)

	var_3_0.Talkers = var_3_4

	local var_3_5

	if CONDITIONS.IsConsoleGame(var_3_0) then
		var_3_5 = MenuBuilder.BuildRegisteredType("SplitscreenPrompt", {
			controllerIndex = var_3_1
		})
		var_3_5.id = "SplitscreenPrompt"

		var_3_5.PromptText:SetAlignment(LUI.Alignment.Right)
		var_3_5:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -500, 0, _1080p * 64, _1080p * 104)
		var_3_0:addElement(var_3_5)

		var_3_0.SplitscreenPrompt = var_3_5
	end

	local var_3_6
	local var_3_7 = MenuBuilder.BuildRegisteredType("SocialPartyWidgetLayout", {
		controllerIndex = var_3_1
	})

	var_3_7.id = "Layout"

	var_3_7:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -296, 0, 0, _1080p * 64)
	var_3_0:addElement(var_3_7)

	var_3_0.Layout = var_3_7

	local function var_3_8()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_8

	local var_3_9

	if CONDITIONS.IsConsoleGame(var_3_0) then
		local var_3_10 = {
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

		var_3_5:RegisterAnimationSequence("CDLon", var_3_10)
	end

	local function var_3_11()
		if CONDITIONS.IsConsoleGame(var_3_0) then
			var_3_5:AnimateSequence("CDLon")
		end
	end

	var_3_0._sequences.CDLon = var_3_11

	local var_3_12

	if CONDITIONS.IsConsoleGame(var_3_0) then
		local var_3_13 = {
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

		var_3_5:RegisterAnimationSequence("CDLoff", var_3_13)
	end

	local function var_3_14()
		if CONDITIONS.IsConsoleGame(var_3_0) then
			var_3_5:AnimateSequence("CDLoff")
		end
	end

	var_3_0._sequences.CDLoff = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SocialPartyWidget", SocialPartyWidget)
LockTable(_M)
