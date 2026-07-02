module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.isQuickAccessShortcutsDisabled = true

	if arg_1_2.message then
		arg_1_0.Message:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_1_2.message)))
	end
end

function LootPurchasingPopup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "LootPurchasingPopup"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "Spinner"

	var_2_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -170, _1080p * 170, _1080p * 104, _1080p * 114)
	var_2_0:addElement(var_2_4)

	var_2_0.Spinner = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Message"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_2_6:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE")), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetWordWrap(false)
	var_2_6:SetAlignment(LUI.Alignment.Center)
	var_2_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 62, _1080p * 92)
	var_2_0:addElement(var_2_6)

	var_2_0.Message = var_2_6

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LootPurchasingPopup", LootPurchasingPopup)
LockTable(_M)
