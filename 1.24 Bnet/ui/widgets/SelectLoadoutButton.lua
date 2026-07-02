module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	return false
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Selected)
	arg_2_0:SetAlpha(1)
	ACTIONS.AnimateSequence(arg_2_0.Selected, arg_2_2 and "On" or "Off")

	arg_2_0.isSelected = arg_2_2
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.GetNew = var_0_0
	arg_3_0.SetSelected = var_0_1

	local var_3_0 = LUI.Alignment.Left

	if arg_3_0.Selected then
		arg_3_0:addEventHandler("button_over", function()
			arg_3_0.Selected.Backer:SetAlpha(1)
			arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_0)
		end)
		arg_3_0:addEventHandler("button_up", function()
			arg_3_0.Selected.Backer:SetAlpha(0)
		end)
		arg_3_0:addEventHandler("button_over_disable", function(arg_6_0, arg_6_1)
			arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_0)
		end)
	else
		arg_3_0:addEventHandler("button_over", function()
			arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_0)
		end)
		arg_3_0:addEventHandler("button_over_disable", function(arg_8_0, arg_8_1)
			arg_3_0.Background:SetupButton(arg_3_0.Text, arg_3_0.Text:getText(), var_3_0)
		end)
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_3_0, "AR")
	end
end

