module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0.DynamicLine = LUI.UILine.new()

	arg_1_0:addElement(arg_1_0.DynamicLine)
	arg_1_0.DynamicLine:SetThickness(2 * _1080p)
	arg_1_0.DynamicLine:SetAlpha(1)
	arg_1_0.DynamicLine:SetVertexPosition(LUI.UILine.START, 0, 0, 52 * _1080p, 34 * _1080p)
	arg_1_0.DynamicLine:SetVertexPadding(LUI.UILine.START, 0)
	arg_1_0.DynamicLine:SetRGBFromTable(SWATCHES.genericButton.description)
	arg_1_0:SetAlpha(0)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1 and not CONDITIONS.IsInGameBattlesMatch()

	arg_2_0.NewItemNotification:SetAlpha(var_2_0 and 1 or 0)

	arg_2_0._hasNew = var_2_0
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0.DynamicLine:SetVertexPadding(LUI.UILine.END, 1)
	arg_3_0.DynamicLine:SetVertexPadding(LUI.UILine.END, 0, 800, LUI.EASING.outQuadratic)
	arg_3_0.DynamicLine:SetVertexEntity(LUI.UILine.END, arg_3_1)
	arg_3_0.DynamicLine:SetVertexEntityTag(LUI.UILine.END, "j_spinelower")
	arg_3_0.DynamicLine:AttachVertexToWorldModel(LUI.UILine.END)
	arg_3_0.DynamicLine:SetLineLengthScalar(0.35)
	arg_3_0.DynamicLine:SetVertexTagSpacePosition(LUI.UILine.END, 5 * _1080p, 0, 5 * _1080p)
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.CreateDynamicLineToClientCharacter = var_0_0
	arg_4_0.UpdateLine = var_0_2
	arg_4_0.UpdateNewItemNotification = var_0_1

	local function var_4_0(arg_5_0, arg_5_1)
		local var_5_0
		local var_5_1 = 50 * _1080p
		local var_5_2 = 20 * _1080p

		if LUI.IsLastInputGamepad(arg_5_1.controllerIndex) then
			if arg_5_0.EditButton:getParent() then
				arg_5_0:RemoveElement(arg_5_0.EditButton)
			end

			arg_5_0.EditText:SetAlpha(1)
			arg_5_0.EditTextKBM:SetAlpha(0)
			arg_5_0.Backer:SetAlpha(1)
			arg_5_0.BackerKBM:SetAlpha(0)

			var_5_0 = LAYOUT.GetTextWidth(arg_5_0.EditText)
		else
			arg_5_0.EditText:SetAlpha(0)
			arg_5_0.EditTextKBM:SetAlpha(1)
			arg_5_0.Backer:SetAlpha(0)
			arg_5_0.BackerKBM:SetAlpha(1)

			if not arg_5_0.EditButton:getParent() then
				arg_5_0:addElement(arg_5_0.EditButton)
			end

			arg_5_0.EditButton.Background:SetAlpha(0)

			var_5_0 = LAYOUT.GetTextWidth(arg_5_0.EditTextKBM)
		end

		arg_5_0.Backer:SetRight(var_5_0 + var_5_1 + var_5_2)
		arg_5_0.BackerKBM:SetRight(var_5_0 + var_5_1 + var_5_2)
		arg_5_0.BackgroundLine:SetRight(var_5_0 + var_5_1 + var_5_2)
	end

	arg_4_0.EditButton:SetHandleMouse(false)
	arg_4_0:addAndCallEventHandler("update_input_type", var_4_0, {
		controllerIndex = arg_4_1
	})
	arg_4_0:addEventHandler("mouseenter", function(arg_6_0, arg_6_1)
		ACTIONS.AnimateSequence(arg_4_0, "mouseEnter")
	end)
	arg_4_0:addEventHandler("mouseleave", function(arg_7_0, arg_7_1)
		ACTIONS.AnimateSequence(arg_4_0, "mouseLeave")
	end)
end

