module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = MenuBuilder.BuildRegisteredType("SPPauseDifficultyFlyin", {
		controllerIndex = arg_1_0._controllerIndex
	})

	var_1_0:SetMap("proxywar")

	if arg_1_1 == true then
		local function var_1_1(arg_2_0, arg_2_1)
			if LUI.FlowManager.IsInStack("MainMenuOffline") then
				ACTIONS.RestoreMenu("MainMenuOffline", true, arg_2_1.controller)
			else
				ACTIONS.RestoreMenu("MainMenu", true, arg_2_1.controller)
			end
		end

		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_1_0._controllerIndex, false, {
			disableQuickAccessShortcuts = false,
			widget = var_1_0,
			backButtonOverride = var_1_1
		})
	else
		LUI.FlowManager.RequestPopupMenu(nil, "FlyInPopup", true, arg_1_0._controllerIndex, false, {
			disableQuickAccessShortcuts = false,
			widget = var_1_0
		})
	end
end

local function var_0_1(arg_3_0, arg_3_1)
	assert(arg_3_0._levelList)

	local var_3_0 = arg_3_0.LevelSelectionList:GetFocusPositionIndex() + 1
	local var_3_1 = arg_3_0._levelList[var_3_0]
	local var_3_2 = arg_3_0.Map._nodes[var_3_0]
	local var_3_3 = true

	if arg_3_0._prevNode and arg_3_0._prevNode.id == var_3_2.id then
		var_3_3 = false
	end

	if var_3_3 then
		if arg_3_0._prevNode then
			arg_3_0._prevNode:DeselectNode(var_3_1)
		end

		var_3_2:SelectNode(var_3_1)

		local var_3_4 = "Position1"

		if var_3_1.mapPosition == WORLD_MAP.Regions.UK then
			var_3_4 = "Position1"
			arg_3_0.Map._isZoomIn = false

			arg_3_0.Map:ZoomOut(arg_3_0._prevNode, var_3_2, var_3_1)
		elseif var_3_1.mapPosition == WORLD_MAP.Regions.GLOBAL_LOWER or var_3_1.mapPosition == WORLD_MAP.Regions.GLOBAL_UPPER then
			var_3_4 = var_3_1.mapPosition == WORLD_MAP.Regions.GLOBAL_LOWER and "Position4" or "Position2"
			arg_3_0.Map._isZoomIn = false

			arg_3_0.Map:ZoomOut(arg_3_0._prevNode, var_3_2, var_3_1)
		elseif var_3_1.mapPosition == WORLD_MAP.Regions.URZIKSTAN then
			var_3_4 = "Position3"
			arg_3_0.Map._isZoomIn = true

			arg_3_0.Map:ZoomIn(arg_3_0._prevNode, var_3_2, var_3_1)
		else
			assert(false, "unknown map position")
		end

		arg_3_0.Map:UpdateDetails(arg_3_0._prevNode, var_3_2, var_3_1)
		ACTIONS.AnimateSequence(arg_3_0, var_3_4)

		arg_3_0._prevNode = var_3_2
	end
end

