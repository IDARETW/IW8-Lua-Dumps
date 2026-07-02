module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = {}

	if Dvar.IBEGCHEFE("lui_build_last_five") then
		var_1_0[#var_1_0 + 1] = {
			menuName = "PreviousGamesStats",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LAST_5_GAMES"))
		}
	end

	var_1_0[#var_1_0 + 1] = {
		menuName = "LeaderboardSelectMenu",
		placeholder = true,
		name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LEADERBOARD"))
	}

	if not CONDITIONS.IsMagmaGameMode() then
		var_1_0[#var_1_0 + 1] = {
			menuName = "CombatRecord",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMBAT_RECORD"))
		}
	end

	if Dvar.IBEGCHEFE("LSQMOSORKS") then
		var_1_0[#var_1_0 + 1] = {
			menuName = "CommendationsMenu",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/COMMENDATIONS"))
		}
	end

	if CONDITIONS.AreSpecOpsStarsEnabled() and not CONDITIONS.IsMagmaGameMode() then
		var_1_0[#var_1_0 + 1] = {
			menuName = "CPRecordsMenu",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/SPECIAL_OPS"))
		}
	end

	local var_1_1 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		table.insert(var_1_1, {
			name = iter_1_1.name,
			disabled = iter_1_1.disabled,
			hasDefaultFocus = iter_1_0 == 1,
			focusFunction = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
				arg_1_0.MenuTitle:SetTitle(iter_1_1.name)

				if arg_1_0._activeTabWidget then
					arg_1_0._activeTabWidget:closeTree()

					arg_1_0._activeTabWidget = nil
				end

				arg_1_0._activeTabWidget = MenuBuilder.BuildRegisteredType(iter_1_1.menuName, {
					controllerIndex = arg_2_1
				})

				arg_1_0:addElement(arg_1_0._activeTabWidget)

				if arg_2_3 ~= FocusType.MenuFlow then
					arg_1_0._activeTabWidget:processEvent({
						name = "gain_focus"
					})
				end

				arg_1_0._activeTabIndex = iter_1_0
			end
		})
	end

	arg_1_0.Tabs:SetTabs(var_1_1)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	var_0_0(arg_3_0)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.TabBacker)
	ACTIONS.ScaleFullscreen(arg_3_0.Darken)
	ACTIONS.ScaleFullscreen(arg_3_0.Vignette)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_3_0)
	end
end

function BarracksRecords(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIVerticalNavigator.new()

	var_4_0.id = "BarracksRecords"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = {
		worldBlur = 1,
		controllerIndex = var_4_1
	}
	local var_4_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_4_4)

	var_4_5.id = "WorldBlur"

	var_4_0:addElement(var_4_5)

	var_4_0.WorldBlur = var_4_5

	local var_4_6
	local var_4_7 = LUI.UIImage.new()

	var_4_7.id = "Darken"

	var_4_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_7:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_7)

	var_4_0.Darken = var_4_7

	local var_4_8
	local var_4_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_4_1
	})

	var_4_9.id = "Vignette"

	var_4_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_4_0:addElement(var_4_9)

	var_4_0.Vignette = var_4_9

	local var_4_10
	local var_4_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_4_1
	})

	var_4_11.id = "TabBacker"

	var_4_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_4_0:addElement(var_4_11)

	var_4_0.TabBacker = var_4_11

	local var_4_12
	local var_4_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_13.id = "MenuTitle"

	var_4_13.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/BARRACKS"), 0)
	var_4_13.Line:SetLeft(0, 0)
	var_4_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_4_0:addElement(var_4_13)

	var_4_0.MenuTitle = var_4_13

	local var_4_14
	local var_4_15 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_4_1
			})
		end,
		controllerIndex = var_4_1
	}
	local var_4_16 = LUI.TabManager.new(var_4_15)

	var_4_16.id = "Tabs"

	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1020, _1080p * 108, _1080p * 160)
	var_4_0:addElement(var_4_16)

	var_4_0.Tabs = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "LobbyMembersFooter"

	var_4_18:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_4_0:addElement(var_4_18)

	var_4_0.LobbyMembersFooter = var_4_18

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BarracksRecords", BarracksRecords)
LockTable(_M)
