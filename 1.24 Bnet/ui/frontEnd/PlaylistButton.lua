module(..., package.seeall)

local function var_0_0(arg_1_0)
	local var_1_0 = {
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon1
		},
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon2
		},
		{
			isUsed = false,
			icon = arg_1_0.ModifierIcon3
		}
	}

	local function var_1_1()
		for iter_2_0 = 1, #var_1_0 do
			if not var_1_0[iter_2_0].isUsed then
				var_1_0[iter_2_0].isUsed = true

				local var_2_0 = var_1_0[iter_2_0].icon

				var_2_0:SetAlpha(1)

				return var_2_0
			end
		end
	end

	local function var_1_2(arg_3_0, arg_3_1)
		if arg_3_0:GetValue(controllerIndex) > 1 then
			var_1_1():setImage(RegisterMaterial(arg_3_1))
		end
	end

	if arg_1_0:GetDataSource() then
		var_1_2(arg_1_0:GetDataSource().xpScale, "icon_double_xp")
		var_1_2(arg_1_0:GetDataSource().weaponXpScale, "icon_double_weapon_xp")
		var_1_2(arg_1_0:GetDataSource().battlePassXpScale, "icon_double_battle_xp")
	end
end

local var_0_1 = {
	LOCKED_NO_FILTERS_SET = 6,
	LOCKED_MAXPARTY = 3,
	LOCKED_MINPARTY = 4,
	DEDI_REQUIRED = 5,
	UNLOCKED = 0,
	LOCKED_DLC_PARTY = 2,
	LOCKED_DLC_LOCAL = 1
}
local var_0_2 = 200

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:SetAlpha(1)

	if arg_4_2 == var_0_2 then
		return
	end

	local var_4_0, var_4_1 = Playlist.CGJBAEBBG(arg_4_1, arg_4_2)

	if var_4_0 == true and var_4_1 == false then
		arg_4_0:SetAlpha(0.25)
	end
end

local function var_0_4(arg_5_0)
	return function(arg_6_0, arg_6_1)
		assert(arg_5_0.Button)

		local var_6_0 = arg_5_0:GetDataSource()
		local var_6_1 = var_6_0.playlistIndex:GetValue(arg_6_1.controller)
		local var_6_2 = var_6_0.categoryIndex:GetValue(arg_6_1.controller)
		local var_6_3 = Playlist.DCFCIFABGH(var_6_2, var_6_1)

		if var_6_3 == var_0_1.LOCKED_DLC_LOCAL then
			STORE.GoToStore(arg_6_1.controller, arg_5_0:GetCurrentMenu().id, arg_5_0.id, "vip")

			return
		end

		if var_6_3 ~= var_0_1.UNLOCKED then
			arg_5_0.Button:SetButtonDisabled(true)

			return
		end

		local var_6_4, var_6_5 = Playlist.CGJBAEBBG(var_6_2, var_6_1)

		if var_6_4 == true and var_6_1 ~= var_0_2 then
			Playlist.CBHGDIGEI(var_6_2, var_6_1)
			var_0_3(arg_5_0.Button, var_6_2, var_6_1)

			return
		end

		local var_6_6 = Playlist.CHFFDAHDIB(var_6_2, var_6_1)
		local var_6_7 = LUI.FlowManager.GetScopedData(arg_5_0)
		local var_6_8 = Friends.BJDEIGDDCD()
		local var_6_9 = var_6_8 and #var_6_8 > 1

		if Lobby.BCJAAJAHDD() and var_6_6 and #var_6_6 > 0 and CP.HasSeenCinematic(arg_6_1.controller, var_6_6) == 0 and not var_6_9 then
			CP.SetHasSeenIntroVideo(arg_6_1.controller, var_6_6)
			CP.PlayIntroVideo(arg_6_1.controller, var_6_6)
		else
			local function var_6_10()
				if Playlist.CDBBECIGIG(var_6_2, var_6_1) then
					MissionUtils.SetCurrentPlaylist(var_6_2, var_6_1)
					Engine.DAGFFDGFII("uploadstats", arg_6_1.controller)

					if Engine.EAIICIFIFA() then
						local var_7_0 = var_6_0.numRounds:GetValue(arg_6_1.controller)
						local var_7_1 = var_6_0.timeLimit:GetValue(arg_6_1.controller)

						LUI.FlowManager.RequestAddMenu("CPPublicMatchMenu", false, arg_6_1.controller, false, {
							openFromPlaylist = true,
							relics = var_7_0,
							difficulty = var_7_1
						})
					elseif Engine.HEEFCICJE() then
						LUI.FlowManager.RequestAddMenu("BRPublicLobby", false, arg_6_1.controller, false, {
							openFromPlaylist = true
						})
					else
						LUI.FlowManager.RequestAddMenu("MPPublicLobby", false, arg_6_1.controller, false, {
							openFromPlaylist = true
						})
					end
				end
			end

			Lobby.TryNavigateToLobby(var_6_10)
		end
	end
end

