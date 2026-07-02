module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("GameInstallManager", {
	"fenceSpinner"
})

local var_0_0 = {
	STORE.OPTIONAL_PACK_1_NAME,
	STORE.OPTIONAL_PACK_2_NAME,
	STORE.OPTIONAL_PACK_3_NAME,
	STORE.OPTIONAL_PACK_4_NAME,
	STORE.OPTIONAL_PACK_5_NAME
}
local var_0_1 = {
	MW_GAME_PACKS = 0,
	T9_GAME_PACKS = 2,
	MW_TEXTURE_PACKS = 1
}

local function var_0_2(arg_1_0, arg_1_1)
	if arg_1_0._highResPackInstall > 0 then
		local var_1_0 = var_0_0[arg_1_0._highResPackInstall]

		for iter_1_0 = 1, #arg_1_0._products do
			local var_1_1 = arg_1_0._products[iter_1_0]

			if var_1_1.productId == var_1_0 then
				arg_1_0.DLCGrid:SetFocusedPosition({
					x = 0,
					y = iter_1_0 - 1
				}, true)
				arg_1_0:UpdateDetails(var_1_1, var_1_1.status == InGameStoreProductStatus.INSTALLED)

				return
			end
		end
	else
		local var_1_2

		if arg_1_1 == MAIN_MENU.BladeKeys.SP then
			var_1_2 = "sp"
		elseif arg_1_1 == MAIN_MENU.BladeKeys.MP then
			var_1_2 = "mp"
		elseif arg_1_1 == MAIN_MENU.BladeKeys.CP then
			var_1_2 = "cp"
		end

		if var_1_2 then
			for iter_1_1 = 1, #arg_1_0._products do
				local var_1_3 = arg_1_0._products[iter_1_1]
				local var_1_4 = string.find(var_1_3.productId, var_1_2)

				if (var_1_4 and var_1_4 > 0 or var_1_3.productId == STORE.DATA_PACK_1_NAME or var_1_3.productId == STORE.DATA_PACK_2_NAME and arg_1_1 ~= MAIN_MENU.BladeKeys.SP) and var_1_3.status == InGameStoreProductStatus.INSTALLED then
					local var_1_5 = arg_1_0.DLCGrid:GetElementAtPosition(0, iter_1_1 - 1)

					var_1_5:SetIsDLCValue(true)
					ACTIONS.AnimateSequence(var_1_5, "Highlight")

					var_1_3.isDLCForCurrentMode = true
				end
			end
		end
	end
end

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0 = "t9"
	local var_2_1
	local var_2_2 = "optional"
	local var_2_3
	local var_2_4 = {}
	local var_2_5

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		local var_2_6 = false
		local var_2_7 = string.find(iter_2_1.productId, var_2_0)
		local var_2_8 = string.find(iter_2_1.productId, var_2_2)

		if arg_2_1 == var_0_1.T9_GAME_PACKS and var_2_7 ~= nil then
			var_2_6 = true
		elseif arg_2_1 == var_0_1.MW_TEXTURE_PACKS and var_2_8 ~= nil then
			var_2_6 = true
		elseif arg_2_1 == var_0_1.MW_GAME_PACKS and var_2_7 == nil and var_2_8 == nil then
			var_2_6 = true
		end

		if var_2_6 then
			table.insert(var_2_4, iter_2_1)
		end
	end

	return var_2_4
end