local function var_0_2(arg_4_0, arg_4_1)
	local var_4_0
	local var_4_1 = -2
	local var_4_2 = StringTable.BFHCAIIDA(CSV.levels.file) - 1

	for iter_4_0 = 0, var_4_2 do
		local var_4_3 = CSV.ReadRow(CSV.levels, iter_4_0)
		local var_4_4 = var_4_3.name

		if var_4_3.previewBack == nil or var_4_3.previewBack == "" then
			var_4_3.previewBack = "white"
		end

		if var_4_3.previewFront == nil or var_4_3.previewFront == "" then
			var_4_3.previewFront = "white"
		end

		local var_4_5 = {
			disabled = true,
			isCurrentMission = var_4_4 == arg_4_0._currentMission,
			levelIndex = iter_4_0,
			levelName = var_4_4,
			displayName = Engine.CBBHFCGDIC(var_4_3.string),
			locationText = Engine.CBBHFCGDIC(var_4_3.location),
			objectiveText = Engine.CBBHFCGDIC(var_4_3.desc),
			difficultyRank = SPSharedUtils.GetHighestDifficultyForLevel(var_4_4, arg_4_1),
			collateralRank = SPSharedUtils.GetHighestCollateralRankForLevel(var_4_4, arg_4_1),
			previewBack = RegisterMaterial(var_4_3.previewBack),
			previewFront = RegisterMaterial(var_4_3.previewFront),
			image = RegisterMaterial(var_4_3.image),
			missionState = SPSharedUtils.GetMissionStateForLevel(var_4_4, arg_4_1),
			positionLeft = var_4_3.posLeft,
			positionTop = var_4_3.posTop,
			latitude = var_4_3.latitude,
			longitude = var_4_3.longitude,
			mapPosition = var_4_3.mapPosition,
			focusSFX = var_4_3.focusSFX
		}

		if not Dvar.IBEGCHEFE("lui_checkIfLevelInFileSystem") or Engine.DDCGBHDIBF and Engine.DDCGBHDIBF(var_4_4) then
			if var_4_5.missionState == "complete" then
				var_4_1 = iter_4_0
			end

			local var_4_6 = var_4_1 >= iter_4_0 - 1

			if var_4_5.missionState ~= "locked" or var_4_6 or SPSharedUtils.UnlockAllMissions(arg_4_1) then
				if var_4_5.isCurrentMission then
					var_4_0 = #arg_4_0._levelList
				end

				var_4_5.disabled = false

				table.insert(arg_4_0._levelList, var_4_5)
			end
		end
	end

	arg_4_0.Map:PopulateMap(arg_4_0._levelList)
	arg_4_0.LevelSelectionList:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = 1 + arg_4_0.LevelSelectionList:GetContentIndex(arg_5_1, arg_5_2)
		local var_5_1 = arg_4_0._levelList[var_5_0]
		local var_5_2 = {
			isCurrentMission = var_5_1.isCurrentMission,
			levelName = var_5_1.levelName,
			displayName = var_5_1.displayName,
			image = var_5_1.image
		}

		arg_5_0:SetButtonDisabled(var_5_1.disabled)
		arg_5_0:SetupButton(var_5_2)
		arg_5_0:setGainFocusAllSFX(var_5_1.focusSFX)

		arg_5_0._column = arg_5_1
		arg_5_0._row = arg_5_2

		if not arg_5_0.addHandlers then
			arg_5_0.addHandlers = true

			arg_5_0:registerEventHandler("button_over", function(arg_6_0, arg_6_1)
				arg_4_0.LevelSelectionList:SetFocusedPosition({
					x = arg_6_0._column,
					y = arg_6_0._row
				}, true)
				var_0_1(arg_4_0, arg_4_1)
				ACTIONS.AnimateSequence(arg_6_0, "ButtonOver")
			end)
		end
	end)

	if var_4_0 ~= nil then
		arg_4_0.LevelSelectionList:SetDefaultFocus({
			y = 0,
			x = var_4_0
		})
	end

	arg_4_0.LevelSelectionList:SetNumChildren(#arg_4_0._levelList)
	arg_4_0.LevelSelectionList:RefreshContent()
end

local function var_0_3(arg_7_0)
	if not arg_7_0._handlersAdded then
		arg_7_0._handlersAdded = true

		local var_7_0 = LUI.UIBindButton.new()

		var_7_0.id = "selfBindButton"

		arg_7_0:addElement(var_7_0)

		arg_7_0.bindButton = var_7_0

		arg_7_0:AddButtonHelperText({
			side = "left",
			priority = 0,
			button_ref = "button_alt1",
			helper_text = Engine.CBBHFCGDIC("MENU/NEWGAME"),
			container = arg_7_0.ButtonPromptContainer
		})
		arg_7_0.bindButton:addEventHandler("button_alt1", function(arg_8_0, arg_8_1)
			SPSharedUtils.ShaderPreloadWrap(function()
				Dvar.BDEHAEGHAF("start", "")

				if Engine.BBGGBGEHAI(arg_7_0._controllerIndex) then
					LUI.FlowManager.RequestPopupMenu(arg_7_0, "overwrite_warning_menu", true, arg_7_0._controllerIndex)
				else
					var_0_0(arg_7_0)
				end
			end)
		end)

		if arg_7_0._currentMission ~= "none" then
			local function var_7_1()
				if Engine.BBGGBGEHAI(arg_7_0._controllerIndex) then
					arg_7_0:AddButtonHelperText({
						side = "left",
						priority = 1,
						button_ref = "button_alt2",
						helper_text = Engine.CBBHFCGDIC("MENU/RESUMEGAME"),
						container = arg_7_0.ButtonPromptContainer
					})
					arg_7_0.bindButton:addEventHandler("button_alt2", function(arg_11_0, arg_11_1)
						SPSharedUtils.ShaderPreloadWrap(function()
							Dvar.BDEHAEGHAF("start", "")
							LUI.FlowManager.RequestPopupMenu(arg_11_0, "ResumeGamePopup", false, arg_11_1.controller, false)
						end)
					end)
				end
			end

			var_7_1()
			arg_7_0:addEventHandler("update_save_game_available_complete", function(arg_13_0, arg_13_1)
				var_7_1()
			end)
		end
	end
end

local function var_0_4(arg_14_0, arg_14_1, arg_14_2)
	if SPSharedUtils.IsMissionCheatEnabled(arg_14_1) then
		local var_14_0 = LUI.UIText.new()

		var_14_0:setText("Cheat Mode Enabled - All Maps Unlocked, but Progression saving disabled!", 0)
		var_14_0:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_14_0:SetAlignment(LUI.Alignment.Left)
		var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 438, _1080p * 216, _1080p * 252)
		arg_14_0:addElement(var_14_0)

		arg_14_0.CheatLabel = var_14_0
	end

	Engine.BBEEIGHJBA(CoD.Music.MainSPMusic)
	Engine.EBCGADABJ()

	arg_14_0.SetupButtonHelpers = var_0_3
	arg_14_0._controllerIndex = arg_14_1
	arg_14_0._currentMission = PlayerData.BFFBGAJGD(arg_14_1, 0).spData.currentMission:get()
	arg_14_0._levelList = {}
	arg_14_0._prevNode = nil

	var_0_2(arg_14_0, arg_14_1)

	arg_14_0.LevelSelectionList._showNumbersAndArrowsKBM = true

	arg_14_0.LevelSelectionList:SetWidgetsAlwaysVisible(true)
	arg_14_0.LevelSelectionList:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -822.5, _1080p * 235 * 7 / 2, _1080p * -174, _1080p * -69)
	arg_14_0.ArrowLeft:SetupArrow(LUI.BEARING.left)
	arg_14_0.ArrowRight:SetupArrow(LUI.BEARING.right)
	assert(arg_14_0.VignetteFrontend)

	local function var_14_1()
		local var_15_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_14_0.VignetteFrontend:SetScale(var_15_0)
	end

	arg_14_0:addAndCallEventHandler("onVideoChange", var_14_1)

	if (not arg_14_0._levelList[1] or arg_14_0._levelList[1].missionState == "locked") and not SPSharedUtils.UnlockAllMissions(arg_14_1) then
		SPSharedUtils.ShaderPreloadWrap(function()
			var_0_0(arg_14_0, true)
		end)
	end

	arg_14_0.MapLightener:SetAlpha(0)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_14_0.FooterBacker)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_14_0.TabBacker)
	ACTIONS.ScaleFullscreen(arg_14_0.VignetteFrontend)