local function var_0_5(arg_8_0, arg_8_1, arg_8_2)
	assert(arg_8_0.Button)
	arg_8_0.Button:addEventHandler("button_action", var_0_4(arg_8_0))

	local function var_8_0(arg_9_0, arg_9_1)
		if Engine.EAIICIFIFA() then
			local var_9_0 = arg_8_0:GetDataSource()

			assert(var_9_0)

			local var_9_1 = var_9_0.playlistIndex:GetValue()

			assert(var_9_1)
			Engine.EBHIFJCGBH("map_select", var_9_1)
		end

		if Engine.HEEFCICJE() then
			local var_9_2 = arg_8_0:GetDataSource()

			assert(var_9_2)
			arg_9_0:dispatchEventToRoot({
				name = "playlist_button_over",
				dataSource = var_9_2,
				controller = arg_9_1.controller
			})
		end
	end

	arg_8_0.Button:addEventHandler("button_over", var_8_0)
	arg_8_0.Button:addEventHandler("button_over_disable", var_8_0)

	local function var_8_1(arg_10_0)
		local var_10_0 = arg_10_0:GetDataSource()

		if var_10_0 then
			local var_10_1 = var_10_0.playlistIndex:GetValue(arg_8_1)
			local var_10_2 = var_10_0.categoryIndex:GetValue(arg_8_1)
			local var_10_3 = Playlist.DCFCIFABGH(var_10_2, var_10_1)
			local var_10_4 = var_10_3 == var_0_1.UNLOCKED
			local var_10_5 = var_10_3 == var_0_1.LOCKED_DLC_LOCAL

			if CONDITIONS.IsThirdGameMode() then
				local var_10_6 = var_10_0.timeLimit:GetValue(arg_8_1)

				if var_10_6 == 101 then
					var_10_4 = CP.IsRaidPlaylistUnlocked(var_10_6, arg_8_1)
				end
			end

			local var_10_7 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

			var_10_4 = var_10_4 and not var_10_7

			local var_10_8 = not var_10_4 and not var_10_5

			arg_10_0.Button:SetButtonDisabled(var_10_8)
			var_0_3(arg_10_0.Button, var_10_2, var_10_1)

			if var_10_3 == var_0_1.UNLOCKED then
				arg_10_0.Button:SetButtonDescription("")
			elseif var_10_3 == var_0_1.LOCKED_DLC_LOCAL then
				arg_10_0.Button:SetButtonDescription(Engine.CBBHFCGDIC("DLC/PLAYLIST_MISSING_MAP_PACK"))
			elseif var_10_3 == var_0_1.LOCKED_DLC_PARTY then
				arg_10_0.Button:SetButtonDescription(Engine.CBBHFCGDIC("DLC/NOTEVERYONEHASREQUIREDDLC"))
			elseif var_10_3 == var_0_1.LOCKED_MAXPARTY then
				local var_10_9 = var_10_0.maxPartySize:GetValue(arg_8_1)

				arg_10_0.Button:SetButtonDescription(Engine.CBBHFCGDIC("MPUI/MAXPARTYSIZE", var_10_9))
			elseif var_10_3 == var_0_1.LOCKED_MINPARTY then
				local var_10_10 = var_10_0.minPartySize:GetValue(arg_8_1)

				arg_10_0.Button:SetButtonDescription(Engine.CBBHFCGDIC("MPUI/MINPARTYSIZE", var_10_10))
			elseif var_10_3 == var_0_1.LOCKED_NO_FILTERS_SET then
				arg_10_0.Button:SetButtonDescription("No filters set!")
			end

			if var_10_0.isNew then
				local var_10_11 = var_10_0.isNew:GetValue(arg_8_1)

				if var_10_11 and not var_10_8 then
					arg_8_0.NewItemNotification:SetAlpha(var_10_11)
				end
			end

			if var_10_0.isLimitedTime then
				local var_10_12 = var_10_0.isLimitedTime:GetValue(arg_8_1)
				local var_10_13

				var_10_13 = var_10_12 and not var_10_8

				arg_8_0.LimitedTimeIcon:SetAlpha(var_10_12 and 0.6 or 0)
			end
		end
	end

	local var_8_2

	local function var_8_3(arg_11_0)
		var_8_1(arg_11_0)

		arg_11_0:Wait(1000).onComplete = var_8_3
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_8_0, "AR")
	end

	var_8_3(arg_8_0)
	arg_8_0:SubscribeToDataSourceThroughElement(arg_8_0, nil, function()
		var_8_1(arg_8_0)
	end)

	local function var_8_4()
		local var_13_0 = Lobby.GFFECBCCF() and not Lobby.BGIADHIHAG()

		arg_8_0.Button:SetButtonDisabled(var_13_0)
	end

	local var_8_5 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_8_6 = DataSources.frontEnd.lobby.memberCount

	arg_8_0:SubscribeToModel(var_8_5:GetModel(arg_8_1), var_8_4, true)
	arg_8_0:SubscribeToModel(var_8_6:GetModel(arg_8_1), var_8_4, true)
	arg_8_0:addEventHandler("update_publisher_variables", var_8_4)
	var_8_4()
	arg_8_0:SubscribeToModelThroughElement(arg_8_0, "xpScale", function()
		var_0_0(arg_8_0)
	end)
	arg_8_0:SubscribeToModelThroughElement(arg_8_0, "weaponXpScale", function()
		var_0_0(arg_8_0)
	end)
	arg_8_0:SubscribeToModelThroughElement(arg_8_0, "battlePassXpScale", function()
		var_0_0(arg_8_0)
	end)
