module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.crateID)

	local var_1_0 = arg_1_2.crateID

	arg_1_0.previousMenu = arg_1_2.previousMenu

	arg_1_0:SetAlpha(1)

	local var_1_1 = 0

	arg_1_0.PurchaseButtons.PriceButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_CRATE"))
	arg_1_0.PurchaseButtons.PriceButton:processEvent({
		name = "gain_focus"
	})
	arg_1_0:SubscribeToModel(DataSources.frontEnd.MP.commerce.inGameCurrency:GetModel(arg_1_1), function(arg_2_0)
		local var_2_0 = DataModel.JJEHAEBDF(arg_2_0)
		local var_2_1

		if var_2_0 < var_1_1 then
			var_2_1 = false
		end

		if var_2_1 == false then
			arg_1_0.PurchaseButtons.PriceButton.CurrencyImage:SetRGBFromTable(SWATCHES.Reticles.DarkRed)
			arg_1_0.PurchaseButtons.PriceButton.Cost:SetRGBFromTable(SWATCHES.Reticles.DarkRed)
			arg_1_0.PurchaseButtons.PriceButton:SetButtonDisabled(true)
			arg_1_0.PurchaseButtons.PriceButton:SetMouseFocusBlocker(true)
		end
	end)
	;(function()
		arg_1_0.PurchaseButtons.PriceButton:processEvent({
			name = "gain_focus"
		})
	end)()
	arg_1_0.PurchaseButtons.PriceButton.Cost:setText(var_1_1)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function MPDepotMenuBillboardPurchaseConfirm(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "MPDepotMenuBillboardPurchaseConfirm"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Darkener"

	var_4_4:SetRGBFromInt(0, 0)
	var_4_4:SetAlpha(0.9, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Darkener = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "ButtonHelperBar"

	var_4_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -664, _1080p * 664, _1080p * 295, _1080p * 365)
	var_4_0:addElement(var_4_6)

	var_4_0.ButtonHelperBar = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "GenericPopupWindow"

	var_4_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -255, _1080p * 295)
	var_4_0:addElement(var_4_8)

	var_4_0.GenericPopupWindow = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "ItemImage"

	var_4_10:SetScale(-0.25, 0)
	var_4_10:setImage(RegisterMaterial("placeholder_x"), 0)
	var_4_10:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 160, _1080p * 672, _1080p * -234, _1080p * 278)
	var_4_0:addElement(var_4_10)

	var_4_0.ItemImage = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "ItemDescription"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1600, _1080p * 426, _1080p * 486)
	var_4_0:addElement(var_4_12)

	var_4_0.ItemDescription = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "PurchaseInfoLabel"

	var_4_14:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1600, _1080p * 490, _1080p * 514)
	var_4_0:addElement(var_4_14)

	var_4_0.PurchaseInfoLabel = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "PlayerDetails"

	var_4_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
	var_4_0:addElement(var_4_16)

	var_4_0.PlayerDetails = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("BillboardPurchaseCrateButtons", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "PurchaseButtons"

	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1150, _1080p * 552, _1080p * 642)
	var_4_0:addElement(var_4_18)

	var_4_0.PurchaseButtons = var_4_18

	function var_4_6.addButtonHelperFunction(arg_5_0, arg_5_1)
		arg_5_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_5_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	local var_4_19 = LUI.UIBindButton.new()

	var_4_19.id = "ButtonHelperBarBindButton"

	var_4_6:addElement(var_4_19)

	var_4_6.bindButton = var_4_19

	var_4_6.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)

	function var_4_0.addButtonHelperFunction(arg_7_0, arg_7_1)
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_7_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_4_0:addEventHandler("menu_create", var_4_0.addButtonHelperFunction)

	local var_4_20 = LUI.UIBindButton.new()

	var_4_20.id = "selfBindButton"

	var_4_0:addElement(var_4_20)

	var_4_0.bindButton = var_4_20

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_4_0.bindButton:addEventHandler("button_primary", function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1.controller or var_4_1

		ACTIONS.OpenMenu("MENU/CONFIRM_SELECTION", true, var_9_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MPDepotMenuBillboardPurchaseConfirm", MPDepotMenuBillboardPurchaseConfirm)
LockTable(_M)
