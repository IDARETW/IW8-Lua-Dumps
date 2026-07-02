module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2)
	assert(arg_1_2.popupTitle)
	assert(arg_1_2.itemName)
	assert(arg_1_2.itemImage)
	assert(arg_1_2.itemCount)

	if arg_1_2.openSound and #arg_1_2.openSound > 0 then
		Engine.BJDBIAGIDA(arg_1_2.openSound)
	end

	if arg_1_2.isXPReward then
		arg_1_0.Item.Name:setText(ToUpperCase(arg_1_2.itemName))
		ACTIONS.AnimateSequence(arg_1_0.Item, "ReverseNameAndIcon")
	else
		arg_1_0.Item.Name:setText(ToUpperCase(arg_1_2.itemName) .. " x " .. arg_1_2.itemCount)
	end

	if arg_1_2.itemImage ~= "" then
		arg_1_0.Item.Icon:setImage(RegisterMaterial(arg_1_2.itemImage))

		if arg_1_2.itemImageIsWide then
			ACTIONS.AnimateSequence(arg_1_0.Item, "Icon2x1")
		end
	end

	arg_1_0.Title:setText(arg_1_2.popupTitle)

	if arg_1_2.rewardDescription then
		arg_1_0.RewardDescription:setText(arg_1_2.rewardDescription)
	end

	local var_1_0 = arg_1_2.lootMessage or ""

	arg_1_0.LootMessage:setText(var_1_0)
	LUI.TextChat.SetupMenuForNoChat(arg_1_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	assert(arg_1_0.Darkener)
	assert(arg_1_0.Blur)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
	ACTIONS.ScaleFullscreen(arg_1_0.Blur)
end

function RewardPopup(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0.id = "RewardPopup"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIBlur.new()

	var_2_4.id = "Blur"

	var_2_4:SetBlurStrength(0.75, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Blur = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Darkener"

	var_2_6:SetRGBFromInt(0, 0)
	var_2_6:SetAlpha(0.8, 0)
	var_2_6:SetScale(1, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 270, _1080p * -270)
	var_2_0:addElement(var_2_6)

	var_2_0.Darkener = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "GenericPopupWindow"

	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -300, _1080p * 299)
	var_2_0:addElement(var_2_8)

	var_2_0.GenericPopupWindow = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "ButtonHelperBar"

	var_2_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_10.Background:SetAlpha(0, 0)
	var_2_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -818, _1080p * 314, _1080p * 364)
	var_2_0:addElement(var_2_10)

	var_2_0.ButtonHelperBar = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("RewardItem", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "Item"

	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * -133, _1080p * 167)
	var_2_0:addElement(var_2_12)

	var_2_0.Item = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIStyledText.new()

	var_2_14.id = "LootMessage"

	var_2_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_14:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SUPPLY_DROP_MESSAGE"), 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetAlignment(LUI.Alignment.Center)
	var_2_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -365, _1080p * 365, _1080p * 184, _1080p * 212)
	var_2_0:addElement(var_2_14)

	var_2_0.LootMessage = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIStyledText.new()

	var_2_16.id = "RewardDescription"

	var_2_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_16:setText("", 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_16:SetAlignment(LUI.Alignment.Center)
	var_2_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -199, _1080p * -171)
	var_2_0:addElement(var_2_16)

	var_2_0.RewardDescription = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIStyledText.new()

	var_2_18.id = "Title"

	var_2_18:SetRGBFromTable(SWATCHES.Popups.titleTxt, 0)
	var_2_18:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/DAILY_LOGIN_TITLE")), 0)
	var_2_18:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_2_18:SetTracking(2 * _1080p, 0)
	var_2_18:SetAlignment(LUI.Alignment.Center)
	var_2_18:SetShadowRGBFromInt(0, 0)
	var_2_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -602, _1080p * 602, _1080p * -272, _1080p * -212)
	var_2_0:addElement(var_2_18)

	var_2_0.Title = var_2_18

	local var_2_19
	local var_2_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_20.id = "ConfirmButton"

	var_2_20.Text:SetLeft(0, 0)
	var_2_20.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/THANKS"), 0)
	var_2_20.Text:SetAlignment(LUI.Alignment.Center)
	var_2_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -131, _1080p * 131, _1080p * 236, _1080p * 274)
	var_2_0:addElement(var_2_20)

	var_2_0.ConfirmButton = var_2_20

	var_2_20:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if not arg_3_1.controller then
			local var_3_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)

	function var_2_0.addButtonHelperFunction(arg_4_0, arg_4_1)
		arg_4_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_2_0:addEventHandler("menu_create", var_2_0.addButtonHelperFunction)

	local var_2_21 = LUI.UIBindButton.new()

	var_2_21.id = "selfBindButton"

	var_2_0:addElement(var_2_21)

	var_2_0.bindButton = var_2_21

	var_2_0.bindButton:addEventHandler("button_primary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("RewardPopup", RewardPopup)
LockTable(_M)
