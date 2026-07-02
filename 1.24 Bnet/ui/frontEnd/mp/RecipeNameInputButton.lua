module(..., package.seeall)

local var_0_0 = SWATCHES.AAR.AARdescription
local var_0_1 = SWATCHES.genericButton.description
local var_0_2 = SWATCHES.genericButton.textDefault
local var_0_3 = SWATCHES.genericButton.textFocus
local var_0_4 = SWATCHES.Scoreboard.enemyTeam

local function var_0_5(arg_1_0)
	return function()
		if arg_1_0._textEditingActive then
			arg_1_0.textEdit:setTextEditActive(false)

			arg_1_0._textEditingActive = false
		end
	end
end

local function var_0_6(arg_3_0)
	if arg_3_0._isDefault then
		arg_3_0.textEdit:SetRGBFromTable(var_0_1, 150)
		arg_3_0.textEdit:SetAlpha(1)
		arg_3_0.Border:SetRGBFromTable(var_0_2, 150)
		arg_3_0.HighlightTop:SetRGBFromTable(var_0_3, 150)
		arg_3_0.ButtonGlowTop.Glow:SetRGBFromTable(var_0_3, 150)
	elseif arg_3_0:GetErrorState() then
		arg_3_0.textEdit:SetRGBFromTable(var_0_4, 150)
		arg_3_0.textEdit:SetAlpha(1)
		arg_3_0.Border:SetRGBFromTable(var_0_4, 150)
		arg_3_0.HighlightTop:SetRGBFromTable(var_0_4, 150)
		arg_3_0.HighlightTop:SetRGBFromTable(var_0_4, 150)
		arg_3_0.ButtonGlowTop.Glow:SetRGBFromTable(var_0_4, 150)
	else
		arg_3_0.textEdit:SetRGBFromTable(var_0_3, 150)
		arg_3_0.Border:SetRGBFromTable(var_0_3, 150)
		arg_3_0.HighlightTop:SetRGBFromTable(var_0_3, 150)
		arg_3_0.HighlightTop:SetRGBFromTable(var_0_3, 150)
		arg_3_0.ButtonGlowTop.Glow:SetRGBFromTable(var_0_3, 150)
	end
end

local function var_0_7(arg_4_0)
	if arg_4_0._isDefault then
		arg_4_0.textEdit:SetRGBFromTable(var_0_0, 150)
		arg_4_0.textEdit:SetAlpha(0.75)
		arg_4_0.Border:SetRGBFromTable(var_0_2, 150)
	elseif arg_4_0:GetErrorState() then
		arg_4_0.textEdit:SetRGBFromTable(var_0_4, 150)
		arg_4_0.textEdit:SetAlpha(1)
		arg_4_0.Border:SetRGBFromTable(var_0_4, 150)
	else
		arg_4_0.textEdit:SetRGBFromTable(var_0_2, 150)
		arg_4_0.Border:SetRGBFromTable(var_0_3, 150)
	end
end

local function var_0_8(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_0 = {
		alwaysSendTypingEvents = true,
		disableAfterEdit = true,
		autoConfirmOnOutsideClick = true,
		useAutoAlign = true,
		controllerIndex = arg_5_1,
		maxLength = arg_5_2
	}
	local var_5_1 = MenuBuilder.BuildRegisteredType("UITextEdit", var_5_0)
	local var_5_2 = (IsLanguageArabic() and 30 or 22) / 2

	var_5_1:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 10 * _1080p, -10 * _1080p, -var_5_2 * _1080p, var_5_2 * _1080p)
	var_5_1:SetRGBFromTable(SWATCHES.genericButton.textDefault)

	var_5_1.id = "playerSearch"

	var_5_1:SetFont(CoD.TextSettings.SmallFont.Font)
	var_5_1:SetAlignment(IsLanguageArabic() and LUI.Alignment.Right or LUI.Alignment.Left)

	if arg_5_4 then
		arg_5_0._isDefault = true

		var_5_1:SetRGBFromTable(var_0_0)
		var_5_1:SetAlpha(0.75)
		arg_5_0.Border:SetRGBFromTable(var_0_2, 150)
	end

	var_5_1:addEventHandler("menu_create", function(arg_6_0, arg_6_1)
		arg_6_0:setTextEditText(arg_5_3, false, true)
	end)
	arg_5_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
		arg_7_0._isOver = true

		var_0_6(arg_7_0)
	end)
	arg_5_0:addEventHandler("button_up", function(arg_8_0, arg_8_1)
		arg_8_0._isOver = false

		var_0_7(arg_8_0)
	end)

	arg_5_0.textEdit = var_5_1

	arg_5_0:addElement(var_5_1)