end

function CampaignPlayMenu(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIVerticalNavigator.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_17_0.id = "CampaignPlayMenu"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("LevelSelectMap", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "Map"

	var_17_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -283, _1080p * -283, _1080p * 234, _1080p * 234)
	var_17_0:addElement(var_17_4)

	var_17_0.Map = var_17_4

	local var_17_5
	local var_17_6 = LUI.UIImage.new()

	var_17_6.id = "MapLightener"

	var_17_6:SetAlpha(0.05, 0)
	var_17_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 154, _1080p * 885)
	var_17_0:addElement(var_17_6)

	var_17_0.MapLightener = var_17_6

	local var_17_7

	if CONDITIONS.InFrontend(var_17_0) then
		local var_17_8 = LUI.UIImage.new()

		var_17_8.id = "VignetteFrontend"

		var_17_8:SetAlpha(0.75, 0)
		var_17_8:setImage(RegisterMaterial("campaign_world_vignette"), 0)
		var_17_0:addElement(var_17_8)

		var_17_0.VignetteFrontend = var_17_8
	end

	local var_17_9
	local var_17_10 = LUI.UIImage.new()

	var_17_10.id = "FooterBacker"

	var_17_10:SetRGBFromInt(0, 0)
	var_17_10:SetAlpha(0.65, 0)
	var_17_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -195, 0)
	var_17_0:addElement(var_17_10)

	var_17_0.FooterBacker = var_17_10

	local var_17_11
	local var_17_12 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 7,
		maxVisibleRows = 1,
		wrapY = false,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_17_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("LevelSelectButton", {
				controllerIndex = var_17_1
			})
		end,
		refreshChild = function(arg_19_0, arg_19_1, arg_19_2)
			return
		end,
		spacingX = _1080p * 25,
		spacingY = _1080p * 25,
		columnWidth = _1080p * 210,
		rowHeight = _1080p * 105,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_17_13 = LUI.UIGrid.new(var_17_12)

	var_17_13.id = "LevelSelectionList"

	var_17_13:setUseStencil(true)
	var_17_13:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -810, _1080p * 810, _1080p * -174, _1080p * -69)
	var_17_0:addElement(var_17_13)

	var_17_0.LevelSelectionList = var_17_13

	local var_17_14
	local var_17_15 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_17_1
	})

	var_17_15.id = "ArrowRight"

	var_17_15:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_17_15.Arrow:SetZRotation(-90, 0)
	var_17_15:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -135, _1080p * -103, _1080p * -138, _1080p * -106)
	var_17_0:addElement(var_17_15)

	var_17_0.ArrowRight = var_17_15

	local var_17_16
	local var_17_17 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_17_1
	})

	var_17_17.id = "ArrowLeft"

	var_17_17:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_17_17.Arrow:SetZRotation(90, 0)
	var_17_17:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 103, _1080p * 135, _1080p * -138, _1080p * -106)
	var_17_0:addElement(var_17_17)

	var_17_0.ArrowLeft = var_17_17

	local var_17_18
	local var_17_19 = LUI.UIImage.new()

	var_17_19.id = "TabBacker"

	var_17_19:SetRGBFromInt(0, 0)
	var_17_19:SetAlpha(0.65, 0)
	var_17_19:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_17_0:addElement(var_17_19)

	var_17_0.TabBacker = var_17_19

	local var_17_20
	local var_17_21 = MenuBuilder.BuildRegisteredType("ButtonPromptContainerHorizontal", {
		controllerIndex = var_17_1
	})

	var_17_21.id = "ButtonPromptContainer"

	if CONDITIONS.AlwaysFalse(var_17_0) then
		var_17_21.Label:setText("ButtonPrompt", 0)
	end

	var_17_21:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 150, _1080p * 251, _1080p * -226, _1080p * -195)
	var_17_0:addElement(var_17_21)

	var_17_0.ButtonPromptContainer = var_17_21

	local function var_17_22()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_22

	local var_17_23 = {
		{
			duration = 923,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -240,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -240,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 200,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 200,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_17_4:RegisterAnimationSequence("Position1", var_17_23)

	local function var_17_24()
		var_17_4:AnimateSequence("Position1")
	end

	var_17_0._sequences.Position1 = var_17_24

	local var_17_25 = {
		{
			duration = 923,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1161,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 314,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1161,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 314,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_17_4:RegisterAnimationSequence("Position2", var_17_25)

	local function var_17_26()
		var_17_4:AnimateSequence("Position2")
	end

	var_17_0._sequences.Position2 = var_17_26

	local var_17_27 = {
		{
			duration = 923,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -992,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 22,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -992,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 22,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_17_4:RegisterAnimationSequence("Position3", var_17_27)

	local function var_17_28()
		var_17_4:AnimateSequence("Position3")
	end

	var_17_0._sequences.Position3 = var_17_28

	local var_17_29 = {
		{
			duration = 923,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1460,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -245,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1460,
			easing = LUI.EASING.inOutQuadratic
		},
		{
			duration = 923,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -245,
			easing = LUI.EASING.inOutQuadratic
		}
	}

	var_17_4:RegisterAnimationSequence("Position4", var_17_29)

	local function var_17_30()
		var_17_4:AnimateSequence("Position4")
	end

	var_17_0._sequences.Position4 = var_17_30

	var_17_13:AddArrow(var_17_17)
	var_17_13:AddArrow(var_17_15)
	var_0_4(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("CampaignPlayMenu", CampaignPlayMenu)
LockTable(_M)
