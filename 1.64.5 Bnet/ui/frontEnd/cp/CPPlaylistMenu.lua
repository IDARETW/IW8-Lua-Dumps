module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0
	local var_1_1 = PlaylistUtils.GetPublicPlaylistDatasources()
	local var_1_2 = var_1_1:GetCountValue(arg_1_0) - 1

	for iter_1_0 = 0, var_1_2 do
		local var_1_3 = var_1_1:GetDataSourceAtIndex(iter_1_0)
		local var_1_4 = var_1_3.index:GetValue(arg_1_0)

		if not Playlist.DDIDBIIJIF(var_1_4) then
			var_1_0 = var_1_3

			break
		end
	end

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Darkener)
	assert(arg_2_0.Vignette)
	assert(arg_2_0.TabBacker)
	assert(arg_2_0.PlaylistList)
	assert(arg_2_0.PlaylistList.PlaylistButtons)
	assert(arg_2_0.MenuTitle)
	Engine.DHFCHIIJCA("squad_lobby")
	FrontEndScene.HideAllCharacters()
	arg_2_0.CPCheckpointWidget:SetAlpha(0, 0)
	arg_2_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU_CP/PLAYLISTS"))
	Lobby.CheckTURequirement(arg_2_0, arg_2_1)

	local var_2_0 = (arg_2_2.publicPlaylistDataSource or var_0_0(arg_2_1)).playlists

	arg_2_0.PlaylistList.PlaylistButtons:SetGridDataSource(var_2_0)
	arg_2_0.PlaylistInfo:SetDataSourceThroughElement(arg_2_0.PlaylistList.PlaylistButtons, nil)
	arg_2_0.PlaylistList.PlaylistButtons:processEvent({
		name = "gain_focus"
	})
	arg_2_0.CPNextRewardContainer:SetDataSourceThroughElement(arg_2_0.PlaylistList.PlaylistButtons, nil)
	arg_2_0.CPCheckpointWidget:SetDataSourceThroughElement(arg_2_0.PlaylistList.PlaylistButtons, nil)
	arg_2_0.CPDisabledMunitions:SetDataSourceThroughElement(arg_2_0.PlaylistList.PlaylistButtons, nil)
	arg_2_0.CPDifficultyPlaylistInfo:SetDataSourceThroughElement(arg_2_0.PlaylistList.PlaylistButtons, nil)
	arg_2_0.CPRelicsActiveFrontEnd:SetDataSourceThroughElement(arg_2_0.PlaylistList.PlaylistButtons, nil)

	local var_2_1 = arg_2_2.intelData

	if var_2_1 ~= nil then
		local var_2_2 = arg_2_0.PlaylistList.PlaylistButtons
		local var_2_3 = var_2_2:GetNumChildren()

		for iter_2_0 = 1, var_2_3 do
			local var_2_4 = var_2_2:GetPositionForIndex(iter_2_0)
			local var_2_5 = var_2_2:GetElementAtPosition(var_2_4.x, var_2_4.y).Button.Text:getText()
			local var_2_6 = Engine.CBBHFCGDIC(var_2_1.operationName)
			local var_2_7 = var_2_5:upper()

			if var_2_6:upper():find(var_2_7) then
				var_2_2:SetFocusedPosition(var_2_4, true)

				break
			end
		end
	end

	LAYOUT.AddAspectRatioFadeFrame(arg_2_0, arg_2_1)
	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_2_0.TabBacker)
	ACTIONS.ScaleFullscreen(arg_2_0.Vignette)
end

