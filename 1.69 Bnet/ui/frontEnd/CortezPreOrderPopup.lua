module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("CortezPreOrderPopup", {
	"store",
	"fenceSpinner",
	"exchange"
})

local var_0_0 = {
	[STORE.CortezVaultID] = {
		animation = "TabVaultEdition",
		productId = STORE.CortezVaultID,
		tabName = Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_VAULT_TITLE")
	},
	[STORE.CortezStandardID] = {
		animation = "TabStandardEdition",
		productId = STORE.CortezStandardID,
		tabName = Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_STANDARD_TITLE")
	},
	[STORE.CortezAltID] = {
		productId = STORE.CortezAltID,
		tabName = Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_ALT_TITLE"),
		animation = CONDITIONS.IsSony() and "TabAltEditionSony" or "TabAltEditionXbox"
	},
	[STORE.CortezUpgradeToUltimateID] = {
		animation = "TabVaultEdition",
		productId = STORE.CortezUpgradeToUltimateID,
		tabName = Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_VAULT_TITLE")
	}
}
local var_0_1 = {
	STORE.CortezVaultID,
	STORE.CortezUpgradeToUltimateID,
	STORE.CortezAltID,
	STORE.CortezStandardID
}

local function var_0_2()
	return Dvar.CFHDGABACF("NOSQLRPRKO") ~= 1 and true or false
end

local function var_0_3(arg_2_0)
	if (var_0_0[STORE.CortezVaultID].product and var_0_0[STORE.CortezVaultID].product.owned or false) and arg_2_0._selectedTab == STORE.CortezVaultID and var_0_2() then
		return true
	end

	return false
end

local function var_0_4(arg_3_0, arg_3_1)
	if var_0_3(arg_3_0) then
		LUI.FlowManager.RequestPopupMenu(arg_3_0, "InstantGratPopup", true, arg_3_1, false)
	end
end

local function var_0_5(arg_4_0, arg_4_1)
	for iter_4_0 = 1, #arg_4_0.Tabs._tabs do
		local var_4_0 = arg_4_0.Tabs:GetTabAtIndex(iter_4_0)
		local var_4_1 = "UnFocused"

		var_4_0:SetTabSelected(false, var_4_1, {
			ignoreTheming = true
		})
	end

	arg_4_0._selectedTab = arg_4_1.productId
	var_0_0[arg_4_0._selectedTab].itemIndex = arg_4_1.itemIndex

	local var_4_2 = var_0_0[arg_4_0._selectedTab]
	local var_4_3 = arg_4_0.Tabs:GetTabAtIndex(arg_4_1.itemIndex)
	local var_4_4 = "Focused"

	var_4_3:SetTabSelected(true, var_4_4, {
		ignoreTheming = true
	})
	arg_4_0:SetPageAnimationState(var_4_2)

	local var_4_5 = var_4_2.product and var_4_2.product.price or ""
	local var_4_6 = var_4_2.product and var_4_2.product.owned or false

	if Dvar.IBEGCHEFE(MAIN_MENU.PSVaultOwnershipFixKillswitchDvar) then
		arg_4_0.PreOrderButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_PRICE", Engine.JCBDICCAH(var_4_5)))

		if not var_4_6 then
			arg_4_0.PreOrderButton:SetAlpha(1)
			arg_4_0.OwnedText:SetAlpha(0)
		else
			arg_4_0.PreOrderButton:SetAlpha(0)
			arg_4_0.OwnedText:SetAlpha(1)
		end
	else
		arg_4_0.OwnedText:SetAlpha(0)

		if var_4_6 then
			ACTIONS.AnimateSequence(arg_4_0.PreOrderButton, "ButtonDisabled")
			arg_4_0.PreOrderButton.Text:setText(Engine.CBBHFCGDIC("MENU/OWNED_CAPS"))
		else
			ACTIONS.AnimateSequence(arg_4_0.PreOrderButton, "ButtonUp")
			arg_4_0.PreOrderButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/BUY_NOW_PRICE", Engine.JCBDICCAH(var_4_5)))
		end
	end

	if var_0_3(arg_4_0) then
		arg_4_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_r3",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("INGAMESTORE_WZ335/CORTEZ_INSTANT_GRAT_VIEW_TEXT")
		})
	else
		arg_4_0.ButtonHelperBar.ButtonHelperText:RemoveButtonPrompt("button_r3")
	end

	local var_4_7 = LUI.FlowManager.GetMenuByName("MPStore")

	if var_4_7 and var_4_7.menu then
		var_4_7.menu._scoped.restoreFocusProduct = arg_4_0._selectedTab
	end
end

