module(..., package.seeall)

local var_0_0 = "frontEnd.systemLinkMenu.serverBrowser"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 then
		arg_1_0.ServerBrowser:processEvent({
			name = "gain_focus",
			controller = arg_1_1
		})
	else
		arg_1_0.ServerBrowser:processEvent({
			name = "lose_focus",
			controller = arg_1_1
		})
	end
end

local function var_0_2(arg_2_0, arg_2_1)
	if CONDITIONS.IsThirdGameMode() then
		arg_2_0.ServerBrowser:AnimateSequence("DisplayServerBrowser")
	end

	local var_2_0 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".serverCount"):GetValue(arg_2_1)

	if var_2_0 ~= nil and var_2_0 ~= 0 then
		MP.ValidateAllPlayersPrivateSquadMembers()
		Dvar.DHEGHJJJHI("LLPNKKORPT", false)
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:SubscribeToDataSourceThroughElement(arg_3_0.ServerBrowser.ServerList, nil, function()
		local var_4_0 = arg_3_0.ServerBrowser.ServerList:GetDataSource()
		local var_4_1 = var_4_0.index
		local var_4_2 = var_4_0.type:GetValue(arg_3_1)
		local var_4_3 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_4_2, CSV.gameTypesTable.cols.name)
		local var_4_4 = Engine.CBBHFCGDIC(var_4_3)
		local var_4_5 = MP.GetGameTypeImage(var_4_2)
		local var_4_6 = var_4_0.map:GetValue(arg_3_1)
		local var_4_7 = Lobby.CDAFGHBJCA(arg_3_1, var_4_1, ServerGameIndex.SORT_MAP)
		local var_4_8 = Lobby.EBFJDJEJJE(var_4_7)

		if var_4_8 == nil or #var_4_8 == 0 then
			var_4_8 = Lobby.DefaultMapImage
		end

		arg_3_0.LocalLobbyMap:SetLobbyInfo(var_4_6 or "", var_4_8, var_4_4 or "", var_4_5)
	end)
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0.bindButton = LUI.UIBindButton.new()
	arg_5_0.bindButton.id = "selfBindButton"

	arg_5_0:addElement(arg_5_0.bindButton)
	arg_5_0.bindButton:addEventHandler("button_alt2", function(arg_6_0, arg_6_1)
		local var_6_0 = CONDITIONS.IsThirdGameMode()

		if Engine.BFDACIJIAD(arg_6_1.controller) then
			Lobby.OpenSystemLinkLobby(arg_6_1.controller, not var_6_0, false)
		end
	end)
	arg_5_0.bindButton:addEventHandler("button_alt1", function(arg_7_0, arg_7_1)
		Lobby.JIFFFICJH(arg_5_1)
		ACTIONS.PlaySoundSetSound(arg_5_0, "selectAlt", false)
	end)
	arg_5_0.bindButton:addEventHandler("button_start", function(arg_8_0, arg_8_1)
		ACTIONS.OpenOptionsMenu(arg_8_1.controller)
		ACTIONS.PlaySoundSetSound(arg_5_0, "selectAlt", false)
	end)

	if MLG.AreMLGRulesEnabled() then
		MLG.Hide(arg_5_0)
	end
end

local var_0_5

local function var_0_6(arg_9_0, arg_9_1)
	arg_9_0:Wait(250).onComplete = function()
		return var_0_6(arg_9_0, arg_9_1)
	end

	Lobby.IDFHIHJCF(arg_9_1)
	Lobby.CBHADHEHAH(arg_9_1)
end

