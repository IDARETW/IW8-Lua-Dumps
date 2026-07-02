module(..., package.seeall)

local var_0_0 = {
	rarityOdds = 2,
	crateContents = 1
}
local var_0_1 = {
	CRATE_OPEN = 1366,
	CRATE_DROP = 1533
}

local function var_0_2(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.crateID)

	local var_1_0 = arg_1_2.crateID

	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_CRATE"))
	Engine.DHFCHIIJCA("quartermaster_detail")
	arg_1_0:SetAlpha(0)
	FrontEndScene.SetCharacterVisible(FrontEndScene.ClientCharacters.QuartermasterCrate, true)
	FrontEndScene.SetCharacterVisible(FrontEndScene.ClientCharacters.QuartermasterTarget1, true)
	FrontEndScene.SetCharacterVisible(FrontEndScene.ClientCharacters.QuartermasterTarget2, true)
	FrontEndScene.SetCharacterVisible(FrontEndScene.ClientCharacters.QuartermasterTarget3, true)
	MenuUtils.SetupSceneChangeCallback(arg_1_0, function()
		ClientCharacter.CAECDIHFCF(FrontEndScene.ClientCharacters.QuartermasterCrate, "mp_military_carepackage_landing")

		arg_1_0:Wait(var_0_1.CRATE_DROP).onComplete = function()
			arg_1_0:SetAlpha(1, 500)
		end
	end)

	if CONDITIONS.AreCODPointsEnabled(arg_1_0) then
		arg_1_0.CPButton.navigation = {}
		arg_1_0.CPButton.navigation.right = arg_1_0.AltCurrencyButton
		arg_1_0.AltCurrencyButton.navigation = {}
		arg_1_0.AltCurrencyButton.navigation.left = arg_1_0.CPButton
	else
		arg_1_0.AltCurrencyButton:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 760, _1080p * 1160, _1080p * 828, _1080p * 908)
	end

	local var_1_1 = {}
	local var_1_2 = {}
	local var_1_3 = {}

	assert(#var_1_1 == #var_1_2 and #var_1_2 == #var_1_3)

	local var_1_4 = -1
	local var_1_5 = -1
	local var_1_6 = -1

	for iter_1_0 = 1, #var_1_3 do
		if tonumber(var_1_3[iter_1_0]) == 20 then
			var_1_4 = iter_1_0
		end

		if tonumber(var_1_3[iter_1_0]) == 12 then
			var_1_6 = iter_1_0
		end

		if tonumber(var_1_3[iter_1_0]) == 11 then
			var_1_5 = iter_1_0
		end
	end

	local var_1_7 = 0

	if var_1_4 ~= -1 then
		var_1_7 = tonumber(var_1_1[var_1_4])
	end

	local var_1_8 = 0

	if var_1_5 ~= -1 then
		var_1_8 = tonumber(var_1_1[var_1_5]) / 100
	end

	local var_1_9 = 0

	if var_1_6 ~= -1 then
		var_1_8 = tonumber(var_1_1[var_1_6])
	end

	function arg_1_0.NumberOfItems.UpdatePrice(arg_4_0)
		if CONDITIONS.AreCODPointsEnabled(arg_1_0) then
			arg_1_0.CPButton.Amount:setText(var_1_7 * arg_4_0)
		end

		arg_1_0.AltCurrencyButton.Amount:setText(var_1_8 * arg_4_0)
	end

	arg_1_0._rarityInfoSelected = var_0_0.crateContents

	arg_1_0.bindButton:addEventHandler("button_alt1", function(arg_5_0, arg_5_1)
		if arg_1_0._rarityInfoSelected == var_0_0.crateContents then
			arg_1_0.CrateContents:SetAlpha(0)
			arg_1_0.RarityOdds:SetAlpha(1)

			arg_1_0._rarityInfoSelected = var_0_0.rarityOdds
		else
			arg_1_0.CrateContents:SetAlpha(1)
			arg_1_0.RarityOdds:SetAlpha(0)

			arg_1_0._rarityInfoSelected = var_0_0.crateContents
		end
	end)
	arg_1_0.AltCurrencyButton.Amount:setText(var_1_8)

	if CONDITIONS.AreCODPointsEnabled(arg_1_0) then
		arg_1_0.bindButton:addEventHandler("button_alt2", function(arg_6_0, arg_6_1)
			ACTIONS.OpenMenu("Store", true, arg_1_1)
		end)
		arg_1_0.HelperBar:AddButtonHelperTextToElement(arg_1_0, {
			kbm_only = true,
			side = "left",
			priority = 1,
			button_ref = "button_alt2",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_COD_POINTS")
		})
		arg_1_0.CPButton.Amount:setText(var_1_7)

		if var_1_4 ~= -1 then
			arg_1_0.CPButton:addEventHandler("button_action", function(arg_7_0, arg_7_1)
				LootCrates.CAHBCECFJD(arg_1_1, var_1_2[var_1_4], 1, var_1_0)

				local var_7_0 = {
					cratePopupType = STORE.CratePopupType.PURCHASE
				}

				LUI.FlowManager.RequestPopupMenu(nil, "popup_handle_lootcrate", true, arg_1_1, false, var_7_0)
			end)
		elseif var_1_6 ~= -1 then
			arg_1_0.CPButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
				LootCrates.CAHBCECFJD(arg_1_1, var_1_2[var_1_6], 1, var_1_0)

				local var_8_0 = {
					cratePopupType = STORE.CratePopupType.PURCHASE
				}

				LUI.FlowManager.RequestPopupMenu(nil, "popup_handle_lootcrate", true, arg_1_1, false, var_8_0)
			end)
		end
	end

	arg_1_0.AltCurrencyButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		LootCrates.CAHBCECFJD(arg_1_1, var_1_2[var_1_5], 1, var_1_0)

		local var_9_0 = {
			cratePopupType = STORE.CratePopupType.PURCHASE
		}

		LUI.FlowManager.RequestPopupMenu(nil, "popup_handle_lootcrate", true, arg_1_1, false, var_9_0)
	end)
	arg_1_0.OpenCrateButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		if Loot.DEBEIFJEEG(arg_1_1, var_1_0) then
			LootCrates.JCIAFIEFJ(arg_1_1, var_1_0)

			local var_10_0 = {
				cratePopupType = STORE.CratePopupType.OPEN
			}

			LUI.FlowManager.RequestPopupMenu(nil, "popup_handle_lootcrate", true, arg_1_1, false, var_10_0)
		end
	end)
	;(function()
		local var_11_0 = Loot.DEBEIFJEEG(arg_1_1, var_1_0)
		local var_11_1 = var_11_0 > 0

		if var_11_1 then
			arg_1_0.AltCurrencyButton:processEvent({
				name = "lose_focus"
			})
			arg_1_0.OpenCrateButton:SetAlpha(1)
			arg_1_0.OpenCrateButton:processEvent({
				name = "gain_focus"
			})

			arg_1_0.OpenCrateButton.navigation = {}

			if CONDITIONS.AreCODPointsEnabled(arg_1_0) then
				arg_1_0.CPButton:processEvent({
					name = "lose_focus"
				})

				arg_1_0.OpenCrateButton.navigation.right = arg_1_0.CPButton
				arg_1_0.CPButton.navigation.left = arg_1_0.OpenCrateButton
			else
				arg_1_0.OpenCrateButton.navigation.right = arg_1_0.AltCurrencyButton
			end
		else
			arg_1_0.OpenCrateButton:SetAlpha(0)

			if CONDITIONS.AreCODPointsEnabled(arg_1_0) then
				arg_1_0.CPButton:processEvent({
					name = "gain_focus"
				})
			else
				arg_1_0.AltCurrencyButton:processEvent({
					name = "gain_focus"
				})
			end
		end

		arg_1_0.OpenCrateButton:SetButtonDisabled(not var_11_1)
		arg_1_0.OpenCrateButton:SetMouseFocusBlocker(not var_11_1)
		arg_1_0.OpenCrateButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/OPEN_CRATES_COUNT", var_11_0))
	end)()

	local function var_1_10(arg_12_0, arg_12_1)
		if CONDITIONS.AreCODPointsEnabled() then
			if LUI.IsLastInputKeyboardMouse(arg_12_1.controllerIndex) then
				arg_12_0.MuteAllButtonIcon:SetAlpha(0)
				arg_12_0.MuteAllLabel:SetAlpha(0)
			else
				arg_12_0.MuteAllButtonIcon:SetAlpha(1)
				arg_12_0.MuteAllLabel:SetAlpha(1)
			end
		end
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_10, {
		controllerIndex = arg_1_1
	})
