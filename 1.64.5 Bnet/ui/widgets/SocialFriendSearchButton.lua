module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._textEditingActive then
		arg_1_0.textEdit:setTextEditActive(false)

		arg_1_0._textEditingActive = false

		if arg_1_0._textEraseOnEditOff then
			arg_1_0.textEdit:setTextEditText("")
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._defaultInputString = arg_2_1

	if arg_2_0.textEdit then
		arg_2_0.textEdit:setTextEditText(arg_2_0._defaultInputString)
	end
end

local function var_0_2(arg_3_0)
	return not arg_3_0._firstInteraction
end

local function var_0_3(arg_4_0)
	arg_4_0._firstInteraction = true
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0._textEraseOnEditOff = arg_5_1
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._textEditingActive = false
	arg_6_0._firstInteraction = true
	arg_6_0._textEraseOnEditOff = true

	arg_6_0:SetFocusable(true)

	local var_6_0 = 256

	arg_6_0._defaultInputString = ""

	local var_6_1 = FONTS.GetFont(FONTS.BattleNetRegular.File)

	arg_6_0.TextEditOff = var_0_0
	arg_6_0.SetDefaultInputString = var_0_1
	arg_6_0.IsPastFirstInteraction = var_0_2
	arg_6_0.ResetFirstInteraction = var_0_3
	arg_6_0.SetTextEraseOnEditOff = var_0_4

	arg_6_0:addEventHandler("button_action", function(arg_7_0, arg_7_1)
		if not arg_7_0._textEditingActive then
			arg_7_0.textEdit:setTextEditActive()

			arg_7_0._textEditingActive = true

			if arg_7_0._firstInteraction then
				arg_7_0.textEdit:setTextEditText("")

				arg_7_0._firstInteraction = false
			end

			if arg_7_0.buttonActionCallbackFunc then
				arg_7_0.buttonActionCallbackFunc()
			end
		end
	end)
	arg_6_0:addEventHandler("text_edit_complete", function(arg_8_0, arg_8_1)
		if arg_8_0._textEditingActive and arg_8_1.active then
			if arg_8_1.switchTextEditField then
				arg_8_0:TextEditOff()
			else
				local var_8_0 = arg_8_1.text or ""

				if arg_8_0.textEditCompleteCallbackFunc then
					arg_8_0:textEditCompleteCallbackFunc(arg_8_1.cancelled, var_8_0)
				end

				if not arg_8_1.cancelled then
					arg_8_0:TextEditOff()
				end
			end

			arg_8_0._textEditingActive = false
		end
	end)
	arg_6_0:addEventHandler("text_edit_is_typing", function(arg_9_0, arg_9_1)
		if arg_9_0.isTypingCallbackFunc then
			local var_9_0 = arg_9_1.text or ""

			arg_9_0.isTypingCallbackFunc(arg_9_1.isTyping, var_9_0)
		end
	end)

	local var_6_2 = {
		alwaysSendTypingEvents = true,
		disableAfterEdit = true,
		useAutoAlign = true,
		controllerIndex = arg_6_1,
		maxLength = var_6_0
	}
	local var_6_3 = MenuBuilder.BuildRegisteredType("UITextEdit", var_6_2)

	if IsLanguageArabic() then
		var_6_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 4 * _1080p, 30 * _1080p)
	else
		var_6_3:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 7 * _1080p, 27 * _1080p)
	end

	var_6_3.id = "playerSearch"

	var_6_3:SetFont(var_6_1)
	var_6_3:SetRGBFromTable(SWATCHES.genericButton.description)
	var_6_3:SetAlignment(LUI.Alignment.Left)
	var_6_3:addEventHandler("menu_create", function(arg_10_0, arg_10_1)
		if not IsLanguageArabic() then
			arg_10_0:setTextEditText(arg_6_0._defaultInputString)
		else
			arg_6_0:AddTooltipData(arg_6_1, {
				tooltipDescription = arg_6_0._defaultInputString
			})
		end
	end)

	arg_6_0.textEdit = var_6_3

	arg_6_0:addElement(var_6_3)
	arg_6_0:SetAsEditBoxHandler(true)
end

function SocialFriendSearchButton(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIButton.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 36 * _1080p)

	var_11_0.id = "SocialFriendSearchButton"

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "BGImage"

	var_11_4:SetRGBFromTable(SWATCHES.CAC.ItemBtnBackground, 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -16, 0, 0, 0)
	var_11_0:addElement(var_11_4)

	var_11_0.BGImage = var_11_4

	local var_11_5
	local var_11_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_11_7 = LUI.UIBorder.new(var_11_6)

	var_11_7.id = "Border"

	var_11_7:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_11_7:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -15, 0, 0, 0)
	var_11_0:addElement(var_11_7)

	var_11_0.Border = var_11_7

	var_11_0:addEventHandler("button_over", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_11_1
		end

		ACTIONS.SetAlpha(var_11_0, 1, 0, 0)
	end)
	var_11_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_11_1
		end

		ACTIONS.SetAlpha(var_11_0, 0.6, 0, 0)
	end)
	var_0_5(var_11_0, var_11_1, arg_11_1)
	ACTIONS.SetAlpha(var_11_0, 0.6, 0, 0)

	return var_11_0
end

MenuBuilder.registerType("SocialFriendSearchButton", SocialFriendSearchButton)
LockTable(_M)
