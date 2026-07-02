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

	arg_5_0._isMenuInitialized = false

	local var_5_1 = {}
	local var_5_2 = SEASON.GetCurrentSeason()
	local var_5_3 = 1

	for iter_5_0 = 1, var_5_3 do
		var_5_1[iter_5_0] = {
			menuName = "CPIntelSeason",
			name = Engine.CBBHFCGDIC("LUA_MENU_CP/INTEL_SEASON_" .. iter_5_0 .. "_NAME"),
			season = tostring(iter_5_0)
		}
	end

	if var_5_3 == 1 then
		arg_5_0.Tabs:SetAlpha(0, 0)
	end

	local var_5_4 = {}

	for iter_5_1, iter_5_2 in ipairs(var_5_1) do
		table.insert(var_5_4, {
			name = iter_5_2.name,
			disabled = iter_5_2.disabled,
			hasDefaultFocus = iter_5_1 - 1 == var_5_0.activeTabIndex,
			focusFunction = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
				local var_6_0 = LUI.DataSourceInGlobalModel.new("menu.spltscreenDisplay.controllerIndex"):GetValue(arg_6_1)

				if var_0_1(arg_5_0, iter_5_2.menuName) then
					arg_6_1 = var_6_0
				end

				if var_5_0.activeTabIndex and arg_6_2 == var_5_0.activeTabIndex and arg_5_0.activeTabWidget then
					return
				end

				TAB.UpdateBuiltWidgetOnTabChange(arg_5_0, var_5_0.activeTabIndex, "activeTabWidget", arg_6_2, arg_6_3, iter_5_2.menuName, {
					buildPriority = -1,
					controllerIndex = arg_6_1,
					season = iter_5_2.season
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

				local function var_6_2(arg_8_0)
					if not arg_8_0._isMenuInitialized then
						return
					end

					arg_8_0:AddButtonHelperText({
						helper_text = "",
						button_ref = "button_right_trigger"
					})

					if var_0_1(arg_8_0, iter_5_2.menuName) then
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
				end

				arg_5_0:addEventHandler("menu_create", function(arg_9_0, arg_9_1)
					arg_9_0._isMenuInitialized = true

					var_6_2(arg_9_0)
				end)
				var_6_2(arg_5_0)
			end,
			buildSpecificTab = iter_5_2.buildSpecificTab
		})
	end

	arg_5_0.Tabs:SetTabs(var_5_4)

	arg_5_0.tabsData = var_5_1
end

local function var_0_4(arg_10_0, arg_10_1, arg_10_2)
	assert(arg_10_0.MenuTitle)
	assert(arg_10_0.Tabs)

	arg_10_0.SetupTabs = var_0_3
	arg_10_0.UpdateJoinableStatus = var_0_0
	arg_10_0.SetupBackButtonHandler = var_0_2

	arg_10_0.SetupTabs(arg_10_0, arg_10_1)
	arg_10_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/INTEL_CAPS"))
	arg_10_0.bindButton:addEventHandler("button_start", function(arg_11_0, arg_11_1)
		local var_11_0 = arg_11_1.controller or arg_10_1

		ACTIONS.OpenOptionsMenu(var_11_0, "")
	end)
	arg_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 2,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	ACTIONS.ScaleStretchAnchorFullscreen(arg_10_0.TabBacker)
end

function CPIntel(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIVerticalNavigator.new()

	var_12_0.id = "CPIntel"

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	var_12_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})
	var_12_0.HelperBar.id = "HelperBar"

	var_12_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_12_0.HelperBar:setPriority(10)
	var_12_0:addElement(var_12_0.HelperBar)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "TabBacker"

	var_12_4:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_12_0:addElement(var_12_4)

	var_12_0.TabBacker = var_12_4

	local var_12_5
	local var_12_6 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_12_1
	})

	var_12_6.id = "MenuTitle"

	var_12_6.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/INTEL_CAPS"), 0)
	var_12_6.Line:SetLeft(0, 0)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_12_0:addElement(var_12_6)

	var_12_0.MenuTitle = var_12_6

	local var_12_7
	local var_12_8 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_12_1
			})
		end,
		controllerIndex = var_12_1
	}
	local var_12_9 = LUI.TabManager.new(var_12_8)

	var_12_9.id = "Tabs"

	var_12_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 987, _1080p * 108, _1080p * 160)
	var_12_0:addElement(var_12_9)

	var_12_0.Tabs = var_12_9

	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_12_10 = LUI.UIBindButton.new()

	var_12_10.id = "selfBindButton"

	var_12_0:addElement(var_12_10)

	var_12_0.bindButton = var_12_10

	var_12_0.bindButton:addEventHandler("button_secondary", function(arg_14_0, arg_14_1)
		if not arg_14_1.controller then
			local var_14_0 = var_12_1
		end

		ACTIONS.LeaveMenu(var_12_0)
	end)
	var_0_4(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("CPIntel", CPIntel)
LockTable(_M)
