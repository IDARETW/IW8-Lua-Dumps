module(..., package.seeall)

function TrialEventRewardDetailsPopup(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIVerticalNavigator.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_1_0.id = "TrialEventRewardDetailsPopup"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Darkener"

	var_1_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_1_4:SetAlpha(0.95, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Darkener = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "GenericPopupWindow"

	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -400, _1080p * 400)
	var_1_0:addElement(var_1_6)

	var_1_0.GenericPopupWindow = var_1_6

	local var_1_7
	local var_1_8 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_1_1
	})

	var_1_8.id = "ButtonHelperBar"

	var_1_8.Background:SetAlpha(0, 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 400, _1080p * 460)
	var_1_0:addElement(var_1_8)

	var_1_0.ButtonHelperBar = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIText.new()

	var_1_10.id = "Description"

	var_1_10:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_1_10:setText(Engine.CBBHFCGDIC("ONBOARDING/WZ_INTRO_POPUP_DESC_1"), 0)
	var_1_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_10:SetAlignment(LUI.Alignment.Center)
	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -391, _1080p * 401, _1080p * 140, _1080p * 164)
	var_1_0:addElement(var_1_10)

	var_1_0.Description = var_1_10

	local var_1_11
	local var_1_12 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_1_1
	})

	var_1_12.id = "LootSilver"

	var_1_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -86, _1080p * 86, _1080p * -210, _1080p * 18)
	var_1_0:addElement(var_1_12)

	var_1_0.LootSilver = var_1_12

	local var_1_13
	local var_1_14 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_1_1
	})

	var_1_14.id = "LootBronze"

	var_1_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -391, _1080p * -219, _1080p * -210, _1080p * 18)
	var_1_0:addElement(var_1_14)

	var_1_0.LootBronze = var_1_14

	local var_1_15
	local var_1_16 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_1_1
	})

	var_1_16.id = "LootGold"

	var_1_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 229, _1080p * 401, _1080p * -210, _1080p * 18)
	var_1_0:addElement(var_1_16)

	var_1_0.LootGold = var_1_16

	local var_1_17
	local var_1_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_1_1
	})

	var_1_18.id = "OkButton"

	var_1_18.Text:SetLeft(_1080p * 20, 0)
	var_1_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OK")), 0)
	var_1_18.Text:SetAlignment(LUI.Alignment.Center)
	var_1_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 270, _1080p * 308)
	var_1_0:addElement(var_1_18)

	var_1_0.OkButton = var_1_18

	function var_1_0.addButtonHelperFunction(arg_2_0, arg_2_1)
		arg_2_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_2_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_1_0:addEventHandler("menu_create", var_1_0.addButtonHelperFunction)

	local var_1_19 = LUI.UIBindButton.new()

	var_1_19.id = "selfBindButton"

	var_1_0:addElement(var_1_19)

	var_1_0.bindButton = var_1_19

	return var_1_0
end

MenuBuilder.registerType("TrialEventRewardDetailsPopup", TrialEventRewardDetailsPopup)
LockTable(_M)