local function var_0_4(arg_3_0, arg_3_1)
	arg_3_0._products = InGameStore.GetCategoryProducts(arg_3_1, STORE.GameDLCCategory)

	if arg_3_0._products then
		arg_3_0._products = var_0_3(arg_3_0._products, arg_3_0._currentTabIndex)

		arg_3_0.DLCGrid:SetNumRows(#arg_3_0._products)
		arg_3_0.DLCGrid:RefreshContent()
		arg_3_0.DLCGrid:SetFocusedPosition({
			x = 0,
			y = 0
		}, true)

		if arg_3_0._gameModeToHighlight or arg_3_0._highResPackInstall > 0 then
			var_0_2(arg_3_0, arg_3_0._gameModeToHighlight)
		end

		if arg_3_0._highResPackInstall == 0 and arg_3_0._products[1] then
			arg_3_0:UpdateDetails(arg_3_0._products[1], arg_3_0._products[1].status == InGameStoreProductStatus.INSTALLED)
		end

		ACTIONS.AnimateSequence(arg_3_0, "ShowDetails")
	end
end

local function var_0_5(arg_4_0, arg_4_1)
	return function()
		arg_4_0._currentTabIndex = arg_4_0.Tabs:GetCurrentTabIndex()

		arg_4_0:SetupDLCGrid(arg_4_1)
	end
end

local function var_0_6(arg_6_0, arg_6_1)
	assert(arg_6_0.Tabs)

	local var_6_0 = {}

	table.insert(var_6_0, {
		hasDefaultFocus = true,
		disabled = false,
		name = Engine.CBBHFCGDIC("LUA_MENU/MW_GAME_PACKS_DLC_TAB_NAME"),
		focusFunction = var_0_5(arg_6_0, arg_6_1)
	})
	arg_6_0.Tabs:SetTabs(var_6_0)
	arg_6_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

local function var_0_7(arg_7_0, arg_7_1)
	InGameStore.FetchCatalog(arg_7_1, true, true)
	ACTIONS.AnimateSequence(arg_7_0, "ShowFetching")

	local var_7_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "refresh_timer",
			controllerIndex = arg_7_1
		}
	})

	var_7_0.id = "refreshTimer"

	arg_7_0:addElement(var_7_0)

	arg_7_0._refreshTimer = var_7_0

	arg_7_0:registerEventHandler("refresh_timer", function(arg_8_0, arg_8_1)
		local var_8_0 = InGameStore.GetCatalogStatus(arg_8_1.controllerIndex)
		local var_8_1 = false

		if var_8_0 == InGameStoreCatalogStatus.READY then
			var_0_4(arg_7_0, arg_7_1)

			var_8_1 = true
		elseif var_8_0 == InGameStoreCatalogStatus.ERROR then
			arg_7_0.UnableToFetchContent:SetAlpha(1)

			var_8_1 = true

			local var_8_2 = {}

			if Engine.DBFCJBDJEC() then
				local var_8_3 = Engine.BIAFEJHHDD()

				if var_8_3 ~= nil then
					local var_8_4 = Engine.JCBDICCAH(var_8_3)

					var_8_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_8_4)

					Engine.DCFIDJGACA()
				else
					var_8_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_8_5 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				var_8_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_8_5)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_8_2, nil, false, true)
			Engine.DHCGHHBHCH()
			ACTIONS.LeaveMenu(arg_7_0)
		end

		if var_8_1 then
			ACTIONS.AnimateSequence(arg_8_0, "HideFetching")
			arg_8_0._refreshTimer:closeTree()

			arg_8_0._refreshTimer = nil
		end
	end)
end

local function var_0_8(arg_9_0)
	local var_9_0 = "HideInstallProgressBar"

	if Engine.CIEGIACHAE() and arg_9_0._curProduct and arg_9_0._curProduct.productId then
		local var_9_1 = InGameStore.GetProduct(arg_9_0._controllerIndex, arg_9_0._curProduct.productId)

		if var_9_1 and var_9_1.status == InGameStoreProductStatus.DOWNLOADING then
			var_9_0 = "ShowInstallProgressBar"

			assert(var_9_1 and var_9_1.bytesDownloaded and var_9_1.bytesTotal)

			if var_9_1.bytesDownloaded ~= 0 and var_9_1.bytesTotal ~= 0 then
				arg_9_0.InstallProgressBar:SetProgress(tonumber(var_9_1.bytesDownloaded / var_9_1.bytesTotal), 0)
			end

			arg_9_0.DownloadProgressDescription:setText(Engine.CBBHFCGDIC("LUA_MENU/DLC_DOWNLOAD_PROGRESS_DESCRIPTION", Engine.JCBDICCAH(var_9_1.title)))
		end
	end

	ACTIONS.AnimateSequence(arg_9_0, var_9_0)
end