local function var_0_6(arg_5_0)
	local var_5_0 = Engine.CEAEFCAGJG()

	if Dvar.CFHDGABACF("ui_cortez_preorder_state_force_japan") == 1 then
		var_5_0 = AssetRegion.Japan
	end

	local var_5_1 = CONDITIONS.IsPC()
	local var_5_2 = CONDITIONS.IsSony()
	local var_5_3 = CONDITIONS.IsXbox()

	if Dvar.CFHDGABACF("ui_cortez_preorder_state_force_ps") == 1 then
		var_5_1 = false
		var_5_2 = true
		var_5_3 = false
	end

	if Dvar.CFHDGABACF("ui_cortez_preorder_state_force_xbox") == 1 then
		var_5_1 = false
		var_5_2 = false
		var_5_3 = true
	end

	local var_5_4 = Dvar.CFHDGABACF("NPPPQTQTOK")
	local var_5_5 = ""

	if var_5_0 == AssetRegion.Japan then
		var_5_5 = var_5_1 and "CORTEZ_STANDARD_EDITION_CONTENTS_JAPAN_ONLY" or "CORTEZ_ALT_EDITION_CONTENTS_CONSOLES_JAPAN_ONLY"
	elseif var_5_1 then
		var_5_5 = "CORTEZ_STANDARD_EDITION_CONTENTS"
	elseif var_5_2 then
		var_5_5 = "CORTEZ_ALT_EDITION_CONTENTS_SONY"
	elseif var_5_3 then
		var_5_5 = "CORTEZ_ALT_EDITION_CONTENTS_XBOX"
	end

	if var_5_4 == nil or var_5_4 == 0 then
		var_5_5 = "LUA_MENU_WZ335/" .. var_5_5
	elseif var_5_4 == 1 then
		var_5_5 = "LUA_MENU_WZ335/" .. var_5_5 .. "_CHANGE_01"
	elseif var_5_4 == 2 then
		var_5_5 = "LUA_MENU_WZ350/" .. var_5_5 .. "_CHANGE_02"
	elseif var_5_4 == 3 then
		var_5_5 = "LUA_MENU_WZ350/" .. var_5_5 .. "_CHANGE_03"
	elseif var_5_4 == 4 then
		var_5_5 = "LUA_MENU_WZ350/" .. var_5_5 .. "_CHANGE_04"
	elseif var_5_4 == 5 then
		if var_5_2 then
			var_5_5 = "LUA_MENU_WZ355/CORTEZ_ALT_EDITION_CONTENTS_SONY_CHANGE_05"
		elseif var_5_3 then
			var_5_5 = "LUA_MENU_WZ355/CORTEZ_ALT_EDITION_CONTENTS_XBOX_CHANGE_05"
		else
			var_5_5 = "LUA_MENU_WZ350/" .. var_5_5 .. "_CHANGE_04"
		end
	elseif var_5_4 == 6 then
		var_5_5 = "LUA_MENU_WZ355/CORTEZ_STANDARD_AND_ALT_EDITION_CONTENTS_CHANGE_06"

		arg_5_0.VaultContentsDesc:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ355/CORTEZ_VAULT_EDITION_CONTENTS_CHANGE_06"))
	end

	arg_5_0.ContentsDesc:setText(Engine.CBBHFCGDIC(var_5_5))
end

local function var_0_7(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.animation

	ACTIONS.AnimateSequence(arg_6_0, var_6_0)
	var_0_6(arg_6_0)
end

local function var_0_8(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {}

	for iter_7_0 = 1, #var_0_1 do
		local var_7_1 = var_0_0[var_0_1[iter_7_0]]

		if var_0_0[var_7_1.productId].isAvailable then
			table.insert(var_7_0, {
				disabled = false,
				name = var_0_0[var_7_1.productId].tabName,
				hasDefaultFocus = arg_7_0._defaultProductId == var_7_1.productId or false,
				tabHeight = _1080p * 52,
				animation = var_7_1.animation,
				productId = var_7_1.productId,
				focusFunction = function(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
					arg_7_0:SwitchToTab(var_7_1)
				end
			})
		end
	end

	arg_7_0.Tabs:SetTabs(var_7_0)
	arg_7_0.Tabs:SetAlignment(LUI.Alignment.Center)
end

local function var_0_9(arg_9_0, arg_9_1)
	arg_9_0.PreOrderButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		arg_9_0:OnPreOrderButtonClicked(arg_10_1)
	end)
	ACTIONS.AnimateSequence(arg_9_0.PreOrderButton, "Glint")
	arg_9_0.PreOrderButton:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		ACTIONS.AnimateSequence(arg_9_0.PreOrderButton, "ButtonOver")
	end)
	arg_9_0.PreOrderButton:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		ACTIONS.AnimateSequence(arg_9_0.PreOrderButton, "ButtonUp")
	end)
	arg_9_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(true)
	end
