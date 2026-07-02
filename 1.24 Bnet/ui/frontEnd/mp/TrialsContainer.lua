module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	MP_COMMON.SetupParty()
	MP_COMMON.SetupPrivateMatch()
	Lobby.DDDCGDHHJF(arg_1_1)
	Lobby.EAHFJBBBBD(PartyUIRoot.MP_TRIALS)
end

local function var_0_1(arg_2_0)
	return Engine.CFHBIHABCB(arg_2_0) and CSV.trialMissionTable or CSV.trialMissionTableF2P
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = var_0_1(arg_3_1)
	local var_3_1 = StringTable.BFHCAIIDA(var_3_0.file)
	local var_3_2 = {}

	for iter_3_0 = 0, var_3_1 - 1 do
		local var_3_3 = CSV.ReadRow(var_3_0, iter_3_0)

		if arg_3_2 == tonumber(var_3_3.season) and var_3_3.ui_previewImage ~= "" and var_3_3.ui_name ~= "" and var_3_3.ui_description ~= "" then
			var_3_3.bestScore = 0

			if var_3_3.playerDataId and var_3_3.playerDataId ~= "" then
				var_3_3.bestScore = PlayerData.BFFBGAJGD(arg_3_1, CoD.StatsGroup.Ranked).trialsBestScore[var_3_3.playerDataId]:get()
			end

			table.insert(var_3_2, var_3_3)
		end
	end

	arg_3_0.trials = var_3_2
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_0.Maps then
		arg_4_0.Scrollbar:closeTree()

		arg_4_0.Scrollbar = nil

		arg_4_0.Maps:closeTree()

		arg_4_0.Maps = nil
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIGrid.new({
		maxVisibleColumns = 3,
		maxVisibleRows = 3,
		wrapY = true,
		adjustSizeToContent = true,
		wrapX = true,
		controllerIndex = arg_5_1,
		spacingX = _1080p * 20,
		spacingY = _1080p * 30,
		columnWidth = _1080p * 360,
		rowHeight = _1080p * 197
	})

	var_5_0.id = "Maps"

	var_5_0:setUseStencil(true)
	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 510, _1080p * 216, _1080p * 806)
	arg_5_0:addElement(var_5_0)

	arg_5_0.Maps = var_5_0

	local var_5_1
	local var_5_2 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = arg_5_1
	})

	var_5_2.id = "Scrollbar"

	var_5_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 70, _1080p * 86, _1080p * 216, _1080p * 865)
	arg_5_0:addElement(var_5_2)

	arg_5_0.Scrollbar = var_5_2

	local var_5_3 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_5_2,
		startCap = var_5_2.startCap,
		endCap = var_5_2.endCap,
		sliderArea = var_5_2.sliderArea,
		slider = var_5_2.sliderArea and var_5_2.sliderArea.slider,
		fixedSizeSlider = var_5_2.sliderArea and var_5_2.sliderArea.fixedSizeSlider
	})

	var_5_0:AddScrollbar(var_5_3)
	var_5_3:UpdateSliderAreaVertical(false)
	var_5_3:SetKBMStyle(true)
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.trials
	local var_6_1 = LUI.DataSourceFromList.new(#var_6_0)

	function var_6_1.MakeDataSourceAtIndex(arg_7_0, arg_7_1)
		return var_6_0[arg_7_1]
	end

	for iter_6_0 = 1, #arg_6_0.trials do
		local var_6_2 = MenuBuilder.BuildRegisteredType("TrialButton", {
			controllerIndex = arg_6_1
		})

		var_6_2.Text:setText(Engine.CBBHFCGDIC(var_6_0[iter_6_0].ui_name))
		var_6_2.BackgroundImage:setImage(RegisterMaterial(var_6_0[iter_6_0].ui_previewImage))
		var_6_2:SetDataSource(var_6_1[iter_6_0], arg_6_1)
		var_6_2:addEventHandler("gain_focus", function(arg_8_0, arg_8_1)
			local var_8_0 = arg_8_0:GetDataSource()

			if var_8_0 then
				arg_6_0.TrialDetails.trialData = var_8_0

				arg_6_0.TrialDetails.BackgroundImage:setImage(RegisterMaterial(var_8_0.ui_previewMapImage))
				arg_6_0.TrialDetails.Description:setText(Engine.CBBHFCGDIC(var_8_0.ui_description))
				arg_6_0.TrialDetails.Header.Text:setText(Engine.CBBHFCGDIC(var_8_0.ui_name))
				arg_6_0.TrialDetails:UpdateBestScore(var_8_0)
			end
		end)

		var_6_2.trialData = var_6_1[iter_6_0]

		var_6_2:SetBestScoreStars(var_6_2.trialData)
		var_6_2:addEventHandler("button_action", function(arg_9_0, arg_9_1)
			LUI.FlowManager.RequestPopupMenu(nil, "TrialSkinny", true, arg_6_1, false, {
				trialLobby = arg_9_0,
				trialData = arg_9_0.trialData
			})
		end)
		arg_6_0.Maps:AddElement(var_6_2)
	end

	arg_6_0.Maps:FocusFirstItem()
end

local function var_0_6(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0) do
		if iter_10_1.season == arg_10_1 then
			return true
		end
	end

	return false
end

local function var_0_7(arg_11_0, arg_11_1)
	local var_11_0 = var_0_1(arg_11_1)
	local var_11_1 = Engine.CBBHFCGDIC("LUA_MENU/SEASON_NUM", tostring(SEASON.GetCurrentSeason()))
	local var_11_2 = {}
	local var_11_3 = StringTable.BFHCAIIDA(CSV.trialMissionTable.file)

	for iter_11_0 = 0, var_11_3 - 1 do
		local var_11_4 = CSV.ReadRow(var_11_0, iter_11_0)

		if var_11_4.season and var_11_4.season ~= "" and not var_0_6(var_11_2, tonumber(var_11_4.season)) then
			local var_11_5 = {
				name = Engine.CFHBIHABCB(arg_11_1) and Engine.CBBHFCGDIC("LUA_MENU/SEASON_NUM", var_11_4.season) or var_11_1,
				season = tonumber(var_11_4.season),
				focusFunction = function(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
					var_0_2(arg_11_0, arg_12_1, arg_11_0.tabsData[arg_12_2 + 1].season)
					var_0_3(arg_11_0, arg_12_1)
					var_0_4(arg_11_0, arg_12_1)
					var_0_5(arg_11_0, arg_12_1)
					Engine.BJDBIAGIDA(SOUND_SETS.default.tabHighlight)
				end
			}

			table.insert(var_11_2, var_11_5)
		end
	end

	table.sort(var_11_2, function(arg_13_0, arg_13_1)
		return tonumber(arg_13_1.season) > tonumber(arg_13_0.season)
	end)

	arg_11_0.tabsData = var_11_2

	arg_11_0.Tabs:SetTabs(var_11_2)
	arg_11_0.Tabs:SetAlignment(LUI.Alignment.Left)
end

local function var_0_8(arg_14_0, arg_14_1)
	arg_14_0.AvailableTickets:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_AVAILABLE_TICKETS", Loot.DEBEIFJEEG(arg_14_1, TRIALS.TicketID)), 0)
end

local function var_0_9(arg_15_0, arg_15_1, arg_15_2)
	Engine.EBIDFIDHIE(MPConfig.default_online, arg_15_1)
	Dvar.DFIJDJFIFD("OOTQKOTRM", 1)
	Dvar.DHEGHJJJHI("LSTLQTSSRM", true)
	Dvar.DHEGHJJJHI("LNQLRSNMQS", true)
end

local function var_0_10(arg_16_0, arg_16_1, arg_16_2)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	assert(arg_16_0.MenuTitle)
	arg_16_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/TRIALS"))
	var_0_7(arg_16_0, arg_16_1)
	var_0_0(arg_16_0, arg_16_1)
	MatchRules.CJGCIGEBB(1)
	MatchRules.CIGFFEAEFD("gametype", "trial")
	MatchRules.BCECADEHDA()

	if Engine.ECHCFGDDDF() then
		local var_16_0 = LUI.UIElement.new()

		var_16_0:SetBlurStrength(5)
		var_16_0:setupWorldBlur()

		var_16_0.id = "blur"

		arg_16_0:addElement(var_16_0)
	end

	arg_16_0:addEventHandler("trial_activated", function(arg_17_0, arg_17_1)
		if Lobby.CAEJIEEEDF() == 0 then
			Lobby.CJBHJEAFGH(2)
		end

		Engine.EBIDFIDHIE("xpartygo 1")
		var_0_8(arg_17_0, arg_16_1)
	end)

	if Dvar.CFHDGABACF("MRNSMSRQMO") > 0 then
		PostGameFanfare:start()
		Dvar.DFIJDJFIFD("MRNSMSRQMO", 0)
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_16_0.TabBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_16_0.Darken)
	LAYOUT.AddAspectRatioFadeFrame(arg_16_0, arg_16_1)
	var_0_8(arg_16_0, arg_16_1)

	if #arg_16_0.tabsData > 0 then
		arg_16_0.Tabs:FocusTab(arg_16_1, #arg_16_0.tabsData - 1, FocusType.MouseOver)
	end
end

function TrialsContainer(arg_18_0, arg_18_1)
	local var_18_0 = LUI.UIElement.new()

	var_18_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_18_0.id = "TrialsContainer"

	local var_18_1 = arg_18_1 and arg_18_1.controllerIndex

	if not var_18_1 and not Engine.DDJFBBJAIG() then
		var_18_1 = var_18_0:getRootController()
	end

	assert(var_18_1)
	var_0_9(var_18_0, var_18_1, arg_18_1)

	local var_18_2 = var_18_0
	local var_18_3
	local var_18_4 = LUI.UIImage.new()

	var_18_4.id = "Darken"

	var_18_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_18_4:SetAlpha(0.5, 0)
	var_18_0:addElement(var_18_4)

	var_18_0.Darken = var_18_4

	local var_18_5
	local var_18_6 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_18_1
	})

	var_18_6.id = "TabBacker"

	var_18_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_18_0:addElement(var_18_6)

	var_18_0.TabBacker = var_18_6

	local var_18_7
	local var_18_8 = MenuBuilder.BuildRegisteredType("TrialDetails", {
		controllerIndex = var_18_1
	})

	var_18_8.id = "TrialDetails"

	var_18_8:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -516, _1080p * -100, _1080p * 215, _1080p * 805)
	var_18_0:addElement(var_18_8)

	var_18_0.TrialDetails = var_18_8

	local var_18_9
	local var_18_10 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
		controllerIndex = var_18_1
	})

	var_18_10.id = "MPPlayerDetails"

	var_18_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1324, _1080p * 1824, _1080p * 54, _1080p * 114)
	var_18_0:addElement(var_18_10)

	var_18_0.MPPlayerDetails = var_18_10

	local var_18_11
	local var_18_12 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_18_1
	})

	var_18_12.id = "MenuTitle"

	var_18_12.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TRIALS")), 0)
	var_18_12.Line:SetLeft(0, 0)
	var_18_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_18_0:addElement(var_18_12)

	var_18_0.MenuTitle = var_18_12

	local var_18_13
	local var_18_14 = LUI.UIText.new()

	var_18_14.id = "AvailableTickets"

	var_18_14:setText("", 0)
	var_18_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_18_14:SetAlignment(LUI.Alignment.Left)
	var_18_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -487, _1080p * -115, _1080p * 173, _1080p * 197)
	var_18_0:addElement(var_18_14)

	var_18_0.AvailableTickets = var_18_14

	local var_18_15
	local var_18_16 = {
		spacing = 4,
		wrap = true,
		tabHeight = _1080p * 52,
		buildTab = function()
			return MenuBuilder.BuildRegisteredType("SubMenuTab", {
				controllerIndex = var_18_1
			})
		end,
		controllerIndex = var_18_1
	}
	local var_18_17 = LUI.TabManager.new(var_18_16)

	var_18_17.id = "Tabs"

	var_18_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 987, _1080p * 108, _1080p * 160)
	var_18_0:addElement(var_18_17)

	var_18_0.Tabs = var_18_17

	var_0_10(var_18_0, var_18_1, arg_18_1)

	return var_18_0
end

MenuBuilder.registerType("TrialsContainer", TrialsContainer)
LockTable(_M)