end

function PlaylistButton(arg_17_0, arg_17_1)
	local var_17_0 = LUI.UIElement.new()

	var_17_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 40 * _1080p)

	var_17_0.id = "PlaylistButton"
	var_17_0._animationSets = var_17_0._animationSets or {}
	var_17_0._sequences = var_17_0._sequences or {}

	local var_17_1 = arg_17_1 and arg_17_1.controllerIndex

	if not var_17_1 and not Engine.DDJFBBJAIG() then
		var_17_1 = var_17_0:getRootController()
	end

	assert(var_17_1)

	local var_17_2 = var_17_0
	local var_17_3
	local var_17_4 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_17_1
	})

	var_17_4.id = "Button"

	var_17_4.Text:SetLeft(_1080p * 20, 0)
	var_17_4.Text:SetAlignment(LUI.Alignment.Left)
	var_17_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)

	local function var_17_5()
		local var_18_0 = var_17_0:GetDataSource().name:GetValue(var_17_1)

		if var_18_0 ~= nil then
			var_17_4.Text:setText(ToUpperCase(var_18_0), 0)
		end
	end

	var_17_4:SubscribeToModelThroughElement(var_17_0, "name", var_17_5)
	var_17_0:addElement(var_17_4)

	var_17_0.Button = var_17_4

	local var_17_6
	local var_17_7 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_17_1
	})

	var_17_7.id = "NewItemNotification"

	var_17_7:SetAlpha(0, 0)
	var_17_7:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -19, _1080p * -11, _1080p * -4, _1080p * 4)
	var_17_0:addElement(var_17_7)

	var_17_0.NewItemNotification = var_17_7

	local var_17_8
	local var_17_9 = LUI.UIImage.new()

	var_17_9.id = "LimitedTimeIcon"

	var_17_9:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_17_9:SetAlpha(0, 0)
	var_17_9:setImage(RegisterMaterial("hud_icon_overtime"), 0)
	var_17_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 367, _1080p * 391, _1080p * -12, _1080p * 12)
	var_17_0:addElement(var_17_9)

	var_17_0.LimitedTimeIcon = var_17_9

	local var_17_10
	local var_17_11 = LUI.UIImage.new()

	var_17_11.id = "ModifierIcon1"

	var_17_11:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_17_11:SetAlpha(0, 0)
	var_17_11:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_17_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 338, _1080p * 363, _1080p * 8, _1080p * 32)
	var_17_0:addElement(var_17_11)

	var_17_0.ModifierIcon1 = var_17_11

	local var_17_12
	local var_17_13 = LUI.UIImage.new()

	var_17_13.id = "ModifierIcon2"

	var_17_13:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_17_13:SetAlpha(0, 0)
	var_17_13:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_17_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 308, _1080p * 333, _1080p * 8, _1080p * 32)
	var_17_0:addElement(var_17_13)

	var_17_0.ModifierIcon2 = var_17_13

	local var_17_14
	local var_17_15 = LUI.UIImage.new()

	var_17_15.id = "ModifierIcon3"

	var_17_15:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_17_15:SetAlpha(0, 0)
	var_17_15:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_17_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 279, _1080p * 304, _1080p * 8, _1080p * 32)
	var_17_0:addElement(var_17_15)

	var_17_0.ModifierIcon3 = var_17_15

	local function var_17_16()
		return
	end

	var_17_0._sequences.DefaultSequence = var_17_16

	local var_17_17
	local var_17_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -410
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -402
		}
	}

	var_17_7:RegisterAnimationSequence("AR", var_17_18)

	local var_17_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 50
		}
	}

	var_17_9:RegisterAnimationSequence("AR", var_17_19)

	local var_17_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 54
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 79
		}
	}

	var_17_11:RegisterAnimationSequence("AR", var_17_20)

	local var_17_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 83
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 108
		}
	}

	var_17_13:RegisterAnimationSequence("AR", var_17_21)

	local var_17_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 137
		}
	}

	var_17_15:RegisterAnimationSequence("AR", var_17_22)

	local function var_17_23()
		var_17_7:AnimateSequence("AR")
		var_17_9:AnimateSequence("AR")
		var_17_11:AnimateSequence("AR")
		var_17_13:AnimateSequence("AR")
		var_17_15:AnimateSequence("AR")
	end

	var_17_0._sequences.AR = var_17_23

	var_0_5(var_17_0, var_17_1, arg_17_1)

	return var_17_0
end

MenuBuilder.registerType("PlaylistButton", PlaylistButton)
LockTable(_M)