end

local function var_0_10(arg_13_0, arg_13_1)
	if arg_13_0._selectedTab then
		local var_13_0 = var_0_0[arg_13_0._selectedTab]

		if not Dvar.IBEGCHEFE(MAIN_MENU.PSVaultOwnershipFixKillswitchDvar) and var_13_0.product and var_13_0.product.owned then
			return
		end

		local var_13_1 = var_13_0.productId

		METRICS.RecordCortezBuyNowClicked(arg_13_1.controller, var_13_1)
		InGameStore.SelectProduct(arg_13_1.controller, var_13_1, InGameStorePurchaseType.BROWSE)
	end
end

local function var_0_11()
	local var_14_0 = {
		message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE")
	}

	LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_14_0, nil, false, true)
end

local function var_0_12(arg_15_0, arg_15_1)
	local var_15_0 = false
	local var_15_1 = {}
	local var_15_2 = InGameStore.GetProduct(arg_15_1, STORE.CortezStandardID)
	local var_15_3 = InGameStore.GetProduct(arg_15_1, STORE.CortezVaultID)
	local var_15_4 = InGameStore.GetProduct(arg_15_1, STORE.CortezAltID)
	local var_15_5 = InGameStore.GetProduct(arg_15_1, STORE.CortezUpgradeToUltimateID)

	if var_15_2 then
		var_15_2.owned = var_15_2 and var_15_2.status ~= InGameStoreProductStatus.NOT_OWNED or var_15_3 and var_15_3.owned or false
		var_0_0[STORE.CortezStandardID].product = var_15_2
	end

	if var_15_3 then
		var_15_3.owned = var_15_3 and var_15_3.status ~= InGameStoreProductStatus.NOT_OWNED or false
		var_0_0[STORE.CortezVaultID].product = var_15_3
	end

	if var_15_4 then
		var_15_4.owned = var_15_4 and var_15_4.status ~= InGameStoreProductStatus.NOT_OWNED or false
		var_0_0[STORE.CortezAltID].product = var_15_4
	end

	if var_15_5 then
		var_15_5.owned = var_15_5 and var_15_5.status ~= InGameStoreProductStatus.NOT_OWNED or false
		var_0_0[STORE.CortezUpgradeToUltimateID].product = var_15_5
	end

	local var_15_6 = 1

	for iter_15_0 = 1, #var_0_1 do
		local var_15_7 = var_0_0[var_0_1[iter_15_0]]

		if var_15_7.isAvailable then
			var_15_7.itemIndex = var_15_6
			var_15_7.isFirstParty = true
			var_15_7.image = var_15_7.image == "" and "placeholder_x" or var_15_7.image
			var_15_7.leavePartyAndLobbyOnPurchase = arg_15_0._leavePartyAndLobbyOnPurchase

			table.insert(var_15_1, var_15_7)

			var_15_0 = true
			var_15_6 = var_15_6 + 1
		end
	end

	if var_15_0 then
		var_0_8(arg_15_0, arg_15_1, var_15_1)
	else
		var_0_11()
		assert(false, "CortezPreOrderPopup - SetupData - No item added, leaving the menu!")
		ACTIONS.LeaveMenu(arg_15_0)
	end
end

local function var_0_13(arg_16_0, arg_16_1)
	InGameStore.FetchCatalog(arg_16_1, true, true)

	local var_16_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "cortez_preorder_update_fetching_store",
			controllerIndex = arg_16_1
		}
	})

	var_16_0.id = "fetchingTimer"

	arg_16_0:addElement(var_16_0)

	arg_16_0._fetchingTimer = var_16_0

	arg_16_0:registerEventHandler("cortez_preorder_update_fetching_store", function(arg_17_0, arg_17_1)
		local var_17_0 = false
		local var_17_1 = InGameStore.GetCatalogStatus(arg_16_1)

		if var_17_1 == InGameStoreCatalogStatus.READY then
			ACTIONS.AnimateSequence(arg_16_0, "ShowAll")
			var_0_12(arg_16_0, arg_16_1)
			var_0_9(arg_16_0, arg_16_1)

			var_17_0 = true
		elseif var_17_1 == InGameStoreCatalogStatus.ERROR then
			var_17_0 = true

			local var_17_2 = {}

			if Engine.DBFCJBDJEC() then
				local var_17_3 = Engine.BIAFEJHHDD()

				if var_17_3 ~= nil then
					local var_17_4 = Engine.JCBDICCAH(var_17_3)

					var_17_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_17_4)

					Engine.DCFIDJGACA()
				else
					var_17_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_17_5 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				var_17_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_17_5)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_17_2, nil, false, true)
			Engine.DHCGHHBHCH()
			LUI.FlowManager.RequestLeaveMenu(arg_17_0)
		end

		if var_17_0 then
			arg_17_0._fetchingTimer:closeTree()

			arg_17_0._fetchingTimer = nil

			arg_17_0._maxTimeToFetchTimer:closeTree()

			arg_17_0._maxTimeToFetchTimer = nil
		end
	end)

	local var_16_1 = Dvar.CFHDGABACF("lui_max_time_to_fetch_in_game_store_catalog") or 5000
	local var_16_2 = LUI.UITimer.new({
		interval = var_16_1,
		event = {
			name = "cortez_max_time_to_fetch_store",
			controllerIndex = arg_16_1
		}
	})

	var_16_2.id = "maxTimeToFetchTimer"

	arg_16_0:addElement(var_16_2)

	arg_16_0._maxTimeToFetchTimer = var_16_2

	arg_16_0:registerEventHandler("cortez_max_time_to_fetch_store", function(arg_18_0, arg_18_1)
		var_0_11()
		LUI.FlowManager.RequestLeaveMenu(arg_18_0)
		arg_18_0._fetchingTimer:closeTree()

		arg_18_0._fetchingTimer = nil

		arg_18_0._maxTimeToFetchTimer:closeTree()

		arg_18_0._maxTimeToFetchTimer = nil
	end)
