module(..., package.seeall)

local var_0_0 = "matchDataPackage"
local var_0_1 = "gunsmithDataPackage"
local var_0_2 = "accoladesPackage"
local var_0_3 = {
	[AAR.TabTypes.SUMMARY] = {
		image = "hud_cross",
		name = Engine.CBBHFCGDIC("AAR/SUMMARY"),
		menuDataPackageKey = var_0_0,
		OnCreate = function(arg_1_0, arg_1_1)
			Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)

			return MenuBuilder.BuildRegisteredType("AARSummary", {
				controllerIndex = arg_1_0,
				matchDataPackage = arg_1_1
			})
		end
	},
	[AAR.TabTypes.CONTRACTS] = {
		image = "hud_cross",
		name = Engine.CBBHFCGDIC("LUA_MENU_MP/CONTRACTS"),
		menuDataPackageKey = var_0_0,
		OnCreate = function(arg_2_0, arg_2_1)
			Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)

			return MenuBuilder.BuildRegisteredType("AARContracts", {
				controllerIndex = arg_2_0,
				matchDataPackage = arg_2_1
			})
		end
	},
	[AAR.TabTypes.SCOREBOARD] = {
		image = "hud_cross",
		name = Engine.CBBHFCGDIC("AAR/SCOREBOARD"),
		menuDataPackageKey = var_0_0,
		OnCreate = function(arg_3_0, arg_3_1)
			return MenuBuilder.BuildRegisteredType("AARScoreboards", {
				controllerIndex = arg_3_0,
				matchDataPackage = arg_3_1
			})
		end
	},
	[AAR.TabTypes.CHALLENGES] = {
		image = "hud_cross",
		name = Engine.CBBHFCGDIC("AAR/CHALLENGES"),
		menuDataPackageKey = var_0_0,
		OnCreate = function(arg_4_0, arg_4_1)
			Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)

			return MenuBuilder.BuildRegisteredType("AARChallenges", {
				controllerIndex = arg_4_0,
				matchDataPackage = arg_4_1
			})
		end
	},
	[AAR.TabTypes.GUNSMITH] = {
		image = "hud_cross",
		name = Engine.CBBHFCGDIC("AAR/GUNSMITH_UNLOCKS"),
		menuDataPackageKey = var_0_1,
		OnCreate = function(arg_5_0, arg_5_1)
			Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)

			return MenuBuilder.BuildRegisteredType("AARGunsmith", {
				controllerIndex = arg_5_0,
				gunsmithDataPackage = arg_5_1
			})
		end
	},
	[AAR.TabTypes.COMMENDATIONS] = {
		image = "hud_cross",
		name = Engine.CBBHFCGDIC("AAR/COMMENDATIONS"),
		menuDataPackageKey = var_0_2,
		OnCreate = function(arg_6_0, arg_6_1)
			return MenuBuilder.BuildRegisteredType("AARCommendations", {
				controllerIndex = arg_6_0,
				accoladesDataPackage = arg_6_1
			})
		end
	}
}