local function var_0_9(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._curProduct = arg_10_1

	arg_10_0.DLCHeader:setText(arg_10_1.title)
	arg_10_0.DLCDescription:setText(arg_10_1.contentLong)

	local var_10_0 = arg_10_0.DLCHeader:GetCurrentAnchorsAndPositions().top
	local var_10_1 = LAYOUT.GetElementHeight(arg_10_0.DLCHeader)
	local var_10_2 = arg_10_0.DLCDescription:GetCurrentAnchorsAndPositions().top
	local var_10_3 = LAYOUT.GetTextHeightWithWrapping(arg_10_0.DLCDescription, arg_10_0.DLCDescription:getText())
	local var_10_4 = var_10_2 + var_10_3
	local var_10_5 = 100 * _1080p
	local var_10_6 = 50 * _1080p
	local var_10_7 = var_10_0 + var_10_1 + var_10_3 + var_10_5 + var_10_6

	arg_10_0.DetailsBG:SetBottom(var_10_7, 200)

	local var_10_8

	var_10_8 = arg_10_1.status ~= InGameStoreProductStatus.NOT_OWNED

	local var_10_9 = arg_10_1.status == InGameStoreProductStatus.INSTALLED

	arg_10_0.InstalledTag:SetAlpha(var_10_9 and 1 or 0, var_10_9 and 200 or 0)

	local var_10_10 = LAYOUT.GetElementHeight(arg_10_0.InstalledTag)
	local var_10_11 = var_10_7 - var_10_5

	arg_10_0.InstalledTag:SetAnchorsAndPosition(0, 1, 0, 1, 790 * _1080p, 940 * _1080p, var_10_11 + 10, var_10_11 + var_10_10 + 10, 200)
	arg_10_0.DLCUninstallImage:SetBottom(var_10_7 - 5, 200)
	arg_10_0.DLCUninstallImage:SetTop(var_10_7 - LAYOUT.GetElementHeight(arg_10_0.DLCUninstallImage) - 5, 200)
	arg_10_0.DLCUninstallMessage:SetBottom(var_10_7 - 5, 200)
	arg_10_0.DLCUninstallMessage:SetTop(var_10_7 - LAYOUT.GetElementHeight(arg_10_0.DLCUninstallMessage) - 5, 200)

	if arg_10_1.status == InGameStoreProductStatus.NOT_OWNED then
		arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	elseif arg_10_2 then
		if Engine.BAHIIBFDDG() then
			arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				helper_text = "",
				priority = 1
			})
		else
			arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL")
			})
		end
	else
		arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/INSTALL")
		})
	end

	arg_10_0.DLCUninstallImage:SetAlpha(arg_10_1.isDLCForCurrentMode and 1 or 0)
	arg_10_0.DLCUninstallMessage:SetAlpha(arg_10_1.isDLCForCurrentMode and 1 or 0)
	var_0_8(arg_10_0)
end

