module(..., package.seeall)

local var_0_0 = {
	[MP.PLAYLIST_FILTER_MODE.normal] = "LUA_MENU/QUICK_PLAY_FILTER_CORE",
	[MP.PLAYLIST_FILTER_MODE.hardcore] = "LUA_MENU/QUICK_PLAY_FILTER_HARDCORE",
	[MP.PLAYLIST_FILTER_MODE.CDLRules] = "LUA_MENU/CDL_CAPS"
}

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 == MP.PLAYLIST_FILTER_MODE.normal then
		return arg_1_2.normalFilteredDataSource
	elseif Dvar.IBEGCHEFE("MMTOPPQOON") and Dvar.IBEGCHEFE("LLMQKSPLSP") and arg_1_1 == MP.PLAYLIST_FILTER_MODE.CDLRules then
		return arg_1_2.cdlFilteredDataSource
	else
		return arg_1_2.hardcoreFilteredDataSource
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = MP.GetLastQuickplayFilter(arg_2_1)

	return var_0_1(arg_2_1, var_2_0, arg_2_2)
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_2 then
		arg_3_0._currentFilterSelected = true

		arg_3_0.EquippedWidget:SetAlpha(1)
		arg_3_0.Prompt:SetAlpha(0)
		arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_alt1"
		})
	else
		arg_3_0._currentFilterSelected = false

		arg_3_0.EquippedWidget:SetAlpha(0)

		if LUI.IsLastInputKeyboardMouse(arg_3_1) then
			arg_3_0.Prompt:SetAlpha(0)
			arg_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
				kbm_only = true,
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/SET_SELECTED_MODE_KBM"),
				container = arg_3_0.ButtonPromptContainer,
				containerAlignment = LUI.Alignment.Left
			})
		else
			arg_3_0.Prompt:SetAlpha(1)
			arg_3_0.HelperBar.ButtonHelperText:PopButtonPrompt({
				button_ref = "button_alt1"
			})
		end
	end
end