function OperatorEdit(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 200 * _1080p, 0, 40 * _1080p)

	var_8_0.id = "OperatorEdit"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "BackerKBM"

	var_8_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_4:SetPixelGridEnabled(true)
	var_8_4:SetPixelGridContrast(0.05, 0)
	var_8_4:SetPixelGridBlockWidth(2, 0)
	var_8_4:SetPixelGridBlockHeight(2, 0)
	var_8_4:SetPixelGridGutterWidth(1, 0)
	var_8_4:SetPixelGridGutterHeight(1, 0)
	var_8_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 50, _1080p * 192, _1080p * -16, _1080p * 16)
	var_8_0:addElement(var_8_4)

	var_8_0.BackerKBM = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIImage.new()

	var_8_6.id = "Backer"

	var_8_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_6:SetPixelGridEnabled(true)
	var_8_6:SetPixelGridContrast(0.05, 0)
	var_8_6:SetPixelGridBlockWidth(2, 0)
	var_8_6:SetPixelGridBlockHeight(2, 0)
	var_8_6:SetPixelGridGutterWidth(1, 0)
	var_8_6:SetPixelGridGutterHeight(1, 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 192, _1080p * 4, _1080p * 36)
	var_8_0:addElement(var_8_6)

	var_8_0.Backer = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "EditButton"

	var_8_8:SetAlpha(0.01, 0)
	var_8_8.Text:SetLeft(0, 0)
	var_8_8.Text:setText("", 0)
	var_8_8.Text:SetAlignment(LUI.Alignment.Center)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 192, _1080p * 4, _1080p * 36)
	var_8_0:addElement(var_8_8)

	var_8_0.EditButton = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIStyledText.new()

	var_8_10.id = "EditTextKBM"

	var_8_10:SetRGBFromTable(SWATCHES.text.buildNumber, 0)
	var_8_10:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN_KBM"), 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_10:SetWordWrap(false)
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_10:SetTintFontIcons(true)
	var_8_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 60, _1080p * 192, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_10)

	var_8_0.EditTextKBM = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIStyledText.new()

	var_8_12.id = "EditText"

	var_8_12:SetRGBFromTable(SWATCHES.text.buildNumber, 0)
	var_8_12:setText(Engine.CBBHFCGDIC("OPERATIONS/EDIT_SKIN"), 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetWordWrap(false)
	var_8_12:SetAlignment(LUI.Alignment.Left)
	var_8_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_8_12:SetTintFontIcons(true)
	var_8_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 60, _1080p * 192, _1080p * -12, _1080p * 12)
	var_8_0:addElement(var_8_12)

	var_8_0.EditText = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIImage.new()

	var_8_14.id = "BackgroundLine"

	var_8_14:SetRGBFromInt(4374770, 0)
	var_8_14:SetAlpha(0, 0)
	var_8_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 192, _1080p * 3, _1080p * 6)
	var_8_0:addElement(var_8_14)

	var_8_0.BackgroundLine = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "NewItemNotification"

	var_8_16:SetAlpha(0, 0)
	var_8_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 31, _1080p * 39, _1080p * 16, _1080p * 24)
	var_8_0:addElement(var_8_16)

	var_8_0.NewItemNotification = var_8_16

	local function var_8_17()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_17

	local var_8_18
	local var_8_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.overText
		}
	}

	var_8_10:RegisterAnimationSequence("mouseEnter", var_8_19)

	local var_8_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("mouseEnter", var_8_20)

	local function var_8_21()
		var_8_10:AnimateSequence("mouseEnter")
		var_8_14:AnimateSequence("mouseEnter")
	end

	var_8_0._sequences.mouseEnter = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.buildNumber
		}
	}

	var_8_10:RegisterAnimationSequence("mouseLeave", var_8_23)

	local var_8_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("mouseLeave", var_8_24)

	local function var_8_25()
		var_8_10:AnimateSequence("mouseLeave")
		var_8_14:AnimateSequence("mouseLeave")
	end

	var_8_0._sequences.mouseLeave = var_8_25

	var_0_3(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("OperatorEdit", OperatorEdit)
LockTable(_M)