local function var_0_7(arg_11_0, arg_11_1, arg_11_2)
	assert(arg_11_0.Darken)
	assert(arg_11_0.ServerBrowser)
	assert(arg_11_0.ServerBrowser.ServerList)
	assert(arg_11_0.RefreshServerListHint)
	assert(arg_11_0.LocalLobbyMap)
	assert(arg_11_0.CreateLocalGamePrompt)
	ACTIONS.ScaleFullscreen(arg_11_0.Darken)
	arg_11_0:setPriority(-1)
	FrontEndScene.HideAllCharacters()
	Engine.DHFCHIIJCA("squad_lobby")
	var_0_4(arg_11_0, arg_11_1)
	Lobby.HEGDIBBCI(arg_11_1)
	Lobby.JIFFFICJH(arg_11_1)
	ACTIONS.AnimateSequence(arg_11_0, "HideMatchInfo")
	ACTIONS.AnimateSequence(arg_11_0.ServerBrowser, "HideScoreboard")
	arg_11_0.RefreshTitle:setText(Engine.CBBHFCGDIC("MENU/REFRESH_LIST", "0"))

	local var_11_0 = LUI.DataSourceInGlobalModel.new(var_0_0 .. ".serverCount")

	arg_11_0:SubscribeToModel(var_11_0:GetModel(arg_11_1), function()
		local var_12_0 = var_11_0:GetValue(arg_11_1)

		if var_12_0 ~= nil then
			if var_12_0 == 0 then
				ACTIONS.AnimateSequence(arg_11_0, "HideMatchInfo")
				ACTIONS.AnimateSequence(arg_11_0.ServerBrowser, "HideScoreboard")
				var_0_1(arg_11_0, arg_11_1, false)
			else
				ACTIONS.AnimateSequence(arg_11_0, "ShowMatchInfo")
				ACTIONS.AnimateSequence(arg_11_0.ServerBrowser, "ShowScoreboard")
				var_0_2(arg_11_0, arg_11_1)
			end

			arg_11_0.RefreshTitle:setText(Engine.CBBHFCGDIC("MENU/REFRESH_LIST", tostring(var_12_0)))
		end
	end)

	local var_11_1 = LUI.DataSourceFromList.new(var_11_0)

	function var_11_1.MakeDataSourceAtIndex(arg_13_0, arg_13_1, arg_13_2)
		local var_13_0 = arg_13_1 % 2 == 0 and COLORS.white or COLORS.black
		local var_13_1 = LUI.DataSourceInGlobalModel.new(var_0_0 .. "." .. arg_13_1 .. ".status"):Filter("status", function(arg_14_0, arg_14_1)
			return arg_14_0 == 1 and Engine.CBBHFCGDIC("MENU/LOBBY") or Engine.CBBHFCGDIC("MENU/IN_GAME")
		end)

		return {
			index = arg_13_1,
			color = var_13_0,
			host = LUI.DataSourceInGlobalModel.new(var_0_0 .. "." .. arg_13_1 .. ".host"),
			map = LUI.DataSourceInGlobalModel.new(var_0_0 .. "." .. arg_13_1 .. ".map"),
			players = LUI.DataSourceInGlobalModel.new(var_0_0 .. "." .. arg_13_1 .. ".players"),
			type = LUI.DataSourceInGlobalModel.new(var_0_0 .. "." .. arg_13_1 .. ".type"),
			status = var_13_1
		}
	end

	arg_11_0.ServerBrowser.ServerList:SetGridDataSource(var_11_1)

	arg_11_0:Wait(250).onComplete = function()
		return var_0_6(arg_11_0, arg_11_1)
	end

	var_0_3(arg_11_0, arg_11_1, var_11_1)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_11_0, "AR")
	end

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_11_0, "JP")
	end

	if CONDITIONS.IsLaunchChunk() then
		Dvar.BDEHAEGHAF("NSQLTTMRMP", "mp_lc_speedball")
		Lobby.OpenSystemLinkLobby(arg_11_1, true, false)
	end

	;(function(arg_16_0)
		if arg_16_0.Backer and arg_16_0.TextureLayer then
			local var_16_0 = LAYOUT.GetTextWidth(arg_16_0.CreateLocalGamePrompt)
			local var_16_1 = 4
			local var_16_2 = var_16_0 + arg_16_0.CreateLocalGamePrompt:GetCurrentAnchorsAndPositions().left + var_16_1

			arg_16_0.Backer:SetRight(var_16_2)
			arg_16_0.TextureLayer:SetRight(var_16_2)
		else
			DebugPrint("WARNING: Cannot update CreateLocalGamePrompt backers without a backer.")
		end
	end)(arg_11_0)
end

