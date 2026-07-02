module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = Lobby.BCBBBABFFB()

	if var_1_0 == CoD.PartyPrivacySetting.CLOSED then
		arg_1_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_CLOSED"))
	elseif var_1_0 == CoD.PartyPrivacySetting.JOINABLE_BY_FRIENDS then
		arg_1_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_JOINABLE_BY_FRIENDS"))
	elseif var_1_0 == CoD.PartyPrivacySetting.INVITE_ONLY then
		arg_1_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_INVITE_ONLY"))
	else
		arg_1_0.JoinableStatus:setText(Engine.CBBHFCGDIC("LUA_MENU/PARTY_PRIVACY_PUBLIC"))
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	return arg_2_1 == "MPWeaponMenu" or arg_2_1 == "MPOperatorMenu" or arg_2_1 == "MPBarracksMenu"
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_1 ~= nil then
		arg_3_0._backButtonHandlerSet = true

		if not arg_3_0.bindButton then
			arg_3_0.bindButton = LUI.UIBindButton.new()
			arg_3_0.bindButton.id = "selfBindButton"

			arg_3_0:addElement(arg_3_0.bindButton)
		end

		arg_3_0.bindButton:registerEventHandler("button_secondary", function(arg_4_0, arg_4_1)
			Engine.EBCGADABJ()

			local var_4_0 = arg_3_0.activeTabWidget
			local var_4_1 = true

			if var_4_0 and var_4_0.BackButtonOverride then
				var_4_1 = var_4_0.BackButtonOverride(arg_4_0, arg_4_1)
			end

			if var_4_1 then
				arg_3_1(arg_4_0, arg_4_1)
			end
		end)
	end
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)
	local var_5_1 = arg_5_2 and arg_5_2.firstTabWidget

	if var_5_1 == nil then
		var_5_1 = "CPIntelCategoryList"
	end

	arg_5_0._isMenuInitialized = false

	local var_5_2 = {}
	local var_5_3 = {}

	for iter_5_0 = 0, StringTable.BFHCAIIDA(CSV.cpIntelCategories.file) - 1 do
		local var_5_4 = CSV.ReadRow(CSV.cpIntelCategories, iter_5_0)

		var_5_4.isUnlocked = var_5_4.levelUnlock

		if CONDITIONS.IsDemoBuildOrDevBuildOrAreDevFeaturesEnabled() then
			table.insert(var_5_3, var_5_4)
		elseif var_5_4.devOnly ~= "1" then
			table.insert(var_5_3, var_5_4)
		end
	end

	local var_5_5 = 0
	local var_5_6 = 1
	local var_5_7
	local var_5_8

	for iter_5_1, iter_5_2 in ipairs(var_5_3) do
		if iter_5_2.season == var_5_0.season then
			local var_5_9 = iter_5_2.category
			local var_5_10 = iter_5_2.name

			var_5_2[#var_5_2 + 1] = {
				name = Engine.CBBHFCGDIC(var_5_10),
				menuName = var_5_1,
				category = var_5_9,
				season = var_5_0.season,
				categoryName = var_5_10
			}
		end
	end

	local var_5_11 = {}

	for iter_5_3, iter_5_4 in ipairs(var_5_2) do
		for iter_5_5 = 0, StringTable.BFHCAIIDA(CSV.cpIntel.file) - 1 do
			local var_5_12 = CSV.ReadRow(CSV.cpIntel, iter_5_5)

			if iter_5_4.category == var_5_12.category and PlayerData.BFFBGAJGD(arg_5_1, CoD.StatsGroup.Coop).cpIntelNew[var_5_12.index]:get() == 1 then
				iter_5_4.hasNewItem = 1

				break
			end
		end

		table.insert(var_5_11, {
			name = iter_5_4.name,
			disabled = iter_5_4.disabled,
			hasDefaultFocus = iter_5_3 - 1 == var_5_0.activeTabIndex,
			hasNewItem = iter_5_4.hasNewItem,
			focusFunction = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
				local var_6_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex"):GetValue(arg_6_1)

				if var_0_1(arg_5_0, iter_5_4.menuName) then
					arg_6_1 = var_6_0
				end

				if var_5_0.activeTabIndex and arg_6_2 == var_5_0.activeTabIndex and arg_5_0.activeTabWidget then
					return
				end

				TAB.UpdateBuiltWidgetOnTabChange(arg_5_0, var_5_0.activeTabIndex, "activeTabWidget", arg_6_2, arg_6_3, iter_5_4.menuName, {
					buildPriority = -1,
					controllerIndex = arg_6_1,
					category = iter_5_4.category,
					season = iter_5_4.season,
					categoryName = iter_5_4.categoryName
				})

				var_5_0.activeTabIndex = arg_6_2

				if arg_5_0._backButtonHandlerSet and arg_6_2 ~= 0 then
					local var_6_1 = arg_5_0.activeTabWidget

					if var_6_1 and not var_6_1.BackButtonOverride then
						function var_6_1.BackButtonOverride(arg_7_0, arg_7_1)
							local var_7_0 = arg_7_1.qualifier ~= "keyboard" and arg_7_1.qualifier ~= "gamepad" and FocusType.MouseOver or FocusType.Gamepad

							arg_5_0.Tabs:FocusTab(arg_6_1, 0, var_7_0)

							return false
						end
					end
				end

				arg_5_0._isSoundPlayed = false

				local function var_6_2(arg_8_0)
					if not arg_8_0._isMenuInitialized then
						return
					end

					if iter_5_4.menuName == "MPWeaponMenu" and CONDITIONS.IsCoreMultiplayer() then
						arg_8_0:AddButtonHelperText({
							kbm_only = true,
							priority = 3,
							side = "left",
							button_ref = "button_right_trigger",
							helper_text = Engine.CBBHFCGDIC("LUA_MENU/CHANGE_STREAK_VALUES")
						})
					else
						arg_8_0:AddButtonHelperText({
							helper_text = "",
							button_ref = "button_right_trigger"
						})
					end

					if var_0_1(arg_8_0, iter_5_4.menuName) then
						if Engine.JEDFGECDJ() > 1 then
							arg_8_0:AddButtonHelperText({
								side = "left",
								button_ref = "button_left_trigger",
								priority = 3,
								helper_text = Engine.CBBHFCGDIC("LUA_MENU/SPLITSCREEN_SWITCH_INFORMATION", GetOtherPlayersController(arg_8_0, var_6_0) + 1)
							})
						end
					else
						arg_8_0:AddButtonHelperText({
							helper_text = "",
							button_ref = "button_left_trigger"
						})
					end

					if not arg_5_0._isSoundPlayed then
						Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)

						arg_5_0._isSoundPlayed = true
					end
				end

				arg_5_0:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
					arg_9_0._isMenuInitialized = true

					var_6_2(arg_9_0)
				end)
				var_6_2(arg_5_0)
			end,
			buildSpecificTab = iter_5_4.buildSpecificTab
		})
	end

	arg_5_0.Tabs:SetTabs(var_5_11)

	arg_5_0.tabsData = var_5_2

	local var_5_13 = var_5_0.buttonIndex

	if var_5_0.activeTabIndex and var_5_0.activeTabIndex > 0 then
		var_5_13 = var_5_0.activeTabIndex
	end

	arg_5_0.Tabs:FocusTab(arg_5_1, var_5_13, focusType)