local function var_0_10(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_0.MenuBackgroundImage)

	arg_11_0.UpdateDetails = var_0_9
	arg_11_0.SetupDLCGrid = var_0_4
	arg_11_0.FilterProductsByTitle = var_0_3
	arg_11_0.GetTabFocusFunction = var_0_5
	arg_11_0.SetupTabs = var_0_6
	arg_11_0._gameModeToHighlight = arg_11_2.gameMode
	arg_11_0._highResPackInstall = arg_11_2.highResPackInstall or 0
	arg_11_0._currentTabIndex = var_0_1.MW_GAME_PACKS
	arg_11_0._controllerIndex = arg_11_1

	var_0_7(arg_11_0, arg_11_1)
	var_0_6(arg_11_0, arg_11_1)
	arg_11_0.Tabs:SetAlpha(0)

	local function var_11_0(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = arg_11_0._products[arg_12_2 + 1]
		local var_12_1 = var_12_0.status ~= InGameStoreProductStatus.NOT_OWNED

		arg_12_0.InstallStatus:SetAlpha(var_12_1 and 1 or 0)

		arg_12_0._menu = arg_11_0
		arg_12_0._product = var_12_0

		arg_12_0:SetCheckValue(var_12_0.status == InGameStoreProductStatus.INSTALLED)
		arg_12_0.DLCPackText:setText(var_12_0.title)
	end

	arg_11_0.DLCGrid:SetRefreshChild(var_11_0)
	arg_11_0.DLCGrid:SetNumRows(0)
	arg_11_0.DLCGrid:SetNumColumns(1)
	arg_11_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/GENERAL_SUB_GAME_INSTALLS"))
	arg_11_0.InstalledTag.EventText:setText(ToUpperCase(Engine.CBBHFCGDIC("MPUI/DLC_INSTALLED")))
	ACTIONS.AnimateSequence(arg_11_0, "HideDetails")
	arg_11_0:addEventHandler("dlc_install_state_change", function(arg_13_0, arg_13_1)
		if not arg_11_0._refreshTimer then
			var_0_7(arg_11_0, arg_11_1)
		end
	end)
	arg_11_0:addEventHandler("gain_focus", function(arg_14_0, arg_14_1)
		return true
	end)

	if Engine.BAHIIBFDDG() then
		local var_11_1 = {
			{
				text = "OPTIONS/XBOX_ONE_UNINSTALL_DLC_1"
			},
			{
				text = "OPTIONS/XBOX_ONE_UNINSTALL_DLC_2"
			},
			{
				text = "OPTIONS/XBOX_ONE_UNINSTALL_DLC_3"
			},
			{
				text = "OPTIONS/XBOX_ONE_UNINSTALL_DLC_4"
			},
			{
				text = "OPTIONS/XBOX_ONE_UNINSTALL_DLC_5"
			},
			{
				text = "OPTIONS/XBOX_ONE_UNINSTALL_DLC_6"
			}
		}

		arg_11_0.Instructions:SetupBullets(arg_11_1, var_11_1)

		local var_11_2, var_11_3, var_11_4, var_11_5 = arg_11_0.InstructionsHeader:getLocalRect()
		local var_11_6 = var_11_5 - var_11_3
		local var_11_7, var_11_8, var_11_9, var_11_10 = arg_11_0.Instructions:getLocalRect()
		local var_11_11, var_11_12, var_11_13, var_11_14 = arg_11_0.InstructionsBacker:getLocalRect()

		arg_11_0.InstructionsBacker:SetBottom(var_11_8 + arg_11_0.Instructions.ListHeight + (var_11_3 - var_11_12))
		arg_11_0.bindButton:addEventHandler("button_alt1", function(arg_15_0, arg_15_1)
			Engine.DIJDDGHHFE()
		end)
	end

	local var_11_15 = LUI.UITimer.new({
		interval = 5000,
		event = "ingame_store_enumeration"
	})

	var_11_15.id = "IngameStoreEnumeration"

	arg_11_0:addElement(var_11_15)
	arg_11_0:registerEventHandler("ingame_store_enumeration", function(arg_16_0, arg_16_1)
		InGameStore.EnumerateContent()
		var_0_8(arg_16_0)
	end)
end

function GameInstallManager(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "GameInstallManager"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	var_17_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_17_1
	})
	var_17_0.HelperBar.id = "HelperBar"

	var_17_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_17_0.HelperBar:setPriority(10)
	var_17_0:addElement(var_17_0.HelperBar)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("MenuBackgroundImage", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "MenuBackgroundImage"

	var_17_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_17_0:addElement(var_17_4)

	var_17_0.MenuBackgroundImage = var_17_4

	local var_17_5
	local var_17_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_17_1
	})

	var_17_6.id = "DetailsBG"

	var_17_6:SetAlpha(0.6, 0)
	var_17_6.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_6.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
	var_17_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 755, _1080p * 1429, _1080p * 216, _1080p * 446)
	var_17_0:addElement(var_17_6)

	var_17_0.DetailsBG = var_17_6

	local var_17_7
	local var_17_8 = LUI.UIText.new()

	var_17_8.id = "DLCDescription"

	var_17_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_17_8:setText("", 0)
	var_17_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_8:SetLeading(5 * _1080p, 0)
	var_17_8:SetAlignment(LUI.Alignment.Left)
	var_17_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 296, _1080p * 317)
	var_17_0:addElement(var_17_8)

	var_17_0.DLCDescription = var_17_8

	local var_17_9
	local var_17_10 = LUI.UIStyledText.new()

	var_17_10.id = "DLCHeader"

	var_17_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_17_10:setText(ToUpperCase(""), 0)
	var_17_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_17_10:SetWordWrap(false)
	var_17_10:SetAlignment(LUI.Alignment.Left)
	var_17_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_17_10:SetStartupDelay(1000)
	var_17_10:SetLineHoldTime(400)
	var_17_10:SetAnimMoveTime(150)
	var_17_10:SetAnimMoveSpeed(50)
	var_17_10:SetEndDelay(1000)
	var_17_10:SetCrossfadeTime(400)
	var_17_10:SetFadeInTime(300)
	var_17_10:SetFadeOutTime(300)
	var_17_10:SetMaxVisibleLines(1)
	var_17_10:SetDecodeLetterLength(30)
	var_17_10:SetDecodeMaxRandChars(6)
	var_17_10:SetDecodeUpdatesPerLetter(4)
	var_17_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 246, _1080p * 296)
	var_17_0:addElement(var_17_10)

	var_17_0.DLCHeader = var_17_10

	local var_17_11
	local var_17_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = true,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 10,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_17_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameInstallButton", {
				controllerIndex = var_17_1
			})
		end,
		refreshChild = function(arg_19_0, arg_19_1, arg_19_2)
			return
		end,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_17_13 = LUI.UIGrid.new(var_17_12)

	var_17_13.id = "DLCGrid"

	var_17_13:setUseStencil(true)
	var_17_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 216, _1080p * 788)
	var_17_0:addElement(var_17_13)

	var_17_0.DLCGrid = var_17_13

	local var_17_14
	local var_17_15 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_17_1
	})

	var_17_15.id = "VerticalScrollbar"

	var_17_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 730, _1080p * 740, _1080p * 216, _1080p * 788)
	var_17_0:addElement(var_17_15)

	var_17_0.VerticalScrollbar = var_17_15

	local var_17_16
	local var_17_17 = LUI.UIStyledText.new()

	var_17_17.id = "FetchingMessage"

	var_17_17:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_17:SetAlpha(0, 0)
	var_17_17:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FETCHING_GAME_INSTALLS")), 0)
	var_17_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_17:SetWordWrap(false)
	var_17_17:SetAlignment(LUI.Alignment.Center)
	var_17_17:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_17_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 171, _1080p * 191)
	var_17_0:addElement(var_17_17)

	var_17_0.FetchingMessage = var_17_17

	local var_17_18
	local var_17_19 = LUI.UIImage.new()

	var_17_19.id = "Spinner"

	var_17_19:SetAlpha(0, 0)
	var_17_19:setImage(RegisterMaterial("spinner_loading"), 0)
	var_17_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -170, _1080p * 170, _1080p * 195, _1080p * 205)
	var_17_0:addElement(var_17_19)

	var_17_0.Spinner = var_17_19

	local var_17_20
	local var_17_21 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_21.id = "MenuTitle"

	var_17_21.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/GENERAL_SUB_GAME_INSTALLS"), 0)
	var_17_21.Line:SetLeft(0, 0)
	var_17_21:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_21)

	var_17_0.MenuTitle = var_17_21

	local var_17_22
	local var_17_23 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_17_1
	})

	var_17_23.id = "InstalledTag"

	var_17_23:SetAlpha(0, 0)
	var_17_23:SetYRotation(1, 0)
	var_17_23.Backer:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_17_23.Node:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_17_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 940, _1080p * 407, _1080p * 435)
	var_17_0:addElement(var_17_23)

	var_17_0.InstalledTag = var_17_23

	local var_17_24
	local var_17_25 = LUI.UIText.new()

	var_17_25.id = "UnableToFetchContent"

	var_17_25:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_17_25:SetAlpha(0, 0)
	var_17_25:setText(Engine.CBBHFCGDIC("LUA_MENU/UNABLE_TO_FETCH_CONTENT"), 0)
	var_17_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_25:SetAlignment(LUI.Alignment.Center)
	var_17_25:SetVerticalAlignment(LUI.Alignment.Center)
	var_17_25:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 426, _1080p * -426, _1080p * -18, _1080p * 18)
	var_17_0:addElement(var_17_25)

	var_17_0.UnableToFetchContent = var_17_25

	local var_17_26
	local var_17_27 = LUI.UIImage.new()

	var_17_27.id = "DLCUninstallImage"

	var_17_27:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_17_27:SetAlpha(0, 0)
	var_17_27:setImage(RegisterMaterial("uninstall_icon"), 0)
	var_17_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 825, _1080p * 407, _1080p * 442)
	var_17_0:addElement(var_17_27)

	var_17_0.DLCUninstallImage = var_17_27

	local var_17_28
	local var_17_29 = LUI.UIStyledText.new()

	var_17_29.id = "DLCUninstallMessage"

	var_17_29:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_17_29:SetAlpha(0, 0)
	var_17_29:setText(Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL_DLC_DESC"), 0)
	var_17_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_29:SetWordWrap(false)
	var_17_29:SetAlignment(LUI.Alignment.Left)
	var_17_29:SetOptOutRightToLeftAlignmentFlip(true)
	var_17_29:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_17_29:SetStartupDelay(1000)
	var_17_29:SetLineHoldTime(400)
	var_17_29:SetAnimMoveTime(150)
	var_17_29:SetAnimMoveSpeed(50)
	var_17_29:SetEndDelay(1000)
	var_17_29:SetCrossfadeTime(400)
	var_17_29:SetFadeInTime(300)
	var_17_29:SetFadeOutTime(300)
	var_17_29:SetMaxVisibleLines(1)
	var_17_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 834, _1080p * 1403, _1080p * 412, _1080p * 436)
	var_17_0:addElement(var_17_29)

	var_17_0.DLCUninstallMessage = var_17_29

	local var_17_30

	if Engine.BAHIIBFDDG() then
		local var_17_31 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
			controllerIndex = var_17_1
		})

		var_17_31.id = "InstructionsBacker"

		var_17_31:SetAlpha(0.6, 0)
		var_17_31.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_17_31.WZWipPromptBackground:setImage(RegisterMaterial("ui_mp_wz_bkg_button_4"), 0)
		var_17_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 755, _1080p * 1429, _1080p * 506, _1080p * 980)
		var_17_0:addElement(var_17_31)

		var_17_0.InstructionsBacker = var_17_31
	end

	local var_17_32

	if Engine.BAHIIBFDDG() then
		local var_17_33 = {
			fontSize = "24",
			bulletImage = "aar_arrow",
			spacing = 16,
			textColor = "SWATCHES.genericMenu.descText",
			numericSeparator = ".",
			separation = 6,
			listType = 2,
			bulletColor = "",
			bulletScale = 1,
			controllerIndex = var_17_1
		}
		local var_17_34 = MenuBuilder.BuildRegisteredType("BulletList", var_17_33)

		var_17_34.id = "Instructions"

		var_17_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 583, _1080p * 601)
		var_17_0:addElement(var_17_34)

		var_17_0.Instructions = var_17_34
	end

	local var_17_35

	if Engine.BAHIIBFDDG() then
		local var_17_36 = LUI.UIStyledText.new()

		var_17_36.id = "InstructionsHeader"

		var_17_36:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
		var_17_36:setText(Engine.CBBHFCGDIC("OPTIONS/XBOX_ONE_UNINSTALL_HEADER"), 0)
		var_17_36:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_17_36:SetWordWrap(false)
		var_17_36:SetAlignment(LUI.Alignment.Left)
		var_17_36:SetOptOutRightToLeftAlignmentFlip(true)
		var_17_36:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_17_36:SetStartupDelay(1000)
		var_17_36:SetLineHoldTime(400)
		var_17_36:SetAnimMoveTime(150)
		var_17_36:SetAnimMoveSpeed(50)
		var_17_36:SetEndDelay(1000)
		var_17_36:SetCrossfadeTime(400)
		var_17_36:SetFadeInTime(300)
		var_17_36:SetFadeOutTime(300)
		var_17_36:SetMaxVisibleLines(1)
		var_17_36:SetDecodeLetterLength(30)
		var_17_36:SetDecodeMaxRandChars(6)
		var_17_36:SetDecodeUpdatesPerLetter(4)
		var_17_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 529, _1080p * 565)
		var_17_0:addElement(var_17_36)

		var_17_0.InstructionsHeader = var_17_36
	end

	local var_17_37
	local var_17_38 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_17_1
			})
		end,
		controllerIndex = var_17_1
	}
	local var_17_39 = LUI.TabManager.new(var_17_38)

	var_17_39.id = "Tabs"

	var_17_39:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_17_0:addElement(var_17_39)

	var_17_0.Tabs = var_17_39

	local var_17_40
	local var_17_41 = LUI.UIText.new()

	var_17_41.id = "DownloadProgressDescription"

	var_17_41:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_17_41:setText("", 0)
	var_17_41:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_41:SetLeading(5 * _1080p, 0)
	var_17_41:SetAlignment(LUI.Alignment.Left)
	var_17_41:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 377, _1080p * 397)
	var_17_0:addElement(var_17_41)

	var_17_0.DownloadProgressDescription = var_17_41

	local var_17_42
	local var_17_43 = MenuBuilder.BuildRegisteredType("InstallProgressBar", {
		controllerIndex = var_17_1
	})

	var_17_43.id = "InstallProgressBar"

	var_17_43.Fill:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_17_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 345, _1080p * 364)
	var_17_0:addElement(var_17_43)

	var_17_0.InstallProgressBar = var_17_43

	local var_17_44
	local var_17_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_41:RegisterAnimationSequence("DefaultSequence", var_17_45)

	local var_17_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_43:RegisterAnimationSequence("DefaultSequence", var_17_46)

	local function var_17_47()
		var_17_41:AnimateSequence("DefaultSequence")
		var_17_43:AnimateSequence("DefaultSequence")
	end

	var_17_0._sequences.DefaultSequence = var_17_47

	local var_17_48
	local var_17_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_17:RegisterAnimationSequence("ShowFetching", var_17_49)

	local var_17_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_19:RegisterAnimationSequence("ShowFetching", var_17_50)

	local function var_17_51()
		var_17_17:AnimateSequence("ShowFetching")
		var_17_19:AnimateSequence("ShowFetching")
	end

	var_17_0._sequences.ShowFetching = var_17_51

	local var_17_52
	local var_17_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_17:RegisterAnimationSequence("HideFetching", var_17_53)

	local var_17_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_19:RegisterAnimationSequence("HideFetching", var_17_54)

	local function var_17_55()
		var_17_17:AnimateSequence("HideFetching")
		var_17_19:AnimateSequence("HideFetching")
	end

	var_17_0._sequences.HideFetching = var_17_55

	local var_17_56
	local var_17_57 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("ShowDetails", var_17_57)

	local var_17_58 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("ShowDetails", var_17_58)

	local var_17_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_10:RegisterAnimationSequence("ShowDetails", var_17_59)

	local function var_17_60()
		var_17_6:AnimateSequence("ShowDetails")
		var_17_8:AnimateSequence("ShowDetails")
		var_17_10:AnimateSequence("ShowDetails")
	end

	var_17_0._sequences.ShowDetails = var_17_60

	local var_17_61
	local var_17_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_6:RegisterAnimationSequence("HideDetails", var_17_62)

	local var_17_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_8:RegisterAnimationSequence("HideDetails", var_17_63)

	local var_17_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_10:RegisterAnimationSequence("HideDetails", var_17_64)

	local function var_17_65()
		var_17_6:AnimateSequence("HideDetails")
		var_17_8:AnimateSequence("HideDetails")
		var_17_10:AnimateSequence("HideDetails")
	end

	var_17_0._sequences.HideDetails = var_17_65

	local var_17_66
	local var_17_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_41:RegisterAnimationSequence("ShowInstallProgressBar", var_17_67)

	local var_17_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_43:RegisterAnimationSequence("ShowInstallProgressBar", var_17_68)

	local function var_17_69()
		var_17_41:AnimateSequence("ShowInstallProgressBar")
		var_17_43:AnimateSequence("ShowInstallProgressBar")
	end

	var_17_0._sequences.ShowInstallProgressBar = var_17_69

	local var_17_70
	local var_17_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_41:RegisterAnimationSequence("HideInstallProgressBar", var_17_71)

	local var_17_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_43:RegisterAnimationSequence("HideInstallProgressBar", var_17_72)

	local function var_17_73()
		var_17_41:AnimateSequence("HideInstallProgressBar")
		var_17_43:AnimateSequence("HideInstallProgressBar")
	end

	var_17_0._sequences.HideInstallProgressBar = var_17_73

	ACTIONS.AnimateSequence(var_17_0, "NoCustomModesHide")

	local var_17_74 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_17_15,
		startCap = var_17_15.startCap,
		endCap = var_17_15.endCap,
		sliderArea = var_17_15.sliderArea,
		slider = var_17_15.sliderArea and var_17_15.sliderArea.slider,
		fixedSizeSlider = var_17_15.sliderArea and var_17_15.sliderArea.fixedSizeSlider
	})

	var_17_13:AddScrollbar(var_17_74)
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_17_75 = LUI.UIBindButton.new()

	var_17_75.id = "selfBindButton"

	var_17_0:addElement(var_17_75)

	var_17_0.bindButton = var_17_75

	var_17_0.bindButton:addEventHandler("button_secondary", function(arg_28_0, arg_28_1)
		if not arg_28_1.controller then
			local var_28_0 = var_17_1
		end

		ACTIONS.LeaveMenu(var_17_0)
	end)
	var_0_10(var_17_0, var_17_1, arg_17_1)
	ACTIONS.AnimateSequence(var_17_0, "DefaultSequence")

	return var_17_0
end

MenuBuilder.registerType("GameInstallManager", GameInstallManager)
LockTable(_M)