end

local function var_0_14()
	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end
end

local function var_0_15(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.SetPageAnimationState = var_0_7
	arg_20_0.SwitchToTab = var_0_5
	arg_20_0.OnPreOrderButtonClicked = var_0_10
	arg_20_0._tabsData = {}
	arg_20_0._selectedTab = STORE.CortezVaultID
	arg_20_0._defaultProductId = arg_20_2.defaultProductId and arg_20_2.defaultProductId or STORE.CortezVaultID
	arg_20_0._controllerIndex = arg_20_1

	if arg_20_2 and arg_20_2.cortezEntryPointMenu then
		METRICS.RecordCortezMenuOpeningFlow(arg_20_1, arg_20_2.cortezEntryPointMenu)
	end

	var_0_0[STORE.CortezStandardID].isAvailable = CONDITIONS.IsPC()
	var_0_0[STORE.CortezVaultID].isAvailable = CONDITIONS.IsConsoleGame() and true or not MAIN_MENU.IsUpgradeToUltimateAvailable(arg_20_1)
	var_0_0[STORE.CortezAltID].isAvailable = CONDITIONS.IsConsoleGame()
	var_0_0[STORE.CortezUpgradeToUltimateID].isAvailable = CONDITIONS.IsPC() and MAIN_MENU.IsUpgradeToUltimateAvailable(arg_20_1)

	arg_20_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_20_0 = LUI.UIBindButton.new()

	var_20_0.id = "selfBindButton"

	arg_20_0:addElement(var_20_0)

	arg_20_0._bindButton = var_20_0

	arg_20_0._bindButton:registerEventHandler("button_secondary", function(arg_21_0, arg_21_1)
		ACTIONS.LeaveMenu(arg_20_0)
	end)
	arg_20_0._bindButton:registerEventHandler("button_right_stick", function(arg_22_0, arg_22_1)
		var_0_4(arg_20_0, arg_22_1.controller)
	end)
	ACTIONS.AnimateSequence(arg_20_0, "HideAll")
	var_0_13(arg_20_0, arg_20_1)

	local var_20_1, var_20_2, var_20_3, var_20_4 = MAIN_MENU.GetCortezProductOwned(arg_20_1, true)
	local var_20_5 = CONDITIONS.IsPC() and STORE.CortezStandardID or STORE.CortezAltID

	var_0_0[var_20_5].product = var_20_1

	if var_20_3 then
		var_0_0[STORE.CortezUpgradeToUltimateID].product = var_20_2
	else
		var_0_0[STORE.CortezVaultID].product = var_20_2
	end

	arg_20_0:addEventHandler("ingamestore_purchased_product", function(arg_23_0, arg_23_1)
		if arg_23_1.transactionResult == STORE.TransactionResult.TRANSACTION_SUCCEEDED then
			local var_23_0 = arg_20_0._selectedTab

			if arg_20_0._selectedTab == STORE.CortezVaultID then
				var_0_0[STORE.CortezVaultID].isAvailable = true
				var_23_0 = STORE.CortezVaultID

				if var_0_2() then
					LUI.FlowManager.RequestPopupMenu(arg_20_0, "InstantGratPopup", true, arg_23_1.controller, false)
				end
			elseif arg_20_0._selectedTab == STORE.CortezStandardID then
				var_0_0[STORE.CortezVaultID].isAvailable = false
				var_0_0[STORE.CortezUpgradeToUltimateID].isAvailable = true
				var_23_0 = STORE.CortezStandardID
			elseif arg_20_0._selectedTab == STORE.CortezAltID then
				var_0_0[STORE.CortezAltID].isAvailable = true
				var_23_0 = STORE.CortezAltID
			elseif arg_20_0._selectedTab == STORE.CortezUpgradeToUltimateID then
				var_0_0[STORE.CortezVaultID].isAvailable = true
				var_0_0[STORE.CortezUpgradeToUltimateID].isAvailable = false
				var_23_0 = STORE.CortezVaultID

				if var_0_2() then
					LUI.FlowManager.RequestPopupMenu(arg_20_0, "InstantGratPopup", true, arg_23_1.controller, false)
				end
			end

			arg_20_0._defaultProductId = var_23_0

			var_0_12(arg_20_0, arg_20_1)
			arg_20_0.PreOrderButton:SetAlpha(0)
			arg_20_0.OwnedText:SetAlpha(1)
		end
	end)
	arg_20_0:addEventHandler("menu_close", function(arg_24_0, arg_24_1)
		arg_24_0:dispatchEventToRoot({
			immediate = true,
			name = "update_cortez_blade_anim"
		})
	end)

	if Engine.HDGDBCJFG() then
		if CONDITIONS.IsSony() then
			ACTIONS.AnimateSequence(arg_20_0, "SonyConfig")
		else
			ACTIONS.AnimateSequence(arg_20_0, "XboxConfig")
		end
	end

	ACTIONS.ScaleFullscreen(arg_20_0.Background)
	ACTIONS.ScaleFullscreen(arg_20_0.PopupBackgroundLadingBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_20_0.ButtonHelperBar)
end

function CortezPreOrderPopup(arg_25_0, arg_25_1)
	local var_25_0 = LUI.UIElement.new()

	var_25_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_25_0.id = "CortezPreOrderPopup"
	var_25_0._animationSets = var_25_0._animationSets or {}
	var_25_0._sequences = var_25_0._sequences or {}

	local var_25_1 = arg_25_1 and arg_25_1.controllerIndex

	if not var_25_1 and not Engine.DDJFBBJAIG() then
		var_25_1 = var_25_0:getRootController()
	end

	assert(var_25_1)

	local var_25_2 = var_25_0
	local var_25_3
	local var_25_4 = LUI.UIImage.new()

	var_25_4.id = "Background"

	var_25_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_25_4:SetAlpha(0.8, 0)
	var_25_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_25_0:addElement(var_25_4)

	var_25_0.Background = var_25_4

	local var_25_5
	local var_25_6 = LUI.UIImage.new()

	var_25_6.id = "PopupBackgroundLadingBacker"

	var_25_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_25_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
	var_25_0:addElement(var_25_6)

	var_25_0.PopupBackgroundLadingBacker = var_25_6

	local var_25_7
	local var_25_8 = LUI.UIImage.new()

	var_25_8.id = "PopupBackground"

	var_25_8:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_25_8:setImage(RegisterMaterial("cortez_store_upsell_standard_edition"), 0)
	var_25_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -844, _1080p * 844, _1080p * -386, _1080p * 374)
	var_25_0:addElement(var_25_8)

	var_25_0.PopupBackground = var_25_8

	local var_25_9
	local var_25_10 = {
		spacing = 20,
		wrap = false,
		tabHeight = _1080p * 44,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("CortezPreOrderTab", {
				controllerIndex = var_25_1
			})
		end,
		controllerIndex = var_25_1
	}
	local var_25_11 = LUI.TabManager.new(var_25_10)

	var_25_11.id = "Tabs"

	var_25_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -447, _1080p * -395)
	var_25_0:addElement(var_25_11)

	var_25_0.Tabs = var_25_11

	local var_25_12
	local var_25_13 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_25_1
	})

	var_25_13.id = "ButtonHelperBar"

	var_25_13:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -960, _1080p * 960, _1080p * 1020, 0)
	var_25_0:addElement(var_25_13)

	var_25_0.ButtonHelperBar = var_25_13

	local var_25_14
	local var_25_15 = LUI.UIStyledText.new()

	var_25_15.id = "OwnedText"

	var_25_15:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezDescriptionText, 0)
	var_25_15:setText(Engine.CBBHFCGDIC("MENU/OWNED_CAPS"), 0)
	var_25_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_15:SetAlignment(LUI.Alignment.Center)
	var_25_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_25_15:SetStartupDelay(2000)
	var_25_15:SetLineHoldTime(400)
	var_25_15:SetAnimMoveTime(300)
	var_25_15:SetAnimMoveSpeed(50)
	var_25_15:SetEndDelay(1500)
	var_25_15:SetCrossfadeTime(750)
	var_25_15:SetFadeInTime(300)
	var_25_15:SetFadeOutTime(300)
	var_25_15:SetMaxVisibleLines(1)
	var_25_15:SetShadowRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_25_15:SetOutlineRGBFromInt(0, 0)
	var_25_15:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 917, _1080p * -907, _1080p * 316, _1080p * 344)
	var_25_0:addElement(var_25_15)

	var_25_0.OwnedText = var_25_15

	local var_25_16
	local var_25_17 = LUI.UIStyledText.new()

	var_25_17.id = "LogoSubtitle"

	var_25_17:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezGreen, 0)
	var_25_17:SetAlpha(0, 0)
	var_25_17:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_STANDARD_EDITION_SUBTITLE")), 0)
	var_25_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_17:SetAlignment(LUI.Alignment.Center)
	var_25_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_25_17:SetStartupDelay(2000)
	var_25_17:SetLineHoldTime(400)
	var_25_17:SetAnimMoveTime(150)
	var_25_17:SetAnimMoveSpeed(50)
	var_25_17:SetEndDelay(2000)
	var_25_17:SetCrossfadeTime(400)
	var_25_17:SetFadeInTime(300)
	var_25_17:SetFadeOutTime(300)
	var_25_17:SetMaxVisibleLines(2)
	var_25_17:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 264, _1080p * 769, _1080p * -17, _1080p * 7)
	var_25_0:addElement(var_25_17)

	var_25_0.LogoSubtitle = var_25_17

	local var_25_18
	local var_25_19 = LUI.UIStyledText.new()

	var_25_19.id = "ContentsDesc"

	var_25_19:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezDescriptionText, 0)
	var_25_19:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_STANDARD_EDITION_CONTENTS"), 0)
	var_25_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_19:SetAlignment(LUI.Alignment.Left)
	var_25_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 231, _1080p * 800, _1080p * 655, _1080p * 679)
	var_25_0:addElement(var_25_19)

	var_25_0.ContentsDesc = var_25_19

	local var_25_20
	local var_25_21 = LUI.UIStyledText.new()

	var_25_21.id = "ContentsHeader"

	var_25_21:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_25_21:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_STANDARD_EDITION_CONTENTS_HEADER")), 0)
	var_25_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_21:SetWordWrap(false)
	var_25_21:SetAlignment(LUI.Alignment.Left)
	var_25_21:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_25_21:SetStartupDelay(1000)
	var_25_21:SetLineHoldTime(400)
	var_25_21:SetAnimMoveTime(150)
	var_25_21:SetAnimMoveSpeed(50)
	var_25_21:SetEndDelay(1000)
	var_25_21:SetCrossfadeTime(400)
	var_25_21:SetFadeInTime(300)
	var_25_21:SetFadeOutTime(300)
	var_25_21:SetMaxVisibleLines(1)
	var_25_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -729, _1080p * -160, _1080p * 52, _1080p * 88)
	var_25_0:addElement(var_25_21)

	var_25_0.ContentsHeader = var_25_21

	local var_25_22
	local var_25_23 = LUI.UIStyledText.new()

	var_25_23.id = "VaultContentsDesc"

	var_25_23:SetRGBFromTable(SWATCHES.WZCH3.WZCH3CortezDescriptionText, 0)
	var_25_23:SetAlpha(0, 0)
	var_25_23:setText(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_VAULT_EDITION_CONTENTS"), 0)
	var_25_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_25_23:SetAlignment(LUI.Alignment.Left)
	var_25_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 907, _1080p * 1746, _1080p * 568, _1080p * 592)
	var_25_0:addElement(var_25_23)

	var_25_0.VaultContentsDesc = var_25_23

	local var_25_24
	local var_25_25 = LUI.UIStyledText.new()

	var_25_25.id = "VaultContentsHeader"

	var_25_25:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_25_25:SetAlpha(0, 0)
	var_25_25:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_VAULT_EDITION_CONTENTS_HEADER")), 0)
	var_25_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_25_25:SetWordWrap(false)
	var_25_25:SetAlignment(LUI.Alignment.Left)
	var_25_25:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_25_25:SetStartupDelay(1000)
	var_25_25:SetLineHoldTime(400)
	var_25_25:SetAnimMoveTime(150)
	var_25_25:SetAnimMoveSpeed(50)
	var_25_25:SetEndDelay(1000)
	var_25_25:SetCrossfadeTime(400)
	var_25_25:SetFadeInTime(300)
	var_25_25:SetFadeOutTime(300)
	var_25_25:SetMaxVisibleLines(1)
	var_25_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 907, _1080p * 1746, _1080p * 513, _1080p * 549)
	var_25_0:addElement(var_25_25)

	var_25_0.VaultContentsHeader = var_25_25

	local var_25_26
	local var_25_27 = MenuBuilder.BuildRegisteredType("CortezUpsellButton", {
		controllerIndex = var_25_1
	})

	var_25_27.id = "PreOrderButton"

	var_25_27.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/PRE_PURCHASE")), 0)
	var_25_27.Text:SetAlignment(LUI.Alignment.Center)
	var_25_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * 342, _1080p * 402)
	var_25_0:addElement(var_25_27)

	var_25_0.PreOrderButton = var_25_27

	local function var_25_28()
		return
	end

	var_25_0._sequences.DefaultSequence = var_25_28

	local var_25_29
	local var_25_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cortez_store_upsell_vault_edition")
		}
	}

	var_25_8:RegisterAnimationSequence("TabVaultEdition", var_25_30)

	local var_25_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_VAULT_EDITION_SUBTITLE"))
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_17:RegisterAnimationSequence("TabVaultEdition", var_25_31)

	local var_25_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_23:RegisterAnimationSequence("TabVaultEdition", var_25_32)

	local var_25_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_25:RegisterAnimationSequence("TabVaultEdition", var_25_33)

	local function var_25_34()
		var_25_8:AnimateSequence("TabVaultEdition")
		var_25_17:AnimateSequence("TabVaultEdition")
		var_25_23:AnimateSequence("TabVaultEdition")
		var_25_25:AnimateSequence("TabVaultEdition")
	end

	var_25_0._sequences.TabVaultEdition = var_25_34

	local var_25_35
	local var_25_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cortez_store_upsell_standard_edition")
		}
	}

	var_25_8:RegisterAnimationSequence("TabStandardEdition", var_25_36)

	local var_25_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_STANDARD_EDITION_SUBTITLE"))
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_17:RegisterAnimationSequence("TabStandardEdition", var_25_37)

	local var_25_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_STANDARD_EDITION_CONTENTS_HEADER"))
		}
	}

	var_25_21:RegisterAnimationSequence("TabStandardEdition", var_25_38)

	local var_25_39 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_23:RegisterAnimationSequence("TabStandardEdition", var_25_39)

	local var_25_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_25:RegisterAnimationSequence("TabStandardEdition", var_25_40)

	local function var_25_41()
		var_25_8:AnimateSequence("TabStandardEdition")
		var_25_17:AnimateSequence("TabStandardEdition")
		var_25_21:AnimateSequence("TabStandardEdition")
		var_25_23:AnimateSequence("TabStandardEdition")
		var_25_25:AnimateSequence("TabStandardEdition")
	end

	var_25_0._sequences.TabStandardEdition = var_25_41

	local var_25_42
	local var_25_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_ALT_EDITION_CONTENTS_HEADER"))
		}
	}

	var_25_21:RegisterAnimationSequence("SonyConfig", var_25_43)

	local var_25_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/PREORDER_TITLE")),
			child = var_25_0.PreOrderButton.Text
		}
	}

	var_25_27:RegisterAnimationSequence("SonyConfig", var_25_44)

	local function var_25_45()
		var_25_21:AnimateSequence("SonyConfig")
		var_25_27:AnimateSequence("SonyConfig")
	end

	var_25_0._sequences.SonyConfig = var_25_45

	local var_25_46
	local var_25_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_8:RegisterAnimationSequence("HideAll", var_25_47)

	local var_25_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_11:RegisterAnimationSequence("HideAll", var_25_48)

	local var_25_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_13:RegisterAnimationSequence("HideAll", var_25_49)

	local var_25_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_15:RegisterAnimationSequence("HideAll", var_25_50)

	local var_25_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_17:RegisterAnimationSequence("HideAll", var_25_51)

	local var_25_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_19:RegisterAnimationSequence("HideAll", var_25_52)

	local var_25_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_21:RegisterAnimationSequence("HideAll", var_25_53)

	local var_25_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_23:RegisterAnimationSequence("HideAll", var_25_54)

	local var_25_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_25:RegisterAnimationSequence("HideAll", var_25_55)

	local var_25_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_27:RegisterAnimationSequence("HideAll", var_25_56)

	local function var_25_57()
		var_25_8:AnimateSequence("HideAll")
		var_25_11:AnimateSequence("HideAll")
		var_25_13:AnimateSequence("HideAll")
		var_25_15:AnimateSequence("HideAll")
		var_25_17:AnimateSequence("HideAll")
		var_25_19:AnimateSequence("HideAll")
		var_25_21:AnimateSequence("HideAll")
		var_25_23:AnimateSequence("HideAll")
		var_25_25:AnimateSequence("HideAll")
		var_25_27:AnimateSequence("HideAll")
	end

	var_25_0._sequences.HideAll = var_25_57

	local var_25_58
	local var_25_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_8:RegisterAnimationSequence("ShowAll", var_25_59)

	local var_25_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_11:RegisterAnimationSequence("ShowAll", var_25_60)

	local var_25_61 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_13:RegisterAnimationSequence("ShowAll", var_25_61)

	local var_25_62 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_17:RegisterAnimationSequence("ShowAll", var_25_62)

	local var_25_63 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_19:RegisterAnimationSequence("ShowAll", var_25_63)

	local var_25_64 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_21:RegisterAnimationSequence("ShowAll", var_25_64)

	local var_25_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_27:RegisterAnimationSequence("ShowAll", var_25_65)

	local function var_25_66()
		var_25_8:AnimateSequence("ShowAll")
		var_25_11:AnimateSequence("ShowAll")
		var_25_13:AnimateSequence("ShowAll")
		var_25_17:AnimateSequence("ShowAll")
		var_25_19:AnimateSequence("ShowAll")
		var_25_21:AnimateSequence("ShowAll")
		var_25_27:AnimateSequence("ShowAll")
	end

	var_25_0._sequences.ShowAll = var_25_66

	local var_25_67
	local var_25_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cortez_store_upsell_alt_edition")
		}
	}

	var_25_8:RegisterAnimationSequence("TabAltEditionSony", var_25_68)

	local var_25_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_ALT_EDITION_SUBTITLE"))
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_17:RegisterAnimationSequence("TabAltEditionSony", var_25_69)

	local var_25_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_ALT_EDITION_CONTENTS_HEADER"))
		}
	}

	var_25_21:RegisterAnimationSequence("TabAltEditionSony", var_25_70)

	local var_25_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_23:RegisterAnimationSequence("TabAltEditionSony", var_25_71)

	local var_25_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_25:RegisterAnimationSequence("TabAltEditionSony", var_25_72)

	local function var_25_73()
		var_25_8:AnimateSequence("TabAltEditionSony")
		var_25_17:AnimateSequence("TabAltEditionSony")
		var_25_21:AnimateSequence("TabAltEditionSony")
		var_25_23:AnimateSequence("TabAltEditionSony")
		var_25_25:AnimateSequence("TabAltEditionSony")
	end

	var_25_0._sequences.TabAltEditionSony = var_25_73

	local var_25_74
	local var_25_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("cortez_store_upsell_alt_edition")
		}
	}

	var_25_8:RegisterAnimationSequence("TabAltEditionXbox", var_25_75)

	local var_25_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_ALT_EDITION_SUBTITLE"))
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_17:RegisterAnimationSequence("TabAltEditionXbox", var_25_76)

	local var_25_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_ALT_EDITION_CONTENTS_HEADER"))
		}
	}

	var_25_21:RegisterAnimationSequence("TabAltEditionXbox", var_25_77)

	local var_25_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_23:RegisterAnimationSequence("TabAltEditionXbox", var_25_78)

	local var_25_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_25_25:RegisterAnimationSequence("TabAltEditionXbox", var_25_79)

	local function var_25_80()
		var_25_8:AnimateSequence("TabAltEditionXbox")
		var_25_17:AnimateSequence("TabAltEditionXbox")
		var_25_21:AnimateSequence("TabAltEditionXbox")
		var_25_23:AnimateSequence("TabAltEditionXbox")
		var_25_25:AnimateSequence("TabAltEditionXbox")
	end

	var_25_0._sequences.TabAltEditionXbox = var_25_80

	local var_25_81
	local var_25_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_WZ335/CORTEZ_ALT_EDITION_CONTENTS_HEADER"))
		}
	}

	var_25_21:RegisterAnimationSequence("XboxConfig", var_25_82)

	local var_25_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = ToUpperCase(Engine.CBBHFCGDIC("MENU/PREORDER_TITLE")),
			child = var_25_0.PreOrderButton.Text
		}
	}

	var_25_27:RegisterAnimationSequence("XboxConfig", var_25_83)

	local function var_25_84()
		var_25_21:AnimateSequence("XboxConfig")
		var_25_27:AnimateSequence("XboxConfig")
	end

	var_25_0._sequences.XboxConfig = var_25_84

	var_0_15(var_25_0, var_25_1, arg_25_1)

	return var_25_0
end

MenuBuilder.registerType("CortezPreOrderPopup", CortezPreOrderPopup)
LUI.FlowManager.RegisterStackPopBehaviour("CortezPreOrderPopup", var_0_14)
LockTable(_M)
