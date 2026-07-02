module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("VGPreOrderPopup", {
	"store",
	"fenceSpinner",
	"exchange"
})

local var_0_0 = "t9kingsley"
local var_0_1 = "iw8_sm_t9spray"
local var_0_2 = "LUA_MENU_BAKER/OPERATOR_SKIN_WESTERN_T9KINGSLEY_1_1"
local var_0_3 = "button_r3"
local var_0_4 = "button_right_stick"
local var_0_5
local var_0_6
local var_0_7
local var_0_8 = {
	[STORE.VanguardStandardID] = {
		animation = "TabStandardEdition",
		tabName = Engine.CBBHFCGDIC("LUA_MENU_MP/VG_PREORDER_STANDARD")
	},
	[STORE.VanguardCrossGenID] = {
		animation = "TabCrossGenEdition",
		tabName = Engine.CBBHFCGDIC("LUA_MENU_MP/VG_PREORDER_CROSSGEN")
	},
	[STORE.VanguardUltimateID] = {
		animation = "TabUltimateEdition",
		tabName = Engine.CBBHFCGDIC("LUA_MENU_MP/VG_PREORDER_ULTIMATE")
	},
	[STORE.VanguardUpgradeToUltimateID] = {
		animation = "TabUltimateEdition",
		tabName = Engine.CBBHFCGDIC("LUA_MENU_MP/VG_PREORDER_ULTIMATE"),
		buttonText = Engine.CBBHFCGDIC("MENU/MP_UPGRADE_TO_ULTIMATE")
	}
}

local function var_0_9(arg_1_0, arg_1_1)
	for iter_1_0 = 1, #arg_1_0.Tabs._tabs do
		arg_1_0.Tabs:GetTabAtIndex(iter_1_0):SetTabSelected(false)
	end

	arg_1_0._selectedTab = arg_1_1.productId
	var_0_8[arg_1_0._selectedTab].itemIndex = arg_1_1.itemIndex
	var_0_8[arg_1_0._selectedTab].productId = arg_1_1.productId

	local var_1_0 = var_0_8[arg_1_0._selectedTab]

	arg_1_0.Tabs:GetTabAtIndex(arg_1_1.itemIndex):SetTabSelected(true, var_1_0.animation)
	arg_1_0:dispatchEventToChildren({
		name = "preorder_tab_switched",
		tabData = var_1_0,
		tabKey = arg_1_0._selectedTab
	})
	arg_1_0:SetPageAnimationState(var_1_0)

	if arg_1_1.owned then
		arg_1_0.PreOrderButton:SetAlpha(0)
		arg_1_0.OwnedText:SetAlpha(1)
	else
		arg_1_0.PreOrderButton:SetAlpha(1)

		if var_1_0.buttonText then
			arg_1_0.PreOrderButton.Text:setText(var_1_0.buttonText, 0)
		end

		arg_1_0.OwnedText:SetAlpha(0)
	end

	local var_1_1 = LUI.FlowManager.GetMenuByName("MPStore")

	if var_1_1 and var_1_1.menu then
		var_1_1.menu._scoped.restoreFocusProduct = arg_1_0._selectedTab
	end
end

local function var_0_10(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.animation .. "PostLaunch"

	if CONDITIONS.IsPC() then
		var_2_0 = var_2_0 .. "PC"
	end

	arg_2_0.PreOrderButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/PURCHASE"))
	arg_2_0.BetaDatesMSPC:SetAlpha(0)
	arg_2_0.BetaDatesSY:SetAlpha(0)
	;(CONDITIONS.IsPS4() and arg_2_0.BetaDatesSY or arg_2_0.BetaDatesMSPC):SetAlpha(0)
	ACTIONS.AnimateSequence(arg_2_0, var_2_0)
end

local function var_0_11(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_2) do
		if iter_3_1.productId ~= STORE.VanguardTrialID then
			table.insert(var_3_0, {
				disabled = false,
				name = var_0_8[iter_3_1.productId].tabName,
				hasDefaultFocus = arg_3_0._defaultProductId == iter_3_1.productId or false,
				tabHeight = _1080p * 52,
				animation = iter_3_1.animation,
				productId = iter_3_1.productId,
				focusFunction = function(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
					arg_3_0:SwitchToTab(iter_3_1)
				end,
				owned = iter_3_1.owned
			})
		end
	end

	arg_3_0.Tabs:SetTabs(var_3_0)
	arg_3_0.Tabs:SetAlignment(LUI.Alignment.Center)
end

local function var_0_12(arg_5_0, arg_5_1)
	(function()
		local var_6_0 = STORE.GetVGPreOrderMastercraftRewardId()
		local var_6_1 = BATTLEPASS.GetPreviewWeapon(arg_5_1.controller, LOOT.itemTypes.WEAPON, var_6_0)
		local var_6_2 = {
			currentState = OPERATOR.SuperFaction.WEST,
			previewOperatorRef = var_0_0 .. "_western",
			eastSelectedOperator = var_0_0 .. "_western",
			skinInfo = {
				bodyModel = "body_mp_western_" .. var_0_0 .. "_1_1_lod1",
				headModel = "head_mp_western_" .. var_0_0 .. "_1_1"
			}
		}
		local var_6_3 = {
			secondaryModel = "iw8_pi_mike1911_mp+rec_mike1911+slide_mike1911+mag_mike1911+triggrip_mike1911+ironsdefault_mike1911",
			primaryModel = WEAPON.GetWeaponModelName(var_0_1, var_6_1, {
				includeAttachments = true
			})
		}
		local var_6_4 = {
			isBattlePass = false,
			storePreviewItemType = 7,
			isStorePreview = true,
			operatorData = var_6_2,
			weaponData = var_6_3,
			itemRef = var_0_0 .. "_western_basic",
			titleOverride = var_0_2
		}

		LUI.FlowManager.RequestAddMenu("OperatorShowcase", false, arg_5_1.controller, false, var_6_4)
	end)()
end

local function var_0_13(arg_7_0, arg_7_1)
	arg_7_0.PreOrderButton:addEventHandler("button_action", function(arg_8_0, arg_8_1)
		arg_7_0:OnPreOrderButtonClicked(arg_8_1)
	end)
	arg_7_0.PreOrderButton:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		ACTIONS.AnimateSequence(arg_7_0.PreOrderButton, "ButtonOverGlint")
		ACTIONS.AnimateSequence(arg_7_0.PreOrderButton, "AnimateGlow")
	end)
	arg_7_0.PreOrderButton:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		ACTIONS.AnimateSequence(arg_7_0.PreOrderButton, "ButtonUpGlint")
		ACTIONS.AnimateSequence(arg_7_0.PreOrderButton, "StopGlow")
	end)
	arg_7_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	if arg_7_0._allowWeaponPreview then
		arg_7_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			priority = 3,
			helper_text = Engine.CBBHFCGDIC("MENU/PREVIEW_MASTERCRAFT"),
			button_ref = var_0_3
		})
		arg_7_0._bindButton:registerEventHandler(var_0_4, var_0_12)
	end

	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(true)
	end
end

local function var_0_14(arg_11_0, arg_11_1)
	if arg_11_0._selectedTab then
		local var_11_0 = var_0_8[arg_11_0._selectedTab].productId

		Engine.CEJJDJJHIJ(arg_11_1.controller, "dlog_event_vanguard_upsell_prepurchase", {
			productID = var_11_0
		})
		InGameStore.SelectProduct(arg_11_1.controller, var_11_0, InGameStorePurchaseType.BROWSE)
	end
end

local function var_0_15(arg_12_0, arg_12_1)
	local var_12_0 = false
	local var_12_1 = {}
	local var_12_2 = STORE.GetVanguardCategoryData(arg_12_1)

	for iter_12_0, iter_12_1 in ipairs(var_12_2) do
		if iter_12_1.firstPartyProductID == STORE.VanguardTrialID then
			table.remove(var_12_2, iter_12_0)
		end
	end

	local var_12_3 = 1

	if var_12_2 and #var_12_2 > 0 then
		for iter_12_2 = 1, #var_12_2 do
			var_12_2[iter_12_2].itemIndex = var_12_3
			var_12_2[iter_12_2].isFirstParty = true
			var_12_2[iter_12_2].image = var_12_2[iter_12_2].image == "" and "placeholder_x" or var_12_2[iter_12_2].image
			var_12_2[iter_12_2].leavePartyAndLobbyOnPurchase = arg_12_0._leavePartyAndLobbyOnPurchase

			table.insert(var_12_1, var_12_2[iter_12_2])

			var_12_0 = true
			var_12_3 = var_12_3 + 1
		end
	end

	if var_12_0 then
		var_0_11(arg_12_0, arg_12_1, var_12_1)
	else
		ACTIONS.LeaveMenu(arg_12_0)
	end
end