function SelectLoadoutButton(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 370 * _1080p, 0, 60 * _1080p)

	var_9_0.id = "SelectLoadoutButton"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	local function var_9_3()
		local var_10_0 = var_9_0:GetDataSource().isLoadoutLocked:GetValue(var_9_1)

		if var_10_0 ~= nil then
			var_9_0:SetButtonDisabled(var_10_0)
		end
	end

	var_9_0:SubscribeToModelThroughElement(var_9_0, "isLoadoutLocked", var_9_3)

	local var_9_4
	local var_9_5 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_5.id = "Background"

	var_9_5:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_5)

	var_9_0.Background = var_9_5

	local var_9_6
	local var_9_7 = LUI.UIStyledText.new()

	var_9_7.id = "Text"

	var_9_7:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_7:setText(ToUpperCase(""), 0)
	var_9_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_7:SetAlignment(LUI.Alignment.Left)
	var_9_7:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_7:SetStartupDelay(2000)
	var_9_7:SetLineHoldTime(400)
	var_9_7:SetAnimMoveTime(300)
	var_9_7:SetAnimMoveSpeed(50)
	var_9_7:SetEndDelay(1500)
	var_9_7:SetCrossfadeTime(750)
	var_9_7:SetFadeInTime(300)
	var_9_7:SetFadeOutTime(300)
	var_9_7:SetMaxVisibleLines(1)
	var_9_7:SetOutlineRGBFromInt(0, 0)
	var_9_7:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 20, _1080p * -37, _1080p * -15, _1080p * 15)
	var_9_0:addElement(var_9_7)

	var_9_0.Text = var_9_7

	local var_9_8
	local var_9_9 = LUI.UIImage.new()

	var_9_9.id = "Lock"

	var_9_9:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_9_9:SetAlpha(0, 0)
	var_9_9:setImage(RegisterMaterial("icon_lock"), 0)
	var_9_9:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -25, _1080p * -5, _1080p * -10, _1080p * 10)
	var_9_0:addElement(var_9_9)

	var_9_0.Lock = var_9_9

	local var_9_10

	if CONDITIONS.InGame(var_9_0) then
		var_9_10 = MenuBuilder.BuildRegisteredType("EquippedNotification", {
			controllerIndex = var_9_1
		})
		var_9_10.id = "Selected"

		var_9_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -23, _1080p * -7, _1080p * -8, _1080p * 8)
		var_9_0:addElement(var_9_10)

		var_9_0.Selected = var_9_10
	end

	local var_9_11

	if CONDITIONS.IsBRGameType(var_9_0) then
		var_9_11 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_9_1
		})
		var_9_11.id = "BRWarning"

		var_9_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 280, _1080p * 310, _1080p * 15, _1080p * 45)
		var_9_0:addElement(var_9_11)

		var_9_0.BRWarning = var_9_11
	end

	local var_9_12
	local var_9_13 = LUI.UIImage.new()

	var_9_13.id = "RestrictionWarning"

	var_9_13:SetAlpha(0, 0)
	var_9_13:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_9_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -58, _1080p * -23, _1080p * 12, _1080p * 48)
	var_9_0:addElement(var_9_13)

	var_9_0.RestrictionWarning = var_9_13

	local function var_9_14()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_14

	local var_9_15
	local var_9_16 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_7:RegisterAnimationSequence("ButtonUp", var_9_16)

	local function var_9_17()
		var_9_7:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_17

	local var_9_18
	local var_9_19 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_7:RegisterAnimationSequence("ButtonOver", var_9_19)

	local function var_9_20()
		var_9_7:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_20

	local var_9_21
	local var_9_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_9_7:RegisterAnimationSequence("ButtonDisabled", var_9_22)

	local var_9_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("ButtonDisabled", var_9_23)

	local function var_9_24()
		var_9_7:AnimateSequence("ButtonDisabled")
		var_9_9:AnimateSequence("ButtonDisabled")
	end

	var_9_0._sequences.ButtonDisabled = var_9_24

	local var_9_25
	local var_9_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_9_7:RegisterAnimationSequence("ButtonOverDisabled", var_9_26)

	local var_9_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_9:RegisterAnimationSequence("ButtonOverDisabled", var_9_27)

	local function var_9_28()
		var_9_7:AnimateSequence("ButtonOverDisabled")
		var_9_9:AnimateSequence("ButtonOverDisabled")
	end

	var_9_0._sequences.ButtonOverDisabled = var_9_28

	local var_9_29

	if CONDITIONS.InGame(var_9_0) then
		local var_9_30 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -46
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -12
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -22
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 12
			}
		}

		var_9_10:RegisterAnimationSequence("Splitscreen", var_9_30)
	end

	local function var_9_31()
		if CONDITIONS.InGame(var_9_0) then
			var_9_10:AnimateSequence("Splitscreen")
		end
	end

	var_9_0._sequences.Splitscreen = var_9_31

	local var_9_32
	local var_9_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 16
		}
	}

	var_9_7:RegisterAnimationSequence("AR", var_9_33)

	local var_9_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -359
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -339
		}
	}

	var_9_9:RegisterAnimationSequence("AR", var_9_34)

	if CONDITIONS.InGame(var_9_0) then
		local var_9_35 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -357
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * -341
			}
		}

		var_9_10:RegisterAnimationSequence("AR", var_9_35)
	end

	if CONDITIONS.IsBRGameType(var_9_0) then
		local var_9_36 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 39
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 69
			}
		}

		var_9_11:RegisterAnimationSequence("AR", var_9_36)
	end

	local function var_9_37()
		var_9_7:AnimateSequence("AR")
		var_9_9:AnimateSequence("AR")

		if CONDITIONS.InGame(var_9_0) then
			var_9_10:AnimateSequence("AR")
		end

		if CONDITIONS.IsBRGameType(var_9_0) then
			var_9_11:AnimateSequence("AR")
		end
	end

	var_9_0._sequences.AR = var_9_37

	local var_9_38
	local var_9_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("RestrictionOn", var_9_39)

	local function var_9_40()
		var_9_13:AnimateSequence("RestrictionOn")
	end

	var_9_0._sequences.RestrictionOn = var_9_40

	local var_9_41
	local var_9_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_9_13:RegisterAnimationSequence("RestrictionOff", var_9_42)

	local function var_9_43()
		var_9_13:AnimateSequence("RestrictionOff")
	end

	var_9_0._sequences.RestrictionOff = var_9_43

	var_9_0:addEventHandler("button_over", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonOver")
	end)
	var_9_0:addEventHandler("button_up", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonUp")
	end)
	var_9_0:addEventHandler("button_over_disable", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonOverDisabled")
	end)
	var_9_0:addEventHandler("button_disable", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonDisabled")
	end)
	var_0_2(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("SelectLoadoutButton", SelectLoadoutButton)
LockTable(_M)
