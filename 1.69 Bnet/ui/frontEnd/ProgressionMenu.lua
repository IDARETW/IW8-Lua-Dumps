module(..., package.seeall)

local var_0_0 = {
	CH2_PRESEASON_FOR_CH3 = 1,
	CH3 = 2,
	ONLY_CAREER = 0
}

local function var_0_1(arg_1_0, arg_1_1)
	local var_1_0 = false
	local var_1_1 = {}
	local var_1_2 = 2

	if var_1_2 == var_0_0.CH2_PRESEASON_FOR_CH3 then
		table.insert(var_1_1, {
			menuName = "CareerMenu",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CAREER"))
		})
		table.insert(var_1_1, {
			menuName = "PreseasonMenu",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESEASON"))
		})
	elseif var_1_2 == var_0_0.CH3 then
		local var_1_3 = Engine.CBBHFCGDIC("LUA_MENU/CAREER")

		table.insert(var_1_1, {
			menuName = "CareerMenu",
			name = ToUpperCase(var_1_3)
		})

		local var_1_4 = SEASON.GetStartingSeasonDataNumForChapter(SEASON.GetCurrentChapterNum()) - 1

		if PROGRESSION.GetPlayerPrestigeLevelAtSeason(arg_1_0._controllerIndex, var_1_4, true) > 0 then
			table.insert(var_1_1, {
				menuName = "MemorialMenu",
				name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PAST_CHAPTER"))
			})
		end

		local var_1_5 = PROGRESSION.GetPlayerIsInSeasonalProgression(arg_1_0._controllerIndex) == false

		table.insert(var_1_1, {
			menuName = "ProgressionPrestigeMenu",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_CAPS")),
			disabled = var_1_5
		})
		table.insert(var_1_1, {
			menuName = "PrestigeMasterMenu",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_MASTER_RIBBONS")),
			disabled = var_1_5
		})
	else
		table.insert(var_1_1, {
			menuName = "CareerMenu",
			name = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CAREER"))
		})

		var_1_0 = true
	end

	local var_1_6 = 1

	if arg_1_1 ~= nil then
		for iter_1_0, iter_1_1 in ipairs(var_1_1) do
			if iter_1_1.menuName == arg_1_1 then
				var_1_6 = iter_1_0

				break
			end
		end
	end

	local var_1_7 = {}

	for iter_1_2, iter_1_3 in ipairs(var_1_1) do
		table.insert(var_1_7, {
			name = iter_1_3.name,
			disabled = iter_1_3.disabled,
			hasDefaultFocus = iter_1_2 == var_1_6,
			focusFunction = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
				if arg_1_0._activeTabWidget then
					arg_1_0._activeTabWidget:closeTree()

					arg_1_0._activeTabWidget = nil
				end

				arg_1_0._activeTabWidget = MenuBuilder.BuildRegisteredType(iter_1_3.menuName, {
					controllerIndex = arg_2_1
				})

				arg_1_0:addElement(arg_1_0._activeTabWidget)

				if arg_2_3 ~= FocusType.MenuFlow then
					arg_1_0._activeTabWidget:processEvent({
						name = "gain_focus"
					})
				end

				arg_1_0._activeTabIndex = iter_1_2
			end
		})
	end

	arg_1_0.Tabs:SetTabs(var_1_7)

	if var_1_0 then
		arg_1_0.Tabs:HideTabs()
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = LUI.UIBindButton.new()

	var_3_0.id = "selfBindButton"

	arg_3_0:addElement(var_3_0)

	arg_3_0._bindButton = var_3_0

	arg_3_0._bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		ACTIONS.LeaveMenu(arg_3_0)
	end)
end

local function var_0_3(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = PlayerData.BFFBGAJGD(arg_5_1, CoD.StatsGroup.NonGame).lastSeasonProgressionPopup:get()
	local var_5_1 = SEASON.GetCurrentSeasonDataNum()

	arg_5_2.currentSeason = var_5_1

	if var_5_0 < var_5_1 and CONDITIONS.IsPostSeason() ~= true then
		LUI.FlowManager.RequestPopupMenu(nil, "ProgressionTitleTransitionPopup", true, arg_5_1, false, arg_5_2)
	end
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._controllerIndex = arg_6_1

	local var_6_0 = arg_6_2 and arg_6_2.defaultScreenName

	var_0_2(arg_6_0)
	var_0_1(arg_6_0, var_6_0)
	arg_6_0.MenuTitle.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/PROGRESSION")))

	if CONDITIONS.IsMagmaGameMode() then
		arg_6_0.MenuTitle:SetWarzoneTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
	else
		arg_6_0.MenuTitle:SetMWTitle(Dvar.IBEGCHEFE("MQNNLTKNTS"))
	end

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_6_0.TabBacker)
	ACTIONS.ScaleFullscreen(arg_6_0.Darken)
	ACTIONS.ScaleFullscreen(arg_6_0.Vignette)
	var_0_3(arg_6_0, arg_6_1, arg_6_2)

	if CONDITIONS.IsWZWipFlowEnabled() then
		LAYOUT.SetupScalingBackgroundVignette(arg_6_0)
	end
end

function ProgressionMenu(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIHorizontalNavigator.new()

	var_7_0.id = "ProgressionMenu"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	var_7_0.soundSet = "mpMainMenu"
	var_7_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_7_1
	})
	var_7_0.HelperBar.id = "HelperBar"

	var_7_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_7_0.HelperBar:setPriority(10)
	var_7_0:addElement(var_7_0.HelperBar)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = {
		worldBlur = 1,
		controllerIndex = var_7_1
	}
	local var_7_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_7_4)

	var_7_5.id = "WorldBlur"

	var_7_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_7_0:addElement(var_7_5)

	var_7_0.WorldBlur = var_7_5

	local var_7_6
	local var_7_7 = LUI.UIImage.new()

	var_7_7.id = "Darken"

	var_7_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_7_7:SetAlpha(0.8, 0)
	var_7_0:addElement(var_7_7)

	var_7_0.Darken = var_7_7

	local var_7_8
	local var_7_9 = MenuBuilder.BuildRegisteredType("WZAccentMenuOverlay", {
		controllerIndex = var_7_1
	})

	var_7_9.id = "Vignette"

	var_7_9:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_7_0:addElement(var_7_9)

	var_7_0.Vignette = var_7_9

	local var_7_10
	local var_7_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_7_1
	})

	var_7_11.id = "TabBacker"

	var_7_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_7_0:addElement(var_7_11)

	var_7_0.TabBacker = var_7_11

	local var_7_12
	local var_7_13 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_7_1
			})
		end,
		controllerIndex = var_7_1
	}
	local var_7_14 = LUI.TabManager.new(var_7_13)

	var_7_14.id = "Tabs"

	var_7_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 1020, _1080p * 108, _1080p * 160)
	var_7_0:addElement(var_7_14)

	var_7_0.Tabs = var_7_14

	local var_7_15
	local var_7_16 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_7_1
	})

	var_7_16.id = "MenuTitle"

	var_7_16.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/PROGRESSION"), 0)
	var_7_16.Line:SetLeft(0, 0)
	var_7_16:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, _1080p * 2, _1080p * 106)
	var_7_0:addElement(var_7_16)

	var_7_0.MenuTitle = var_7_16

	local var_7_17
	local var_7_18 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_7_1
	})

	var_7_18.id = "MPPlayerDetails"

	var_7_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 94)
	var_7_0:addElement(var_7_18)

	var_7_0.MPPlayerDetails = var_7_18

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("ProgressionMenu", ProgressionMenu)
LockTable(_M)