local function var_0_16(arg_13_0, arg_13_1)
	InGameStore.FetchCatalog(arg_13_1, true, true)

	local var_13_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "update_fetching_store",
			controllerIndex = arg_13_1
		}
	})

	var_13_0.id = "fetchingTimer"

	arg_13_0:addElement(var_13_0)

	arg_13_0._fetchingTimer = var_13_0

	arg_13_0:registerEventHandler("update_fetching_store", function(arg_14_0, arg_14_1)
		local var_14_0 = false
		local var_14_1 = InGameStore.GetCatalogStatus(arg_13_1)

		if var_14_1 == InGameStoreCatalogStatus.READY then
			ACTIONS.AnimateSequence(arg_13_0, "ShowAll")
			var_0_15(arg_13_0, arg_13_1)
			var_0_13(arg_13_0, arg_13_1)

			var_14_0 = true
		elseif var_14_1 == InGameStoreCatalogStatus.ERROR then
			var_14_0 = true

			local var_14_2 = {}

			if Engine.DBFCJBDJEC() then
				local var_14_3 = Engine.BIAFEJHHDD()

				if var_14_3 ~= nil then
					local var_14_4 = Engine.JCBDICCAH(var_14_3)

					var_14_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_14_4)

					Engine.DCFIDJGACA()
				else
					var_14_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_14_5 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				var_14_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_14_5)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_14_2, nil, false, true)
			Engine.DHCGHHBHCH()
			LUI.FlowManager.RequestLeaveMenu(arg_14_0)
		end

		if var_14_0 then
			arg_14_0._fetchingTimer:closeTree()

			arg_14_0._fetchingTimer = nil
		end
	end)
end

local function var_0_17()
	if Engine.CIEGIACHAE() then
		InGameStore.ShowStoreIcon(false)
	end

	if not var_0_5 then
		if not var_0_7 then
			FrontEndScene.HideAllCharacters()
		end

		local var_15_0 = var_0_6 or "quartermaster"

		Engine.DHFCHIIJCA(var_15_0)
	end

	var_0_5 = nil
	var_0_6 = nil
	var_0_7 = nil
end