local function var_0_4(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0:GetCurrentMenu()
	local var_4_1 = LUI.FlowManager.GetScopedData(var_4_0)
	local var_4_2 = MP.GetLastQuickplayFilter(arg_4_1)

	if var_4_1.activeTabIndex ~= var_4_2 then
		ACTIONS.AnimateSequence(var_4_0.Tabs:GetTabAtIndex(var_4_2 + 1), "ToggleOff")
		ACTIONS.AnimateSequence(var_4_0.Tabs:GetTabAtIndex(var_4_1.activeTabIndex + 1), "ToggleOn")
		MP.SetLastQuickplayFilter(arg_4_1, var_4_1.activeTabIndex)
		var_0_3(var_4_0, arg_4_1, true)

		local var_4_3 = var_0_0[var_4_1.activeTabIndex] or ""

		assert(var_4_3 ~= "", "Quick Play Filter toast notification failed. Notification description text is undefined.")

		local var_4_4 = Engine.CBBHFCGDIC(var_4_3)
		local var_4_5 = {
			displayTime = 3000,
			icon = "hud_info_alert",
			description = Engine.CBBHFCGDIC("LUA_MENU/QUICK_PLAY_FILTER_SELECTED", var_4_4),
			type = LUI.ToastManager.NotificationType.QuickPlayFilterEquipped,
			controllerIndex = arg_4_1
		}

		arg_4_0:dispatchEventToRoot({
			name = "send_toast_notification",
			immediate = true,
			options = var_4_5
		})
	end

	ACTIONS.PlaySoundSetSound(arg_4_0, "selectAlt", false)
end

local function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = LUI.FlowManager.GetScopedData(arg_5_0)
	local var_5_1 = {
		{
			name = Engine.CBBHFCGDIC("LUA_MENU/CORE_CAPS")
		},
		{
			name = Engine.CBBHFCGDIC("LUA_MENU/HARDCORE_CAPS")
		}
	}

	if Dvar.IBEGCHEFE("MMTOPPQOON") and Dvar.IBEGCHEFE("LLMQKSPLSP") then
		table.insert(var_5_1, {
			name = Engine.CBBHFCGDIC("LUA_MENU/CDL_CAPS")
		})
	end

	local var_5_2 = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		if var_0_1(arg_5_1, iter_5_0 - 1, arg_5_2) then
			table.insert(var_5_2, {
				name = iter_5_1.name,
				disabled = iter_5_1.disabled,
				hasDefaultFocus = iter_5_0 - 1 == var_5_0.activeTabIndex,
				focusFunction = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
					local var_6_0 = var_0_1(arg_6_1, arg_6_2, arg_5_2)

					if var_6_0 == arg_5_2.cdlFilteredDataSource then
						arg_5_0._isCDLTabFocused = true

						if not Onboarding.CDLRules.WasCompleted(self, arg_6_1) then
							LUI.FlowManager.RequestPopupMenu(self, "onboardingpopup", true, arg_6_1, false, ONBOARDING_DATA.GetOnboardingCDLRulesData())
							Onboarding.CDLRules.MarkCompleted(self, arg_6_1)
						end

						ACTIONS.AnimateSequence(arg_5_0.PlaylistDetails, "ShowPrompt")
					else
						arg_5_0._isCDLTabFocused = false

						ACTIONS.AnimateSequence(arg_5_0.PlaylistDetails, "HidePrompt")
					end

					arg_5_0.PlaylistFilterGrid:processEvent({
						name = "lose_focus"
					})
					arg_5_0.PlaylistFilterGrid:SetGridDataSource(var_6_0.playlists)

					if LUI.IsLastInputGamepad(arg_6_1) then
						arg_5_0.PlaylistFilterGrid:processEvent({
							name = "gain_focus"
						})
					end

					if MP.GetLastQuickplayFilter(arg_6_1) ~= arg_6_2 then
						var_0_3(arg_5_0, arg_6_1, false)
					else
						var_0_3(arg_5_0, arg_6_1, true)
					end

					var_5_0.activeTabIndex = arg_6_2

					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end
			})
		end
	end

	arg_5_0.Tabs:SetTabs(var_5_2)

	arg_5_0._tabsData = var_5_1
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.SetupFilterSelectedPrompt = var_0_3

	PROGRESSION.PrestreamGamemodeIcons(arg_7_0)
	Engine.DHFCHIIJCA("squad_lobby")
	FrontEndScene.HideAllCharacters()
	Engine.BJDBIAGIDA(SOUND_SETS.mpMainMenu.quickPlayOpen)
	ACTIONS.ScaleFullscreen(arg_7_0.Darkener)
	ACTIONS.ScaleFullscreen(arg_7_0.Vignette)
	arg_7_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_MP/QUICK_PLAY_FILTER"))
	Engine.DHFCHIIJCA("squad_lobby")

	local var_7_0
	local var_7_1 = {
		buildArrowsLabel = true,
		maxVisibleRows = 10,
		scrollingThresholdX = 1,
		maxVelocity = 5000,
		adjustSizeToContent = true,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		wrapY = true,
		springCoefficient = 400,
		controllerIndex = arg_7_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("PlaylistFilterButton", {
				controllerIndex = arg_7_1,
				menu = arg_7_0
			})
		end,
		spacingX = _1080p * 5,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 500,
		rowHeight = _1080p * 50,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_7_2 = LUI.UIDataSourceGrid.new(var_7_1)

	var_7_2.id = "PlaylistFilterGrid"

	var_7_2:setUseStencil(true)
	var_7_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 666, _1080p * 240, _1080p * 481)

	arg_7_0.PlaylistFilterGrid = var_7_2

	arg_7_0:addElement(var_7_2)

	local var_7_3 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = arg_7_0.VerticalMinimalScrollbar,
		startCap = arg_7_0.VerticalMinimalScrollbar.startCap,
		endCap = arg_7_0.VerticalMinimalScrollbar.endCap,
		sliderArea = arg_7_0.VerticalMinimalScrollbar.sliderArea,
		slider = arg_7_0.VerticalMinimalScrollbar.sliderArea and arg_7_0.VerticalMinimalScrollbar.sliderArea.slider,
		fixedSizeSlider = arg_7_0.VerticalMinimalScrollbar.sliderArea and arg_7_0.VerticalMinimalScrollbar.sliderArea.fixedSizeSlider
	})

	var_7_2:AddScrollbar(var_7_3)

	local var_7_4 = var_0_2(arg_7_0, arg_7_1, arg_7_2)

	arg_7_0.PlaylistFilterGrid:processEvent({
		name = "lose_focus"
	})
	arg_7_0.PlaylistFilterGrid:SetGridDataSource(var_7_4.playlists)
	arg_7_0.PlaylistFilterGrid:processEvent({
		name = "gain_focus"
	})
	var_0_5(arg_7_0, arg_7_1, arg_7_2)

	local var_7_5 = LUI.UIBindButton.new()

	var_7_5.id = "selfBindButton"

	arg_7_0:addElement(var_7_5)

	arg_7_0.bindButton = var_7_5
	arg_7_0._isCDLTabFocused = false

	arg_7_0.bindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		local var_9_0 = var_0_2(arg_7_0, arg_7_1, arg_7_2)

		if not PlaylistUtils.AtLeastOneGameModeFiltered(var_9_0, arg_7_1) then
			PlaylistUtils.SelectAll(var_9_0, arg_7_1, true, false)
		end

		local var_9_1 = MP.GetLastQuickplayFilter(arg_7_1)
		local var_9_2 = var_0_0[var_9_1] or ""

		METRICS.PlaylistFilterSendDLogEvent(arg_7_1, var_9_0, var_9_1, var_9_2)
		Engine.DAGFFDGFII("uploadstats", arg_9_1.controller)
		ACTIONS.LeaveMenu(arg_7_0)
	end)
	arg_7_0.bindButton:registerEventHandler("button_alt1", function(arg_10_0, arg_10_1)
		var_0_4(arg_7_0, arg_7_1)
	end)
	arg_7_0.bindButton:addEventHandler("button_alt2", function(arg_11_0, arg_11_1)
		if arg_11_1.qualifier then
			Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
		end

		local var_11_0 = var_0_1(arg_7_1, arg_7_0.Tabs:GetCurrentTabIndex(), arg_7_2)

		if PlaylistUtils.CheckIfAllFiltered(var_11_0, arg_7_1) then
			PlaylistUtils.SelectAll(var_11_0, arg_7_1, false, true)
		else
			PlaylistUtils.SelectAll(var_11_0, arg_7_1, true, true)
		end

		arg_7_0.PlaylistFilterGrid:RefreshContent()
	end)
	arg_7_0.bindButton:addEventHandler("button_right_stick", function(arg_12_0, arg_12_1)
		if arg_7_0._isCDLTabFocused then
			local var_12_0 = {
				title = Engine.CBBHFCGDIC("MENU/CDL_RULES_TITLE"),
				message = Engine.CBBHFCGDIC("MENU/CDL_RULES_OPEN")
			}
			local var_12_1 = Engine.DCIAEHEJGH(Engine.CBBHFCGDIC("MENU/CDL_RULES_URL"))

			var_12_0.buttons = {
				{
					label = Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"),
					action = function()
						Engine.BHECIAHGC(arg_7_1, 0, var_12_1)
					end
				},
				{
					label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
					action = function()
						return
					end
				}
			}

			LUI.FlowManager.RequestPopupMenu(arg_12_0, "GenericConfirmPopup", true, arg_7_1, false, var_12_0, nil, true, true)
		end
	end)
	arg_7_0:addEventHandler("menu_create", function(arg_15_0, arg_15_1)
		arg_7_0.PlaylistDetails:AddButtonHelperText({
			button_ref = "button_r3",
			helper_text = Engine.CBBHFCGDIC("MENU/CDL_RULES_PROMPT"),
			container = arg_7_0.PlaylistDetails.ViewRulesPrompt
		})
	end)

	local function var_7_6(arg_16_0, arg_16_1)
		var_0_3(arg_16_0, arg_7_1, arg_16_0._currentFilterSelected)

		if LUI.IsLastInputKeyboardMouse(arg_16_1.controllerIndex) then
			ACTIONS.AnimateSequence(arg_16_0, "PC")
		else
			ACTIONS.AnimateSequence(arg_16_0, "Console")
		end
	end

	arg_7_0:addAndCallEventHandler("update_input_type", var_7_6, {
		controllerIndex = arg_7_1
	})
	LAYOUT.AddAspectRatioFadeFrame(arg_7_0, arg_7_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_7_0.TabBacker)
	arg_7_0.Prompt:setText(Engine.CBBHFCGDIC("LUA_MENU/SET_SELECTED_MODE"))
	arg_7_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("LUA_MENU/SELECTED_MODE"))

	local var_7_7 = MP.GetLastQuickplayFilter(arg_7_1)

	ACTIONS.AnimateSequence(arg_7_0.Tabs:GetTabAtIndex(var_7_7 + 1), "ToggleOn")
	arg_7_0.Tabs:FocusTab(arg_7_1, var_7_7, FocusType.MouseOver)
	var_0_3(arg_7_0, arg_7_1, true)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_7_0, "AR")
	end
