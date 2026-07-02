module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	arg_1_2 = tonumber(arg_1_2)

	if arg_1_2 > 0 then
		local var_1_1 = ""

		if CONDITIONS.IsBloodMoney() or CONDITIONS.IsRiskGametype() or CONDITIONS.IsBRKingSlayer() or CONDITIONS.IsWZRatRace() then
			if arg_1_2 and arg_1_2 <= 10 then
				var_1_1 = Engine.CBBHFCGDIC("MENU/BM_SUCCESS", MenuUtils.GetOrdinalPlacment(arg_1_2))
			else
				var_1_1 = Engine.CBBHFCGDIC("MENU/BM_DEFEAT")
			end
		else
			if arg_1_2 and arg_1_2 <= 1 then
				var_1_1 = Engine.CBBHFCGDIC("MENU/BR_SUCCESS")
			else
				var_1_1 = Engine.CBBHFCGDIC("MENU/BR_DEFEAT")
			end

			arg_1_0:DisplayPlacement(arg_1_2)
		end

		var_1_0 = var_1_1
	end

	local var_1_2 = ""

	arg_1_0.FriendlyOutcome:setText(var_1_0 and ToUpperCase(var_1_0) or var_1_2)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = StringTable.BFHCAIIDA(CSV.cashPlacement.file)

	for iter_2_0 = 1, var_2_0 - 2 do
		local var_2_1 = CSV.ReadRowWithFile(CSV.cashPlacement, CSV.cashPlacement.file, iter_2_0)

		if var_2_1 and var_2_1.maxCash and arg_2_1 <= tonumber(var_2_1.maxCash) then
			return var_2_1
		end
	end

	return (CSV.ReadRowWithFile(CSV.cashPlacement, CSV.cashPlacement.file, var_2_0 - 1))
end

local function var_0_2(arg_3_0, arg_3_1)
	arg_3_0._totalCash = arg_3_0._totalCash + arg_3_1

	arg_3_0:DisplayCash()
end

