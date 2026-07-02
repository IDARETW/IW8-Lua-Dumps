module(..., package.seeall)

local var_0_0 = 5

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = {
		{
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_WEAPONS"))
		},
		{
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_LETHALS"))
		},
		{
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_TACTICALS"))
		},
		{
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_KILLSTREAKS"))
		},
		{
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD_GAME_MODES"))
		},
		{
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/FIELD_UPGRADES"))
		}
	}
	local var_1_1 = "CombatRecordWeapons"

	arg_1_0._isHardcore = false

	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		table.insert(var_1_2, {
			name = iter_1_1.name,
			disabled = iter_1_1.disabled,
			hasDefaultFocus = iter_1_0 == arg_1_1.index,
			focusFunction = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
				if not arg_1_0._activeTabWidget then
					arg_1_0._activeTabWidget = MenuBuilder.BuildRegisteredType(var_1_1, {
						controllerIndex = arg_2_1
					})

					arg_1_0:addElement(arg_1_0._activeTabWidget)
				end

				arg_1_0._activeTabWidget:UpdateTab(iter_1_0, arg_1_0._isHardcore)

				arg_1_0._activeTabIndex = iter_1_0

				if arg_1_0._activeTabIndex == var_0_0 then
					arg_1_0:AddButtonHelperTextToElement(arg_1_0, {
						side = "left",
						button_ref = "button_alt1",
						priority = 2,
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/FILTER")
					})
				else
					arg_1_0:RemoveButtonHelperTextFromElement(arg_1_0, "button_alt1", "left")
				end

				LUI.FlowManager.GetScopedData("BarracksRecords").activeRecordIndex = iter_1_0

				Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
			end
		})
	end

	arg_1_0.bindButton:addEventHandler("button_alt1", function(arg_3_0, arg_3_1)
		if arg_1_0._activeTabIndex == var_0_0 then
			local var_3_0 = arg_3_1.controller or controllerIndex
			local var_3_1 = {
				showOnlyPlaylistFilter = true,
				showPlaylistFilter = true,
				controllerIndex = var_3_0,
				playlistFilter = arg_1_0._isHardcore,
				setFilterOptions = function(arg_4_0, arg_4_1, arg_4_2)
					arg_1_0._isHardcore = arg_4_2
				end
			}
			local var_3_2 = MenuBuilder.BuildRegisteredType("LeaderboardFilterPopup", var_3_1)

			LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, var_3_0, false, {
				widget = var_3_2,
				backButtonOverride = var_3_1.backButtonOverride
			})
		end
	end)
	arg_1_0.Tabs:SetTabs(var_1_2)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD"))
	var_0_1(arg_5_0, arg_5_2)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	ACTIONS.ScaleFullscreen(arg_5_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_5_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrame(arg_5_0, arg_5_1)
end

function CombatRecordTabsMenu(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIVerticalNavigator.new()

	var_6_0.id = "CombatRecordTabsMenu"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = {
		worldBlur = 1,
		controllerIndex = var_6_1
	}
	local var_6_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_6_4)

	var_6_5.id = "WorldBlur"

	var_6_0:addElement(var_6_5)

	var_6_0.WorldBlur = var_6_5

	local var_6_6
	local var_6_7 = LUI.UIImage.new()

	var_6_7.id = "Darken"

	var_6_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_6_7:SetAlpha(0.5, 0)
	var_6_0:addElement(var_6_7)

	var_6_0.Darken = var_6_7

	local var_6_8
	local var_6_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_6_1
	})

	var_6_9.id = "TabBacker"

	var_6_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_6_0:addElement(var_6_9)

	var_6_0.TabBacker = var_6_9

	local var_6_10
	local var_6_11 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_6_1
			})
		end,
		controllerIndex = var_6_1
	}
	local var_6_12 = LUI.TabManager.new(var_6_11)

	var_6_12.id = "Tabs"

	var_6_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 994, _1080p * 108, _1080p * 160)
	var_6_0:addElement(var_6_12)

	var_6_0.Tabs = var_6_12

	local var_6_13
	local var_6_14 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_6_1
	})

	var_6_14.id = "MenuTitle"

	var_6_14.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD"), 0)
	var_6_14.Line:SetLeft(0, 0)
	var_6_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_6_0:addElement(var_6_14)

	var_6_0.MenuTitle = var_6_14

	function var_6_0.addButtonHelperFunction(arg_8_0, arg_8_1)
		arg_8_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("MENU/BACK")
		})
	end

	var_6_0:addEventHandler("menu_create", var_6_0.addButtonHelperFunction)

	local var_6_15 = LUI.UIBindButton.new()

	var_6_15.id = "selfBindButton"

	var_6_0:addElement(var_6_15)

	var_6_0.bindButton = var_6_15

	var_6_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_6_1
		end

		ACTIONS.LeaveMenu(var_6_0)
	end)
	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("CombatRecordTabsMenu", CombatRecordTabsMenu)
LockTable(_M)
