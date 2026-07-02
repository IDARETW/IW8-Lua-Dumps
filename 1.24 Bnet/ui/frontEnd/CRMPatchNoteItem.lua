module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function CRMPatchNoteItem(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 660 * _1080p, 0, 80 * _1080p)

	var_2_0.id = "CRMPatchNoteItem"
	var_2_0._animationSets = {}
	var_2_0._sequences = {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "Background"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "Date"

	var_2_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -306, _1080p * 311, _1080p * 44, _1080p * 64)
	var_2_0:addElement(var_2_6)

	var_2_0.Date = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "Title"

	var_2_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_2_8:setText("Patch Notes 1.14", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -306, _1080p * 311, _1080p * 14, _1080p * 44)
	var_2_0:addElement(var_2_8)

	var_2_0.Title = var_2_8

	local function var_2_9()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_9

	local var_2_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_10)

	local var_2_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonOver", var_2_11)

	local function var_2_12()
		var_2_6:AnimateSequence("ButtonOver")
		var_2_8:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_12

	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_13)

	local var_2_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_2_8:RegisterAnimationSequence("ButtonUp", var_2_14)

	local function var_2_15()
		var_2_6:AnimateSequence("ButtonUp")
		var_2_8:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_15

	local var_2_16 = {
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

	var_2_6:RegisterAnimationSequence("AR", var_2_16)

	local var_2_17 = {
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

	var_2_8:RegisterAnimationSequence("AR", var_2_17)

	local function var_2_18()
		var_2_6:AnimateSequence("AR")
		var_2_8:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_18

	var_2_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CRMPatchNoteItem", CRMPatchNoteItem)
LockTable(_M)