end

function PurchaseItemMenu(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0.id = "PurchaseItemMenu"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	var_13_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_13_1
	})
	var_13_0.HelperBar.id = "HelperBar"

	var_13_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_13_0.HelperBar:setPriority(10)
	var_13_0:addElement(var_13_0.HelperBar)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "MenuTitle"

	var_13_4.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_CRATE")), 0)
	var_13_4.Line:SetLeft(0, 0)
	var_13_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_4)

	var_13_0.MenuTitle = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("BasicCurrencies", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "Currencies"

	var_13_6:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -500, 0, _1080p * 54, _1080p * 104)
	var_13_0:addElement(var_13_6)

	var_13_0.Currencies = var_13_6

	local var_13_7
	local var_13_8 = MenuBuilder.BuildRegisteredType("NumberOfItems", {
		controllerIndex = var_13_1
	})

	var_13_8.id = "NumberOfItems"

	var_13_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * 700, _1080p * 828)
	var_13_0:addElement(var_13_8)

	var_13_0.NumberOfItems = var_13_8

	local var_13_9

	if CONDITIONS.AreCODPointsEnabled(var_13_0) then
		local var_13_10 = MenuBuilder.BuildRegisteredType("PriceButton", {
			controllerIndex = var_13_1
		})

		var_13_10.id = "CPButton"

		var_13_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 760, _1080p * 1160, _1080p * 828, _1080p * 908)
		var_13_0:addElement(var_13_10)

		var_13_0.CPButton = var_13_10
	end

	local var_13_11
	local var_13_12 = MenuBuilder.BuildRegisteredType("PriceButton", {
		controllerIndex = var_13_1
	})

	var_13_12.id = "AltCurrencyButton"

	var_13_12.Currency:setImage(RegisterMaterial("currency_keys_icon"), 0)
	var_13_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1192, _1080p * 1592, _1080p * 828, _1080p * 908)
	var_13_0:addElement(var_13_12)

	var_13_0.AltCurrencyButton = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "OpenCrateButton"

	var_13_14.Text:setText("", 0)
	var_13_14.Text:SetAlignment(LUI.Alignment.Center)
	var_13_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -650, _1080p * -230, _1080p * 848, _1080p * 888)
	var_13_0:addElement(var_13_14)

	var_13_0.OpenCrateButton = var_13_14

	local var_13_15

	if CONDITIONS.AreCODPointsEnabled(var_13_0) then
		local var_13_16 = LUI.UIText.new()

		var_13_16.id = "MuteAllLabel"

		var_13_16:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PURCHASE_COD_POINTS"), 0)
		var_13_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_13_16:SetAlignment(LUI.Alignment.Left)
		var_13_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 713, _1080p * 960, _1080p * 920, _1080p * 942)
		var_13_0:addElement(var_13_16)

		var_13_0.MuteAllLabel = var_13_16
	end

	local var_13_17

	if CONDITIONS.AreCODPointsEnabled(var_13_0) then
		local var_13_18 = LUI.UIImage.new()

		var_13_18.id = "MuteAllButtonIcon"

		var_13_18:setImage(RegisterMaterial("button_alt2"), 0)
		var_13_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 680, _1080p * 705, _1080p * 920, _1080p * 945)
		var_13_0:addElement(var_13_18)

		var_13_0.MuteAllButtonIcon = var_13_18
	end

	local var_13_19
	local var_13_20 = LUI.UIImage.new()

	var_13_20.id = "RarityIcon"

	var_13_20:SetRGBFromTable(SWATCHES.itemRarity.quality1, 0)
	var_13_20:setImage(RegisterMaterial("icon_item_quality_2"), 0)
	var_13_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 196, _1080p * 154, _1080p * 254)
	var_13_0:addElement(var_13_20)

	var_13_0.RarityIcon = var_13_20

	local var_13_21
	local var_13_22 = LUI.UIText.new()

	var_13_22.id = "CrateName"

	var_13_22:setText("", 0)
	var_13_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_22:SetAlignment(LUI.Alignment.Left)
	var_13_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 213, _1080p * 1122, _1080p * 144, _1080p * 204)
	var_13_0:addElement(var_13_22)

	var_13_0.CrateName = var_13_22

	local var_13_23
	local var_13_24 = LUI.UIText.new()

	var_13_24.id = "CrateDesc"

	var_13_24:setText("", 0)
	var_13_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_13_24:SetAlignment(LUI.Alignment.Left)
	var_13_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 196, _1080p * 917, _1080p * 204, _1080p * 232)
	var_13_0:addElement(var_13_24)

	var_13_0.CrateDesc = var_13_24

	local var_13_25
	local var_13_26 = MenuBuilder.BuildRegisteredType("CrateContents", {
		controllerIndex = var_13_1
	})

	var_13_26.id = "CrateContents"

	var_13_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 646, _1080p * 270, _1080p * 540)
	var_13_0:addElement(var_13_26)

	var_13_0.CrateContents = var_13_26

	local var_13_27
	local var_13_28 = MenuBuilder.BuildRegisteredType("RarityOdds", {
		controllerIndex = var_13_1
	})

	var_13_28.id = "RarityOdds"

	var_13_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 646, _1080p * 270, _1080p * 815)
	var_13_0:addElement(var_13_28)

	var_13_0.RarityOdds = var_13_28

	local var_13_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_28:RegisterAnimationSequence("DefaultSequence", var_13_29)

	local function var_13_30()
		var_13_28:AnimateSequence("DefaultSequence")
	end

	var_13_0._sequences.DefaultSequence = var_13_30

	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_13_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt1",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SEE_RARITY")
	})

	local var_13_31 = LUI.UIBindButton.new()

	var_13_31.id = "selfBindButton"

	var_13_0:addElement(var_13_31)

	var_13_0.bindButton = var_13_31

	var_13_0.bindButton:addEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_13_1
		end

		ACTIONS.LeaveMenu(var_13_0)
	end)
	var_0_2(var_13_0, var_13_1, arg_13_1)
	ACTIONS.AnimateSequence(var_13_0, "DefaultSequence")

	return var_13_0
end

MenuBuilder.registerType("PurchaseItemMenu", PurchaseItemMenu)
LockTable(_M)
