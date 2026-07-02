module(..., package.seeall)

local var_0_0 = 412 * _1080p

local function var_0_1(arg_1_0, arg_1_1)
	arg_1_0.DifficultyValue:setText("")
	arg_1_0.CollateralValue:setText("")
	arg_1_0.RewardValue:setText("")

	local function var_1_0(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
		arg_2_1:setText(Engine.CBBHFCGDIC(arg_2_2))

		local var_2_0 = LAYOUT.GetTextWidth(arg_2_1)
		local var_2_1 = arg_2_1:GetCurrentAnchorsAndPositions()
		local var_2_2 = 18 * _1080p

		arg_2_3:SetLeft(var_2_1.left + var_2_0 + var_2_2)

		local function var_2_3(arg_3_0)
			if IsLanguageArabic() then
				local var_3_0 = arg_2_0.Background:GetCurrentAnchorsAndPositions()
				local var_3_1 = 9 * _1080p
				local var_3_2 = var_3_0.left + var_3_1
				local var_3_3 = LAYOUT.GetTextWidth(arg_3_0)
				local var_3_4 = LAYOUT.GetTextWidth(arg_2_3)

				arg_2_3:SetLeft(var_3_2)
				arg_2_3:SetRight(var_3_2 + var_3_4)
				arg_3_0:SetLeft(var_3_2 + var_3_4 + var_2_2)
				arg_3_0:SetRight(var_3_2 + var_3_4 + var_2_2 + var_3_3)
			end
		end

		local function var_2_4(arg_4_0)
			local var_4_0
			local var_4_1 = ""

			if arg_1_1.missionState == "complete" and arg_4_0 == arg_2_0.DifficultyTxt then
				var_4_1 = Engine.CBBHFCGDIC(arg_2_4)
				var_4_0 = "BlinkDifficulty"
			elseif arg_1_1.missionState == "complete" and arg_4_0 == arg_2_0.CollateralTxt then
				var_4_1 = Engine.CBBHFCGDIC(arg_2_4)
				var_4_0 = "BlinkCollateral"
			end

			if arg_4_0 == arg_2_0.RewardTxt then
				var_4_0 = "BlinkReward"
				var_4_1 = arg_2_4
			end

			arg_2_3:setText(var_4_1)
			var_2_3(arg_4_0)
			ACTIONS.AnimateSequence(arg_2_0, var_4_0)
		end

		if arg_2_1 == arg_2_0.DifficultyTxt then
			arg_2_0._difficultyDelay = arg_2_0.DifficultyValue:Wait(arg_2_1:GetDecodeEffectTimeLength(), true)

			function arg_2_0._difficultyDelay.onComplete()
				var_2_4(arg_2_1)
			end
		elseif arg_2_1 == arg_2_0.CollateralTxt then
			arg_2_0._collateralDelay = arg_2_0.CollateralValue:Wait(arg_2_1:GetDecodeEffectTimeLength(), true)

			function arg_2_0._collateralDelay.onComplete()
				var_2_4(arg_2_1)
			end
		elseif arg_2_1 == arg_2_0.RewardTxt then
			arg_2_0._rewardDelay = arg_2_0.RewardValue:Wait(arg_2_1:GetDecodeEffectTimeLength(), true)

			function arg_2_0._rewardDelay.onComplete()
				var_2_4(arg_2_1)
			end
		end
	end

	local var_1_1 = 8 * _1080p
	local var_1_2 = IsLanguageChinese and var_1_1 or var_1_1 / 2

	arg_1_0.Location:setText(arg_1_1.locationText)

	local var_1_3 = arg_1_0.LocationBorder:GetCurrentAnchorsAndPositions()
	local var_1_4 = LAYOUT.GetTextWidth(arg_1_0.Location)

	arg_1_0.LocationBorder:SetRight(var_1_3.left + var_1_4 + var_1_2)

	local var_1_5 = arg_1_0.CoordinatesBorder:GetCurrentAnchorsAndPositions()

	arg_1_0.Coordinates:setText(arg_1_1.latitude .. ", " .. arg_1_1.longitude)

	local var_1_6 = LAYOUT.GetTextWidth(arg_1_0.Coordinates)

	arg_1_0.CoordinatesBorder:SetRight(var_1_5.left + var_1_6 + (IsLanguageChinese() and 0 or var_1_1))
	arg_1_0.Name:setText(ToUpperCase(arg_1_1.displayName))

	if arg_1_1.missionState == "complete" then
		if arg_1_1.isCurrentMission then
			ACTIONS.AnimateSequence(arg_1_0, "CompletedCurrent")
			ACTIONS.AnimateSequence(arg_1_0.EquippedWidget, "TurnOn")
		else
			ACTIONS.AnimateSequence(arg_1_0, "Completed")
		end

		arg_1_0.Statistics:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/STATISTICS")))
		var_1_0(arg_1_0, arg_1_0.DifficultyTxt, "MENU_SP/HIGHEST_DIFFICULTY", arg_1_0.DifficultyValue, arg_1_1.difficultyRank)
		var_1_0(arg_1_0, arg_1_0.CollateralTxt, "MENU_SP/COLLATERAL_RANK", arg_1_0.CollateralValue, arg_1_1.collateralRank)
	elseif arg_1_1.isCurrentMission then
		ACTIONS.AnimateSequence(arg_1_0, "IncompleteCurrent")
		ACTIONS.AnimateSequence(arg_1_0.EquippedWidget, "TurnOn")
	else
		ACTIONS.AnimateSequence(arg_1_0, "Incomplete")
	end

	local var_1_7 = tonumber(StringTable.DIFCHIGDFB(CSV.spRewardIDs.file, CSV.spRewardIDs.cols.index, arg_1_1.levelIndex, CSV.spRewardIDs.cols.baseID))
	local var_1_8 = tonumber(StringTable.DIFCHIGDFB(CSV.spRewardIDs.file, CSV.spRewardIDs.cols.index, arg_1_1.levelIndex, CSV.spRewardIDs.cols.rewardID))
	local var_1_9 = LOOT.GetTypeForID(var_1_8)
	local var_1_10 = LOOT.GetItemRef(var_1_9, var_1_8, options)
	local var_1_11 = var_1_9 == LOOT.itemTypes.OPERATOR and Engine.CBBHFCGDIC("MENU_SP/OPERATOR_REWARD", LOOT.GetItemName(var_1_9, var_1_10)) or LOOT.GetItemName(var_1_9, var_1_10)
	local var_1_12 = Loot.DEBEIFJEEG(arg_1_0._controllerIndex, var_1_7)

	if CONDITIONS.IsUserSignedInDemonware(arg_1_0._controllerIndex) then
		local var_1_13 = Engine.CBBHFCGDIC(var_1_12 == 1 and "MENU_SP/REWARD_COMPLETE" or "MENU_SP/REWARD_INCOMPLETE", var_1_11)

		var_1_0(arg_1_0, arg_1_0.RewardTxt, "MENU_SP/REWARD_TITLE", arg_1_0.RewardValue, var_1_13)
	else
		arg_1_0.RewardTxt:setText(Engine.CBBHFCGDIC("MENU_SP/REWARD_OFFLINE"))
		arg_1_0.RewardValue:setText("")
	end

	;(function(arg_8_0)
		local var_8_0 = arg_8_0.Background:GetCurrentAnchorsAndPositions()
		local var_8_1 = arg_8_0.BackgroundGradient:GetCurrentAnchorsAndPositions()
		local var_8_2 = arg_8_0.Name:GetCurrentAnchorsAndPositions()
		local var_8_3 = arg_8_0.Border:GetCurrentAnchorsAndPositions()
		local var_8_4 = arg_8_0.BorderHeader:GetCurrentAnchorsAndPositions()
		local var_8_5 = 9 * _1080p
		local var_8_6 = (IsLanguageJapanese() and 20 or 16) * _1080p
		local var_8_7 = LAYOUT.GetTextWidth(arg_8_0.Name) + var_8_6

		if var_8_7 < var_0_0 then
			var_8_7 = var_0_0
		end

		arg_8_0.Background:SetRight(var_8_0.left + var_8_7 + var_8_5)
		arg_8_0.BackgroundGradient:SetRight(var_8_1.left + var_8_7 + var_8_5)
		arg_8_0.Name:SetRight(var_8_2.left + var_8_7)
		arg_8_0.Border:SetRight(var_8_3.left + var_8_7 + var_8_5)
		arg_8_0.BorderHeader:SetRight(var_8_4.left + var_8_7 + var_8_5)
	end)(arg_1_0)
	arg_1_0.Background:SetAlpha(0)
	arg_1_0.Background:SetAlpha(0.6, 200, LUI.EASING.outQuadratic)
end

local function var_0_2(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.UpdateContent = var_0_1
	arg_9_0._difficultyDelay = nil
	arg_9_0._collateralDelay = nil
	arg_9_0._rewardDelay = nil
	arg_9_0._controllerIndex = arg_9_1

	arg_9_0.EquippedWidget:InitializeText(Engine.CBBHFCGDIC("MENU_SP/CURRENT_MISSION"))
end

function LevelSelectNodeDetails(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 12 * _1080p, 0, 12 * _1080p)

	var_10_0.id = "LevelSelectNodeDetails"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Background"

	var_10_4:SetRGBFromInt(855309, 0)
	var_10_4:SetAlpha(0.04, 0)
	var_10_4:setImage(RegisterMaterial("ui_default_white"), 0)
	var_10_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 71, _1080p * 503, _1080p * -80, _1080p * 109)
	var_10_0:addElement(var_10_4)

	var_10_0.Background = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "BackgroundGradient"

	var_10_6:SetRGBFromInt(855309, 0)
	var_10_6:SetAlpha(0.5, 0)
	var_10_6:setImage(RegisterMaterial("gradient_top"), 0)
	var_10_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 71, _1080p * 503, _1080p * -80, _1080p * 109)
	var_10_0:addElement(var_10_6)

	var_10_0.BackgroundGradient = var_10_6

	local var_10_7
	local var_10_8 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	}
	local var_10_9 = LUI.UIBorder.new(var_10_8)

	var_10_9.id = "Border"

	var_10_9:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_10_9:SetAlpha(0.3, 0)
	var_10_9:SetBorderThicknessTop(_1080p * 0, 0)
	var_10_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 71, _1080p * 503, _1080p * -80, _1080p * 109)
	var_10_0:addElement(var_10_9)

	var_10_0.Border = var_10_9

	local var_10_10
	local var_10_11 = LUI.UIImage.new()

	var_10_11.id = "BorderHeader"

	var_10_11:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_10_11:SetAlpha(0.8, 0)
	var_10_11:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 71, _1080p * 503, _1080p * -88, _1080p * -80)
	var_10_0:addElement(var_10_11)

	var_10_0.BorderHeader = var_10_11

	local var_10_12
	local var_10_13 = LUI.UIImage.new()

	var_10_13.id = "LocationBorder"

	var_10_13:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_10_13:SetAlpha(0.3, 0)
	var_10_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 406, _1080p * -69, _1080p * -49)
	var_10_0:addElement(var_10_13)

	var_10_0.LocationBorder = var_10_13

	local var_10_14
	local var_10_15 = LUI.UIStyledText.new()

	var_10_15.id = "Location"

	var_10_15:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_10_15:setText("03: LONDON, UK", 0)
	var_10_15:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_15:SetWordWrap(false)
	var_10_15:SetAlignment(LUI.Alignment.Left)
	var_10_15:SetDecodeLetterLength(24)
	var_10_15:SetDecodeMaxRandChars(12)
	var_10_15:SetDecodeUpdatesPerLetter(4)
	var_10_15:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 87, _1080p * 401, _1080p * -69, _1080p * -49)
	var_10_0:addElement(var_10_15)

	var_10_0.Location = var_10_15

	local var_10_16
	local var_10_17 = LUI.UIStyledText.new()

	var_10_17.id = "Name"

	var_10_17:SetRGBFromInt(10853781, 0)
	var_10_17:setText("COLD OPEN", 0)
	var_10_17:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_17:SetWordWrap(false)
	var_10_17:SetAlignment(LUI.Alignment.Left)
	var_10_17:SetDecodeLetterLength(24)
	var_10_17:SetDecodeMaxRandChars(12)
	var_10_17:SetDecodeUpdatesPerLetter(4)
	var_10_17:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 80, _1080p * 498, _1080p * -45, _1080p * 12)
	var_10_0:addElement(var_10_17)

	var_10_0.Name = var_10_17

	local var_10_18
	local var_10_19 = LUI.UIImage.new()

	var_10_19.id = "CoordinatesBorder"

	var_10_19:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_10_19:SetAlpha(0.15, 0)
	var_10_19:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 406, _1080p * 12, _1080p * 30)
	var_10_0:addElement(var_10_19)

	var_10_0.CoordinatesBorder = var_10_19

	local var_10_20
	local var_10_21 = LUI.UIStyledText.new()

	var_10_21.id = "Coordinates"

	var_10_21:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_10_21:SetAlpha(0.5, 0)
	var_10_21:setText("35.88018, -143.94252", 0)
	var_10_21:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_21:SetWordWrap(false)
	var_10_21:SetAlignment(LUI.Alignment.Left)
	var_10_21:SetDecodeLetterLength(24)
	var_10_21:SetDecodeMaxRandChars(12)
	var_10_21:SetDecodeUpdatesPerLetter(4)
	var_10_21:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 87, _1080p * 300, _1080p * 12, _1080p * 30)
	var_10_0:addElement(var_10_21)

	var_10_0.Coordinates = var_10_21

	local var_10_22
	local var_10_23 = LUI.UIStyledText.new()

	var_10_23.id = "Statistics"

	var_10_23:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_10_23:setText("STATISTICS", 0)
	var_10_23:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_23:SetWordWrap(false)
	var_10_23:SetAlignment(LUI.Alignment.Left)
	var_10_23:SetDecodeLetterLength(24)
	var_10_23:SetDecodeMaxRandChars(12)
	var_10_23:SetDecodeUpdatesPerLetter(4)
	var_10_23:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 444, _1080p * 42, _1080p * 60)
	var_10_0:addElement(var_10_23)

	var_10_0.Statistics = var_10_23

	local var_10_24
	local var_10_25 = LUI.UIStyledText.new()

	var_10_25.id = "DifficultyTxt"

	var_10_25:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_10_25:setText("Highest Difficulty Achievement:", 0)
	var_10_25:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_25:SetWordWrap(false)
	var_10_25:SetAlignment(LUI.Alignment.Left)
	var_10_25:SetDecodeLetterLength(24)
	var_10_25:SetDecodeMaxRandChars(12)
	var_10_25:SetDecodeUpdatesPerLetter(4)
	var_10_25:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 365, _1080p * 60, _1080p * 78)
	var_10_0:addElement(var_10_25)

	var_10_0.DifficultyTxt = var_10_25

	local var_10_26
	local var_10_27 = LUI.UIStyledText.new()

	var_10_27.id = "DifficultyValue"

	var_10_27:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_27:setText("EASY", 0)
	var_10_27:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_27:SetWordWrap(false)
	var_10_27:SetAlignment(LUI.Alignment.Left)
	var_10_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 298, _1080p * 485, _1080p * 60, _1080p * 78)
	var_10_0:addElement(var_10_27)

	var_10_0.DifficultyValue = var_10_27

	local var_10_28
	local var_10_29 = LUI.UIStyledText.new()

	var_10_29.id = "CollateralTxt"

	var_10_29:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_10_29:setText("Collateral Rank:", 0)
	var_10_29:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_29:SetWordWrap(false)
	var_10_29:SetAlignment(LUI.Alignment.Left)
	var_10_29:SetDecodeLetterLength(24)
	var_10_29:SetDecodeMaxRandChars(12)
	var_10_29:SetDecodeUpdatesPerLetter(4)
	var_10_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 222, _1080p * 78, _1080p * 96)
	var_10_0:addElement(var_10_29)

	var_10_0.CollateralTxt = var_10_29

	local var_10_30
	local var_10_31 = LUI.UIStyledText.new()

	var_10_31.id = "CollateralValue"

	var_10_31:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_31:setText("3", 0)
	var_10_31:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_31:SetWordWrap(false)
	var_10_31:SetAlignment(LUI.Alignment.Left)
	var_10_31:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 192, _1080p * 374, _1080p * 78, _1080p * 96)
	var_10_0:addElement(var_10_31)

	var_10_0.CollateralValue = var_10_31

	local var_10_32
	local var_10_33 = MenuBuilder.BuildRegisteredType("CurrentLevelWidget", {
		controllerIndex = var_10_1
	})

	var_10_33.id = "EquippedWidget"

	var_10_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 210, _1080p * 117, _1080p * 142)
	var_10_0:addElement(var_10_33)

	var_10_0.EquippedWidget = var_10_33

	local var_10_34
	local var_10_35 = LUI.UIStyledText.new()

	var_10_35.id = "RewardTxt"

	var_10_35:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_10_35:setText("Reward:", 0)
	var_10_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_35:SetAlignment(LUI.Alignment.Left)
	var_10_35:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_35:SetStartupDelay(1000)
	var_10_35:SetLineHoldTime(400)
	var_10_35:SetAnimMoveTime(150)
	var_10_35:SetAnimMoveSpeed(50)
	var_10_35:SetEndDelay(1000)
	var_10_35:SetCrossfadeTime(400)
	var_10_35:SetFadeInTime(300)
	var_10_35:SetFadeOutTime(300)
	var_10_35:SetMaxVisibleLines(1)
	var_10_35:SetDecodeLetterLength(24)
	var_10_35:SetDecodeMaxRandChars(12)
	var_10_35:SetDecodeUpdatesPerLetter(4)
	var_10_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 85, _1080p * 492, _1080p * 96, _1080p * 114)
	var_10_0:addElement(var_10_35)

	var_10_0.RewardTxt = var_10_35

	local var_10_36
	local var_10_37 = LUI.UIStyledText.new()

	var_10_37.id = "RewardValue"

	var_10_37:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_10_37:setText("Reward name", 0)
	var_10_37:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_37:SetWordWrap(false)
	var_10_37:SetAlignment(LUI.Alignment.Left)
	var_10_37:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 192, _1080p * 374, _1080p * 96, _1080p * 114)
	var_10_0:addElement(var_10_37)

	var_10_0.RewardValue = var_10_37

	local function var_10_38()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_38

	local var_10_39 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 57,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 57,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.2,
			duration = 57,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 57,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_10_27:RegisterAnimationSequence("BlinkDifficulty", var_10_39)

	local function var_10_40()
		var_10_27:AnimateSequence("BlinkDifficulty")
	end

	var_10_0._sequences.BlinkDifficulty = var_10_40

	local var_10_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 57,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 57,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.2,
			duration = 57,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 57,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_10_31:RegisterAnimationSequence("BlinkCollateral", var_10_41)

	local function var_10_42()
		var_10_31:AnimateSequence("BlinkCollateral")
	end

	var_10_0._sequences.BlinkCollateral = var_10_42

	local var_10_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		}
	}

	var_10_4:RegisterAnimationSequence("Completed", var_10_43)

	local var_10_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		}
	}

	var_10_6:RegisterAnimationSequence("Completed", var_10_44)

	local var_10_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 121
		},
		{
			value = 0.35,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Border_Thickness_Top,
			value = _1080p * 0
		}
	}

	var_10_9:RegisterAnimationSequence("Completed", var_10_45)

	local var_10_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("Completed", var_10_46)

	local var_10_47 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("Completed", var_10_47)

	local var_10_48 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("Completed", var_10_48)

	local var_10_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("Completed", var_10_49)

	local var_10_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_10_35:RegisterAnimationSequence("Completed", var_10_50)

	local var_10_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_10_37:RegisterAnimationSequence("Completed", var_10_51)

	local function var_10_52()
		var_10_4:AnimateSequence("Completed")
		var_10_6:AnimateSequence("Completed")
		var_10_9:AnimateSequence("Completed")
		var_10_23:AnimateSequence("Completed")
		var_10_25:AnimateSequence("Completed")
		var_10_29:AnimateSequence("Completed")
		var_10_33:AnimateSequence("Completed")
		var_10_35:AnimateSequence("Completed")
		var_10_37:AnimateSequence("Completed")
	end

	var_10_0._sequences.Completed = var_10_52

	local var_10_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		}
	}

	var_10_4:RegisterAnimationSequence("Incomplete", var_10_53)

	local var_10_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		}
	}

	var_10_6:RegisterAnimationSequence("Incomplete", var_10_54)

	local var_10_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 59
		}
	}

	var_10_9:RegisterAnimationSequence("Incomplete", var_10_55)

	local var_10_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("Incomplete", var_10_56)

	local var_10_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("Incomplete", var_10_57)

	local var_10_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("Incomplete", var_10_58)

	local var_10_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("Incomplete", var_10_59)

	local var_10_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		}
	}

	var_10_35:RegisterAnimationSequence("Incomplete", var_10_60)

	local var_10_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		}
	}

	var_10_37:RegisterAnimationSequence("Incomplete", var_10_61)

	local function var_10_62()
		var_10_4:AnimateSequence("Incomplete")
		var_10_6:AnimateSequence("Incomplete")
		var_10_9:AnimateSequence("Incomplete")
		var_10_23:AnimateSequence("Incomplete")
		var_10_25:AnimateSequence("Incomplete")
		var_10_29:AnimateSequence("Incomplete")
		var_10_33:AnimateSequence("Incomplete")
		var_10_35:AnimateSequence("Incomplete")
		var_10_37:AnimateSequence("Incomplete")
	end

	var_10_0._sequences.Incomplete = var_10_62

	local var_10_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_10_4:RegisterAnimationSequence("CompletedCurrent", var_10_63)

	local var_10_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_10_6:RegisterAnimationSequence("CompletedCurrent", var_10_64)

	local var_10_65 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_10_9:RegisterAnimationSequence("CompletedCurrent", var_10_65)

	local var_10_66 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("CompletedCurrent", var_10_66)

	local var_10_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("CompletedCurrent", var_10_67)

	local var_10_68 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("CompletedCurrent", var_10_68)

	local var_10_69 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 116
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 141
		}
	}

	var_10_33:RegisterAnimationSequence("CompletedCurrent", var_10_69)

	local var_10_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_10_35:RegisterAnimationSequence("CompletedCurrent", var_10_70)

	local var_10_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 114
		}
	}

	var_10_37:RegisterAnimationSequence("CompletedCurrent", var_10_71)

	local function var_10_72()
		var_10_4:AnimateSequence("CompletedCurrent")
		var_10_6:AnimateSequence("CompletedCurrent")
		var_10_9:AnimateSequence("CompletedCurrent")
		var_10_23:AnimateSequence("CompletedCurrent")
		var_10_25:AnimateSequence("CompletedCurrent")
		var_10_29:AnimateSequence("CompletedCurrent")
		var_10_33:AnimateSequence("CompletedCurrent")
		var_10_35:AnimateSequence("CompletedCurrent")
		var_10_37:AnimateSequence("CompletedCurrent")
	end

	var_10_0._sequences.CompletedCurrent = var_10_72

	local var_10_73 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		}
	}

	var_10_4:RegisterAnimationSequence("IncompleteCurrent", var_10_73)

	local var_10_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		}
	}

	var_10_6:RegisterAnimationSequence("IncompleteCurrent", var_10_74)

	local var_10_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		}
	}

	var_10_9:RegisterAnimationSequence("IncompleteCurrent", var_10_75)

	local var_10_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_23:RegisterAnimationSequence("IncompleteCurrent", var_10_76)

	local var_10_77 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_25:RegisterAnimationSequence("IncompleteCurrent", var_10_77)

	local var_10_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_29:RegisterAnimationSequence("IncompleteCurrent", var_10_78)

	local var_10_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 85
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_33:RegisterAnimationSequence("IncompleteCurrent", var_10_79)

	local var_10_80 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		}
	}

	var_10_35:RegisterAnimationSequence("IncompleteCurrent", var_10_80)

	local var_10_81 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 52
		}
	}

	var_10_37:RegisterAnimationSequence("IncompleteCurrent", var_10_81)

	local function var_10_82()
		var_10_4:AnimateSequence("IncompleteCurrent")
		var_10_6:AnimateSequence("IncompleteCurrent")
		var_10_9:AnimateSequence("IncompleteCurrent")
		var_10_23:AnimateSequence("IncompleteCurrent")
		var_10_25:AnimateSequence("IncompleteCurrent")
		var_10_29:AnimateSequence("IncompleteCurrent")
		var_10_33:AnimateSequence("IncompleteCurrent")
		var_10_35:AnimateSequence("IncompleteCurrent")
		var_10_37:AnimateSequence("IncompleteCurrent")
	end

	var_10_0._sequences.IncompleteCurrent = var_10_82

	local var_10_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.2,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_10_37:RegisterAnimationSequence("BlinkReward", var_10_83)

	local function var_10_84()
		var_10_37:AnimateSequence("BlinkReward")
	end

	var_10_0._sequences.BlinkReward = var_10_84

	var_0_2(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("LevelSelectNodeDetails", LevelSelectNodeDetails)
LockTable(_M)