end

function PlaylistFilterMenu(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0.id = "PlaylistFilterMenu"
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
	local var_17_4 = {
		worldBlur = 1,
		controllerIndex = var_17_1
	}
	local var_17_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_17_4)

	var_17_5.id = "WorldBlur"

	var_17_0:addElement(var_17_5)

	var_17_0.WorldBlur = var_17_5

	local var_17_6
	local var_17_7 = LUI.UIImage.new()

	var_17_7.id = "Darkener"

	var_17_7:SetRGBFromInt(0, 0)
	var_17_7:SetAlpha(0.5, 0)
	var_17_0:addElement(var_17_7)

	var_17_0.Darkener = var_17_7

	local var_17_8
	local var_17_9 = LUI.UIImage.new()

	var_17_9.id = "Vignette"

	var_17_9:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_17_9:SetAlpha(0.5, 0)
	var_17_9:setImage(RegisterMaterial("gradient_curve"), 0)
	var_17_0:addElement(var_17_9)

	var_17_0.Vignette = var_17_9

	local var_17_10
	local var_17_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_17_1
	})

	var_17_11.id = "TabBacker"

	var_17_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_17_0:addElement(var_17_11)

	var_17_0.TabBacker = var_17_11

	local var_17_12
	local var_17_13 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_17_1
	})

	var_17_13.id = "MenuTitle"

	var_17_13.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/QUICK_PLAY_FILTER"), 0)
	var_17_13.Line:SetLeft(0, 0)
	var_17_13:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_17_0:addElement(var_17_13)

	var_17_0.MenuTitle = var_17_13

	local var_17_14
	local var_17_15 = LUI.UIText.new()

	var_17_15.id = "Prompt"

	var_17_15:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_15:setText("", 0)
	var_17_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_15:SetAlignment(LUI.Alignment.Left)
	var_17_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 594, _1080p * 183, _1080p * 207)
	var_17_0:addElement(var_17_15)

	var_17_0.Prompt = var_17_15

	local var_17_16
	local var_17_17 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTabQuickplayFilter", {
				controllerIndex = var_17_1
			})
		end,
		controllerIndex = var_17_1
	}
	local var_17_18 = LUI.TabManager.new(var_17_17)

	var_17_18.id = "Tabs"

	var_17_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 700, _1080p * 108, _1080p * 160)
	var_17_0:addElement(var_17_18)

	var_17_0.Tabs = var_17_18

	local var_17_19
	local var_17_20 = MenuBuilder.BuildRegisteredType("PlaylistDetails", {
		controllerIndex = var_17_1
	})

	var_17_20.id = "PlaylistDetails"

	var_17_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 671, _1080p * 1427, _1080p * 216, _1080p * 596)
	var_17_0:addElement(var_17_20)

	var_17_0.PlaylistDetails = var_17_20

	local var_17_21
	local var_17_22 = LUI.UIImage.new()

	var_17_22.id = "Line"

	var_17_22:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_22:SetAlpha(0.4, 0)
	var_17_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 594, _1080p * 215, _1080p * 216)
	var_17_0:addElement(var_17_22)

	var_17_0.Line = var_17_22

	local var_17_23
	local var_17_24 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_17_1
	})

	var_17_24.id = "VerticalMinimalScrollbar"

	var_17_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 603, _1080p * 614, _1080p * 240, _1080p * 832)
	var_17_0:addElement(var_17_24)

	var_17_0.VerticalMinimalScrollbar = var_17_24

	local var_17_25
	local var_17_26 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_17_1
	})

	var_17_26.id = "EquippedWidget"

	var_17_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 232, _1080p * 177, _1080p * 207)
	var_17_0:addElement(var_17_26)

	var_17_0.EquippedWidget = var_17_26

	local var_17_27
	local var_17_28 = MenuBuilder.BuildRegisteredType("ButtonPromptContainer", {
		controllerIndex = var_17_1
	})

	var_17_28.id = "ButtonPromptContainer"

	if CONDITIONS.AlwaysFalse(var_17_0) then
		var_17_28.Label:setText("", 0)
	end

	var_17_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 200, _1080p * 177, _1080p * 207)
	var_17_0:addElement(var_17_28)

	var_17_0.ButtonPromptContainer = var_17_28

	local function var_17_29()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_29

	local function var_17_30()
		return
	end

	var_17_0._sequences.AR = var_17_30

	local var_17_31
	local var_17_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 603
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 614
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 807
		}
	}

	var_17_24:RegisterAnimationSequence("PC", var_17_32)

	local function var_17_33()
		var_17_24:AnimateSequence("PC")
	end

	var_17_0._sequences.PC = var_17_33

	local var_17_34
	local var_17_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 603
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 614
		}
	}

	var_17_24:RegisterAnimationSequence("Console", var_17_35)

	local function var_17_36()
		var_17_24:AnimateSequence("Console")
	end

	var_17_0._sequences.Console = var_17_36

	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})
	var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_alt2",
		priority = 3,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT_DESELECT_ALL")
	})

	local var_17_37 = LUI.UIBindButton.new()

	var_17_37.id = "selfBindButton"

	var_17_0:addElement(var_17_37)

	var_17_0.bindButton = var_17_37

	var_17_0.bindButton:addEventHandler("button_start", function(arg_23_0, arg_23_1)
		local var_23_0 = arg_23_1.controller or var_17_1

		ACTIONS.OpenOptionsMenu(var_23_0, "", "")
	end)
	var_0_6(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("PlaylistFilterMenu", PlaylistFilterMenu)
LockTable(_M)
