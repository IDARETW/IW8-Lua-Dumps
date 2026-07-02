module(..., package.seeall)

function ScoreboardTitleTextField(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 192 * _1080p, 0, 40 * _1080p)

	var_1_0.id = "ScoreboardTitleTextField"
	var_1_0._animationSets = {}
	var_1_0._sequences = {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIStyledText.new()

	var_1_4.id = "Field"

	var_1_4:setText("-", 0)
	var_1_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_4:SetAlignment(LUI.Alignment.Center)
	var_1_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_4:SetStartupDelay(1000)
	var_1_4:SetLineHoldTime(400)
	var_1_4:SetAnimMoveTime(300)
	var_1_4:SetAnimMoveSpeed(50)
	var_1_4:SetEndDelay(1000)
	var_1_4:SetCrossfadeTime(500)
	var_1_4:SetFadeInTime(300)
	var_1_4:SetFadeOutTime(300)
	var_1_4:SetMaxVisibleLines(1)
	var_1_4:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_1_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11)
	var_1_0:addElement(var_1_4)

	var_1_0.Field = var_1_4

	local function var_1_5()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_5

	local var_1_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.text
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonUp", var_1_6)

	local function var_1_7()
		var_1_4:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_7

	local var_1_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Scoreboard.text
		}
	}

	var_1_4:RegisterAnimationSequence("ButtonOver", var_1_8)

	local function var_1_9()
		var_1_4:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_9

	var_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonOver")
	end)
	var_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_1_1
		end

		ACTIONS.AnimateSequence(var_1_0, "ButtonUp")
	end)

	return var_1_0
end

MenuBuilder.registerType("ScoreboardTitleTextField", ScoreboardTitleTextField)
LockTable(_M)
