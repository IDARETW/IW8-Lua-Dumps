module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2)
	assert(arg_1_2.popupTitle)
	assert(arg_1_2.rewardDescription)
	assert(arg_1_2.confirmText)
	assert(arg_1_2.lootData)

	if arg_1_2.openSound and #arg_1_2.openSound > 0 then
		Engine.BJDBIAGIDA(arg_1_2.openSound)
	end

	arg_1_0.LootItem:UpdateCardConfig(arg_1_2.lootData)
	arg_1_0.Title:setText(arg_1_2.popupTitle)
	arg_1_0.RewardDescription:setText(arg_1_2.rewardDescription)

	local var_1_0 = arg_1_2.lootMessage or ""

	arg_1_0.LootMessage:setText(var_1_0)
	arg_1_0.ConfirmButton.Text:setText(arg_1_2.confirmText)
	arg_1_0.ConfirmButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		if not arg_2_1.controller then
			local var_2_0 = arg_1_1
		end
	end)
	arg_1_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		10,
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	LUI.TextChat.SetupMenuForNoChat(arg_1_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	assert(arg_1_0.Darkener)
	assert(arg_1_0.Blur)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
	ACTIONS.ScaleFullscreen(arg_1_0.Blur)
end

function ChurnPopup(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0.id = "ChurnPopup"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIBlur.new()

	var_3_4.id = "Blur"

	var_3_4:SetBlurStrength(0.75, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Blur = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Darkener"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.8, 0)
	var_3_6:SetScale(1, 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 270, _1080p * -270)
	var_3_0:addElement(var_3_6)

	var_3_0.Darkener = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "PopupBackground"

	var_3_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_8:SetAlpha(0.4, 0)
	var_3_8:SetPixelGridEnabled(true)
	var_3_8:SetPixelGridContrast(0.5, 0)
	var_3_8:SetPixelGridBlockWidth(2, 0)
	var_3_8:SetPixelGridBlockHeight(2, 0)
	var_3_8:SetPixelGridGutterWidth(1, 0)
	var_3_8:SetPixelGridGutterHeight(1, 0)
	var_3_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -300, _1080p * 300)
	var_3_0:addElement(var_3_8)

	var_3_0.PopupBackground = var_3_8

	local var_3_9
	local var_3_10 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_3_11 = LUI.UIBorder.new(var_3_10)

	var_3_11.id = "CornerTopRight"

	var_3_11:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_11:SetBorderThicknessLeft(_1080p * 0, 0)
	var_3_11:SetBorderThicknessBottom(_1080p * 0, 0)
	var_3_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 825, _1080p * 855, _1080p * -300, _1080p * -270)
	var_3_0:addElement(var_3_11)

	var_3_0.CornerTopRight = var_3_11

	local var_3_12
	local var_3_13 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_3_14 = LUI.UIBorder.new(var_3_13)

	var_3_14.id = "CornerTopLeft"

	var_3_14:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_14:SetBorderThicknessRight(_1080p * 0, 0)
	var_3_14:SetBorderThicknessBottom(_1080p * 0, 0)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -825, _1080p * -300, _1080p * -270)
	var_3_0:addElement(var_3_14)

	var_3_0.CornerTopLeft = var_3_14

	local var_3_15
	local var_3_16 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_17 = LUI.UIBorder.new(var_3_16)

	var_3_17.id = "CornerBotLeft"

	var_3_17:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_17:SetBorderThicknessRight(_1080p * 0, 0)
	var_3_17:SetBorderThicknessTop(_1080p * 0, 0)
	var_3_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * -825, _1080p * 270, _1080p * 300)
	var_3_0:addElement(var_3_17)

	var_3_0.CornerBotLeft = var_3_17

	local var_3_18
	local var_3_19 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_20 = LUI.UIBorder.new(var_3_19)

	var_3_20.id = "CornerBotRight"

	var_3_20:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_20:SetBorderThicknessLeft(_1080p * 0, 0)
	var_3_20:SetBorderThicknessTop(_1080p * 0, 0)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 825, _1080p * 855, _1080p * 270, _1080p * 300)
	var_3_0:addElement(var_3_20)

	var_3_0.CornerBotRight = var_3_20

	local var_3_21
	local var_3_22 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})

	var_3_22.id = "ButtonHelperBar"

	var_3_22:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_3_22.Background:SetAlpha(0, 0)
	var_3_22:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -818, _1080p * 314, _1080p * 364)
	var_3_0:addElement(var_3_22)

	var_3_0.ButtonHelperBar = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIImage.new()

	var_3_24.id = "BotBorder"

	var_3_24:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_24:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 299, _1080p * 300)
	var_3_0:addElement(var_3_24)

	var_3_0.BotBorder = var_3_24

	local var_3_25
	local var_3_26 = LUI.UIImage.new()

	var_3_26.id = "TopBorder"

	var_3_26:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_26:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -300, _1080p * -299)
	var_3_0:addElement(var_3_26)

	var_3_0.TopBorder = var_3_26

	local var_3_27
	local var_3_28 = LUI.UIStyledText.new()

	var_3_28.id = "LootMessage"

	var_3_28:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_28:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SUPPLY_DROP_MESSAGE"), 0)
	var_3_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_28:SetAlignment(LUI.Alignment.Center)
	var_3_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -365, _1080p * 365, _1080p * 198, _1080p * 226)
	var_3_0:addElement(var_3_28)

	var_3_0.LootMessage = var_3_28

	local var_3_29
	local var_3_30 = LUI.UIStyledText.new()

	var_3_30.id = "RewardDescription"

	var_3_30:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_30:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/DAILY_LOGIN_MESSAGE"), 0)
	var_3_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_30:SetAlignment(LUI.Alignment.Center)
	var_3_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -199, _1080p * -171)
	var_3_0:addElement(var_3_30)

	var_3_0.RewardDescription = var_3_30

	local var_3_31
	local var_3_32 = LUI.UIStyledText.new()

	var_3_32.id = "Title"

	var_3_32:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_32:SetAlpha(0.7, 0)
	var_3_32:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/DAILY_LOGIN_TITLE")), 0)
	var_3_32:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_3_32:SetTracking(2 * _1080p, 0)
	var_3_32:SetAlignment(LUI.Alignment.Center)
	var_3_32:SetShadowRGBFromInt(0, 0)
	var_3_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -602, _1080p * 602, _1080p * -272, _1080p * -212)
	var_3_0:addElement(var_3_32)

	var_3_0.Title = var_3_32

	local var_3_33
	local var_3_34 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_3_1
	})

	var_3_34.id = "ConfirmButton"

	var_3_34.Text:SetLeft(0, 0)
	var_3_34.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/THANKS"), 0)
	var_3_34.Text:SetAlignment(LUI.Alignment.Center)
	var_3_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -131, _1080p * 131, _1080p * 236, _1080p * 274)
	var_3_0:addElement(var_3_34)

	var_3_0.ConfirmButton = var_3_34

	local var_3_35
	local var_3_36 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_3_1
	})

	var_3_36.id = "LootItem"

	var_3_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 858, _1080p * 1062, _1080p * 433, _1080p * 705)
	var_3_0:addElement(var_3_36)

	var_3_0.LootItem = var_3_36

	var_3_34:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)

	function var_3_0.addButtonHelperFunction(arg_5_0, arg_5_1)
		arg_5_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_3_0:addEventHandler("menu_create", var_3_0.addButtonHelperFunction)

	local var_3_37 = LUI.UIBindButton.new()

	var_3_37.id = "selfBindButton"

	var_3_0:addElement(var_3_37)

	var_3_0.bindButton = var_3_37

	var_3_0.bindButton:addEventHandler("button_primary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ChurnPopup", ChurnPopup)
LockTable(_M)
