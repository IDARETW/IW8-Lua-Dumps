module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Engine.CBBHFCGDIC("CAS/EDIT")
	local var_1_1 = LUI.Alignment.Left

	arg_1_0.Text:setText(var_1_0)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		arg_1_0.Background:SetupButton(arg_2_0.Text, arg_2_0.Text:getText(), var_1_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUp")
	end)
	arg_1_0:addEventHandler("button_over_disable", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = arg_1_1
		end

		WZWIP.AnimateThemeElement(arg_4_0, "ButtonOverDisabled")
	end)
	arg_1_0:addEventHandler("button_disable", function(arg_5_0, arg_5_1)
		WZWIP.AnimateThemeElement(arg_5_0, "ButtonDisabled")
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function EditLoadoutButton(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 170 * _1080p, 0, 60 * _1080p)

	var_6_0.id = "EditLoadoutButton"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	local function var_6_3()
		local var_7_0 = var_6_0:GetDataSource().isLoadoutLocked:GetValue(var_6_1)

		if var_7_0 ~= nil then
			var_6_0:SetButtonDisabled(var_7_0)
		end
	end

	var_6_0:SubscribeToModelThroughElement(var_6_0, "isLoadoutLocked", var_6_3)

	local var_6_4
	local var_6_5 = MenuBuilder.BuildRegisteredType("GenericButtonBackground", {
		controllerIndex = var_6_1
	})

	var_6_5.id = "Background"

	var_6_5:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_6_0:addElement(var_6_5)

	var_6_0.Background = var_6_5

	local var_6_6

	if CONDITIONS.IsMagmaGameMode() then
		local var_6_7 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
			controllerIndex = var_6_1
		})

		var_6_7.id = "WZBackground"

		var_6_7:SetAlpha(0.8, 0)
		var_6_7:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		var_6_0:addElement(var_6_7)

		var_6_0.WZBackground = var_6_7
	end

	local var_6_8
	local var_6_9 = LUI.UIStyledText.new()

	var_6_9.id = "Text"

	var_6_9:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_9:setText(ToUpperCase(""), 0)
	var_6_9:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_9:SetAlignment(LUI.Alignment.Left)
	var_6_9:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_9:SetStartupDelay(2000)
	var_6_9:SetLineHoldTime(400)
	var_6_9:SetAnimMoveTime(300)
	var_6_9:SetAnimMoveSpeed(50)
	var_6_9:SetEndDelay(1500)
	var_6_9:SetCrossfadeTime(750)
	var_6_9:SetFadeInTime(300)
	var_6_9:SetFadeOutTime(300)
	var_6_9:SetMaxVisibleLines(1)
	var_6_9:SetOutlineRGBFromInt(0, 0)
	var_6_9:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 17, _1080p * -17, _1080p * -15, _1080p * 15)
	var_6_0:addElement(var_6_9)

	var_6_0.Text = var_6_9

	local function var_6_10()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_10

	local var_6_11
	local var_6_12 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_6_9:RegisterAnimationSequence("ButtonUp", var_6_12)

	local function var_6_13()
		var_6_9:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_13

	local var_6_14
	local var_6_15 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_6_9:RegisterAnimationSequence("ButtonOver", var_6_15)

	local function var_6_16()
		var_6_9:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_6_9:RegisterAnimationSequence("ButtonDisabled", var_6_18)

	local function var_6_19()
		var_6_9:AnimateSequence("ButtonDisabled")
	end

	var_6_0._sequences.ButtonDisabled = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_6_9:RegisterAnimationSequence("ButtonOverDisabled", var_6_21)

	local function var_6_22()
		var_6_9:AnimateSequence("ButtonOverDisabled")
	end

	var_6_0._sequences.ButtonOverDisabled = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_5:RegisterAnimationSequence("WZWipSetup", var_6_24)

	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_9:RegisterAnimationSequence("WZWipSetup", var_6_25)

	local function var_6_26()
		var_6_5:AnimateSequence("WZWipSetup")
		var_6_9:AnimateSequence("WZWipSetup")
	end

	var_6_0._sequences.WZWipSetup = var_6_26

	local var_6_27
	local var_6_28 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_9:RegisterAnimationSequence("WZWipButtonOver", var_6_28)

	local function var_6_29()
		var_6_9:AnimateSequence("WZWipButtonOver")
	end

	var_6_0._sequences.WZWipButtonOver = var_6_29

	local var_6_30
	local var_6_31 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_9:RegisterAnimationSequence("WZWipButtonDisabled", var_6_31)

	local function var_6_32()
		var_6_9:AnimateSequence("WZWipButtonDisabled")
	end

	var_6_0._sequences.WZWipButtonDisabled = var_6_32

	local var_6_33
	local var_6_34 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_9:RegisterAnimationSequence("WZWipButtonOverDisabled", var_6_34)

	local function var_6_35()
		var_6_9:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_6_0._sequences.WZWipButtonOverDisabled = var_6_35

	local var_6_36
	local var_6_37 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_9:RegisterAnimationSequence("WZWipButtonUp", var_6_37)

	local function var_6_38()
		var_6_9:AnimateSequence("WZWipButtonUp")
	end

	var_6_0._sequences.WZWipButtonUp = var_6_38

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("EditLoadoutButton", EditLoadoutButton)
LockTable(_M)
