module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.BindButton = LUI.UIBindButton.new()
	arg_1_0.BindButton.onCancel = arg_1_1

	arg_1_0.BindButton:registerEventHandler("button_secondary", function(arg_2_0, arg_2_1)
		arg_2_0:onCancel(arg_2_1.controller)
	end)
	arg_1_0.BindButton:registerEventHandler("virtual_keyboard_popup_active", function(arg_3_0, arg_3_1)
		arg_3_0:processEvent({
			name = "popup_active"
		})
	end)
	arg_1_0:addElement(arg_1_0.BindButton)

	local var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")

	arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = var_1_0
	})
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Message)

	arg_4_0.SetupCancelButton = var_0_0

	if arg_4_2.onCancel then
		var_0_0(arg_4_0, arg_4_2.onCancel)
	end

	if arg_4_2.timerData then
		local var_4_0

		local function var_4_1()
			local var_5_0 = arg_4_2.timerData.getNumPartyMembersWaitingToJoinThroughCrosslaunchCallback()

			arg_4_0.Message:setText(Engine.CBBHFCGDIC("MENU/WAITING_FOR_PARTY_MEMBERS_TO_JOIN", var_5_0))

			arg_4_0:Wait(arg_4_2.timerData.frequency, true).onComplete = var_4_1
		end

		var_4_1()
	end
end

function WaitingForPartyMembersForCrosslaunchPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "WaitingForPartyMembersForCrosslaunchPopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Darkener"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Darkener = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "GenericPopupWindow"

	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 856, _1080p * -142, _1080p * 142)
	var_6_0:addElement(var_6_6)

	var_6_0.GenericPopupWindow = var_6_6

	local var_6_7
	local var_6_8 = MenuBuilder.BuildRegisteredType("GenericBoxFillAndStroke", {
		controllerIndex = var_6_1
	})

	var_6_8.id = "Background"

	var_6_8:SetAlpha(0, 0)
	var_6_8:SetPixelGridEnabled(true)
	var_6_8:SetPixelGridContrast(0.5, 0)
	var_6_8:SetPixelGridBlockWidth(2, 0)
	var_6_8:SetPixelGridBlockHeight(2, 0)
	var_6_8:SetPixelGridGutterWidth(1, 0)
	var_6_8:SetPixelGridGutterHeight(1, 0)
	var_6_8.Fill:SetRGBFromInt(3355443, 0)
	var_6_8.Fill:SetAlpha(0, 0)
	var_6_8.Stroke:SetRGBFromTable(SWATCHES.genericMenu.frame, 0)
	var_6_8.Stroke:SetAlpha(0, 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 45, _1080p * 45)
	var_6_0:addElement(var_6_8)

	var_6_0.Background = var_6_8

	local var_6_9
	local var_6_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_10.id = "ButtonHelperBar"

	var_6_10.Background:SetAlpha(0, 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 142, _1080p * 202)
	var_6_0:addElement(var_6_10)

	var_6_0.ButtonHelperBar = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIText.new()

	var_6_12.id = "Message"

	var_6_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_12:setText("", 0)
	var_6_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_12:SetAlignment(LUI.Alignment.Center)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -784, _1080p * 784, _1080p * 69, _1080p * 97)
	var_6_0:addElement(var_6_12)

	var_6_0.Message = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "Spinner"

	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 25, _1080p * 33)
	var_6_0:addElement(var_6_14)

	var_6_0.Spinner = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIStyledText.new()

	var_6_16.id = "Title"

	var_6_16:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_16:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/WAITING")), 0)
	var_6_16:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_16:SetAlignment(LUI.Alignment.Center)
	var_6_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * 802, _1080p * -111, _1080p * -51)
	var_6_0:addElement(var_6_16)

	var_6_0.Title = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIStyledText.new()

	var_6_18.id = "WZWipTitle"

	var_6_18:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_6_18:setText(Engine.CBBHFCGDIC("MENU/WAITING"), 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_18:SetAlignment(LUI.Alignment.Center)
	var_6_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -111, _1080p * -51)
	var_6_0:addElement(var_6_18)

	var_6_0.WZWipTitle = var_6_18

	var_0_1(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("WaitingForPartyMembersForCrosslaunchPopup", WaitingForPartyMembersForCrosslaunchPopup)
LockTable(_M)
