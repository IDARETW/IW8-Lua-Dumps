module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.PlayMenuButton:Contract()

	if not arg_1_0:IsDisabled() then
		local var_1_0 = WATCH.GetEquippedWatch(arg_1_1)
		local var_1_1 = WATCH.GetWatchName(var_1_0)

		arg_1_0.WatchName:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED_WITH_NAME", var_1_1))
	end

	local function var_1_2(arg_2_0)
		arg_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p, 150)
		arg_2_0.PlayMenuButton.Description:SetRight(330 * _1080p)
	end

	local function var_1_3(arg_3_0)
		arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 50 * _1080p, 150)
	end

	arg_1_0:addEventHandler("button_over", function(arg_4_0, arg_4_1)
		if not LUI.IsLastInputMouseNavigation(arg_1_1) then
			var_1_2(arg_4_0)
			ACTIONS.AnimateSequence(arg_4_0, "ButtonOver")
		else
			ACTIONS.AnimateSequence(arg_4_0, "ButtonOverKBM")
		end
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
		if not LUI.IsLastInputMouseNavigation(arg_1_1) then
			var_1_2(arg_5_0)
			ACTIONS.AnimateSequence(arg_5_0, "ButtonOver")
		else
			ACTIONS.AnimateSequence(arg_5_0, "ButtonOverKBM")
		end

		arg_1_0.WatchName:SetAlpha(0)
	end)
	arg_1_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		var_1_3(arg_6_0)
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_7_0, arg_7_1)
		var_1_3(arg_7_0)
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function WatchSelectButton(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIButton.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 150 * _1080p)

	var_8_0.id = "WatchSelectButton"
	var_8_0._animationSets = {}
	var_8_0._sequences = {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	var_8_0:setUseStencil(true)

	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("PlayMenuButton", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "PlayMenuButton"

	var_8_4.Text:setText("", 0)
	var_8_4.Description:setText("", 0)
	var_8_4.DisabledText:setText(Engine.CBBHFCGDIC("MENU/LOCKED"), 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.PlayMenuButton = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "WatchName"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_6:SetAlpha(0, 0)
	var_8_6:setText(Engine.CBBHFCGDIC("LUA_MENU/EQUIPPED_WITH_NAME"), 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_8_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_8_6:SetStartupDelay(1000)
	var_8_6:SetLineHoldTime(500)
	var_8_6:SetAnimMoveTime(500)
	var_8_6:SetAnimMoveSpeed(50)
	var_8_6:SetEndDelay(1000)
	var_8_6:SetCrossfadeTime(500)
	var_8_6:SetFadeInTime(300)
	var_8_6:SetFadeOutTime(300)
	var_8_6:SetMaxVisibleLines(1)
	var_8_6:SetShadowRGBFromInt(0, 0)
	var_8_6:SetOutlineRGBFromInt(0, 0)
	var_8_6:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 20, _1080p * -65, _1080p * -32, _1080p * -10)
	var_8_0:addElement(var_8_6)

	var_8_0.WatchName = var_8_6

	local function var_8_7()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_7

	local var_8_8 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOver", var_8_8)

	local function var_8_9()
		var_8_6:AnimateSequence("ButtonOver")
	end

	var_8_0._sequences.ButtonOver = var_8_9

	local var_8_10 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonUp", var_8_10)

	local function var_8_11()
		var_8_6:AnimateSequence("ButtonUp")
	end

	var_8_0._sequences.ButtonUp = var_8_11

	local var_8_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_6:RegisterAnimationSequence("ButtonOverKBM", var_8_12)

	local function var_8_13()
		var_8_6:AnimateSequence("ButtonOverKBM")
	end

	var_8_0._sequences.ButtonOverKBM = var_8_13

	local var_8_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -23
		}
	}

	var_8_6:RegisterAnimationSequence("AR", var_8_14)

	local function var_8_15()
		var_8_6:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_15

	var_8_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonUp")
	end)
	var_0_0(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("WatchSelectButton", WatchSelectButton)
LockTable(_M)