end

local function var_0_9(arg_9_0, arg_9_1)
	arg_9_0._isError = arg_9_1

	if arg_9_0._isOver then
		var_0_6(arg_9_0)
	else
		var_0_7(arg_9_0)
	end
end

local function var_0_10(arg_10_0)
	return arg_10_0._isError
end

local function var_0_11(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.SetErrorState = var_0_9
	arg_11_0.GetErrorState = var_0_10
	arg_11_0._textEditingActive = false
	arg_11_0._firstInteraction = true
	arg_11_0._isDefault = false
	arg_11_0._isError = false
	arg_11_0._isOver = false

	arg_11_0:SetFocusable(true)

	arg_11_0.TextEditOff = var_0_5(arg_11_0)
	arg_11_0.SetupUITextEdit = var_0_8

	arg_11_0:addEventHandler("button_action", function(arg_12_0, arg_12_1)
		if not arg_12_0._textEditingActive then
			arg_12_0.textEdit:setTextEditActive()

			arg_12_0._textEditingActive = true

			if arg_12_0._firstInteraction then
				arg_12_0.textEdit:setTextEditText("")
				arg_12_0.textEdit:SetAlpha(1)

				arg_12_0._firstInteraction = false
				arg_12_0._isDefault = false
			end

			if arg_12_0.buttonActionCallbackFunc then
				arg_12_0.buttonActionCallbackFunc()
			end
		end
	end)
	arg_11_0:addEventHandler("text_edit_complete", function(arg_13_0, arg_13_1)
		if arg_13_0._textEditingActive and arg_13_1.active then
			if arg_13_1.switchTextEditField then
				arg_13_0:TextEditOff()
			elseif not arg_13_1.cancelled then
				arg_13_0:TextEditOff()
			else
				arg_13_0._textEditingActive = false
			end
		end
	end)
end

function RecipeNameInputButton(arg_14_0, arg_14_1)
	local var_14_0 = LUI.UIButton.new()

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 27 * _1080p)

	var_14_0.id = "RecipeNameInputButton"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3
	local var_14_4 = MenuBuilder.BuildRegisteredType("ButtonGlow", {
		controllerIndex = var_14_1
	})

	var_14_4.id = "ButtonGlowTop"

	var_14_4:SetAlpha(0, 0)
	var_14_4.Glow:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_14_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 12, _1080p * -7)
	var_14_0:addElement(var_14_4)

	var_14_0.ButtonGlowTop = var_14_4

	local var_14_5
	local var_14_6 = LUI.UIImage.new()

	var_14_6.id = "BGImage"

	var_14_6:SetRGBFromTable(SWATCHES.CAC.panelBacker, 0)
	var_14_0:addElement(var_14_6)

	var_14_0.BGImage = var_14_6

	local var_14_7
	local var_14_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_14_9 = LUI.UIBorder.new(var_14_8)

	var_14_9.id = "Border"

	var_14_9:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_14_9:SetAlpha(0.5, 0)
	var_14_0:addElement(var_14_9)

	var_14_0.Border = var_14_9

	local var_14_10
	local var_14_11 = LUI.UIImage.new()

	var_14_11.id = "HighlightTop"

	var_14_11:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_14_11:SetAlpha(0, 0)
	var_14_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 1)
	var_14_0:addElement(var_14_11)

	var_14_0.HighlightTop = var_14_11

	local function var_14_12()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_12

	local var_14_13
	local var_14_14 = {
		{
			value = 0.6,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ButtonOver", var_14_14)

	local var_14_15 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_11:RegisterAnimationSequence("ButtonOver", var_14_15)

	local function var_14_16()
		var_14_4:AnimateSequence("ButtonOver")
		var_14_11:AnimateSequence("ButtonOver")
	end

	var_14_0._sequences.ButtonOver = var_14_16

	local var_14_17
	local var_14_18 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_4:RegisterAnimationSequence("ButtonUp", var_14_18)

	local var_14_19 = {
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_11:RegisterAnimationSequence("ButtonUp", var_14_19)

	local function var_14_20()
		var_14_4:AnimateSequence("ButtonUp")
		var_14_11:AnimateSequence("ButtonUp")
	end

	var_14_0._sequences.ButtonUp = var_14_20

	var_14_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonOver")
	end)
	var_14_0:addEventHandler("button_up", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonUp")
	end)
	var_0_11(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("RecipeNameInputButton", RecipeNameInputButton)
LockTable(_M)
