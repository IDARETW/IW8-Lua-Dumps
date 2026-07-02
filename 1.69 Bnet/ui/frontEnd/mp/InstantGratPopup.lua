module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIBindButton.new()

	var_1_0.id = "selfBindButton"

	arg_1_0:addElement(var_1_0)

	arg_1_0._bindButton = var_1_0

	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	ACTIONS.AnimateSequence(arg_1_0.ConfirmButton, "Glint")
	arg_1_0.ConfirmButton:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_1_0.ConfirmButton, "ButtonOver")
	end)
	arg_1_0.ConfirmButton:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_1_0.ConfirmButton, "ButtonUp")
	end)
	arg_1_0._bindButton:registerEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		ACTIONS.LeaveMenu(arg_1_0)
	end)
	arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	if Dvar.CFHDGABACF("MTLMNTLRNQ") == 1 then
		arg_1_0.background:setImage(RegisterMaterial("cortez_store_upsell_vault_instant_grat_three_blade"))
	end

	if Dvar.CFHDGABACF("LPSKRLPMNK") == 1 then
		local var_1_1 = ""
		local var_1_2 = CONDITIONS.IsPC() and "INGAMESTORE_WZ350/CORTEZ_INSTANT_GRAT_TEXT_PC" or "INGAMESTORE_WZ350/CORTEZ_INSTANT_GRAT_TEXT_CONSOLE"

		arg_1_0.RewardText:setText(Engine.CBBHFCGDIC(var_1_2))
	end

	if not Onboarding.CortezInstantGratPopup.WasCompleted(arg_1_0, arg_1_1) then
		Onboarding.CortezInstantGratPopup.MarkCompleted(arg_1_0, arg_1_1)
	end

	if not Onboarding.CortezInstantGratPopupAfterSeasonStart.WasCompleted(arg_1_0, arg_1_1) then
		Onboarding.CortezInstantGratPopupAfterSeasonStart.MarkCompleted(arg_1_0, arg_1_1)
	end
end

function InstantGratPopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "InstantGratPopup"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "background"

	var_6_4:setImage(RegisterMaterial("cortez_store_upsell_vault_instant_grat"), 0)
	var_6_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_6_0:addElement(var_6_4)

	var_6_0.background = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("CortezUpsellButton", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "ConfirmButton"

	var_6_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM")), 0)
	var_6_6.Text:SetAlignment(LUI.Alignment.Center)
	var_6_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 707, _1080p * 1213, _1080p * 882, _1080p * 942)
	var_6_0:addElement(var_6_6)

	var_6_0.ConfirmButton = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "CenterTextBackground"

	var_6_8:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_8:SetAlpha(0.85, 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -452, _1080p * 452, _1080p * 133, _1080p * 305)
	var_6_0:addElement(var_6_8)

	var_6_0.CenterTextBackground = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIText.new()

	var_6_10.id = "RewardText"

	var_6_10:setText(Engine.CBBHFCGDIC("INGAMESTORE_WZ335/CORTEZ_INSTANT_GRAT_TEXT"), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_10:SetAlignment(LUI.Alignment.Left)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -432, _1080p * 409, _1080p * 164, _1080p * 188)
	var_6_0:addElement(var_6_10)

	var_6_0.RewardText = var_6_10

	local var_6_11
	local var_6_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_6_1
	})

	var_6_12.id = "ButtonHelperBar"

	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1020, _1080p * 1080)
	var_6_0:addElement(var_6_12)

	var_6_0.ButtonHelperBar = var_6_12

	local var_6_13
	local var_6_14 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 4
	}
	local var_6_15 = LUI.UIBorder.new(var_6_14)

	var_6_15.id = "CenterTextBorder"

	var_6_15:SetAlpha(0.47, 0)
	var_6_15:SetBorderThicknessLeft(_1080p * 0, 0)
	var_6_15:SetBorderThicknessRight(_1080p * 0, 0)
	var_6_15:SetBorderThicknessTop(_1080p * 3, 0)
	var_6_15:SetBorderThicknessBottom(_1080p * 4, 0)
	var_6_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -452, _1080p * 452, _1080p * 133, _1080p * 305)
	var_6_0:addElement(var_6_15)

	var_6_0.CenterTextBorder = var_6_15

	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("InstantGratPopup", InstantGratPopup)
LockTable(_M)