local function var_0_3(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 % 100
	local var_4_1 = arg_4_1 % 10
	local var_4_2 = "MENU/POSITION_FOURTH"

	if var_4_0 < 11 or var_4_0 > 13 then
		if var_4_1 == 1 then
			var_4_2 = "MENU/POSITION_FIRST"
		elseif var_4_1 == 2 then
			var_4_2 = "MENU/POSITION_SECOND"
		elseif var_4_1 == 3 then
			var_4_2 = "MENU/POSITION_THIRD"
		end
	end

	return var_4_2
end

local function var_0_4(arg_5_0)
	local var_5_0 = var_0_1(arg_5_0, arg_5_0._totalCash)

	assert(var_5_0 and #var_5_0 == 0)
	arg_5_0.Header:setText(ToUpperCase(Engine.CBBHFCGDIC(var_5_0.name)))
	arg_5_0.Body:setText(Engine.CBBHFCGDIC("MP/BR_QUANTITY_DOLLAR_PREFIX", arg_5_0._totalCash))
	arg_5_0.Icon:setImage(RegisterMaterial(var_5_0.icon))
	ACTIONS.AnimateSequence(arg_5_0, "ShowCash")
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0 = var_0_3(arg_6_0, arg_6_1)

	arg_6_0.BrEndGamePlayerNumberBox:SetPlayerNumber(arg_6_1, Engine.CBBHFCGDIC(var_6_0))
	ACTIONS.AnimateSequence(arg_6_0, "ShowPlacement")
end

local function var_0_6(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.SetupPlacement = var_0_0
	arg_7_0.SetTotalCash = var_0_2
	arg_7_0.DisplayPlacement = var_0_5
	arg_7_0.DisplayCash = var_0_4
	arg_7_0._totalCash = 0

	ACTIONS.AnimateSequence(arg_7_0, "HidePlacementAndCash")

	if SCOREBOARD.IsAARScoreboard() then
		assert(arg_7_0.MatchTimer)
		assert(arg_7_0.FriendlyOutcome)

		local var_7_0 = DataSources.frontEnd.AAR.gameTime:GetValue(arg_7_1)

		if not var_7_0 or var_7_0 == "" then
			var_7_0 = 1
		end

		arg_7_0.MatchTimer:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_TIME_WITH_TIME", var_7_0))
	end
end

function BRTeamScoreboardExtraInfo(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1124 * _1080p, 0, 92 * _1080p)

	var_8_0.id = "BRTeamScoreboardExtraInfo"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIText.new()

	var_8_4.id = "MatchTimer"

	var_8_4:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_4:setText(Engine.CBBHFCGDIC("MLG_GAMEBATTLES/MATCH_TIME_WITH_TIME"), 0)
	var_8_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_4:SetAlignment(LUI.Alignment.Right)
	var_8_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -357, 0, _1080p * 40, _1080p * 60)
	var_8_0:addElement(var_8_4)

	var_8_0.MatchTimer = var_8_4

	local var_8_5
	local var_8_6 = LUI.UIStyledText.new()

	var_8_6.id = "FriendlyOutcome"

	var_8_6:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_8_6:setText("", 0)
	var_8_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_6:SetAlignment(LUI.Alignment.Left)
	var_8_6:SetShadowMinDistance(-0.2, 0)
	var_8_6:SetShadowMaxDistance(0.2, 0)
	var_8_6:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_8_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 360, 0, _1080p * 36)
	var_8_0:addElement(var_8_6)

	var_8_0.FriendlyOutcome = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("ScoreboardHeaderSubInfo", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "ScoreboardHeaderSubInfo"

	var_8_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 651, _1080p * 40, _1080p * 62)
	var_8_0:addElement(var_8_8)

	var_8_0.ScoreboardHeaderSubInfo = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("BrEndGamePlayerNumberBox", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "BrEndGamePlayerNumberBox"

	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -165, _1080p * 165, _1080p * -359, _1080p * -29)
	var_8_0:addElement(var_8_10)

	var_8_0.BrEndGamePlayerNumberBox = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIStyledText.new()

	var_8_12.id = "Body"

	var_8_12:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_8_12:setText("", 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_12:SetAlignment(LUI.Alignment.Center)
	var_8_12:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -400, _1080p * 400, _1080p * -79, _1080p * -29)
	var_8_0:addElement(var_8_12)

	var_8_0.Body = var_8_12

	local var_8_13
	local var_8_14 = LUI.UIStyledText.new()

	var_8_14.id = "Header"

	var_8_14:SetRGBFromTable(SWATCHES.AAR.XPText, 0)
	var_8_14:setText("", 0)
	var_8_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_8_14:SetAlignment(LUI.Alignment.Center)
	var_8_14:SetShadowRGBFromTable(SWATCHES.splashNotifications.background, 0)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -400, _1080p * 400, _1080p * -149, _1080p * -79)
	var_8_0:addElement(var_8_14)

	var_8_0.Header = var_8_14

	local var_8_15
	local var_8_16 = LUI.UIImage.new()

	var_8_16.id = "Icon"

	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -64, _1080p * 64, _1080p * -294, _1080p * -166)
	var_8_0:addElement(var_8_16)

	var_8_0.Icon = var_8_16

	local function var_8_17()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_17

	local var_8_18
	local var_8_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ShowPlacement", var_8_19)

	local var_8_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ShowPlacement", var_8_20)

	local var_8_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ShowPlacement", var_8_21)

	local var_8_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ShowPlacement", var_8_22)

	local function var_8_23()
		var_8_10:AnimateSequence("ShowPlacement")
		var_8_12:AnimateSequence("ShowPlacement")
		var_8_14:AnimateSequence("ShowPlacement")
		var_8_16:AnimateSequence("ShowPlacement")
	end

	var_8_0._sequences.ShowPlacement = var_8_23

	local var_8_24
	local var_8_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("ShowCash", var_8_25)

	local var_8_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("ShowCash", var_8_26)

	local var_8_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("ShowCash", var_8_27)

	local var_8_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("ShowCash", var_8_28)

	local function var_8_29()
		var_8_10:AnimateSequence("ShowCash")
		var_8_12:AnimateSequence("ShowCash")
		var_8_14:AnimateSequence("ShowCash")
		var_8_16:AnimateSequence("ShowCash")
	end

	var_8_0._sequences.ShowCash = var_8_29

	local var_8_30
	local var_8_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_10:RegisterAnimationSequence("HidePlacementAndCash", var_8_31)

	local var_8_32 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_12:RegisterAnimationSequence("HidePlacementAndCash", var_8_32)

	local var_8_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_14:RegisterAnimationSequence("HidePlacementAndCash", var_8_33)

	local var_8_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_16:RegisterAnimationSequence("HidePlacementAndCash", var_8_34)

	local function var_8_35()
		var_8_10:AnimateSequence("HidePlacementAndCash")
		var_8_12:AnimateSequence("HidePlacementAndCash")
		var_8_14:AnimateSequence("HidePlacementAndCash")
		var_8_16:AnimateSequence("HidePlacementAndCash")
	end

	var_8_0._sequences.HidePlacementAndCash = var_8_35

	var_0_6(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("BRTeamScoreboardExtraInfo", BRTeamScoreboardExtraInfo)
LockTable(_M)
