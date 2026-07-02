module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	return false
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.NewItemNotification)

	if arg_2_1 == 1 then
		arg_2_0.NewItemNotification:SetAlpha(1, 0)
	else
		arg_2_0.NewItemNotification:SetAlpha(0, 0)
	end

	arg_2_0._isNew = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.Selected)
	ACTIONS.AnimateSequence(arg_3_0.Selected, arg_3_1 and "On" or "Off")

	arg_3_0.isSelected = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.SetNew = var_0_1
	arg_4_0.GetNew = var_0_0
	arg_4_0.SetSelected = var_0_2
	arg_4_0._controllerIndex = arg_4_1

	arg_4_0:addEventHandler("button_up", function(arg_5_0, arg_5_1)
		if arg_5_0._isNew then
			-- block empty
		end
	end)
end

function CPIntelButton(arg_6_0, arg_6_1)
	local var_6_0 = MenuBuilder.BuildRegisteredType("ProgressionItemButton", arg_6_1)

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 546 * _1080p, 0, 62 * _1080p)

	var_6_0.id = "CPIntelButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Lock"

	var_6_4:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_6_4:SetAlpha(0, 0)
	var_6_4:setImage(RegisterMaterial("intel_icon_locked"), 0)
	var_6_4:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -57, _1080p * -11, _1080p * -23, _1080p * 23)
	var_6_0:addElement(var_6_4)

	var_6_0.Lock = var_6_4

	local var_6_5

	if CONDITIONS.IsWaveGameType(var_6_0) then
		local var_6_6 = LUI.UIStyledText.new()

		var_6_6.id = "CPWaveSurvivalCost"

		var_6_6:SetRGBFromInt(8421504, 0)
		var_6_6:SetAlpha(0.6, 0)
		var_6_6:setText("", 0)
		var_6_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_6_6:SetAlignment(LUI.Alignment.Right)
		var_6_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_6_6:SetStartupDelay(2000)
		var_6_6:SetLineHoldTime(400)
		var_6_6:SetAnimMoveTime(300)
		var_6_6:SetAnimMoveSpeed(50)
		var_6_6:SetEndDelay(1500)
		var_6_6:SetCrossfadeTime(750)
		var_6_6:SetFadeInTime(300)
		var_6_6:SetFadeOutTime(300)
		var_6_6:SetMaxVisibleLines(1)
		var_6_6:SetOutlineRGBFromInt(0, 0)
		var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 289, _1080p * 417, _1080p * 38, _1080p * 62)
		var_6_0:addElement(var_6_6)

		var_6_0.CPWaveSurvivalCost = var_6_6
	end

	local function var_6_7()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_7

	local function var_6_8()
		return
	end

	var_6_0._sequences.ButtonOver = var_6_8

	local function var_6_9()
		return
	end

	var_6_0._sequences.ButtonUp = var_6_9

	local var_6_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Disabled", var_6_10)

	local function var_6_11()
		var_6_4:AnimateSequence("Disabled")
	end

	var_6_0._sequences.Disabled = var_6_11

	local var_6_12 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("Enabled", var_6_12)

	local function var_6_13()
		var_6_4:AnimateSequence("Enabled")
	end

	var_6_0._sequences.Enabled = var_6_13

	var_6_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
	end)
	var_6_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUp")
	end)
	var_6_0:addEventHandler("disable", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Disabled")
	end)
	var_6_0:addEventHandler("enable", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "Enabled")
	end)
	var_0_3(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("CPIntelButton", CPIntelButton)
LockTable(_M)