end

local function var_0_4(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.MenuTitle)
	assert(arg_10_0.Tabs)
	assert(arg_10_2.season)

	arg_10_0.SetupTabs = var_0_3
	arg_10_0.UpdateJoinableStatus = var_0_0
	arg_10_0.SetupBackButtonHandler = var_0_2

	arg_10_0.SetupTabs(arg_10_0, arg_10_1, {
		firstTabWidget = "CPIntelCategoryList"
	})

	if arg_10_2.season == "1" then
		arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/INTEL_CAPS"))
	elseif arg_10_2.season == "2" then
		arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_SEASON_2_NAME"))
	elseif arg_10_2.season == "3" then
		arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_SEASON_3_NAME"))
	elseif arg_10_2.season == "4" then
		arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_SEASON_4_NAME"))
	else
		arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/INTEL_CAPS"))
	end

	local var_10_0 = LUI.UIBindButton.new()

	var_10_0.id = "bindButton"

	arg_10_0:addElement(var_10_0)

	arg_10_0.bindButton = var_10_0

	local function var_10_1(arg_11_0, arg_11_1)
		ACTIONS.LeaveMenu(arg_10_0)
	end

	arg_10_0.bindButton:addEventHandler("button_secondary", var_10_1)
	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	arg_10_0.bindButton:addEventHandler("button_start", function(arg_12_0, arg_12_1)
		local var_12_0 = arg_12_1.controller or arg_10_1

		ACTIONS.OpenOptionsMenu(var_12_0, "")
	end)
	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 2,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_10_0, arg_10_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_10_0.TabBacker)
end

function CPIntelCategory(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIElement.new()

	var_13_0.id = "CPIntelCategory"

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
	local var_13_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_13_1
	})

	var_13_4.id = "TabBacker"

	var_13_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_13_0:addElement(var_13_4)

	var_13_0.TabBacker = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "MenuTitle"

	var_13_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/INTEL_CAPS"), 0)
	var_13_6.Line:SetLeft(0, 0)
	var_13_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_13_0:addElement(var_13_6)

	var_13_0.MenuTitle = var_13_6

	local var_13_7
	local var_13_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_13_1
			})
		end,
		controllerIndex = var_13_1
	}
	local var_13_9 = LUI.TabManager.new(var_13_8)

	var_13_9.id = "Tabs"

	var_13_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 987, _1080p * 108, _1080p * 160)
	var_13_0:addElement(var_13_9)

	var_13_0.Tabs = var_13_9

	var_0_4(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("CPIntelCategory", CPIntelCategory)
LockTable(_M)