function CPPlaylistMenu(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIVerticalNavigator.new()

	var_3_0.id = "CPPlaylistMenu"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	var_3_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_3_1
	})
	var_3_0.HelperBar.id = "HelperBar"

	var_3_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_3_0.HelperBar:setPriority(10)
	var_3_0:addElement(var_3_0.HelperBar)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = {
		worldBlur = 5,
		controllerIndex = var_3_1
	}
	local var_3_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_3_4)

	var_3_5.id = "WorldBlur"

	var_3_0:addElement(var_3_5)

	var_3_0.WorldBlur = var_3_5

	local var_3_6
	local var_3_7 = LUI.UIImage.new()

	var_3_7.id = "Darkener"

	var_3_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_7:SetAlpha(0.5, 0)
	var_3_0:addElement(var_3_7)

	var_3_0.Darkener = var_3_7

	local var_3_8
	local var_3_9 = LUI.UIImage.new()

	var_3_9.id = "Vignette"

	var_3_9:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_9:SetAlpha(0.5, 0)
	var_3_9:setImage(RegisterMaterial("gradient_curve"), 0)
	var_3_9:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -1006, _1080p * 160, _1080p * -70)
	var_3_0:addElement(var_3_9)

	var_3_0.Vignette = var_3_9

	local var_3_10
	local var_3_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_3_1
	})

	var_3_11.id = "TabBacker"

	var_3_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_3_0:addElement(var_3_11)

	var_3_0.TabBacker = var_3_11

	local var_3_12
	local var_3_13 = MenuBuilder.BuildRegisteredType("PlaylistInfo", {
		controllerIndex = var_3_1
	})

	var_3_13.id = "PlaylistInfo"

	var_3_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 1374, _1080p * 200, _1080p * 475)
	var_3_0:addElement(var_3_13)

	var_3_0.PlaylistInfo = var_3_13

	local var_3_14
	local var_3_15 = MenuBuilder.BuildRegisteredType("SocialPartyWidget", {
		controllerIndex = var_3_1
	})

	var_3_15.id = "PartyWidget"

	var_3_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1224, _1080p * 1824, _1080p * 94, _1080p * 264)
	var_3_0:addElement(var_3_15)

	var_3_0.PartyWidget = var_3_15

	local var_3_16

	if CONDITIONS.IsUserSignedInDemonware(var_3_1) then
		local var_3_17 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_3_1
		})

		var_3_17.id = "MPPlayerDetails"

		var_3_17:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_3_0:addElement(var_3_17)

		var_3_0.MPPlayerDetails = var_3_17
	end

	local var_3_18
	local var_3_19 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_3_1
	})

	var_3_19.id = "MenuTitle"

	var_3_19.MenuTitle:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/PLAYLISTS"), 0)
	var_3_19.Line:SetLeft(0, 0)
	var_3_19:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_3_0:addElement(var_3_19)

	var_3_0.MenuTitle = var_3_19

	local var_3_20
	local var_3_21 = MenuBuilder.BuildRegisteredType("CPCheckpointWidget", {
		controllerIndex = var_3_1
	})

	var_3_21.id = "CPCheckpointWidget"

	var_3_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1387, _1080p * 1787, _1080p * 375, _1080p * 475)
	var_3_0:addElement(var_3_21)

	var_3_0.CPCheckpointWidget = var_3_21

	local var_3_22
	local var_3_23 = MenuBuilder.BuildRegisteredType("CPDisabledMunitions", {
		controllerIndex = var_3_1
	})

	var_3_23.id = "CPDisabledMunitions"

	var_3_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 780, _1080p * 1280, _1080p * 295, _1080p * 395)
	var_3_0:addElement(var_3_23)

	var_3_0.CPDisabledMunitions = var_3_23

	local var_3_24
	local var_3_25 = MenuBuilder.BuildRegisteredType("CPRelicsActiveFrontEnd", {
		controllerIndex = var_3_1
	})

	var_3_25.id = "CPRelicsActiveFrontEnd"

	var_3_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 999, _1080p * 1379, _1080p * 485, _1080p * 930)
	var_3_0:addElement(var_3_25)

	var_3_0.CPRelicsActiveFrontEnd = var_3_25

	local var_3_26
	local var_3_27 = MenuBuilder.BuildRegisteredType("CPNextRewardConatiner", {
		controllerIndex = var_3_1
	})

	var_3_27.id = "CPNextRewardContainer"

	var_3_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 604, _1080p * 985, _1080p * 485, _1080p * 931)
	var_3_0:addElement(var_3_27)

	var_3_0.CPNextRewardContainer = var_3_27

	local var_3_28
	local var_3_29 = MenuBuilder.BuildRegisteredType("CPPlaylistList", {
		controllerIndex = var_3_1
	})

	var_3_29.id = "PlaylistList"

	var_3_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 200, _1080p * 888)
	var_3_0:addElement(var_3_29)

	var_3_0.PlaylistList = var_3_29

	local var_3_30
	local var_3_31 = MenuBuilder.BuildRegisteredType("CPDifficultyPlaylistInfo", {
		controllerIndex = var_3_1
	})

	var_3_31.id = "CPDifficultyPlaylistInfo"

	var_3_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1120, _1080p * 1374, _1080p * 380, _1080p * 480)
	var_3_0:addElement(var_3_31)

	var_3_0.CPDifficultyPlaylistInfo = var_3_31

	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		priority = 2,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})
	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("MENU/BACK")
	})
	var_3_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		priority = 1,
		kbmTooltipPromptOverload = "button_quick_options",
		button_ref = "button_start",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")
	})

	local var_3_32 = LUI.UIBindButton.new()

	var_3_32.id = "selfBindButton"

	var_3_0:addElement(var_3_32)

	var_3_0.bindButton = var_3_32

	var_3_0.bindButton:addEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		if not arg_4_1.controller then
			local var_4_0 = var_3_1
		end

		ACTIONS.LeaveMenu(var_3_0)
	end)
	var_3_0.bindButton:addEventHandler("button_start", function(arg_5_0, arg_5_1)
		local var_5_0 = arg_5_1.controller or var_3_1

		ACTIONS.OpenOptionsMenu(var_5_0, "", "")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CPPlaylistMenu", CPPlaylistMenu)
LockTable(_M)
