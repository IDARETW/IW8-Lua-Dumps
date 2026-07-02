module(..., package.seeall)

local var_0_0 = "widg_glow_circle_stroke"

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0["Team" .. arg_1_2 .. "Image"]
	local var_1_1 = arg_1_0["Team" .. arg_1_2 .. "Name"]

	assert(var_1_0)
	assert(var_1_1)
	assert(arg_1_0._roundIndex)
	assert(arg_1_0._matchIndex)

	local var_1_2 = Tournament.BCGGEDJHCG(arg_1_0._roundIndex - 1, arg_1_0._matchIndex - 1, arg_1_1 - 1)

	if var_1_2 >= 0 then
		local var_1_3 = MP.GetFactionReference(arg_1_1)
		local var_1_4 = arg_1_2 == 1
		local var_1_5 = MP.GetTeamLogo(arg_1_1, var_1_4 and arg_1_1 or nil, var_1_3, true)

		var_1_0:setImage(RegisterMaterial(var_1_5))

		local var_1_6 = Tournament.DGEFHBHJDJ(var_1_2)

		var_1_1:setText(ToUpperCase(Engine.CBBHFCGDIC(var_1_6)))
		var_1_1:SetAlpha(1)

		arg_1_0._teamSetup[arg_1_1] = true
	else
		var_1_1:SetAlpha(0)
		var_1_0:setImage(RegisterMaterial(var_0_0))
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.RoundTitle)
	assert(arg_2_0.MapName)
	assert(arg_2_0.Team1Image)
	assert(arg_2_0.Team1Name)
	assert(arg_2_0.Team2Image)
	assert(arg_2_0.Team2Name)

	arg_2_0._roundIndex = arg_2_1.roundIndex
	arg_2_0._matchIndex = arg_2_1.matchIndex

	arg_2_0.RoundTitle:setText(Engine.CBBHFCGDIC(TOURNAMENT.GetRoundTitle(arg_2_0._roundIndex)))
	arg_2_0.MapName:setText(Engine.CBBHFCGDIC("TOURNAMENT/PLAYING_ON", TOURNAMENT.GetMapNameForRound(arg_2_0._roundIndex)))

	arg_2_0._previewType = arg_2_1.previewType

	local var_2_0 = Teams.axis
	local var_2_1 = Teams.allies

	if arg_2_0._previewType == TOURNAMENT.PreviewType.LOBBY then
		local var_2_2 = TOURNAMENT.GetMyTeamIndex(arg_2_0._roundIndex, arg_2_0._matchIndex)

		var_2_0 = var_2_2
		var_2_1 = Mirror(var_2_2, Teams.axis, Teams.allies)

		arg_2_0.RoundTitle:SetAlpha(0)
	elseif arg_2_0._previewType == TOURNAMENT.PreviewType.POST_MATCH then
		local var_2_3 = Tournament.BEJEJJBACA(arg_2_0._roundIndex - 1, arg_2_0._matchIndex - 1)
		local var_2_4 = arg_2_0["Team" .. var_2_3 + 1 .. "Winner"]

		assert(var_2_4)
		var_2_4:SetAlpha(1)
	end

	var_0_1(arg_2_0, 1, var_2_0)
	var_0_1(arg_2_0, 2, var_2_1)
end

local function var_0_3(arg_3_0, arg_3_1)
	for iter_3_0 = 1, TOURNAMENT.teamsPerMatch do
		if arg_3_0._previewType == TOURNAMENT.PreviewType.PRE_MATCH then
			if not arg_3_0._teamSetup[iter_3_0] then
				local var_3_0 = iter_3_0 == 1 and Teams.allies or Teams.axis

				var_0_1(arg_3_0, iter_3_0, var_3_0)
			end
		elseif arg_3_0._previewType == TOURNAMENT.PreviewType.IN_PROGRESS then
			assert(arg_3_0["Team" .. iter_3_0 .. "Wins"])
			arg_3_0["Team" .. iter_3_0 .. "Wins"]:setText(Tournament.DCFJHHBECC(arg_3_1.roundIndex - 1, arg_3_1.matchIndex - 1, iter_3_0 - 1))
		end
	end
end

local function var_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.Setup = var_0_2
	arg_4_0.Update = var_0_3
	arg_4_0._teamSetup = {}
	arg_4_0._controllerIndex = arg_4_1

	if IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_4_0, "JP")
	end
end

