module(..., package.seeall)
LUI.FlowManager.RegisterFenceGroup("GameInstallManager", {
	"fenceSpinner"
})

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0

	if arg_1_1 == MAIN_MENU.BladeKeys.SP then
		var_1_0 = "sp"
	elseif arg_1_1 == MAIN_MENU.BladeKeys.MP then
		var_1_0 = "mp"
	elseif arg_1_1 == MAIN_MENU.BladeKeys.CP then
		var_1_0 = "cp"
	end

	if var_1_0 then
		for iter_1_0 = 1, #arg_1_0._products do
			local var_1_1 = arg_1_0._products[iter_1_0]
			local var_1_2 = string.find(var_1_1.productId, var_1_0)

			if (var_1_2 and var_1_2 > 0 or var_1_1.productId == STORE.DATA_PACK_1_NAME) and var_1_1.status == InGameStoreProductStatus.INSTALLED then
				local var_1_3 = arg_1_0.DLCGrid:GetElementAtPosition(0, iter_1_0 - 1)

				var_1_3:SetIsDLCValue(true)
				ACTIONS.AnimateSequence(var_1_3, "Highlight")

				var_1_1.isDLCForCurrentMode = true
			end
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	arg_2_0._products = InGameStore.GetCategoryProducts(arg_2_1, STORE.GameDLCCategory)

	if arg_2_0._products then
		arg_2_0.DLCGrid:SetNumRows(#arg_2_0._products)
		arg_2_0.DLCGrid:RefreshContent()
		arg_2_0.DLCGrid:SetFocusedPosition({
			x = 0,
			y = 0
		}, true)

		if arg_2_0._gameModeToHighlight then
			var_0_0(arg_2_0, arg_2_0._gameModeToHighlight)
		end

		arg_2_0:UpdateDetails(arg_2_0._products[1], arg_2_0._products[1].status == InGameStoreProductStatus.INSTALLED)
		ACTIONS.AnimateSequence(arg_2_0, "ShowDetails")
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	Engine.BHBDAJFHGA()
	InGameStore.FetchCatalog(arg_3_1, true, false)
	ACTIONS.AnimateSequence(arg_3_0, "ShowFetching")

	local var_3_0 = LUI.UITimer.new({
		interval = 100,
		event = {
			name = "refresh_timer",
			controllerIndex = arg_3_1
		}
	})

	var_3_0.id = "refreshTimer"

	arg_3_0:addElement(var_3_0)

	arg_3_0._refreshTimer = var_3_0

	arg_3_0:registerEventHandler("refresh_timer", function(arg_4_0, arg_4_1)
		local var_4_0 = InGameStore.GetCatalogStatus(arg_4_1.controllerIndex)
		local var_4_1 = false

		if var_4_0 == InGameStoreCatalogStatus.READY then
			var_0_1(arg_3_0, arg_3_1)

			var_4_1 = true
		elseif var_4_0 == InGameStoreCatalogStatus.ERROR then
			arg_3_0.UnableToFetchContent:SetAlpha(1)

			var_4_1 = true

			local var_4_2 = {}

			if Engine.DBFCJBDJEC() then
				local var_4_3 = Engine.BIAFEJHHDD()

				if var_4_3 ~= nil then
					local var_4_4 = Engine.JCBDICCAH(var_4_3)

					var_4_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_ERROR", var_4_4)

					Engine.DCFIDJGACA()
				else
					var_4_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE_PC")
				end
			else
				local var_4_5 = Engine.JCBDICCAH(Engine.CIHDHDCIBE())

				var_4_2.message = Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/STORE_UNAVAILABLE", var_4_5)
			end

			LUI.FlowManager.RequestPopupMenu(nil, "generic_error_popup", false, nil, false, var_4_2, nil, false, true)
			Engine.DHCGHHBHCH()
			ACTIONS.LeaveMenu(arg_3_0)
		end

		if var_4_1 then
			ACTIONS.AnimateSequence(arg_4_0, "HideFetching")
			arg_4_0._refreshTimer:closeTree()

			arg_4_0._refreshTimer = nil
		end
	end)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.DLCHeader:setText(arg_5_1.title)
	arg_5_0.DLCDescription:setText(arg_5_1.contentLong)

	local var_5_0 = arg_5_0.DLCHeader:GetCurrentAnchorsAndPositions().top
	local var_5_1 = LAYOUT.GetElementHeight(arg_5_0.DLCHeader)
	local var_5_2 = arg_5_0.DLCDescription:GetCurrentAnchorsAndPositions().top
	local var_5_3 = LAYOUT.GetTextHeightWithWrapping(arg_5_0.DLCDescription, arg_5_0.DLCDescription:getText())
	local var_5_4 = var_5_2 + var_5_3
	local var_5_5 = 100 * _1080p
	local var_5_6 = 50 * _1080p
	local var_5_7 = var_5_0 + var_5_1 + var_5_3 + var_5_5 + var_5_6

	arg_5_0.DetailsBG:SetBottom(var_5_7, 200)

	local var_5_8

	var_5_8 = arg_5_1.status ~= InGameStoreProductStatus.NOT_OWNED

	local var_5_9 = arg_5_1.status == InGameStoreProductStatus.INSTALLED

	arg_5_0.InstalledTag:SetAlpha(var_5_9 and 1 or 0, var_5_9 and 200 or 0)

	local var_5_10 = LAYOUT.GetElementHeight(arg_5_0.InstalledTag)
	local var_5_11 = var_5_7 - var_5_5

	arg_5_0.InstalledTag:SetAnchorsAndPosition(0, 1, 0, 1, 753 * _1080p, 903 * _1080p, var_5_11 + 10, var_5_11 + var_5_10 + 10, 200)
	arg_5_0.DLCUninstallImage:SetBottom(var_5_7 - 5, 200)
	arg_5_0.DLCUninstallImage:SetTop(var_5_7 - LAYOUT.GetElementHeight(arg_5_0.DLCUninstallImage) - 5, 200)
	arg_5_0.DLCUninstallMessage:SetBottom(var_5_7 - 5, 200)
	arg_5_0.DLCUninstallMessage:SetTop(var_5_7 - LAYOUT.GetElementHeight(arg_5_0.DLCUninstallMessage) - 5, 200)

	if arg_5_1.status == InGameStoreProductStatus.NOT_OWNED then
		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	elseif arg_5_2 then
		if Engine.BAHIIBFDDG() then
			arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				helper_text = "",
				priority = 1
			})
		else
			arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				button_ref = "button_primary",
				priority = 1,
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL")
			})
		end
	else
		arg_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/INSTALL")
		})
	end

	arg_5_0.DLCUninstallImage:SetAlpha(arg_5_1.isDLCForCurrentMode and 1 or 0)
	arg_5_0.DLCUninstallMessage:SetAlpha(arg_5_1.isDLCForCurrentMode and 1 or 0)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.UpdateDetails = var_0_3
	arg_6_0._gameModeToHighlight = arg_6_2.gameMode

	var_0_2(arg_6_0, arg_6_1)

	local function var_6_0(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = arg_6_0._products[arg_7_2 + 1]
		local var_7_1 = var_7_0.status ~= InGameStoreProductStatus.NOT_OWNED

		arg_7_0.InstallStatus:SetAlpha(var_7_1 and 1 or 0)

		arg_7_0._menu = arg_6_0
		arg_7_0._product = var_7_0

		arg_7_0:SetCheckValue(var_7_0.status == InGameStoreProductStatus.INSTALLED)
		arg_7_0.DLCPackText:setText(var_7_0.title)
	end

	arg_6_0.DLCGrid:SetRefreshChild(var_6_0)
	arg_6_0.DLCGrid:SetNumRows(0)
	arg_6_0.DLCGrid:SetNumColumns(1)
	arg_6_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/GENERAL_SUB_GAME_INSTALLS"))
	arg_6_0.InstalledTag.EventText:setText(ToUpperCase(Engine.CBBHFCGDIC("MPUI/DLC_INSTALLED")))
	ACTIONS.AnimateSequence(arg_6_0, "HideDetails")
	arg_6_0:addEventHandler("dlc_install_state_change", function(arg_8_0, arg_8_1)
		if not arg_6_0._refreshTimer then
			var_0_2(arg_6_0, arg_6_1)
		end
	end)
	arg_6_0:addEventHandler("gain_focus", function(arg_9_0, arg_9_1)
		return true
	end)

	if Engine.BAHIIBFDDG() then
		local var_6_1 = {
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

		arg_6_0.Instructions:SetupBullets(arg_6_1, var_6_1)

		local var_6_2, var_6_3, var_6_4, var_6_5 = arg_6_0.InstructionsHeader:getLocalRect()
		local var_6_6 = var_6_5 - var_6_3
		local var_6_7, var_6_8, var_6_9, var_6_10 = arg_6_0.Instructions:getLocalRect()
		local var_6_11, var_6_12, var_6_13, var_6_14 = arg_6_0.InstructionsBacker:getLocalRect()

		arg_6_0.InstructionsBacker:SetBottom(var_6_8 + arg_6_0.Instructions.ListHeight + (var_6_3 - var_6_12))
	end
end

function GameInstallManager(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "GameInstallManager"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Background"

	var_10_4:setImage(RegisterMaterial("frontend_option_bg"), 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "DetailsBG"

	var_10_6:SetAlpha(0.6, 0)
	var_10_6.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 755, _1080p * 1429, _1080p * 216, _1080p * 446)
	var_10_0:addElement(var_10_6)

	var_10_0.DetailsBG = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIText.new()

	var_10_8.id = "DLCDescription"

	var_10_8:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_8:setText("", 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_8:SetLeading(5 * _1080p, 0)
	var_10_8:SetAlignment(LUI.Alignment.Left)
	var_10_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 296, _1080p * 317)
	var_10_0:addElement(var_10_8)

	var_10_0.DLCDescription = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIStyledText.new()

	var_10_10.id = "DLCHeader"

	var_10_10:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_10:setText(ToUpperCase(""), 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_10:SetWordWrap(false)
	var_10_10:SetAlignment(LUI.Alignment.Left)
	var_10_10:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_10:SetStartupDelay(1000)
	var_10_10:SetLineHoldTime(400)
	var_10_10:SetAnimMoveTime(150)
	var_10_10:SetAnimMoveSpeed(50)
	var_10_10:SetEndDelay(1000)
	var_10_10:SetCrossfadeTime(400)
	var_10_10:SetFadeInTime(300)
	var_10_10:SetFadeOutTime(300)
	var_10_10:SetMaxVisibleLines(1)
	var_10_10:SetDecodeLetterLength(30)
	var_10_10:SetDecodeMaxRandChars(6)
	var_10_10:SetDecodeUpdatesPerLetter(4)
	var_10_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 246, _1080p * 296)
	var_10_0:addElement(var_10_10)

	var_10_0.DLCHeader = var_10_10

	local var_10_11
	local var_10_12 = {
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
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("GameInstallButton", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 600,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_13 = LUI.UIGrid.new(var_10_12)

	var_10_13.id = "DLCGrid"

	var_10_13:setUseStencil(true)
	var_10_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 216, _1080p * 788)
	var_10_0:addElement(var_10_13)

	var_10_0.DLCGrid = var_10_13

	local var_10_14
	local var_10_15 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_10_1
	})

	var_10_15.id = "VerticalScrollbar"

	var_10_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 536, _1080p * 546, _1080p * 216, _1080p * 788)
	var_10_0:addElement(var_10_15)

	var_10_0.VerticalScrollbar = var_10_15

	local var_10_16
	local var_10_17 = LUI.UIStyledText.new()

	var_10_17.id = "FetchingMessage"

	var_10_17:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_17:SetAlpha(0, 0)
	var_10_17:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FETCHING_GAME_INSTALLS")), 0)
	var_10_17:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_17:SetWordWrap(false)
	var_10_17:SetAlignment(LUI.Alignment.Center)
	var_10_17:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_10_17:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 171, _1080p * 191)
	var_10_0:addElement(var_10_17)

	var_10_0.FetchingMessage = var_10_17

	local var_10_18
	local var_10_19 = LUI.UIImage.new()

	var_10_19.id = "Spinner"

	var_10_19:SetAlpha(0, 0)
	var_10_19:setImage(RegisterMaterial("spinner_loading"), 0)
	var_10_19:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -170, _1080p * 170, _1080p * 195, _1080p * 205)
	var_10_0:addElement(var_10_19)

	var_10_0.Spinner = var_10_19

	local var_10_20
	local var_10_21 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_10_1
	})

	var_10_21.id = "MenuTitle"

	var_10_21.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/GENERAL_SUB_GAME_INSTALLS"), 0)
	var_10_21.Line:SetLeft(0, 0)
	var_10_21:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_10_0:addElement(var_10_21)

	var_10_0.MenuTitle = var_10_21

	local var_10_22
	local var_10_23 = MenuBuilder.BuildRegisteredType("EventBanner", {
		controllerIndex = var_10_1
	})

	var_10_23.id = "InstalledTag"

	var_10_23:SetAlpha(0, 0)
	var_10_23:SetYRotation(1, 0)
	var_10_23.Backer:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_10_23.Node:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_10_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 940, _1080p * 407, _1080p * 435)
	var_10_0:addElement(var_10_23)

	var_10_0.InstalledTag = var_10_23

	local var_10_24
	local var_10_25 = LUI.UIText.new()

	var_10_25.id = "UnableToFetchContent"

	var_10_25:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_25:SetAlpha(0, 0)
	var_10_25:setText(Engine.CBBHFCGDIC("LUA_MENU/UNABLE_TO_FETCH_CONTENT"), 0)
	var_10_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_25:SetAlignment(LUI.Alignment.Center)
	var_10_25:SetVerticalAlignment(LUI.Alignment.Center)
	var_10_25:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 426, _1080p * -426, _1080p * -18, _1080p * 18)
	var_10_0:addElement(var_10_25)

	var_10_0.UnableToFetchContent = var_10_25

	local var_10_26
	local var_10_27 = LUI.UIImage.new()

	var_10_27.id = "DLCUninstallImage"

	var_10_27:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_10_27:SetAlpha(0, 0)
	var_10_27:setImage(RegisterMaterial("uninstall_icon"), 0)
	var_10_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 825, _1080p * 407, _1080p * 442)
	var_10_0:addElement(var_10_27)

	var_10_0.DLCUninstallImage = var_10_27

	local var_10_28
	local var_10_29 = LUI.UIStyledText.new()

	var_10_29.id = "DLCUninstallMessage"

	var_10_29:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_29:SetAlpha(0, 0)
	var_10_29:setText(Engine.CBBHFCGDIC("LUA_MENU/UNINSTALL_DLC_DESC"), 0)
	var_10_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_29:SetWordWrap(false)
	var_10_29:SetAlignment(LUI.Alignment.Left)
	var_10_29:SetOptOutRightToLeftAlignmentFlip(true)
	var_10_29:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_29:SetStartupDelay(1000)
	var_10_29:SetLineHoldTime(400)
	var_10_29:SetAnimMoveTime(150)
	var_10_29:SetAnimMoveSpeed(50)
	var_10_29:SetEndDelay(1000)
	var_10_29:SetCrossfadeTime(400)
	var_10_29:SetFadeInTime(300)
	var_10_29:SetFadeOutTime(300)
	var_10_29:SetMaxVisibleLines(1)
	var_10_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 834, _1080p * 1403, _1080p * 412, _1080p * 436)
	var_10_0:addElement(var_10_29)

	var_10_0.DLCUninstallMessage = var_10_29

	local var_10_30

	if Engine.BAHIIBFDDG() then
		local var_10_31 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
			controllerIndex = var_10_1
		})

		var_10_31.id = "InstructionsBacker"

		var_10_31:SetAlpha(0.6, 0)
		var_10_31.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
		var_10_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 755, _1080p * 1429, _1080p * 506, _1080p * 980)
		var_10_0:addElement(var_10_31)

		var_10_0.InstructionsBacker = var_10_31
	end

	local var_10_32

	if Engine.BAHIIBFDDG() then
		local var_10_33 = {
			fontSize = "24",
			bulletImage = "aar_arrow",
			spacing = 16,
			textColor = "SWATCHES.genericMenu.descText",
			numericSeparator = ".",
			separation = 6,
			listType = 2,
			bulletColor = "",
			bulletScale = 1,
			controllerIndex = var_10_1
		}
		local var_10_34 = MenuBuilder.BuildRegisteredType("BulletList", var_10_33)

		var_10_34.id = "Instructions"

		var_10_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 583, _1080p * 601)
		var_10_0:addElement(var_10_34)

		var_10_0.Instructions = var_10_34
	end

	local var_10_35

	if Engine.BAHIIBFDDG() then
		local var_10_36 = LUI.UIStyledText.new()

		var_10_36.id = "InstructionsHeader"

		var_10_36:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
		var_10_36:setText(Engine.CBBHFCGDIC("OPTIONS/XBOX_ONE_UNINSTALL_HEADER"), 0)
		var_10_36:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_10_36:SetWordWrap(false)
		var_10_36:SetAlignment(LUI.Alignment.Left)
		var_10_36:SetOptOutRightToLeftAlignmentFlip(true)
		var_10_36:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_10_36:SetStartupDelay(1000)
		var_10_36:SetLineHoldTime(400)
		var_10_36:SetAnimMoveTime(150)
		var_10_36:SetAnimMoveSpeed(50)
		var_10_36:SetEndDelay(1000)
		var_10_36:SetCrossfadeTime(400)
		var_10_36:SetFadeInTime(300)
		var_10_36:SetFadeOutTime(300)
		var_10_36:SetMaxVisibleLines(1)
		var_10_36:SetDecodeLetterLength(30)
		var_10_36:SetDecodeMaxRandChars(6)
		var_10_36:SetDecodeUpdatesPerLetter(4)
		var_10_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1403, _1080p * 529, _1080p * 565)
		var_10_0:addElement(var_10_36)

		var_10_0.InstructionsHeader = var_10_36
	end

	local function var_10_37()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_37

	local var_10_38
	local var_10_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("ShowFetching", var_10_39)

	local var_10_40 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowFetching", var_10_40)

	local function var_10_41()
		var_10_17:AnimateSequence("ShowFetching")
		var_10_19:AnimateSequence("ShowFetching")
	end

	var_10_0._sequences.ShowFetching = var_10_41

	local var_10_42
	local var_10_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("HideFetching", var_10_43)

	local var_10_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("HideFetching", var_10_44)

	local function var_10_45()
		var_10_17:AnimateSequence("HideFetching")
		var_10_19:AnimateSequence("HideFetching")
	end

	var_10_0._sequences.HideFetching = var_10_45

	local var_10_46
	local var_10_47 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("ShowDetails", var_10_47)

	local var_10_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("ShowDetails", var_10_48)

	local var_10_49 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("ShowDetails", var_10_49)

	local function var_10_50()
		var_10_6:AnimateSequence("ShowDetails")
		var_10_8:AnimateSequence("ShowDetails")
		var_10_10:AnimateSequence("ShowDetails")
	end

	var_10_0._sequences.ShowDetails = var_10_50

	local var_10_51
	local var_10_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_6:RegisterAnimationSequence("HideDetails", var_10_52)

	local var_10_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_8:RegisterAnimationSequence("HideDetails", var_10_53)

	local var_10_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("HideDetails", var_10_54)

	local function var_10_55()
		var_10_6:AnimateSequence("HideDetails")
		var_10_8:AnimateSequence("HideDetails")
		var_10_10:AnimateSequence("HideDetails")
	end

	var_10_0._sequences.HideDetails = var_10_55

	ACTIONS.AnimateSequence(var_10_0, "NoCustomModesHide")

	local var_10_56 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_10_15,
		startCap = var_10_15.startCap,
		endCap = var_10_15.endCap,
		sliderArea = var_10_15.sliderArea,
		slider = var_10_15.sliderArea and var_10_15.sliderArea.slider,
		fixedSizeSlider = var_10_15.sliderArea and var_10_15.sliderArea.fixedSizeSlider
	})

	var_10_13:AddScrollbar(var_10_56)
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_10_57 = LUI.UIBindButton.new()

	var_10_57.id = "selfBindButton"

	var_10_0:addElement(var_10_57)

	var_10_0.bindButton = var_10_57

	var_10_0.bindButton:addEventHandler("button_secondary", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_10_1
		end

		ACTIONS.LeaveMenu(var_10_0)
	end)
	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("GameInstallManager", GameInstallManager)
LockTable(_M)