function SystemLinkPlayMenu(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_17_0.id = "SystemLinkPlayMenu"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = {
		worldBlur = 1,
		controllerIndex = var_17_1
	}
	local var_17_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_17_4)

	var_17_5.id = "WorldBlur"

	var_17_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, _1080p * 54, 0)
	var_17_0:addElement(var_17_5)

	var_17_0.WorldBlur = var_17_5

	local var_17_6
	local var_17_7 = LUI.UIImage.new()

	var_17_7.id = "Darken"

	var_17_7:SetRGBFromInt(0, 0)
	var_17_7:SetAlpha(0.5, 0)
	var_17_7:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080)
	var_17_0:addElement(var_17_7)

	var_17_0.Darken = var_17_7

	local var_17_8
	local var_17_9 = LUI.UIImage.new()

	var_17_9.id = "Backer"

	var_17_9:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_17_9:SetAlpha(0.3, 0)
	var_17_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 618, _1080p * 190, _1080p * 220)
	var_17_0:addElement(var_17_9)

	var_17_0.Backer = var_17_9

	local var_17_10
	local var_17_11 = LUI.UIImage.new()

	var_17_11.id = "TextureLayer"

	var_17_11:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_17_11:SetAlpha(0.1, 0)
	var_17_11:SetPixelGridEnabled(true)
	var_17_11:SetPixelGridContrast(0.8, 0)
	var_17_11:SetPixelGridBlockWidth(2, 0)
	var_17_11:SetPixelGridBlockHeight(2, 0)
	var_17_11:SetPixelGridGutterWidth(1, 0)
	var_17_11:SetPixelGridGutterHeight(1, 0)
	var_17_11:setImage(RegisterMaterial("ui_default_white"), 0)
	var_17_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 618, _1080p * 190, _1080p * 220)
	var_17_0:addElement(var_17_11)

	var_17_0.TextureLayer = var_17_11

	local var_17_12
	local var_17_13 = MenuBuilder.BuildRegisteredType("ServerBrowser", {
		controllerIndex = var_17_1
	})

	var_17_13.id = "ServerBrowser"

	var_17_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1246, _1080p * 255, _1080p * 951)
	var_17_0:addElement(var_17_13)

	var_17_0.ServerBrowser = var_17_13

	local var_17_14
	local var_17_15 = LUI.UIText.new()

	var_17_15.id = "RefreshServerListHint"

	var_17_15:SetRGBFromTable(SWATCHES.Scoreboard.text, 0)
	var_17_15:setText(Engine.CBBHFCGDIC("MENU/REFRESH_SERVERS_HINT"), 0)
	var_17_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_15:SetAlignment(LUI.Alignment.Left)
	var_17_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 123, _1080p * 1114, _1080p * 307, _1080p * 325)
	var_17_0:addElement(var_17_15)

	var_17_0.RefreshServerListHint = var_17_15

	local var_17_16
	local var_17_17 = LUI.UIImage.new()

	var_17_17.id = "ImageHeaderLine"

	var_17_17:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_17:SetAlpha(0.4, 0)
	var_17_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1364, _1080p * 1824, _1080p * 257, _1080p * 258)
	var_17_0:addElement(var_17_17)

	var_17_0.ImageHeaderLine = var_17_17

	local var_17_18
	local var_17_19 = LUI.UIStyledText.new()

	var_17_19.id = "RefreshTitle"

	var_17_19:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_19:setText(Engine.CBBHFCGDIC("MENU/REFRESH_LIST"), 0)
	var_17_19:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_17_19:SetAlignment(LUI.Alignment.Right)
	var_17_19:SetTintFontIcons(true)
	var_17_19:SetDecodeUseSystemTime(false)
	var_17_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 953, _1080p * 1264, _1080p * 233, _1080p * 251)
	var_17_0:addElement(var_17_19)

	var_17_0.RefreshTitle = var_17_19

	local var_17_20
	local var_17_21 = LUI.UIImage.new()

	var_17_21.id = "ServerListHeaderLine"

	var_17_21:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_21:SetAlpha(0.4, 0)
	var_17_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 1264, _1080p * 257, _1080p * 258)
	var_17_0:addElement(var_17_21)

	var_17_0.ServerListHeaderLine = var_17_21

	local var_17_22
	local var_17_23 = MenuBuilder.BuildRegisteredType("SplitscreenPrompt", {
		controllerIndex = var_17_1
	})

	var_17_23.id = "SplitscreenPrompt"

	var_17_23:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_23.PromptText:SetAlignment(LUI.Alignment.Left)
	var_17_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 522, _1080p * 229, _1080p * 253)
	var_17_0:addElement(var_17_23)

	var_17_0.SplitscreenPrompt = var_17_23

	local var_17_24
	local var_17_25 = MenuBuilder.BuildRegisteredType("LocalLobbyMap", {
		controllerIndex = var_17_1
	})

	var_17_25.id = "LocalLobbyMap"

	var_17_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1364, _1080p * 1824, _1080p * 264, _1080p * 508)
	var_17_0:addElement(var_17_25)

	var_17_0.LocalLobbyMap = var_17_25

	local var_17_26
	local var_17_27 = LUI.UIStyledText.new()

	var_17_27.id = "MatchDetails"

	var_17_27:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_27:setText(Engine.CBBHFCGDIC("MENU/MATCH_DETAILS"), 0)
	var_17_27:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_17_27:SetAlignment(LUI.Alignment.Left)
	var_17_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1364, _1080p * 1559, _1080p * 233, _1080p * 251)
	var_17_0:addElement(var_17_27)

	var_17_0.MatchDetails = var_17_27

	local var_17_28
	local var_17_29 = LUI.UIStyledText.new()

	var_17_29.id = "CreateLocalGamePrompt"

	var_17_29:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_17_29:setText(Engine.CBBHFCGDIC("LUA_MENU/CREATE_LOCAL_GAME"), 0)
	var_17_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_17_29:SetWordWrap(false)
	var_17_29:SetAlignment(LUI.Alignment.Left)
	var_17_29:SetTintFontIcons(true)
	var_17_29:SetDecodeUseSystemTime(false)
	var_17_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 104, _1080p * 458, _1080p * 190, _1080p * 220)
	var_17_0:addElement(var_17_29)

	var_17_0.CreateLocalGamePrompt = var_17_29

	local function var_17_30()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_30

	local var_17_31 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("HideMatchInfo", var_17_31)

	local var_17_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_17:RegisterAnimationSequence("HideMatchInfo", var_17_32)

	local var_17_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_25:RegisterAnimationSequence("HideMatchInfo", var_17_33)

	local var_17_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_27:RegisterAnimationSequence("HideMatchInfo", var_17_34)

	local function var_17_35()
		var_17_15:AnimateSequence("HideMatchInfo")
		var_17_17:AnimateSequence("HideMatchInfo")
		var_17_25:AnimateSequence("HideMatchInfo")
		var_17_27:AnimateSequence("HideMatchInfo")
	end

	var_17_0._sequences.HideMatchInfo = var_17_35

	local var_17_36 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_15:RegisterAnimationSequence("ShowMatchInfo", var_17_36)

	local var_17_37 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_17:RegisterAnimationSequence("ShowMatchInfo", var_17_37)

	local var_17_38 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_25:RegisterAnimationSequence("ShowMatchInfo", var_17_38)

	local var_17_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_17_27:RegisterAnimationSequence("ShowMatchInfo", var_17_39)

	local function var_17_40()
		var_17_15:AnimateSequence("ShowMatchInfo")
		var_17_17:AnimateSequence("ShowMatchInfo")
		var_17_25:AnimateSequence("ShowMatchInfo")
		var_17_27:AnimateSequence("ShowMatchInfo")
	end

	var_17_0._sequences.ShowMatchInfo = var_17_40

	local var_17_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 867
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 177
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 207
		}
	}

	var_17_19:RegisterAnimationSequence("AR", var_17_41)

	local var_17_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 207
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 177
		}
	}

	var_17_27:RegisterAnimationSequence("AR", var_17_42)

	local var_17_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 220
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 190
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 384
		}
	}

	var_17_29:RegisterAnimationSequence("AR", var_17_43)

	local function var_17_44()
		var_17_19:AnimateSequence("AR")
		var_17_27:AnimateSequence("AR")
		var_17_29:AnimateSequence("AR")
	end

	var_17_0._sequences.AR = var_17_44

	local var_17_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 104
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 384
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 192
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 220
		}
	}

	var_17_29:RegisterAnimationSequence("JP", var_17_45)

	local function var_17_46()
		var_17_29:AnimateSequence("JP")
	end

	var_17_0._sequences.JP = var_17_46

	var_0_7(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("SystemLinkPlayMenu", SystemLinkPlayMenu)
LockTable(_M)