function TournamentTeamPreview(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 300 * _1080p)

	var_5_0.id = "TournamentTeamPreview"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIStyledText.new()

	var_5_4.id = "RoundTitle"

	var_5_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_4:setText("", 0)
	var_5_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_4:SetAlignment(LUI.Alignment.Center)
	var_5_4:SetShadowMinDistance(-0.2, 0)
	var_5_4:SetShadowMaxDistance(0.2, 0)
	var_5_4:SetShadowUOffset(-0.002, 0)
	var_5_4:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -108, _1080p * 108, _1080p * -14, _1080p * 14)
	var_5_0:addElement(var_5_4)

	var_5_0.RoundTitle = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Team1Backer"

	var_5_6:SetRGBFromInt(0, 0)
	var_5_6:SetAlpha(0.5, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_right_to_left"), 0)
	var_5_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -742, _1080p * -162, _1080p * 50, _1080p * 110)
	var_5_0:addElement(var_5_6)

	var_5_0.Team1Backer = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Team1Name"

	var_5_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_8:setText("EAST", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_8:SetAlignment(LUI.Alignment.Right)
	var_5_8:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -722, _1080p * -252, _1080p * 50, _1080p * 110)
	var_5_0:addElement(var_5_8)

	var_5_0.Team1Name = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "Team1Image"

	var_5_10:setImage(RegisterMaterial("icon_faction_west_large"), 0)
	var_5_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -239, _1080p * -85, _1080p * 3, _1080p * 157)
	var_5_0:addElement(var_5_10)

	var_5_0.Team1Image = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIImage.new()

	var_5_12.id = "Team2Backer"

	var_5_12:SetRGBFromInt(0, 0)
	var_5_12:SetAlpha(0.5, 0)
	var_5_12:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_5_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 162, _1080p * 742, _1080p * 50, _1080p * 110)
	var_5_0:addElement(var_5_12)

	var_5_0.Team2Backer = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIStyledText.new()

	var_5_14.id = "Team2Name"

	var_5_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_14:setText("WEST", 0)
	var_5_14:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_5_14:SetAlignment(LUI.Alignment.Left)
	var_5_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_5_14:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 250, _1080p * 720, _1080p * 50, _1080p * 110)
	var_5_0:addElement(var_5_14)

	var_5_0.Team2Name = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "Team2Image"

	var_5_16:setImage(RegisterMaterial("icon_faction_east_large"), 0)
	var_5_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 85, _1080p * 238, _1080p * 3, _1080p * 158)
	var_5_0:addElement(var_5_16)

	var_5_0.Team2Image = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIStyledText.new()

	var_5_18.id = "Team1Wins"

	var_5_18:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_18:setText("", 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Center)
	var_5_18:SetShadowMinDistance(-0.2, 0)
	var_5_18:SetShadowMaxDistance(0.2, 0)
	var_5_18:SetShadowUOffset(-0.002, 0)
	var_5_18:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_18:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -226, _1080p * -98, _1080p * 165, _1080p * 195)
	var_5_0:addElement(var_5_18)

	var_5_0.Team1Wins = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIStyledText.new()

	var_5_20.id = "Team2Wins"

	var_5_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_20:setText("", 0)
	var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_20:SetAlignment(LUI.Alignment.Center)
	var_5_20:SetShadowMinDistance(-0.2, 0)
	var_5_20:SetShadowMaxDistance(0.2, 0)
	var_5_20:SetShadowUOffset(-0.002, 0)
	var_5_20:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 103, _1080p * 231, _1080p * 165, _1080p * 195)
	var_5_0:addElement(var_5_20)

	var_5_0.Team2Wins = var_5_20

	local var_5_21
	local var_5_22 = LUI.UIStyledText.new()

	var_5_22.id = "Team1Winner"

	var_5_22:SetAlpha(0, 0)
	var_5_22:setText(Engine.CBBHFCGDIC("TOURNAMENT/WINNER"), 0)
	var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_22:SetAlignment(LUI.Alignment.Center)
	var_5_22:SetShadowMinDistance(-0.2, 0)
	var_5_22:SetShadowMaxDistance(0.2, 0)
	var_5_22:SetShadowUOffset(-0.002, 0)
	var_5_22:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -250, _1080p * -34, _1080p * 282, _1080p * 300)
	var_5_0:addElement(var_5_22)

	var_5_0.Team1Winner = var_5_22

	local var_5_23
	local var_5_24 = LUI.UIStyledText.new()

	var_5_24.id = "Team2Winner"

	var_5_24:SetAlpha(0, 0)
	var_5_24:setText(Engine.CBBHFCGDIC("TOURNAMENT/WINNER"), 0)
	var_5_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_24:SetAlignment(LUI.Alignment.Center)
	var_5_24:SetShadowMinDistance(-0.2, 0)
	var_5_24:SetShadowMaxDistance(0.2, 0)
	var_5_24:SetShadowUOffset(-0.002, 0)
	var_5_24:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 54, _1080p * 270, _1080p * 282, _1080p * 300)
	var_5_0:addElement(var_5_24)

	var_5_0.Team2Winner = var_5_24

	local var_5_25
	local var_5_26 = LUI.UIImage.new()

	var_5_26.id = "MapBacker"

	var_5_26:SetRGBFromInt(0, 0)
	var_5_26:SetAlpha(0.5, 0)
	var_5_26:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_5_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -122, _1080p * 122, _1080p * 161, _1080p * 216)
	var_5_0:addElement(var_5_26)

	var_5_0.MapBacker = var_5_26

	local var_5_27
	local var_5_28 = LUI.UIStyledText.new()

	var_5_28.id = "MapName"

	var_5_28:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_28:setText("", 0)
	var_5_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_28:SetAlignment(LUI.Alignment.Center)
	var_5_28:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -96, _1080p * 96, _1080p * 165, _1080p * 189)
	var_5_0:addElement(var_5_28)

	var_5_0.MapName = var_5_28

	local var_5_29
	local var_5_30 = LUI.UIStyledText.new()

	var_5_30.id = "Versus"

	var_5_30:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_5_30:setText(Engine.CBBHFCGDIC("TOURNAMENT/VERSUS"), 0)
	var_5_30:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_30:SetAlignment(LUI.Alignment.Center)
	var_5_30:SetShadowMinDistance(-0.2, 0)
	var_5_30:SetShadowMaxDistance(0.2, 0)
	var_5_30:SetShadowUOffset(-0.002, 0)
	var_5_30:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_5_30:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -90, _1080p * 90, _1080p * 62, _1080p * 98)
	var_5_0:addElement(var_5_30)

	var_5_0.Versus = var_5_30

	local function var_5_31()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_31

	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_5_8:RegisterAnimationSequence("JP", var_5_32)

	local var_5_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 55
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_5_14:RegisterAnimationSequence("JP", var_5_33)

	local function var_5_34()
		var_5_8:AnimateSequence("JP")
		var_5_14:AnimateSequence("JP")
	end

	var_5_0._sequences.JP = var_5_34

	var_0_4(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("TournamentTeamPreview", TournamentTeamPreview)
LockTable(_M)
