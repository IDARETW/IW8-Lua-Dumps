module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1)
	assert(arg_1_0.PlayerCount)
	assert(arg_1_0.PartyCount)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	arg_1_0:SubscribeToDataSourceThroughElement(arg_1_0, nil, function()
		local var_2_0 = arg_1_0:GetDataSource()

		if var_2_0 then
			local var_2_1 = var_2_0.minPlayerSize:GetValue(arg_1_1)
			local var_2_2 = var_2_0.maxPlayerSize:GetValue(arg_1_1)

			arg_1_0.PlayerCount:setText(var_2_1 .. " - " .. var_2_2)

			local var_2_3 = var_2_0.minPartySize:GetValue(arg_1_1)
			local var_2_4 = var_2_0.maxPartySize:GetValue(arg_1_1)

			arg_1_0.PartyCount:setText(var_2_3 .. " - " .. var_2_4)
		end
	end)
end

function PlaylistInfo(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 770 * _1080p, 0, 275 * _1080p)

	var_3_0.id = "PlaylistInfo"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "PlaylistIcon"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 165, _1080p * 19, _1080p * 161)

	local function var_3_7()
		local var_4_0 = var_3_0:GetDataSource().image:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_6:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	var_3_6:SubscribeToModelThroughElement(var_3_0, "image", var_3_7)
	var_3_0:addElement(var_3_6)

	var_3_0.PlaylistIcon = var_3_6

	local var_3_8
	local var_3_9 = LUI.UIStyledText.new()

	var_3_9.id = "PlaylistName"

	var_3_9:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_9:SetAlignment(LUI.Alignment.Left)
	var_3_9:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_9:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_9:SetStartupDelay(2000)
	var_3_9:SetLineHoldTime(400)
	var_3_9:SetAnimMoveTime(2000)
	var_3_9:SetAnimMoveSpeed(150)
	var_3_9:SetEndDelay(2000)
	var_3_9:SetCrossfadeTime(1000)
	var_3_9:SetFadeInTime(300)
	var_3_9:SetFadeOutTime(300)
	var_3_9:SetMaxVisibleLines(1)
	var_3_9:SetDecodeLetterLength(20)
	var_3_9:SetDecodeMaxRandChars(6)
	var_3_9:SetDecodeUpdatesPerLetter(4)
	var_3_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 175, _1080p * 756, _1080p * 20, _1080p * 70)

	local function var_3_10()
		local var_5_0 = var_3_0:GetDataSource().name:GetValue(var_3_1)

		if var_5_0 ~= nil then
			var_3_9:setText(ToUpperCase(var_5_0), 0)
		end
	end

	var_3_9:SubscribeToModelThroughElement(var_3_0, "name", var_3_10)
	var_3_0:addElement(var_3_9)

	var_3_0.PlaylistName = var_3_9

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "PlaylistDescription"

	var_3_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_12:SetShadowRGBFromInt(0, 0)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 175, _1080p * -225, _1080p * 70, _1080p * 90)

	local function var_3_13()
		local var_6_0 = var_3_0:GetDataSource().desc:GetValue(var_3_1)

		if var_6_0 ~= nil then
			var_3_12:setText(var_6_0, 0)
		end
	end

	var_3_12:SubscribeToModelThroughElement(var_3_0, "desc", var_3_13)
	var_3_0:addElement(var_3_12)

	var_3_0.PlaylistDescription = var_3_12

	local var_3_14
	local var_3_15 = LUI.UIText.new()

	var_3_15.id = "Players"

	var_3_15:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_15:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PLAYERS"), 0)
	var_3_15:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_15:SetAlignment(LUI.Alignment.Left)
	var_3_15:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 254, _1080p * 192, _1080p * 216)
	var_3_0:addElement(var_3_15)

	var_3_0.Players = var_3_15

	local var_3_16
	local var_3_17 = LUI.UIText.new()

	var_3_17.id = "PartySize"

	var_3_17:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_17:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PARTYSIZE"), 0)
	var_3_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_17:SetAlignment(LUI.Alignment.Left)
	var_3_17:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_17:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 341, _1080p * -236, _1080p * 192, _1080p * 216)
	var_3_0:addElement(var_3_17)

	var_3_0.PartySize = var_3_17

	local var_3_18
	local var_3_19 = LUI.UIStyledText.new()

	var_3_19.id = "PartyCount"

	var_3_19:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_19:setText("", 0)
	var_3_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_19:SetAlignment(LUI.Alignment.Left)
	var_3_19:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_19:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 341, _1080p * -249, _1080p * 216, _1080p * 240)
	var_3_0:addElement(var_3_19)

	var_3_0.PartyCount = var_3_19

	local var_3_20
	local var_3_21 = LUI.UIStyledText.new()

	var_3_21.id = "PlayerCount"

	var_3_21:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_21:setText("", 0)
	var_3_21:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_21:SetAlignment(LUI.Alignment.Left)
	var_3_21:SetOptOutRightToLeftAlignmentFlip(true)
	var_3_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 254, _1080p * 216, _1080p * 240)
	var_3_0:addElement(var_3_21)

	var_3_0.PlayerCount = var_3_21

	local var_3_22
	local var_3_23 = LUI.UIImage.new()

	var_3_23.id = "TeamIcon"

	var_3_23:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_23:setImage(RegisterMaterial("icon_playlist_team"), 0)
	var_3_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 273, _1080p * 335, _1080p * 185, _1080p * 247)
	var_3_0:addElement(var_3_23)

	var_3_0.TeamIcon = var_3_23

	local var_3_24
	local var_3_25 = LUI.UIImage.new()

	var_3_25.id = "PlayersIcon"

	var_3_25:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_25:setImage(RegisterMaterial("icon_playlist_players"), 0)
	var_3_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 23, _1080p * 85, _1080p * 185, _1080p * 247)
	var_3_0:addElement(var_3_25)

	var_3_0.PlayersIcon = var_3_25

	local function var_3_26()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_26

	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 81
		}
	}

	var_3_9:RegisterAnimationSequence("AR", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 81
		}
	}

	var_3_12:RegisterAnimationSequence("AR", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 220
		}
	}

	var_3_15:RegisterAnimationSequence("AR", var_3_29)

	local var_3_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 220
		}
	}

	var_3_17:RegisterAnimationSequence("AR", var_3_30)

	local var_3_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 220
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 248
		}
	}

	var_3_19:RegisterAnimationSequence("AR", var_3_31)

	local var_3_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 220
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 248
		}
	}

	var_3_21:RegisterAnimationSequence("AR", var_3_32)

	local function var_3_33()
		var_3_9:AnimateSequence("AR")
		var_3_12:AnimateSequence("AR")
		var_3_15:AnimateSequence("AR")
		var_3_17:AnimateSequence("AR")
		var_3_19:AnimateSequence("AR")
		var_3_21:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_33

	PostLoadFunc(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PlaylistInfo", PlaylistInfo)
LockTable(_M)
