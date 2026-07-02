module(..., package.seeall)

local function var_0_0(arg_1_0)
	if Challenge.HasCompletedIntelMission(arg_1_0, "ch_intel_12_7") and not Challenge.IsFinalIntelBinkSeen(arg_1_0) then
		local var_1_0 = "mw_warzone_finale"

		LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, arg_1_0, false, {
			unskippable = true,
			disableQuickAccess = true,
			video = var_1_0
		})
		Challenge.MarkSeasonalEventCompleteBink(arg_1_0, true)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = LUI.FlowManager.GetScopedData(arg_2_0)

	if CONDITIONS.IsMagmaGameMode() and Engine.CFHBIHABCB(arg_2_1) then
		var_2_0.activeTabIndex = 1
	elseif CONDITIONS.IsThirdGameMode() then
		var_2_0.activeTabIndex = 2
	end

	local var_2_1 = {}

	var_2_1[#var_2_1 + 1] = {
		menuName = "BarracksChallengesMissions",
		name = Engine.CBBHFCGDIC("CHALLENGE/CORE"),
		buildTab = Engine.CFHBIHABCB(arg_2_1) or Dvar.IBEGCHEFE("MPKLTKMKTL"),
		challengeWhitelist = Challenge.MissionsWhitelist,
		activationCategory = Challenge.ActivationCategoryMP
	}
	var_2_1[#var_2_1 + 1] = {
		menuName = "BarracksChallengesMissions",
		name = Engine.CBBHFCGDIC("LUA_MENU/TAC_OPS"),
		buildTab = Engine.CFHBIHABCB(arg_2_1) and Dvar.IBEGCHEFE("LQOMSPKPSR"),
		challengeWhitelist = Challenge.CPMissionsWhitelist,
		activationCategory = Challenge.ActivationCategoryCP
	}

	local var_2_2 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_1) do
		if iter_2_1.buildTab then
			table.insert(var_2_2, {
				name = iter_2_1.name,
				disabled = iter_2_1.disabled,
				hasDefaultFocus = iter_2_0 - 1 == var_2_0.activeTabIndex,
				focusFunction = function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
					if #iter_2_1.menuName > 0 then
						local var_3_0 = {
							controllerIndex = arg_3_1
						}

						if iter_2_1.challengeWhitelist then
							var_3_0.challengeWhitelist = iter_2_1.challengeWhitelist

							if iter_2_1.challengeWhitelist == Challenge.IntelMissionsWhitelist then
								var_0_0(arg_3_1)
							end
						end

						if iter_2_1.activationCategory then
							var_3_0.activationCategory = iter_2_1.activationCategory
						end

						TAB.UpdateBuiltWidgetOnTabChange(arg_2_0, var_2_0.activeTabIndex, "activeTabWidget", arg_3_2, arg_3_3, iter_2_1.menuName, var_3_0)

						var_2_0.activeTabIndex = arg_3_2
					end

					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end
			})
		end
	end

	arg_2_0.Tabs:SetTabs(var_2_2)
	arg_2_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CHALLENGE/MISSIONS"))

	if CONDITIONS.IsWZWipFlowEnabled() then
		local var_4_0 = MenuBuilder.BuildRegisteredType("BarracksChallengesMissions", {
			controllerIndex = arg_4_1,
			challengeWhitelist = Challenge.IntelMissionsWhitelist
		})

		var_4_0.id = "IntelScreenWidget"

		arg_4_0:addElement(var_4_0)
		var_0_0(arg_4_1)
	else
		var_0_1(arg_4_0, arg_4_1)
	end

	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	LAYOUT.AddAspectRatioFadeFrame(arg_4_0, arg_4_1)
	ACTIONS.ScaleFullscreen(arg_4_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_4_0.TabBacker)
end

function ChallengeMenuMissions(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "ChallengeMenuMissions"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	var_5_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_5_1
	})
	var_5_0.HelperBar.id = "HelperBar"

	var_5_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_5_0.HelperBar:setPriority(10)
	var_5_0:addElement(var_5_0.HelperBar)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = {
		worldBlur = 1,
		controllerIndex = var_5_1
	}
	local var_5_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_5_4)

	var_5_5.id = "WorldBlur"

	var_5_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_5_0:addElement(var_5_5)

	var_5_0.WorldBlur = var_5_5

	local var_5_6
	local var_5_7 = LUI.UIImage.new()

	var_5_7.id = "Darken"

	var_5_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_7:SetAlpha(0.5, 0)
	var_5_0:addElement(var_5_7)

	var_5_0.Darken = var_5_7

	local var_5_8
	local var_5_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_5_1
	})

	var_5_9.id = "TabBacker"

	var_5_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_5_0:addElement(var_5_9)

	var_5_0.TabBacker = var_5_9

	local var_5_10
	local var_5_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_11.id = "MenuTitle"

	var_5_11.MenuTitle:setText(Engine.CBBHFCGDIC("CHALLENGE/MISSIONS"), 0)
	var_5_11.Line:SetLeft(0, 0)
	var_5_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_11)

	var_5_0.MenuTitle = var_5_11

	local var_5_12

	if not CONDITIONS.IsWZWipFlowEnabled() then
		local var_5_13 = {
			spacing = 5,
			wrap = false,
			tabHeight = _1080p * 52,
			buildTab = function()
				return MenuBuilder.BuildRegisteredType("SubMenuTab", {
					controllerIndex = var_5_1
				})
			end,
			controllerIndex = var_5_1
		}
		local var_5_14 = LUI.TabManager.new(var_5_13)

		var_5_14.id = "Tabs"

		var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 224, _1080p * 108, _1080p * 160)
		var_5_0:addElement(var_5_14)

		var_5_0.Tabs = var_5_14
	end

	local var_5_15
	local var_5_16 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_5_1
	})

	var_5_16.id = "LobbyMembersFooter"

	var_5_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_5_0:addElement(var_5_16)

	var_5_0.LobbyMembersFooter = var_5_16

	var_5_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_5_17 = LUI.UIBindButton.new()

	var_5_17.id = "selfBindButton"

	var_5_0:addElement(var_5_17)

	var_5_0.bindButton = var_5_17

	var_5_0.bindButton:addEventHandler("button_secondary", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_5_1
		end

		ACTIONS.LeaveMenu(var_5_0)
	end)
	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ChallengeMenuMissions", ChallengeMenuMissions)
LockTable(_M)