local function var_0_4(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0

	while var_7_0 ~= nil and var_7_0.id ~= "AARContainer" do
		var_7_0 = var_7_0:getParent()
	end

	assert(var_7_0.id == "AARContainer")

	if var_7_0.noTabChange then
		return
	end

	var_7_0:RemoveButtonHelperTextFromElement(var_7_0.ButtonHelperBar, "button_dpad_left", "right")
	var_7_0:RemoveButtonHelperTextFromElement(var_7_0.ButtonHelperBar, "button_primary", "right")

	if var_7_0.currentTab then
		var_7_0.currentTab:closeTree()

		var_7_0.currentTab = nil
		var_7_0.currentTabData = nil
	end

	var_7_0.currentTabData = arg_7_2

	local var_7_1 = arg_7_2.OnCreate(arg_7_1, var_7_0[arg_7_2.menuDataPackageKey])

	var_7_1.id = "currentTab"

	var_7_1:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_7_0:addElement(var_7_1)

	var_7_0.currentTab = var_7_1

	var_7_0.currentTab:processEvent({
		name = "gain_focus",
		controllerIndex = arg_7_1
	})
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = AAR.IsDisplayingAARParade(arg_8_2.fromMatch) or AAR.IsDisplayingAARParade(arg_8_2.fromBattlepassAAR)

	if CONDITIONS.IsThirdGameMode() then
		CP.ClearWaveLoadout(arg_8_1)
		CP.ClearAllPickupMunitions(arg_8_1)
	end

	if arg_8_0.aarParade then
		arg_8_0.aarParade:closeTree()

		arg_8_0.aarParade = nil
	end

	if arg_8_0.aarCPPoints then
		arg_8_0.aarCPPoints:closeTree()

		arg_8_0.aarCPPoints = nil
	end

	arg_8_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("AAR/AFTER_ACTION_REPORT"))

	arg_8_0.ButtonHelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = arg_8_1
	})
	arg_8_0.ButtonHelperBar.id = "ButtonHelperBar"

	arg_8_0.ButtonHelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	arg_8_0.ButtonHelperBar:setPriority(10)
	arg_8_0:addElement(arg_8_0.ButtonHelperBar)
	arg_8_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})

	local var_8_1 = LUI.UIBindButton.new()

	var_8_1.id = "backBindButton"

	arg_8_0:addElement(var_8_1)

	arg_8_0.backBindButton = var_8_1

	arg_8_0.backBindButton:addEventHandler("button_secondary", function(arg_9_0, arg_9_1)
		if CONDITIONS.IsDevelopmentBuild() then
			Dvar.DHEGHJJJHI("NSSKNKRKNP", false)
		end

		AAR.CheckAndShowBattlePassPurchasePopup(arg_8_1)

		if AAR.IsDebugAARSummaryEnabled() then
			ACTIONS.LeaveMenu(arg_8_0)
		else
			ACTIONS.AdvancePostGame(arg_8_0)
		end
	end)

	if not var_8_0 and CONDITIONS.ShouldDisplayAARUpsellPrompt(arg_8_1) then
		arg_8_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_alt1",
			priority = 0,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW")
		})

		local var_8_2 = LUI.UIBindButton.new()

		var_8_2.id = "purchaseBindButton"

		arg_8_0:addElement(var_8_2)

		arg_8_0.purchaseBindButton = var_8_2

		arg_8_0.purchaseBindButton:addEventHandler("button_alt1", function(arg_10_0, arg_10_1)
			LUI.FlowManager.RequestLeaveMenu(arg_8_0, true, true)
			LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_8_1, false, {
				leavePartyAndLobbyOnPurchase = true
			})
		end)
	end

	local var_8_3 = {}

	if CONDITIONS.InFrontend(arg_8_0) then
		if CONDITIONS.IsCorePublicMatch(arg_8_0) and not IsMlgGameBattlesMatch() then
			local var_8_4 = {
				name = var_0_3[AAR.TabTypes.SUMMARY].name,
				image = var_0_3[AAR.TabTypes.SUMMARY].image,
				focusFunction = function(arg_11_0, arg_11_1)
					var_0_4(arg_11_0, arg_11_1, var_0_3[AAR.TabTypes.SUMMARY])
				end
			}
			local var_8_5 = {
				name = var_0_3[AAR.TabTypes.CONTRACTS].name,
				image = var_0_3[AAR.TabTypes.CONTRACTS].image,
				focusFunction = function(arg_12_0, arg_12_1)
					var_0_4(arg_12_0, arg_12_1, var_0_3[AAR.TabTypes.CONTRACTS])
				end
			}
			local var_8_6 = {
				name = var_0_3[AAR.TabTypes.SCOREBOARD].name,
				image = var_0_3[AAR.TabTypes.SCOREBOARD].image,
				focusFunction = function(arg_13_0, arg_13_1)
					var_0_4(arg_13_0, arg_13_1, var_0_3[AAR.TabTypes.SCOREBOARD])
				end
			}
			local var_8_7 = {
				name = var_0_3[AAR.TabTypes.CHALLENGES].name,
				image = var_0_3[AAR.TabTypes.CHALLENGES].image,
				focusFunction = function(arg_14_0, arg_14_1)
					var_0_4(arg_14_0, arg_14_1, var_0_3[AAR.TabTypes.CHALLENGES])
				end
			}
			local var_8_8 = {
				name = var_0_3[AAR.TabTypes.GUNSMITH].name,
				image = var_0_3[AAR.TabTypes.GUNSMITH].image,
				focusFunction = function(arg_15_0, arg_15_1)
					var_0_4(arg_15_0, arg_15_1, var_0_3[AAR.TabTypes.GUNSMITH])
				end
			}
			local var_8_9 = {
				name = var_0_3[AAR.TabTypes.COMMENDATIONS].name,
				image = var_0_3[AAR.TabTypes.COMMENDATIONS].image,
				focusFunction = function(arg_16_0, arg_16_1)
					var_0_4(arg_16_0, arg_16_1, var_0_3[AAR.TabTypes.COMMENDATIONS])
				end
			}

			var_8_3[#var_8_3 + 1] = var_8_4

			local var_8_10 = AAR.IsContractTabAvailable()

			if AAR.IsDebugAARSummaryEnabled() then
				var_8_10 = true
			end

			if var_8_10 then
				var_8_3[#var_8_3 + 1] = var_8_5
			end

			if AAR.IsScoreboardDataValid(arg_8_1) then
				var_8_3[#var_8_3 + 1] = var_8_6
			end

			local var_8_11 = false

			if #arg_8_0[var_0_0].challenges > 0 and AAR.IsAnyValidChallengeAvailable(arg_8_0[var_0_0].challenges, arg_8_0[var_0_0].unlocks) then
				var_8_11 = true
			end

			local var_8_12 = false

			if #arg_8_0[var_0_1] > 0 then
				var_8_12 = true
			end

			local var_8_13 = false

			if AAR.IsCommendtionEnabled() and arg_8_0[var_0_2] and #arg_8_0[var_0_2] > 0 then
				var_8_13 = true
			end

			if AAR.IsDebugAARSummaryEnabled() then
				var_8_11 = true
				var_8_12 = true
				var_8_13 = true
			end

			if var_8_11 then
				var_8_3[#var_8_3 + 1] = var_8_7
			end

			if var_8_12 then
				var_8_3[#var_8_3 + 1] = var_8_8
			end

			if var_8_13 then
				var_8_3[#var_8_3 + 1] = var_8_9
			end
		elseif CONDITIONS.IsCoreMultiplayer() and (IsPrivateMatch() or IsSystemLink() or IsMlgGameBattlesMatch()) then
			local var_8_14 = {
				name = var_0_3[AAR.TabTypes.SCOREBOARD].name,
				image = var_0_3[AAR.TabTypes.SCOREBOARD].image,
				focusFunction = function(arg_17_0, arg_17_1)
					var_0_4(arg_17_0, arg_17_1, var_0_3[AAR.TabTypes.SCOREBOARD])
				end
			}
			local var_8_15 = AAR.IsScoreboardDataValid(arg_8_1)

			if CONDITIONS.IsMagmaGameMode(arg_8_0) and (CONDITIONS.IsBloodMoney() or CONDITIONS.IsWZRatRace()) and not IsPrivateMatch() or CONDITIONS.IsRiskGametype() then
				var_8_15 = false
			end

			if var_8_15 then
				var_8_3[#var_8_3 + 1] = var_8_14
			end

			arg_8_0.Tabs:SetAlpha(0)
			arg_8_0.TabBacker:SetAlpha(0)
			arg_8_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("AAR/SCOREBOARD"))
		elseif CONDITIONS.IsThirdGameMode(arg_8_0) then
			if IsSystemLink() then
				local var_8_16 = {
					name = var_0_3[AAR.TabTypes.SCOREBOARD].name,
					image = var_0_3[AAR.TabTypes.SCOREBOARD].image,
					focusFunction = function(arg_18_0, arg_18_1)
						var_0_4(arg_18_0, arg_18_1, var_0_3[AAR.TabTypes.SCOREBOARD])
					end
				}

				var_8_3[#var_8_3 + 1] = var_8_16

				arg_8_0.Tabs:SetAlpha(0)
				arg_8_0.TabBacker:SetAlpha(0)
				arg_8_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("AAR/SCOREBOARD"))
			else
				local var_8_17 = {
					name = var_0_3[AAR.TabTypes.SUMMARY].name,
					image = var_0_3[AAR.TabTypes.SUMMARY].image,
					focusFunction = function(arg_19_0, arg_19_1)
						var_0_4(arg_19_0, arg_19_1, var_0_3[AAR.TabTypes.SUMMARY])
					end
				}
				local var_8_18 = {
					name = var_0_3[AAR.TabTypes.SCOREBOARD].name,
					image = var_0_3[AAR.TabTypes.SCOREBOARD].image,
					focusFunction = function(arg_20_0, arg_20_1)
						var_0_4(arg_20_0, arg_20_1, var_0_3[AAR.TabTypes.SCOREBOARD])
					end
				}
				local var_8_19 = {
					name = var_0_3[AAR.TabTypes.CHALLENGES].name,
					image = var_0_3[AAR.TabTypes.CHALLENGES].image,
					focusFunction = function(arg_21_0, arg_21_1)
						var_0_4(arg_21_0, arg_21_1, var_0_3[AAR.TabTypes.CHALLENGES])
					end
				}
				local var_8_20 = {
					name = var_0_3[AAR.TabTypes.GUNSMITH].name,
					image = var_0_3[AAR.TabTypes.GUNSMITH].image,
					focusFunction = function(arg_22_0, arg_22_1)
						var_0_4(arg_22_0, arg_22_1, var_0_3[AAR.TabTypes.GUNSMITH])
					end
				}
				local var_8_21 = {
					name = var_0_3[AAR.TabTypes.COMMENDATIONS].name,
					image = var_0_3[AAR.TabTypes.COMMENDATIONS].image,
					focusFunction = function(arg_23_0, arg_23_1)
						var_0_4(arg_23_0, arg_23_1, var_0_3[AAR.TabTypes.COMMENDATIONS])
					end
				}

				var_8_3[#var_8_3 + 1] = var_8_17

				if AAR.IsScoreboardDataValid(arg_8_1) then
					var_8_3[#var_8_3 + 1] = var_8_18
				end

				local var_8_22 = false

				if #arg_8_0[var_0_0].challenges > 0 and AAR.IsAnyValidChallengeAvailable(arg_8_0[var_0_0].challenges, arg_8_0[var_0_0].unlocks) then
					var_8_22 = true
				end

				local var_8_23 = false

				if #arg_8_0[var_0_1] > 0 then
					var_8_23 = true
				end

				local var_8_24 = false

				if AAR.IsCommendtionEnabled() and arg_8_0[var_0_2] and #arg_8_0[var_0_2] > 0 then
					var_8_24 = true
				end

				if AAR.IsDebugAARSummaryEnabled() then
					var_8_22 = true
					var_8_23 = true
					var_8_24 = true
				end

				if var_8_22 then
					var_8_3[#var_8_3 + 1] = var_8_19
				end

				if var_8_23 then
					var_8_3[#var_8_3 + 1] = var_8_20
				end

				if var_8_24 then
					var_8_3[#var_8_3 + 1] = var_8_21
				end
			end
		end
	end

	if AAR.IsDebugAARSummaryEnabled() then
		arg_8_0.tabsData = var_8_3

		arg_8_0.Tabs:SetTabs(var_8_3)
		arg_8_0.Tabs:SetAlignment(LUI.Alignment.Left)

		return
	end

	if var_8_0 then
		arg_8_0.aarParade = MenuBuilder.BuildRegisteredType("AARParade", {
			controllerIndex = arg_8_1,
			fromBattlepassAAR = arg_8_2.fromBattlepassAAR,
			matchDataPackage = arg_8_0.matchDataPackage,
			gunsmithDataPackage = arg_8_0.gunsmithDataPackage
		})
		arg_8_0.aarParade.id = "AARParade"

		arg_8_0.aarParade:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
		arg_8_0:addElement(arg_8_0.aarParade)
		arg_8_0.TabBacker:SetAlpha(0)
	elseif arg_8_2.isCPPoints then
		arg_8_0.aarCPPoints = MenuBuilder.BuildRegisteredType("AARCPPoints", {
			controllerIndex = arg_8_1,
			fromBattlepassAAR = arg_8_2.fromBattlepassAAR,
			matchDataPackage = arg_8_0.matchDataPackage
		})
		arg_8_0.aarCPPoints.id = "AARCPPoints"

		arg_8_0.aarCPPoints:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
		arg_8_0:addElement(arg_8_0.aarCPPoints)
		arg_8_0.TabBacker:SetAlpha(0)
	else
		arg_8_0.TabBacker:SetAlpha(0.2)
	end

	if #var_8_3 == 0 or var_8_0 or arg_8_2.isCPPoints then
		if arg_8_0.Tabs then
			arg_8_0:RemoveElement(arg_8_0.Tabs)

			arg_8_0.Tabs = nil
		end

		return
	end

	arg_8_0.tabsData = var_8_3

	arg_8_0.Tabs:SetTabs(var_8_3)
	arg_8_0.Tabs:SetAlignment(LUI.Alignment.Left)

	if #var_8_3 == 1 then
		arg_8_0.noTabChange = true
	end
end

function PreLoadFunc(arg_24_0, arg_24_1, arg_24_2)
	InitAARDataSources(arg_24_1)

	if CONDITIONS.IsLaunchChunk() then
		local var_24_0 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, "mp_lc_speedball", CSV.mpMapTable.cols.name)

		DataSources.frontEnd.AAR.mapName:SetValue(arg_24_1, Engine.CBBHFCGDIC(var_24_0))
	end

	if AAR.IsDebugAARMatchInfoPackageEnabled() then
		arg_24_0[var_0_0] = AAR.GetDebugMatchInfoPackage(arg_24_1)
	else
		arg_24_0[var_0_0] = AAR.GetMatchInfoPackage(arg_24_1)
	end

	DebugPrint(AAR.GetDebugMatchInfoPackageString(arg_24_1))

	if AAR.IsDebugAARSummaryEnabled() then
		arg_24_0[var_0_1] = AAR.GetDebugGunsmithUnlockPackage()
	else
		arg_24_0[var_0_1] = AAR.GetGunsmithUnlockPackage(arg_24_1, arg_24_0[var_0_0].unlocks)
	end

	if AAR.IsDebugAARSummaryEnabled() then
		arg_24_0[var_0_2] = AAR.GetDebugAccoladesPackage()
	else
		arg_24_0[var_0_2] = AAR.GetAccoladesPackage(arg_24_1)
	end

	AAR.PrestreamImagePackage(arg_24_0, arg_24_1, arg_24_0[var_0_0].unlocks, arg_24_0[var_0_1], arg_24_0[var_0_2])

	for iter_24_0 = 1, #arg_24_0[var_0_1] do
		DYN_ATTACHMENT.SetupGunsmithAttachmentStreamer(arg_24_0, arg_24_0[var_0_1][iter_24_0].attachmentsData, "icon", true)
	end
end

function PostLoadFunc(arg_25_0, arg_25_1, arg_25_2)
	assert(arg_25_0.MenuTitle)
	assert(arg_25_0.Tabs)
	var_0_5(arg_25_0, arg_25_1, arg_25_2)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	assert(arg_25_0.Darken)
	ACTIONS.ScaleFullscreen(arg_25_0.Darken)
	LAYOUT.AddAspectRatioFadeFrame(arg_25_0, arg_25_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_25_0.TabBacker)

	arg_25_0.AARSetUp = var_0_5

	if arg_25_0.GameBattlesMatchID then
		local var_25_0 = GAMEBATTLES.GetCurrentMatch(arg_25_1)

		if var_25_0 then
			arg_25_0.GameBattlesMatchID:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_ID_LABEL") .. ": " .. var_25_0.matchId)
		end
	end

	Dvar.DHEGHJJJHI("RMMMKOSTS", false)
	arg_25_0:addEventHandler("menu_close", function(arg_26_0, arg_26_1)
		Dvar.DHEGHJJJHI("RMMMKOSTS", true)
	end)
end

function AARContainer(arg_27_0, arg_27_1)
	local var_27_0 = LUI.UIElement.new()

	var_27_0.id = "AARContainer"

	local var_27_1 = arg_27_1 and arg_27_1.controllerIndex

	if not var_27_1 and not Engine.DDJFBBJAIG() then
		var_27_1 = var_27_0:getRootController()
	end

	assert(var_27_1)
	PreLoadFunc(var_27_0, var_27_1, arg_27_1)

	local var_27_2 = var_27_0
	local var_27_3
	local var_27_4 = {
		worldBlur = 5,
		controllerIndex = var_27_1
	}
	local var_27_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_27_4)

	var_27_5.id = "WorldBlur"

	var_27_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_27_0:addElement(var_27_5)

	var_27_0.WorldBlur = var_27_5

	local var_27_6
	local var_27_7 = LUI.UIImage.new()

	var_27_7.id = "Darken"

	var_27_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_27_7:SetAlpha(0.6, 0)
	var_27_0:addElement(var_27_7)

	var_27_0.Darken = var_27_7

	local var_27_8
	local var_27_9 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_27_1
	})

	var_27_9.id = "TabBacker"

	var_27_9:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_27_0:addElement(var_27_9)

	var_27_0.TabBacker = var_27_9

	local var_27_10
	local var_27_11 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_27_1
	})

	var_27_11.id = "MenuTitle"

	var_27_11.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("AAR/AFTER_ACTION_REPORT")), 0)
	var_27_11.Line:SetLeft(0, 0)
	var_27_11:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_27_0:addElement(var_27_11)

	var_27_0.MenuTitle = var_27_11

	local var_27_12
	local var_27_13 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_27_1
			})
		end,
		controllerIndex = var_27_1
	}
	local var_27_14 = LUI.TabManager.new(var_27_13)

	var_27_14.id = "Tabs"

	var_27_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 994, _1080p * 108, _1080p * 160)
	var_27_0:addElement(var_27_14)

	var_27_0.Tabs = var_27_14

	local var_27_15

	if CONDITIONS.IsInGameBattlesMatch(var_27_0) then
		local var_27_16 = LUI.UIText.new()

		var_27_16.id = "GameBattlesMatchID"

		var_27_16:SetRGBFromTable(SWATCHES.genericMenu.CategoryHeader, 0)
		var_27_16:setText("", 0)
		var_27_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_27_16:SetAlignment(LUI.Alignment.Right)
		var_27_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1424, _1080p * 1790, _1080p * 110, _1080p * 140)
		var_27_0:addElement(var_27_16)

		var_27_0.GameBattlesMatchID = var_27_16
	end

	PostLoadFunc(var_27_0, var_27_1, arg_27_1)

	return var_27_0
end

MenuBuilder.registerType("AARContainer", AARContainer)
LockTable(_M)