local function var_0_18(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.SetPageAnimationState = var_0_10
	arg_16_0.SwitchToTab = var_0_9
	arg_16_0.OnPreOrderButtonClicked = var_0_14
	arg_16_0._tabsData = {}
	arg_16_0._selectedTab = STORE.VanguardCrossGenID
	arg_16_2.activeIndex = arg_16_0._selectedTab
	arg_16_0._defaultProductId = arg_16_2.defaultProductId
	arg_16_0._controllerIndex = arg_16_1

	arg_16_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_16_0 = LUI.UIBindButton.new()

	var_16_0.id = "selfBindButton"

	arg_16_0:addElement(var_16_0)

	arg_16_0._bindButton = var_16_0
	arg_16_0._allowWeaponPreview = arg_16_2.allowWeaponPreview
	var_0_5 = arg_16_2.sceneChangeDisabled
	var_0_6 = arg_16_2.sceneOverride
	var_0_7 = arg_16_2.showCharactersOnPop

	arg_16_0._bindButton:registerEventHandler("button_secondary", function(arg_17_0, arg_17_1)
		ACTIONS.LeaveMenu(arg_16_0)
	end)
	ACTIONS.AnimateSequence(arg_16_0, "HideAll")
	var_0_16(arg_16_0, arg_16_1)

	if Engine.HDGDBCJFG() then
		ACTIONS.AnimateSequence(arg_16_0, "ConsoleConfig")
	end

	ACTIONS.ScaleFullscreen(arg_16_0.Background)
	ACTIONS.ScaleFullscreen(arg_16_0.PopupBackgroundLadingBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_16_0.ButtonHelperBar)
end

function VGPreOrderPopup(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_18_0.id = "VGPreOrderPopup"
	var_18_0._animationSets = var_18_0._animationSets or {}
	var_18_0._sequences = var_18_0._sequences or {}

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "Background"

	var_18_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_18_4:SetAlpha(0.8, 0)
	var_18_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.Background = var_18_4

	local var_18_5
	local var_18_6 = LUI.UIImage.new()

	var_18_6.id = "PopupBackgroundLadingBacker"

	var_18_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_18_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -960, _1080p * 960, _1080p * -540, _1080p * 540)
	var_18_0:addElement(var_18_6)

	var_18_0.PopupBackgroundLadingBacker = var_18_6

	local var_18_7
	local var_18_8 = LUI.UIImage.new()

	var_18_8.id = "PopupBackground"

	var_18_8:SetRGBFromTable(SWATCHES.CH2.White, 0)
	var_18_8:setImage(RegisterMaterial("mw_store_vanguard_upsell_02_postlaunch"), 0)
	var_18_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -844, _1080p * 844, _1080p * -386, _1080p * 374)
	var_18_0:addElement(var_18_8)

	var_18_0.PopupBackground = var_18_8

	local var_18_9
	local var_18_10 = {
		spacing = 50,
		wrap = false,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("VGPreOrderTab", {
				controllerIndex = var_18_1
			})
		end,
		controllerIndex = var_18_1
	}
	local var_18_11 = LUI.TabManager.new(var_18_10)

	var_18_11.id = "Tabs"

	var_18_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -447, _1080p * -395)
	var_18_0:addElement(var_18_11)

	var_18_0.Tabs = var_18_11

	local var_18_12
	local var_18_13 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_18_1
	})

	var_18_13.id = "ButtonHelperBar"

	var_18_13:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -960, _1080p * 960, _1080p * 1020, 0)
	var_18_0:addElement(var_18_13)

	var_18_0.ButtonHelperBar = var_18_13

	local var_18_14
	local var_18_15 = MenuBuilder.BuildRegisteredType("BattlePassButton", {
		controllerIndex = var_18_1
	})

	var_18_15.id = "PreOrderButton"

	var_18_15.Text:setText(Engine.CBBHFCGDIC("MENU/PRE_PURCHASE"), 0)
	var_18_15.Text:SetAlignment(LUI.Alignment.Center)
	var_18_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 750, _1080p * 1170, _1080p * 851, _1080p * 889)
	var_18_0:addElement(var_18_15)

	var_18_0.PreOrderButton = var_18_15

	local var_18_16
	local var_18_17 = LUI.UIStyledText.new()

	var_18_17.id = "OwnedText"

	var_18_17:SetRGBFromTable(SWATCHES.CH2.CH2SeasonFreeBanner, 0)
	var_18_17:SetAlpha(0, 0)
	var_18_17:setText(Engine.CBBHFCGDIC("MENU/OWNED_CAPS"), 0)
	var_18_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_17:SetAlignment(LUI.Alignment.Center)
	var_18_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_17:SetStartupDelay(2000)
	var_18_17:SetLineHoldTime(400)
	var_18_17:SetAnimMoveTime(300)
	var_18_17:SetAnimMoveSpeed(50)
	var_18_17:SetEndDelay(1500)
	var_18_17:SetCrossfadeTime(750)
	var_18_17:SetFadeInTime(300)
	var_18_17:SetFadeOutTime(300)
	var_18_17:SetMaxVisibleLines(1)
	var_18_17:SetShadowRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_18_17:SetOutlineRGBFromInt(0, 0)
	var_18_17:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 917, _1080p * -907, _1080p * 318, _1080p * 342)
	var_18_0:addElement(var_18_17)

	var_18_0.OwnedText = var_18_17

	local var_18_18
	local var_18_19 = LUI.UIText.new()

	var_18_19.id = "LogoSubtitle"

	var_18_19:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_ULT_SUBTITLE"), 0)
	var_18_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_19:SetAlignment(LUI.Alignment.Center)
	var_18_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -800, _1080p * -401, _1080p * -102, _1080p * -78)
	var_18_0:addElement(var_18_19)

	var_18_0.LogoSubtitle = var_18_19

	local var_18_20
	local var_18_21 = LUI.UIText.new()

	var_18_21.id = "WeaponPackHeader"

	var_18_21:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_18_21:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_DIGITAL_PACK_HEADER"), 0)
	var_18_21:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_21:SetAlignment(LUI.Alignment.Center)
	var_18_21:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -800, _1080p * -401, _1080p * 44, _1080p * 68)
	var_18_0:addElement(var_18_21)

	var_18_0.WeaponPackHeader = var_18_21

	local var_18_22
	local var_18_23 = LUI.UIText.new()

	var_18_23.id = "OpenBetaHeader"

	var_18_23:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_18_23:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_BETA_HEADER"), 0)
	var_18_23:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_23:SetAlignment(LUI.Alignment.Center)
	var_18_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 405, _1080p * 804, _1080p * 44, _1080p * 68)
	var_18_0:addElement(var_18_23)

	var_18_0.OpenBetaHeader = var_18_23

	local var_18_24
	local var_18_25 = LUI.UIText.new()

	var_18_25.id = "PreOrderHeader"

	var_18_25:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_18_25:SetAlpha(0, 0)
	var_18_25:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS"), 0)
	var_18_25:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_25:SetAlignment(LUI.Alignment.Center)
	var_18_25:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 405, _1080p * 804, _1080p * -345, _1080p * -321)
	var_18_0:addElement(var_18_25)

	var_18_0.PreOrderHeader = var_18_25

	local var_18_26
	local var_18_27 = LUI.UIText.new()

	var_18_27.id = "PreOrderSubtitle"

	var_18_27:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_27:SetAlpha(0, 0)
	var_18_27:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_HEADER"), 0)
	var_18_27:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_27:SetAlignment(LUI.Alignment.Left)
	var_18_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 422, _1080p * 801, _1080p * -59, _1080p * -35)
	var_18_0:addElement(var_18_27)

	var_18_0.PreOrderSubtitle = var_18_27

	local var_18_28
	local var_18_29 = LUI.UIStyledText.new()

	var_18_29.id = "PreOrderDesc01"

	var_18_29:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_29:SetAlpha(0, 0)
	var_18_29:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_DESC"), 0)
	var_18_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_29:SetAlignment(LUI.Alignment.Left)
	var_18_29:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_18_29:SetStartupDelay(1000)
	var_18_29:SetLineHoldTime(400)
	var_18_29:SetAnimMoveTime(250)
	var_18_29:SetAnimMoveSpeed(50)
	var_18_29:SetEndDelay(1000)
	var_18_29:SetCrossfadeTime(400)
	var_18_29:SetFadeInTime(300)
	var_18_29:SetFadeOutTime(300)
	var_18_29:SetMaxVisibleLines(2)
	var_18_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 422, _1080p * 801, _1080p * -126, _1080p * -106)
	var_18_0:addElement(var_18_29)

	var_18_0.PreOrderDesc01 = var_18_29

	local var_18_30
	local var_18_31 = LUI.UIStyledText.new()

	var_18_31.id = "PreOrderDesc02"

	var_18_31:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_31:SetAlpha(0, 0)
	var_18_31:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_DESC"), 0)
	var_18_31:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_31:SetAlignment(LUI.Alignment.Left)
	var_18_31:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_18_31:SetStartupDelay(1000)
	var_18_31:SetLineHoldTime(400)
	var_18_31:SetAnimMoveTime(250)
	var_18_31:SetAnimMoveSpeed(50)
	var_18_31:SetEndDelay(1000)
	var_18_31:SetCrossfadeTime(400)
	var_18_31:SetFadeInTime(300)
	var_18_31:SetFadeOutTime(300)
	var_18_31:SetMaxVisibleLines(2)
	var_18_31:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 422, _1080p * 801, _1080p * -36, _1080p * -18)
	var_18_0:addElement(var_18_31)

	var_18_0.PreOrderDesc02 = var_18_31

	local var_18_32
	local var_18_33 = LUI.UIText.new()

	var_18_33.id = "OperatorPackHeader"

	var_18_33:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_18_33:SetAlpha(0, 0)
	var_18_33:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_ITEMS_PACK_HEADER"), 0)
	var_18_33:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_33:SetAlignment(LUI.Alignment.Center)
	var_18_33:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -349, _1080p * 359, _1080p * -345, _1080p * -321)
	var_18_0:addElement(var_18_33)

	var_18_0.OperatorPackHeader = var_18_33

	local var_18_34
	local var_18_35 = LUI.UIText.new()

	var_18_35.id = "UltConsumableHeader"

	var_18_35:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_18_35:SetAlpha(0, 0)
	var_18_35:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_HEADER"), 0)
	var_18_35:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_35:SetAlignment(LUI.Alignment.Center)
	var_18_35:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -349, _1080p * 359, _1080p * 44, _1080p * 68)
	var_18_0:addElement(var_18_35)

	var_18_0.UltConsumableHeader = var_18_35

	local var_18_36
	local var_18_37 = LUI.UIStyledText.new()

	var_18_37.id = "UltConsumableSubtitle01"

	var_18_37:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_37:SetAlpha(0, 0)
	var_18_37:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_01"), 0)
	var_18_37:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_37:SetAlignment(LUI.Alignment.Center)
	var_18_37:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_37:SetStartupDelay(1000)
	var_18_37:SetLineHoldTime(400)
	var_18_37:SetAnimMoveTime(150)
	var_18_37:SetAnimMoveSpeed(50)
	var_18_37:SetEndDelay(1000)
	var_18_37:SetCrossfadeTime(400)
	var_18_37:SetFadeInTime(300)
	var_18_37:SetFadeOutTime(300)
	var_18_37:SetMaxVisibleLines(1)
	var_18_37:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -348, _1080p * -16, _1080p * 191, _1080p * 215)
	var_18_0:addElement(var_18_37)

	var_18_0.UltConsumableSubtitle01 = var_18_37

	local var_18_38
	local var_18_39 = LUI.UIText.new()

	var_18_39.id = "UltConsumableDesc01"

	var_18_39:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_39:SetAlpha(0, 0)
	var_18_39:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02"), 0)
	var_18_39:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_39:SetAlignment(LUI.Alignment.Center)
	var_18_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -348, _1080p * -16, _1080p * 218, _1080p * 234)
	var_18_0:addElement(var_18_39)

	var_18_0.UltConsumableDesc01 = var_18_39

	local var_18_40
	local var_18_41 = LUI.UIStyledText.new()

	var_18_41.id = "UltConsumableSubtitle02"

	var_18_41:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_41:SetAlpha(0, 0)
	var_18_41:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_02"), 0)
	var_18_41:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_41:SetAlignment(LUI.Alignment.Center)
	var_18_41:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_41:SetStartupDelay(1000)
	var_18_41:SetLineHoldTime(400)
	var_18_41:SetAnimMoveTime(150)
	var_18_41:SetAnimMoveSpeed(50)
	var_18_41:SetEndDelay(1000)
	var_18_41:SetCrossfadeTime(400)
	var_18_41:SetFadeInTime(300)
	var_18_41:SetFadeOutTime(300)
	var_18_41:SetMaxVisibleLines(1)
	var_18_41:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 24, _1080p * 356, _1080p * 191, _1080p * 215)
	var_18_0:addElement(var_18_41)

	var_18_0.UltConsumableSubtitle02 = var_18_41

	local var_18_42
	local var_18_43 = LUI.UIText.new()

	var_18_43.id = "UltConsumableDesc02"

	var_18_43:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_43:SetAlpha(0, 0)
	var_18_43:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02"), 0)
	var_18_43:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_43:SetAlignment(LUI.Alignment.Center)
	var_18_43:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 24, _1080p * 356, _1080p * 218, _1080p * 234)
	var_18_0:addElement(var_18_43)

	var_18_0.UltConsumableDesc02 = var_18_43

	local var_18_44
	local var_18_45 = LUI.UIText.new()

	var_18_45.id = "CrossGenConsumableHeader"

	var_18_45:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_18_45:SetAlpha(0, 0)
	var_18_45:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_PACK_HEADER"), 0)
	var_18_45:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_45:SetAlignment(LUI.Alignment.Center)
	var_18_45:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -349, _1080p * 50, _1080p * 44, _1080p * 68)
	var_18_0:addElement(var_18_45)

	var_18_0.CrossGenConsumableHeader = var_18_45

	local var_18_46
	local var_18_47 = LUI.UIText.new()

	var_18_47.id = "CrossGenConsumableSubtitle"

	var_18_47:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_47:SetAlpha(0, 0)
	var_18_47:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_PACK_SUBTITLE"), 0)
	var_18_47:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_47:SetAlignment(LUI.Alignment.Center)
	var_18_47:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -348, _1080p * 50, _1080p * 191, _1080p * 215)
	var_18_0:addElement(var_18_47)

	var_18_0.CrossGenConsumableSubtitle = var_18_47

	local var_18_48
	local var_18_49 = LUI.UIText.new()

	var_18_49.id = "CrossGenConsumableDesc"

	var_18_49:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_49:SetAlpha(0, 0)
	var_18_49:setText(Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_PACK_DESC"), 0)
	var_18_49:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_49:SetAlignment(LUI.Alignment.Center)
	var_18_49:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -348, _1080p * 50, _1080p * 218, _1080p * 234)
	var_18_0:addElement(var_18_49)

	var_18_0.CrossGenConsumableDesc = var_18_49

	local var_18_50
	local var_18_51 = LUI.UIStyledText.new()

	var_18_51.id = "BetaDatesSY"

	var_18_51:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_51:SetAlpha(0, 0)
	var_18_51:setText(Engine.CBBHFCGDIC("T9_STORE_BUNDLES_CANTEEN/VANGUARD_SY_BETA_DATES"), 0)
	var_18_51:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_51:SetAlignment(LUI.Alignment.Center)
	var_18_51:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_18_51:SetStartupDelay(1000)
	var_18_51:SetLineHoldTime(400)
	var_18_51:SetAnimMoveTime(250)
	var_18_51:SetAnimMoveSpeed(50)
	var_18_51:SetEndDelay(1000)
	var_18_51:SetCrossfadeTime(400)
	var_18_51:SetFadeInTime(300)
	var_18_51:SetFadeOutTime(300)
	var_18_51:SetMaxVisibleLines(2)
	var_18_51:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 382, _1080p * 830, _1080p * 287, _1080p * 311)
	var_18_0:addElement(var_18_51)

	var_18_0.BetaDatesSY = var_18_51

	local var_18_52
	local var_18_53 = LUI.UIStyledText.new()

	var_18_53.id = "BetaDatesMSPC"

	var_18_53:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_18_53:SetAlpha(0, 0)
	var_18_53:setText(Engine.CBBHFCGDIC("T9_STORE_BUNDLES_CANTEEN/VANGUARD_MS_PC_BETA_DATES"), 0)
	var_18_53:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_53:SetAlignment(LUI.Alignment.Center)
	var_18_53:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_18_53:SetStartupDelay(1000)
	var_18_53:SetLineHoldTime(400)
	var_18_53:SetAnimMoveTime(250)
	var_18_53:SetAnimMoveSpeed(50)
	var_18_53:SetEndDelay(1000)
	var_18_53:SetCrossfadeTime(400)
	var_18_53:SetFadeInTime(300)
	var_18_53:SetFadeOutTime(300)
	var_18_53:SetMaxVisibleLines(2)
	var_18_53:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 382, _1080p * 830, _1080p * 287, _1080p * 311)
	var_18_0:addElement(var_18_53)

	var_18_0.BetaDatesMSPC = var_18_53

	local var_18_54
	local var_18_55 = LUI.UIText.new()

	var_18_55.id = "PostLaunchDesc"

	var_18_55:SetAlpha(0, 0)
	var_18_55:setText(Engine.CBBHFCGDIC("LUA_MENU_EAGLE/POST_LAUNCH_DESC"), 0)
	var_18_55:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_55:SetAlignment(LUI.Alignment.Center)
	var_18_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 152, _1080p * 568, _1080p * 652, _1080p * 672)
	var_18_0:addElement(var_18_55)

	var_18_0.PostLaunchDesc = var_18_55

	local var_18_56
	local var_18_57 = LUI.UIText.new()

	var_18_57.id = "VanguardOwnerXPBoostHeader"

	var_18_57:SetRGBFromTable(SWATCHES.CH2.CH2DarkBlue, 0)
	var_18_57:SetAlpha(0, 0)
	var_18_57:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/UPSELL_2021_VANGUARD_OWNER_HEADER"), 0)
	var_18_57:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_57:SetAlignment(LUI.Alignment.Center)
	var_18_57:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 366, _1080p * 44, _1080p * 68)
	var_18_0:addElement(var_18_57)

	var_18_0.VanguardOwnerXPBoostHeader = var_18_57

	local var_18_58
	local var_18_59 = LUI.UIStyledText.new()

	var_18_59.id = "VanguardOwnerXPBoostSubtitle"

	var_18_59:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_59:SetAlpha(0, 0)
	var_18_59:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/UPSELL_2021_VANGUARD_OWNER_SUBTITLE"), 0)
	var_18_59:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_18_59:SetAlignment(LUI.Alignment.Center)
	var_18_59:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_18_59:SetStartupDelay(1000)
	var_18_59:SetLineHoldTime(400)
	var_18_59:SetAnimMoveTime(150)
	var_18_59:SetAnimMoveSpeed(50)
	var_18_59:SetEndDelay(1000)
	var_18_59:SetCrossfadeTime(400)
	var_18_59:SetFadeInTime(300)
	var_18_59:SetFadeOutTime(300)
	var_18_59:SetMaxVisibleLines(1)
	var_18_59:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 334, _1080p * 191, _1080p * 215)
	var_18_0:addElement(var_18_59)

	var_18_0.VanguardOwnerXPBoostSubtitle = var_18_59

	local var_18_60
	local var_18_61 = LUI.UIText.new()

	var_18_61.id = "VanguardOwnerXPBoostDesc"

	var_18_61:SetRGBFromTable(SWATCHES.CH2.MainMenuLines, 0)
	var_18_61:SetAlpha(0, 0)
	var_18_61:setText(Engine.CBBHFCGDIC("LUA_MENU_FISHER/UPSELL_2021_VANGUARD_OWNER_DESC"), 0)
	var_18_61:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_61:SetAlignment(LUI.Alignment.Center)
	var_18_61:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 2, _1080p * 334, _1080p * 218, _1080p * 234)
	var_18_0:addElement(var_18_61)

	var_18_0.VanguardOwnerXPBoostDesc = var_18_61

	local function var_18_62()
		return
	end

	var_18_0._sequences.DefaultSequence = var_18_62

	local var_18_63
	local var_18_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_03_preorder")
		}
	}

	var_18_8:RegisterAnimationSequence("TabUltimateEdition", var_18_64)

	local var_18_65 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_ULT_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabUltimateEdition", var_18_65)

	local var_18_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_DIGITAL_PACK_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabUltimateEdition", var_18_66)

	local var_18_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_BETA_HEADER")
		}
	}

	var_18_23:RegisterAnimationSequence("TabUltimateEdition", var_18_67)

	local var_18_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		}
	}

	var_18_25:RegisterAnimationSequence("TabUltimateEdition", var_18_68)

	local var_18_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_HEADER")
		}
	}

	var_18_27:RegisterAnimationSequence("TabUltimateEdition", var_18_69)

	local var_18_70 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_DESC")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabUltimateEdition", var_18_70)

	local var_18_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_DESC")
		}
	}

	var_18_31:RegisterAnimationSequence("TabUltimateEdition", var_18_71)

	local var_18_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_ITEMS_PACK_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabUltimateEdition", var_18_72)

	local var_18_73 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_HEADER")
		}
	}

	var_18_35:RegisterAnimationSequence("TabUltimateEdition", var_18_73)

	local var_18_74 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_01")
		}
	}

	var_18_37:RegisterAnimationSequence("TabUltimateEdition", var_18_74)

	local var_18_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_01")
		}
	}

	var_18_39:RegisterAnimationSequence("TabUltimateEdition", var_18_75)

	local var_18_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_02")
		}
	}

	var_18_41:RegisterAnimationSequence("TabUltimateEdition", var_18_76)

	local var_18_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02")
		}
	}

	var_18_43:RegisterAnimationSequence("TabUltimateEdition", var_18_77)

	local var_18_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabUltimateEdition", var_18_78)

	local var_18_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabUltimateEdition", var_18_79)

	local var_18_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabUltimateEdition", var_18_80)

	local var_18_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabUltimateEdition", var_18_81)

	local function var_18_82()
		var_18_8:AnimateSequence("TabUltimateEdition")
		var_18_19:AnimateSequence("TabUltimateEdition")
		var_18_21:AnimateSequence("TabUltimateEdition")
		var_18_23:AnimateSequence("TabUltimateEdition")
		var_18_25:AnimateSequence("TabUltimateEdition")
		var_18_27:AnimateSequence("TabUltimateEdition")
		var_18_29:AnimateSequence("TabUltimateEdition")
		var_18_31:AnimateSequence("TabUltimateEdition")
		var_18_33:AnimateSequence("TabUltimateEdition")
		var_18_35:AnimateSequence("TabUltimateEdition")
		var_18_37:AnimateSequence("TabUltimateEdition")
		var_18_39:AnimateSequence("TabUltimateEdition")
		var_18_41:AnimateSequence("TabUltimateEdition")
		var_18_43:AnimateSequence("TabUltimateEdition")
		var_18_45:AnimateSequence("TabUltimateEdition")
		var_18_47:AnimateSequence("TabUltimateEdition")
		var_18_49:AnimateSequence("TabUltimateEdition")
		var_18_55:AnimateSequence("TabUltimateEdition")
	end

	var_18_0._sequences.TabUltimateEdition = var_18_82

	local var_18_83
	local var_18_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_02_preorder")
		}
	}

	var_18_8:RegisterAnimationSequence("TabCrossGenEdition", var_18_84)

	local var_18_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_ULT_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabCrossGenEdition", var_18_85)

	local var_18_86 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		}
	}

	var_18_21:RegisterAnimationSequence("TabCrossGenEdition", var_18_86)

	local var_18_87 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabCrossGenEdition", var_18_87)

	local var_18_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabCrossGenEdition", var_18_88)

	local var_18_89 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabCrossGenEdition", var_18_89)

	local var_18_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabCrossGenEdition", var_18_90)

	local var_18_91 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabCrossGenEdition", var_18_91)

	local var_18_92 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabCrossGenEdition", var_18_92)

	local var_18_93 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabCrossGenEdition", var_18_93)

	local var_18_94 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabCrossGenEdition", var_18_94)

	local var_18_95 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabCrossGenEdition", var_18_95)

	local var_18_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabCrossGenEdition", var_18_96)

	local var_18_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabCrossGenEdition", var_18_97)

	local var_18_98 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		}
	}

	var_18_45:RegisterAnimationSequence("TabCrossGenEdition", var_18_98)

	local var_18_99 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_47:RegisterAnimationSequence("TabCrossGenEdition", var_18_99)

	local var_18_100 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_49:RegisterAnimationSequence("TabCrossGenEdition", var_18_100)

	local var_18_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabCrossGenEdition", var_18_101)

	local function var_18_102()
		var_18_8:AnimateSequence("TabCrossGenEdition")
		var_18_19:AnimateSequence("TabCrossGenEdition")
		var_18_21:AnimateSequence("TabCrossGenEdition")
		var_18_23:AnimateSequence("TabCrossGenEdition")
		var_18_25:AnimateSequence("TabCrossGenEdition")
		var_18_27:AnimateSequence("TabCrossGenEdition")
		var_18_29:AnimateSequence("TabCrossGenEdition")
		var_18_31:AnimateSequence("TabCrossGenEdition")
		var_18_33:AnimateSequence("TabCrossGenEdition")
		var_18_35:AnimateSequence("TabCrossGenEdition")
		var_18_37:AnimateSequence("TabCrossGenEdition")
		var_18_39:AnimateSequence("TabCrossGenEdition")
		var_18_41:AnimateSequence("TabCrossGenEdition")
		var_18_43:AnimateSequence("TabCrossGenEdition")
		var_18_45:AnimateSequence("TabCrossGenEdition")
		var_18_47:AnimateSequence("TabCrossGenEdition")
		var_18_49:AnimateSequence("TabCrossGenEdition")
		var_18_55:AnimateSequence("TabCrossGenEdition")
	end

	var_18_0._sequences.TabCrossGenEdition = var_18_102

	local var_18_103
	local var_18_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_01_preorder")
		}
	}

	var_18_8:RegisterAnimationSequence("TabStandardEdition", var_18_104)

	local var_18_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabStandardEdition", var_18_105)

	local var_18_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabStandardEdition", var_18_106)

	local var_18_107 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabStandardEdition", var_18_107)

	local var_18_108 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		}
	}

	var_18_25:RegisterAnimationSequence("TabStandardEdition", var_18_108)

	local var_18_109 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabStandardEdition", var_18_109)

	local var_18_110 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabStandardEdition", var_18_110)

	local var_18_111 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabStandardEdition", var_18_111)

	local var_18_112 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabStandardEdition", var_18_112)

	local var_18_113 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabStandardEdition", var_18_113)

	local var_18_114 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabStandardEdition", var_18_114)

	local var_18_115 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabStandardEdition", var_18_115)

	local var_18_116 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabStandardEdition", var_18_116)

	local var_18_117 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabStandardEdition", var_18_117)

	local var_18_118 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabStandardEdition", var_18_118)

	local var_18_119 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabStandardEdition", var_18_119)

	local var_18_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabStandardEdition", var_18_120)

	local var_18_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabStandardEdition", var_18_121)

	local function var_18_122()
		var_18_8:AnimateSequence("TabStandardEdition")
		var_18_19:AnimateSequence("TabStandardEdition")
		var_18_21:AnimateSequence("TabStandardEdition")
		var_18_23:AnimateSequence("TabStandardEdition")
		var_18_25:AnimateSequence("TabStandardEdition")
		var_18_27:AnimateSequence("TabStandardEdition")
		var_18_29:AnimateSequence("TabStandardEdition")
		var_18_31:AnimateSequence("TabStandardEdition")
		var_18_33:AnimateSequence("TabStandardEdition")
		var_18_35:AnimateSequence("TabStandardEdition")
		var_18_37:AnimateSequence("TabStandardEdition")
		var_18_39:AnimateSequence("TabStandardEdition")
		var_18_41:AnimateSequence("TabStandardEdition")
		var_18_43:AnimateSequence("TabStandardEdition")
		var_18_45:AnimateSequence("TabStandardEdition")
		var_18_47:AnimateSequence("TabStandardEdition")
		var_18_49:AnimateSequence("TabStandardEdition")
		var_18_55:AnimateSequence("TabStandardEdition")
	end

	var_18_0._sequences.TabStandardEdition = var_18_122

	local var_18_123
	local var_18_124 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_03_postlaunch")
		}
	}

	var_18_8:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_124)

	local var_18_125 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_ULT_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_125)

	local var_18_126 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_DIGITAL_PACK_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		}
	}

	var_18_21:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_126)

	local var_18_127 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_BETA_HEADER")
		}
	}

	var_18_23:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_127)

	local var_18_128 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_EAGLE/VG_POSTLAUNCH_BONUS_ITEMS")
		}
	}

	var_18_25:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_128)

	local var_18_129 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_HEADER")
		}
	}

	var_18_27:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_129)

	local var_18_130 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_DESC")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_130)

	local var_18_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_DESC")
		}
	}

	var_18_31:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_131)

	local var_18_132 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_ITEMS_PACK_HEADER")
		}
	}

	var_18_33:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_132)

	local var_18_133 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 358
		}
	}

	var_18_35:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_133)

	local var_18_134 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_01")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -350
		}
	}

	var_18_37:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_134)

	local var_18_135 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_01")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -143
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -337
		}
	}

	var_18_39:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_135)

	local var_18_136 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_02")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 372
		}
	}

	var_18_41:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_136)

	local var_18_137 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 372
		}
	}

	var_18_43:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_137)

	local var_18_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_138)

	local var_18_139 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_139)

	local var_18_140 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_140)

	local var_18_141 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_141)

	local var_18_142 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 358
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_57:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_142)

	local var_18_143 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 118
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_59:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_143)

	local var_18_144 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 118
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_61:RegisterAnimationSequence("TabUltimateEditionPostLaunch", var_18_144)

	local function var_18_145()
		var_18_8:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_19:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_21:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_23:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_25:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_27:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_29:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_31:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_33:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_35:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_37:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_39:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_41:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_43:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_45:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_47:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_49:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_55:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_57:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_59:AnimateSequence("TabUltimateEditionPostLaunch")
		var_18_61:AnimateSequence("TabUltimateEditionPostLaunch")
	end

	var_18_0._sequences.TabUltimateEditionPostLaunch = var_18_145

	local var_18_146
	local var_18_147 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_02_postlaunch")
		}
	}

	var_18_8:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_147)

	local var_18_148 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_ULT_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_148)

	local var_18_149 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -321
		}
	}

	var_18_21:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_149)

	local var_18_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_150)

	local var_18_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_151)

	local var_18_152 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_152)

	local var_18_153 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_153)

	local var_18_154 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_154)

	local var_18_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_155)

	local var_18_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_156)

	local var_18_157 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_157)

	local var_18_158 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_158)

	local var_18_159 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_159)

	local var_18_160 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_160)

	local var_18_161 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		}
	}

	var_18_45:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_161)

	local var_18_162 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 376
		}
	}

	var_18_47:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_162)

	local var_18_163 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 376
		}
	}

	var_18_49:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_163)

	local var_18_164 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_164)

	local var_18_165 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		}
	}

	var_18_57:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_165)

	local var_18_166 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 771
		}
	}

	var_18_59:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_166)

	local var_18_167 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 771
		}
	}

	var_18_61:RegisterAnimationSequence("TabCrossGenEditionPostLaunch", var_18_167)

	local function var_18_168()
		var_18_8:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_19:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_21:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_23:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_25:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_27:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_29:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_31:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_33:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_35:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_37:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_39:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_41:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_43:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_45:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_47:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_49:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_55:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_57:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_59:AnimateSequence("TabCrossGenEditionPostLaunch")
		var_18_61:AnimateSequence("TabCrossGenEditionPostLaunch")
	end

	var_18_0._sequences.TabCrossGenEditionPostLaunch = var_18_168

	local var_18_169
	local var_18_170 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_01_postlaunch")
		}
	}

	var_18_8:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_170)

	local var_18_171 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_19:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_171)

	local var_18_172 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -321
		}
	}

	var_18_21:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_172)

	local var_18_173 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_173)

	local var_18_174 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -321
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		}
	}

	var_18_25:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_174)

	local var_18_175 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_175)

	local var_18_176 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_176)

	local var_18_177 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_177)

	local var_18_178 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_178)

	local var_18_179 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_179)

	local var_18_180 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_180)

	local var_18_181 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_181)

	local var_18_182 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_182)

	local var_18_183 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_183)

	local var_18_184 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_45:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_184)

	local var_18_185 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_47:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_185)

	local var_18_186 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_49:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_186)

	local var_18_187 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_187)

	local var_18_188 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 406
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 805
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_57:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_188)

	local var_18_189 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 771
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_59:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_189)

	local var_18_190 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 771
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_61:RegisterAnimationSequence("TabStandardEditionPostLaunch", var_18_190)

	local function var_18_191()
		var_18_8:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_19:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_21:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_23:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_25:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_27:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_29:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_31:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_33:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_35:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_37:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_39:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_41:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_43:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_45:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_47:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_49:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_55:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_57:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_59:AnimateSequence("TabStandardEditionPostLaunch")
		var_18_61:AnimateSequence("TabStandardEditionPostLaunch")
	end

	var_18_0._sequences.TabStandardEditionPostLaunch = var_18_191

	local var_18_192
	local var_18_193 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("STORE/ZEUS_PRE_ORDER"),
			child = var_18_0.PreOrderButton.Text
		}
	}

	var_18_15:RegisterAnimationSequence("ConsoleConfig", var_18_193)

	local function var_18_194()
		var_18_15:AnimateSequence("ConsoleConfig")
	end

	var_18_0._sequences.ConsoleConfig = var_18_194

	local var_18_195
	local var_18_196 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("HideAll", var_18_196)

	local var_18_197 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_11:RegisterAnimationSequence("HideAll", var_18_197)

	local var_18_198 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_13:RegisterAnimationSequence("HideAll", var_18_198)

	local var_18_199 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_15:RegisterAnimationSequence("HideAll", var_18_199)

	local function var_18_200()
		var_18_8:AnimateSequence("HideAll")
		var_18_11:AnimateSequence("HideAll")
		var_18_13:AnimateSequence("HideAll")
		var_18_15:AnimateSequence("HideAll")
	end

	var_18_0._sequences.HideAll = var_18_200

	local var_18_201
	local var_18_202 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_8:RegisterAnimationSequence("ShowAll", var_18_202)

	local var_18_203 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_11:RegisterAnimationSequence("ShowAll", var_18_203)

	local var_18_204 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_13:RegisterAnimationSequence("ShowAll", var_18_204)

	local var_18_205 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_15:RegisterAnimationSequence("ShowAll", var_18_205)

	local function var_18_206()
		var_18_8:AnimateSequence("ShowAll")
		var_18_11:AnimateSequence("ShowAll")
		var_18_13:AnimateSequence("ShowAll")
		var_18_15:AnimateSequence("ShowAll")
	end

	var_18_0._sequences.ShowAll = var_18_206

	local var_18_207
	local var_18_208 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_02_preorder")
		}
	}

	var_18_8:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_208)

	local var_18_209 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_209)

	local var_18_210 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		}
	}

	var_18_21:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_210)

	local var_18_211 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_211)

	local var_18_212 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_PC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_212)

	local var_18_213 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_213)

	local var_18_214 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_214)

	local var_18_215 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_215)

	local var_18_216 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_216)

	local var_18_217 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_217)

	local var_18_218 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_218)

	local var_18_219 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_219)

	local var_18_220 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_220)

	local var_18_221 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_221)

	local var_18_222 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		}
	}

	var_18_45:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_222)

	local var_18_223 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_47:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_223)

	local var_18_224 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_49:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_224)

	local var_18_225 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabCrossGenEditionPC", var_18_225)

	local function var_18_226()
		var_18_8:AnimateSequence("TabCrossGenEditionPC")
		var_18_19:AnimateSequence("TabCrossGenEditionPC")
		var_18_21:AnimateSequence("TabCrossGenEditionPC")
		var_18_23:AnimateSequence("TabCrossGenEditionPC")
		var_18_25:AnimateSequence("TabCrossGenEditionPC")
		var_18_27:AnimateSequence("TabCrossGenEditionPC")
		var_18_29:AnimateSequence("TabCrossGenEditionPC")
		var_18_31:AnimateSequence("TabCrossGenEditionPC")
		var_18_33:AnimateSequence("TabCrossGenEditionPC")
		var_18_35:AnimateSequence("TabCrossGenEditionPC")
		var_18_37:AnimateSequence("TabCrossGenEditionPC")
		var_18_39:AnimateSequence("TabCrossGenEditionPC")
		var_18_41:AnimateSequence("TabCrossGenEditionPC")
		var_18_43:AnimateSequence("TabCrossGenEditionPC")
		var_18_45:AnimateSequence("TabCrossGenEditionPC")
		var_18_47:AnimateSequence("TabCrossGenEditionPC")
		var_18_49:AnimateSequence("TabCrossGenEditionPC")
		var_18_55:AnimateSequence("TabCrossGenEditionPC")
	end

	var_18_0._sequences.TabCrossGenEditionPC = var_18_226

	local var_18_227
	local var_18_228 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_02_postlaunch")
		}
	}

	var_18_8:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_228)

	local var_18_229 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_229)

	local var_18_230 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -321
		}
	}

	var_18_21:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_230)

	local var_18_231 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_231)

	local var_18_232 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_PC")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_232)

	local var_18_233 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_233)

	local var_18_234 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_234)

	local var_18_235 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_235)

	local var_18_236 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_236)

	local var_18_237 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_237)

	local var_18_238 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_238)

	local var_18_239 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_239)

	local var_18_240 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_240)

	local var_18_241 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_241)

	local var_18_242 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_242)

	local var_18_243 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 389
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_243)

	local var_18_244 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 389
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_244)

	local var_18_245 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_245)

	local var_18_246 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -16
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 806
		}
	}

	var_18_57:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_246)

	local var_18_247 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 771
		}
	}

	var_18_59:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_247)

	local var_18_248 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 439
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 771
		}
	}

	var_18_61:RegisterAnimationSequence("TabCrossGenEditionPostLaunchPC", var_18_248)

	local function var_18_249()
		var_18_8:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_19:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_21:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_23:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_25:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_27:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_29:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_31:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_33:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_35:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_37:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_39:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_41:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_43:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_45:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_47:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_49:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_55:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_57:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_59:AnimateSequence("TabCrossGenEditionPostLaunchPC")
		var_18_61:AnimateSequence("TabCrossGenEditionPostLaunchPC")
	end

	var_18_0._sequences.TabCrossGenEditionPostLaunchPC = var_18_249

	local var_18_250
	local var_18_251 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_01_pc_postlaunch")
		}
	}

	var_18_8:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_251)

	local var_18_252 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_19:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_252)

	local var_18_253 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -321
		}
	}

	var_18_21:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_253)

	local var_18_254 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_254)

	local var_18_255 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_PC")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 405
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 804
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -345
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -321
		}
	}

	var_18_25:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_255)

	local var_18_256 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_256)

	local var_18_257 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_257)

	local var_18_258 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_258)

	local var_18_259 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_259)

	local var_18_260 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_260)

	local var_18_261 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_261)

	local var_18_262 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_262)

	local var_18_263 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_263)

	local var_18_264 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_264)

	local var_18_265 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_45:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_265)

	local var_18_266 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 386
		}
	}

	var_18_47:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_266)

	local var_18_267 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 386
		}
	}

	var_18_49:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_267)

	local var_18_268 = {
		{
			value = 0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_268)

	local var_18_269 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 801
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_57:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_269)

	local var_18_270 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 441
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 769
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_59:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_270)

	local var_18_271 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 441
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 769
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_61:RegisterAnimationSequence("TabStandardEditionPostLaunchPC", var_18_271)

	local function var_18_272()
		var_18_8:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_19:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_21:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_23:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_25:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_27:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_29:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_31:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_33:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_35:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_37:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_39:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_41:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_43:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_45:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_47:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_49:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_55:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_57:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_59:AnimateSequence("TabStandardEditionPostLaunchPC")
		var_18_61:AnimateSequence("TabStandardEditionPostLaunchPC")
	end

	var_18_0._sequences.TabStandardEditionPostLaunchPC = var_18_272

	local var_18_273
	local var_18_274 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_03_preorder")
		}
	}

	var_18_8:RegisterAnimationSequence("TabUltimateEditionPC", var_18_274)

	local var_18_275 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabUltimateEditionPC", var_18_275)

	local var_18_276 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_DIGITAL_PACK_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabUltimateEditionPC", var_18_276)

	local var_18_277 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_BETA_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabUltimateEditionPC", var_18_277)

	local var_18_278 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_PC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabUltimateEditionPC", var_18_278)

	local var_18_279 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabUltimateEditionPC", var_18_279)

	local var_18_280 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_DESC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabUltimateEditionPC", var_18_280)

	local var_18_281 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_DESC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabUltimateEditionPC", var_18_281)

	local var_18_282 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_ITEMS_PACK_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabUltimateEditionPC", var_18_282)

	local var_18_283 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabUltimateEditionPC", var_18_283)

	local var_18_284 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_01")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabUltimateEditionPC", var_18_284)

	local var_18_285 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_01")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabUltimateEditionPC", var_18_285)

	local var_18_286 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_02")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabUltimateEditionPC", var_18_286)

	local var_18_287 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabUltimateEditionPC", var_18_287)

	local var_18_288 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabUltimateEditionPC", var_18_288)

	local var_18_289 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabUltimateEditionPC", var_18_289)

	local var_18_290 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabUltimateEditionPC", var_18_290)

	local var_18_291 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabUltimateEditionPC", var_18_291)

	local function var_18_292()
		var_18_8:AnimateSequence("TabUltimateEditionPC")
		var_18_19:AnimateSequence("TabUltimateEditionPC")
		var_18_21:AnimateSequence("TabUltimateEditionPC")
		var_18_23:AnimateSequence("TabUltimateEditionPC")
		var_18_25:AnimateSequence("TabUltimateEditionPC")
		var_18_27:AnimateSequence("TabUltimateEditionPC")
		var_18_29:AnimateSequence("TabUltimateEditionPC")
		var_18_31:AnimateSequence("TabUltimateEditionPC")
		var_18_33:AnimateSequence("TabUltimateEditionPC")
		var_18_35:AnimateSequence("TabUltimateEditionPC")
		var_18_37:AnimateSequence("TabUltimateEditionPC")
		var_18_39:AnimateSequence("TabUltimateEditionPC")
		var_18_41:AnimateSequence("TabUltimateEditionPC")
		var_18_43:AnimateSequence("TabUltimateEditionPC")
		var_18_45:AnimateSequence("TabUltimateEditionPC")
		var_18_47:AnimateSequence("TabUltimateEditionPC")
		var_18_49:AnimateSequence("TabUltimateEditionPC")
		var_18_55:AnimateSequence("TabUltimateEditionPC")
	end

	var_18_0._sequences.TabUltimateEditionPC = var_18_292

	local var_18_293
	local var_18_294 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_03_postlaunch")
		}
	}

	var_18_8:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_294)

	local var_18_295 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_295)

	local var_18_296 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_DIGITAL_PACK_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_296)

	local var_18_297 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_BETA_HEADER")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_297)

	local var_18_298 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_EAGLE/VG_POSTLAUNCH_BONUS_ITEMS")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_298)

	local var_18_299 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_HEADER")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_299)

	local var_18_300 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_DESC")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		}
	}

	var_18_29:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_300)

	local var_18_301 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_DESC")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_301)

	local var_18_302 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_ITEMS_PACK_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_302)

	local var_18_303 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_HEADER")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_303)

	local var_18_304 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_01")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -350
		}
	}

	var_18_37:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_304)

	local var_18_305 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_01")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -337
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -143
		}
	}

	var_18_39:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_305)

	local var_18_306 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_02")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 136
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 365
		}
	}

	var_18_41:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_306)

	local var_18_307 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 136
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 365
		}
	}

	var_18_43:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_307)

	local var_18_308 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_308)

	local var_18_309 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_309)

	local var_18_310 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_310)

	local var_18_311 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_311)

	local var_18_312 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -350
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 358
		}
	}

	var_18_57:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_312)

	local var_18_313 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 118
		}
	}

	var_18_59:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_313)

	local var_18_314 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 118
		}
	}

	var_18_61:RegisterAnimationSequence("TabUltimateEditionPostLaunchPC", var_18_314)

	local function var_18_315()
		var_18_8:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_19:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_21:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_23:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_25:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_27:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_29:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_31:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_33:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_35:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_37:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_39:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_41:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_43:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_45:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_47:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_49:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_55:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_57:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_59:AnimateSequence("TabUltimateEditionPostLaunchPC")
		var_18_61:AnimateSequence("TabUltimateEditionPostLaunchPC")
	end

	var_18_0._sequences.TabUltimateEditionPostLaunchPC = var_18_315

	local var_18_316
	local var_18_317 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_02_preorder")
		}
	}

	var_18_8:RegisterAnimationSequence("TabStandardEditionPC", var_18_317)

	local var_18_318 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabStandardEditionPC", var_18_318)

	local var_18_319 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabStandardEditionPC", var_18_319)

	local var_18_320 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabStandardEditionPC", var_18_320)

	local var_18_321 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_PC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabStandardEditionPC", var_18_321)

	local var_18_322 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabStandardEditionPC", var_18_322)

	local var_18_323 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -126
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -106
		}
	}

	var_18_29:RegisterAnimationSequence("TabStandardEditionPC", var_18_323)

	local var_18_324 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabStandardEditionPC", var_18_324)

	local var_18_325 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabStandardEditionPC", var_18_325)

	local var_18_326 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabStandardEditionPC", var_18_326)

	local var_18_327 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabStandardEditionPC", var_18_327)

	local var_18_328 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabStandardEditionPC", var_18_328)

	local var_18_329 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabStandardEditionPC", var_18_329)

	local var_18_330 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabStandardEditionPC", var_18_330)

	local var_18_331 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabStandardEditionPC", var_18_331)

	local var_18_332 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabStandardEditionPC", var_18_332)

	local var_18_333 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabStandardEditionPC", var_18_333)

	local var_18_334 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabStandardEditionPC", var_18_334)

	local function var_18_335()
		var_18_8:AnimateSequence("TabStandardEditionPC")
		var_18_19:AnimateSequence("TabStandardEditionPC")
		var_18_21:AnimateSequence("TabStandardEditionPC")
		var_18_23:AnimateSequence("TabStandardEditionPC")
		var_18_25:AnimateSequence("TabStandardEditionPC")
		var_18_27:AnimateSequence("TabStandardEditionPC")
		var_18_29:AnimateSequence("TabStandardEditionPC")
		var_18_31:AnimateSequence("TabStandardEditionPC")
		var_18_33:AnimateSequence("TabStandardEditionPC")
		var_18_35:AnimateSequence("TabStandardEditionPC")
		var_18_37:AnimateSequence("TabStandardEditionPC")
		var_18_39:AnimateSequence("TabStandardEditionPC")
		var_18_41:AnimateSequence("TabStandardEditionPC")
		var_18_43:AnimateSequence("TabStandardEditionPC")
		var_18_45:AnimateSequence("TabStandardEditionPC")
		var_18_47:AnimateSequence("TabStandardEditionPC")
		var_18_49:AnimateSequence("TabStandardEditionPC")
		var_18_55:AnimateSequence("TabStandardEditionPC")
	end

	var_18_0._sequences.TabStandardEditionPC = var_18_335

	local var_18_336
	local var_18_337 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_01_pc_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_337)

	local var_18_338 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_338)

	local var_18_339 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		}
	}

	var_18_21:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_339)

	local var_18_340 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_340)

	local var_18_341 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_PC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_341)

	local var_18_342 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_342)

	local var_18_343 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_29:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_343)

	local var_18_344 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_344)

	local var_18_345 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_345)

	local var_18_346 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_346)

	local var_18_347 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_347)

	local var_18_348 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_348)

	local var_18_349 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_349)

	local var_18_350 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_350)

	local var_18_351 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		}
	}

	var_18_45:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_351)

	local var_18_352 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_47:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_352)

	local var_18_353 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_49:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_353)

	local var_18_354 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabCrossGenEditionPostBetaPC", var_18_354)

	local function var_18_355()
		var_18_8:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_19:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_21:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_23:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_25:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_27:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_29:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_31:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_33:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_35:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_37:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_39:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_41:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_43:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_45:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_47:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_49:AnimateSequence("TabCrossGenEditionPostBetaPC")
		var_18_55:AnimateSequence("TabCrossGenEditionPostBetaPC")
	end

	var_18_0._sequences.TabCrossGenEditionPostBetaPC = var_18_355

	local var_18_356
	local var_18_357 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_01_pc_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_357)

	local var_18_358 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_358)

	local var_18_359 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_359)

	local var_18_360 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_360)

	local var_18_361 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_PC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_361)

	local var_18_362 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_362)

	local var_18_363 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_29:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_363)

	local var_18_364 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_364)

	local var_18_365 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_365)

	local var_18_366 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_366)

	local var_18_367 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_367)

	local var_18_368 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_368)

	local var_18_369 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_369)

	local var_18_370 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_370)

	local var_18_371 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_371)

	local var_18_372 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_372)

	local var_18_373 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_373)

	local var_18_374 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabStandardEditionPostBetaPC", var_18_374)

	local function var_18_375()
		var_18_8:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_19:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_21:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_23:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_25:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_27:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_29:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_31:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_33:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_35:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_37:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_39:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_41:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_43:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_45:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_47:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_49:AnimateSequence("TabStandardEditionPostBetaPC")
		var_18_55:AnimateSequence("TabStandardEditionPostBetaPC")
	end

	var_18_0._sequences.TabStandardEditionPostBetaPC = var_18_375

	local var_18_376
	local var_18_377 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_03_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_377)

	local var_18_378 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_19:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_378)

	local var_18_379 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_DIGITAL_PACK_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_379)

	local var_18_380 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_BETA_HEADER")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_380)

	local var_18_381 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_PC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_381)

	local var_18_382 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_HEADER")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_382)

	local var_18_383 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_DESC")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		}
	}

	var_18_29:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_383)

	local var_18_384 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_DESC")
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_384)

	local var_18_385 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_ITEMS_PACK_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_385)

	local var_18_386 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_386)

	local var_18_387 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_01")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_387)

	local var_18_388 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_01")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_388)

	local var_18_389 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_02")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_389)

	local var_18_390 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_390)

	local var_18_391 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_391)

	local var_18_392 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_392)

	local var_18_393 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_393)

	local var_18_394 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabUltimateEditionPostBetaPC", var_18_394)

	local function var_18_395()
		var_18_8:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_19:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_21:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_23:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_25:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_27:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_29:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_31:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_33:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_35:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_37:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_39:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_41:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_43:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_45:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_47:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_49:AnimateSequence("TabUltimateEditionPostBetaPC")
		var_18_55:AnimateSequence("TabUltimateEditionPostBetaPC")
	end

	var_18_0._sequences.TabUltimateEditionPostBetaPC = var_18_395

	local var_18_396
	local var_18_397 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_03_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_397)

	local var_18_398 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_19:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_398)

	local var_18_399 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_DIGITAL_PACK_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_399)

	local var_18_400 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_BETA_HEADER")
		}
	}

	var_18_23:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_400)

	local var_18_401 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		}
	}

	var_18_25:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_401)

	local var_18_402 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_HEADER")
		}
	}

	var_18_27:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_402)

	local var_18_403 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_DESC")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		}
	}

	var_18_29:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_403)

	local var_18_404 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_DESC")
		}
	}

	var_18_31:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_404)

	local var_18_405 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_ITEMS_PACK_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_405)

	local var_18_406 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_HEADER")
		}
	}

	var_18_35:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_406)

	local var_18_407 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_01")
		}
	}

	var_18_37:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_407)

	local var_18_408 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_01")
		}
	}

	var_18_39:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_408)

	local var_18_409 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_02")
		}
	}

	var_18_41:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_409)

	local var_18_410 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02")
		}
	}

	var_18_43:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_410)

	local var_18_411 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_411)

	local var_18_412 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_412)

	local var_18_413 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_413)

	local var_18_414 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabUltimateEditionPostBetaMS", var_18_414)

	local function var_18_415()
		var_18_8:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_19:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_21:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_23:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_25:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_27:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_29:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_31:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_33:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_35:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_37:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_39:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_41:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_43:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_45:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_47:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_49:AnimateSequence("TabUltimateEditionPostBetaMS")
		var_18_55:AnimateSequence("TabUltimateEditionPostBetaMS")
	end

	var_18_0._sequences.TabUltimateEditionPostBetaMS = var_18_415

	local var_18_416
	local var_18_417 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_01_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_417)

	local var_18_418 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_418)

	local var_18_419 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_419)

	local var_18_420 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_420)

	local var_18_421 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		}
	}

	var_18_25:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_421)

	local var_18_422 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_422)

	local var_18_423 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		}
	}

	var_18_29:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_423)

	local var_18_424 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_424)

	local var_18_425 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_425)

	local var_18_426 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_426)

	local var_18_427 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_427)

	local var_18_428 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_428)

	local var_18_429 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_429)

	local var_18_430 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_430)

	local var_18_431 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_431)

	local var_18_432 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_432)

	local var_18_433 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_433)

	local var_18_434 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabStandardEditionPostBetaMS", var_18_434)

	local function var_18_435()
		var_18_8:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_19:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_21:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_23:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_25:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_27:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_29:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_31:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_33:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_35:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_37:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_39:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_41:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_43:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_45:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_47:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_49:AnimateSequence("TabStandardEditionPostBetaMS")
		var_18_55:AnimateSequence("TabStandardEditionPostBetaMS")
	end

	var_18_0._sequences.TabStandardEditionPostBetaMS = var_18_435

	local var_18_436
	local var_18_437 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_02_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_437)

	local var_18_438 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_ULT_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_438)

	local var_18_439 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		}
	}

	var_18_21:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_439)

	local var_18_440 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_440)

	local var_18_441 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_441)

	local var_18_442 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_442)

	local var_18_443 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_29:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_443)

	local var_18_444 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_444)

	local var_18_445 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_445)

	local var_18_446 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_446)

	local var_18_447 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_447)

	local var_18_448 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_448)

	local var_18_449 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_449)

	local var_18_450 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_450)

	local var_18_451 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		}
	}

	var_18_45:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_451)

	local var_18_452 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_47:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_452)

	local var_18_453 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_49:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_453)

	local var_18_454 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabCrossGenEditionPostBetaSY", var_18_454)

	local function var_18_455()
		var_18_8:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_19:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_21:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_23:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_25:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_27:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_29:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_31:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_33:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_35:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_37:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_39:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_41:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_43:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_45:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_47:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_49:AnimateSequence("TabCrossGenEditionPostBetaSY")
		var_18_55:AnimateSequence("TabCrossGenEditionPostBetaSY")
	end

	var_18_0._sequences.TabCrossGenEditionPostBetaSY = var_18_455

	local var_18_456
	local var_18_457 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_02_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_457)

	local var_18_458 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_ULT_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_458)

	local var_18_459 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		}
	}

	var_18_21:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_459)

	local var_18_460 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_460)

	local var_18_461 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_25:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_461)

	local var_18_462 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_462)

	local var_18_463 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_29:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_463)

	local var_18_464 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_464)

	local var_18_465 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_465)

	local var_18_466 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_466)

	local var_18_467 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_467)

	local var_18_468 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_468)

	local var_18_469 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_469)

	local var_18_470 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_470)

	local var_18_471 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		}
	}

	var_18_45:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_471)

	local var_18_472 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_47:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_472)

	local var_18_473 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		}
	}

	var_18_49:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_473)

	local var_18_474 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabCrossGenEditionPostBetaMS", var_18_474)

	local function var_18_475()
		var_18_8:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_19:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_21:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_23:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_25:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_27:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_29:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_31:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_33:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_35:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_37:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_39:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_41:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_43:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_45:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_47:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_49:AnimateSequence("TabCrossGenEditionPostBetaMS")
		var_18_55:AnimateSequence("TabCrossGenEditionPostBetaMS")
	end

	var_18_0._sequences.TabCrossGenEditionPostBetaMS = var_18_475

	local var_18_476
	local var_18_477 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_01_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_477)

	local var_18_478 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_STANDARD_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_478)

	local var_18_479 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_479)

	local var_18_480 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_23:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_480)

	local var_18_481 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		}
	}

	var_18_25:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_481)

	local var_18_482 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_27:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_482)

	local var_18_483 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_29:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_483)

	local var_18_484 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_31:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_484)

	local var_18_485 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_485)

	local var_18_486 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_35:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_486)

	local var_18_487 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_37:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_487)

	local var_18_488 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_39:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_488)

	local var_18_489 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_41:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_489)

	local var_18_490 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_43:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_490)

	local var_18_491 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_491)

	local var_18_492 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_492)

	local var_18_493 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_493)

	local var_18_494 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabStandardEditionPostBetaSY", var_18_494)

	local function var_18_495()
		var_18_8:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_19:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_21:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_23:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_25:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_27:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_29:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_31:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_33:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_35:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_37:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_39:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_41:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_43:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_45:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_47:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_49:AnimateSequence("TabStandardEditionPostBetaSY")
		var_18_55:AnimateSequence("TabStandardEditionPostBetaSY")
	end

	var_18_0._sequences.TabStandardEditionPostBetaSY = var_18_495

	local var_18_496
	local var_18_497 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("mw_store_vanguard_upsell_03_postbeta")
		}
	}

	var_18_8:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_497)

	local var_18_498 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_CROSSGEN_ULT_SUBTITLE")
		}
	}

	var_18_19:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_498)

	local var_18_499 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_DIGITAL_PACK_HEADER")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -800
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -401
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_21:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_499)

	local var_18_500 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_BETA_HEADER")
		}
	}

	var_18_23:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_500)

	local var_18_501 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_HEADER_SY_MS")
		}
	}

	var_18_25:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_501)

	local var_18_502 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_HEADER")
		}
	}

	var_18_27:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_502)

	local var_18_503 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_INSTANT_GRAT_DESC")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 214
		}
	}

	var_18_29:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_503)

	local var_18_504 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_FUTURE_GRAT_DESC")
		}
	}

	var_18_31:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_504)

	local var_18_505 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_ITEMS_PACK_HEADER")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_33:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_505)

	local var_18_506 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_HEADER")
		}
	}

	var_18_35:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_506)

	local var_18_507 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_01")
		}
	}

	var_18_37:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_507)

	local var_18_508 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_01")
		}
	}

	var_18_39:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_508)

	local var_18_509 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_SUBTITLE_02")
		}
	}

	var_18_41:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_509)

	local var_18_510 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_BAKER/UPSELL_2021_ULT_CONSUMABLES_DESC_02")
		}
	}

	var_18_43:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_510)

	local var_18_511 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -349
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 68
		}
	}

	var_18_45:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_511)

	local var_18_512 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 191
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 215
		}
	}

	var_18_47:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_512)

	local var_18_513 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -348
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 218
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 234
		}
	}

	var_18_49:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_513)

	local var_18_514 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_18_55:RegisterAnimationSequence("TabUltimateEditionPostBetaSY", var_18_514)

	local function var_18_515()
		var_18_8:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_19:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_21:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_23:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_25:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_27:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_29:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_31:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_33:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_35:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_37:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_39:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_41:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_43:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_45:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_47:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_49:AnimateSequence("TabUltimateEditionPostBetaSY")
		var_18_55:AnimateSequence("TabUltimateEditionPostBetaSY")
	end

	var_18_0._sequences.TabUltimateEditionPostBetaSY = var_18_515

	var_0_18(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("VGPreOrderPopup", VGPreOrderPopup)
LUI.FlowManager.RegisterStackPopBehaviour("VGPreOrderPopup", var_0_17)
LockTable(_M)
