module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		WZWIP.AnimateThemeElement(arg_2_0, "ButtonOver")
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		WZWIP.AnimateThemeElement(arg_3_0, "ButtonUp")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function CRMPatchNoteItem(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 660 * _1080p, 0, 80 * _1080p)

	var_4_0.id = "CRMPatchNoteItem"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Background"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Background = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "Date"

	var_4_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -306, _1080p * 311, _1080p * 44, _1080p * 64)
	var_4_0:addElement(var_4_6)

	var_4_0.Date = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "Title"

	var_4_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_4_8:setText("Patch Notes 1.14", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -306, _1080p * 311, _1080p * 14, _1080p * 44)
	var_4_0:addElement(var_4_8)

	var_4_0.Title = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_11)

	local var_4_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_12)

	local function var_4_13()
		var_4_6:AnimateSequence("ButtonOver")
		var_4_8:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_13

	local var_4_14
	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_15)

	local var_4_16 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_16)

	local function var_4_17()
		var_4_6:AnimateSequence("ButtonUp")
		var_4_8:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_17

	local var_4_18
	local var_4_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43
		}
	}

	var_4_6:RegisterAnimationSequence("AR", var_4_19)

	local var_4_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		}
	}

	var_4_8:RegisterAnimationSequence("AR", var_4_20)

	local function var_4_21()
		var_4_6:AnimateSequence("AR")
		var_4_8:AnimateSequence("AR")
	end

	var_4_0._sequences.AR = var_4_21

	local var_4_22
	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipSetup", var_4_23)

	local var_4_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipSetup", var_4_24)

	local function var_4_25()
		var_4_6:AnimateSequence("WZWipSetup")
		var_4_8:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_25

	local var_4_26
	local var_4_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipButtonOver", var_4_27)

	local var_4_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipButtonOver", var_4_28)

	local function var_4_29()
		var_4_6:AnimateSequence("WZWipButtonOver")
		var_4_8:AnimateSequence("WZWipButtonOver")
	end

	var_4_0._sequences.WZWipButtonOver = var_4_29

	local var_4_30
	local var_4_31 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipButtonUp", var_4_31)

	local var_4_32 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("WZWipButtonUp", var_4_32)

	local function var_4_33()
		var_4_6:AnimateSequence("WZWipButtonUp")
		var_4_8:AnimateSequence("WZWipButtonUp")
	end

	var_4_0._sequences.WZWipButtonUp = var_4_33

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CRMPatchNoteItem", CRMPatchNoteItem)
LockTable(_M)
