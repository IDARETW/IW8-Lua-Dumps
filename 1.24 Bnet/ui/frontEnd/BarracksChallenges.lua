module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = LUI.FlowManager.GetScopedData(arg_1_0)
	local var_1_1 = {}

	var_1_1[#var_1_1 + 1] = {
		menuName = "BarracksChallengesMissions",
		name = Engine.CBBHFCGDIC("CHALLENGE/MISSIONS"),
		buildTab = Engine.CFHBIHABCB(arg_1_1) or Dvar.IBEGCHEFE("MPKLTKMKTL"),
		challengeWhitelist = Challenge.MissionsWhitelist,
		activationCategory = Challenge.ActivationCategoryMP
	}
	var_1_1[#var_1_1 + 1] = {
		menuName = "BarracksChallengesMissions",
		name = Engine.CBBHFCGDIC("CHALLENGE/WARZONE_MISSIONS"),
		buildTab = CONDITIONS.IsMagmaEnabled(),
		challengeWhitelist = Challenge.BRMissionsWhitelist,
		activationCategory = Challenge.ActivationCategoryBR
	}
	var_1_1[#var_1_1 + 1] = {
		menuName = "BarracksChallengesMissions",
		name = Engine.CBBHFCGDIC("LUA_MENU/TAC_OPS"),
		buildTab = Engine.CFHBIHABCB(arg_1_1) and Dvar.IBEGCHEFE("LQOMSPKPSR"),
		challengeWhitelist = Challenge.CPMissionsWhitelist,
		activationCategory = Challenge.ActivationCategoryCP
	}
	var_1_1[#var_1_1 + 1] = {
		menuName = "BarracksChallengesMissions",
		name = Engine.CBBHFCGDIC("LUA_MENU/INTEL"),
		buildTab = Dvar.IBEGCHEFE("LRNMMQMTPK"),
		challengeWhitelist = Challenge.IntelMissionsWhitelist
	}
	var_1_1[#var_1_1 + 1] = {
		menuName = "BarracksChallengesDaily",
		buildTab = true,
		name = Engine.CBBHFCGDIC("CHALLENGE/DAILY")
	}
	var_1_1[#var_1_1 + 1] = {
		menuName = "BarracksChallengesWeekly",
		name = Engine.CBBHFCGDIC("CHALLENGE/WEEKLY"),
		buildTab = Dvar.IBEGCHEFE("MNROTSKL")
	}

	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_1) do
		if iter_1_1.buildTab then
			table.insert(var_1_2, {
				name = iter_1_1.name,
				disabled = iter_1_1.disabled,
				hasDefaultFocus = iter_1_0 - 1 == var_1_0.activeTabIndex,
				focusFunction = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
					if var_1_0.activeTabIndex and arg_2_2 == var_1_0.activeTabIndex and arg_1_0.activeTabWidget then
						return
					end

					if #iter_1_1.menuName > 0 then
						local var_2_0 = {
							controllerIndex = arg_2_1
						}

						if arg_1_0._challengeID then
							var_2_0.challengeID = arg_1_0._challengeID
						end

						if iter_1_1.challengeWhitelist then
							var_2_0.challengeWhitelist = iter_1_1.challengeWhitelist
						end

						if iter_1_1.activationCategory then
							var_2_0.activationCategory = iter_1_1.activationCategory
						end

						TAB.UpdateBuiltWidgetOnTabChange(arg_1_0, var_1_0.activeTabIndex, "activeTabWidget", arg_2_2, arg_2_3, iter_1_1.menuName, var_2_0)

						var_1_0.activeTabIndex = arg_2_2

						if iter_1_1.menuName == "BarracksChallengesDaily" then
							arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
								side = "left",
								button_ref = "button_primary",
								helper_text = ""
							})
						elseif iter_1_1.menuName == "BarracksChallengesWeekly" then
							arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
								side = "left",
								button_ref = "button_primary",
								helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
							})
						end
					end

					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end
			})
		end
	end

	arg_1_0.Tabs:SetTabs(var_1_2)
	arg_1_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.MenuTitle)
	arg_3_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGES"))

	if Engine.DBAEJAHFGJ(arg_3_1) then
		ACTIONS.LeaveMenu(arg_3_0)
		LUI.FlowManager.RequestPopupMenu(nil, "mp_no_guest_popup", false, arg_3_1, false)
	end

	if arg_3_2.challengeID and arg_3_2.challengeID ~= "" then
		arg_3_0._challengeID = arg_3_2.challengeID
	end

	var_0_0(arg_3_0, arg_3_1)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	LAYOUT.AddAspectRatioFadeFrame(arg_3_0, arg_3_1)
	ACTIONS.ScaleFullscreen(arg_3_0.Darken)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_3_0.TabBacker)
end

function BarracksChallenges(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "BarracksChallenges"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	var_4_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})
	var_4_0.HelperBar.id = "HelperBar"

	var_4_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_4_0.HelperBar:setPriority(10)
	var_4_0:addElement(var_4_0.HelperBar)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = {
		worldBlur = 1,
		controllerIndex = var_4_1
	}
	local var_4_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_4_4)

	var_4_5.id = "WorldBlur"

	var_4_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
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
	local var_4_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_4_1
	})

	var_4_9.id = "TabBacker"

	var_4_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_4_0:addElement(var_4_9)

	var_4_0.TabBacker = var_4_9

	local var_4_10
	local var_4_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_11.id = "MenuTitle"

	var_4_11.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGES"), 0)
	var_4_11.Line:SetLeft(0, 0)
	var_4_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_4_0:addElement(var_4_11)

	var_4_0.MenuTitle = var_4_11

	local var_4_12
	local var_4_13 = {
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
	local var_4_14 = LUI.TabManager.new(var_4_13)

	var_4_14.id = "Tabs"

	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 996, _1080p * 108, _1080p * 160)
	var_4_0:addElement(var_4_14)

	var_4_0.Tabs = var_4_14

	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_4_15 = LUI.UIBindButton.new()

	var_4_15.id = "selfBindButton"

	var_4_0:addElement(var_4_15)

	var_4_0.bindButton = var_4_15

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("BarracksChallenges", BarracksChallenges)
LockTable(_M)
