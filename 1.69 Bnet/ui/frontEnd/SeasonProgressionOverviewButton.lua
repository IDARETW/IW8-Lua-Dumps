module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.buttonAction = arg_1_1.action

	if arg_1_1.isPrestigeShop then
		local var_1_0 = tostring(arg_1_1.prestigeKeyCount)

		arg_1_0.ExclusiveSnipeIcon:UpdateExclusiveSnipeIcon({
			selected = true,
			isExclusive = true,
			gameSourceID = LUI.GAME_SOURCE_ID.COLD_WAR
		})
		arg_1_0.PrestigeKeysCount:setText(var_1_0)
		ACTIONS.AnimateSequence(arg_1_0, "PrestigeShop")
	elseif arg_1_1.isCoreProgression then
		arg_1_0.Title:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC(arg_1_1.title)))
		arg_1_0.Rank:setText(Engine.CBEAHDFCFC(arg_1_1.rankName))
		arg_1_0.LevelText:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", arg_1_1.rankDisplay)))
		arg_1_0.RadialProgress:SetProgress(arg_1_1.percentage)
		arg_1_0.RadialProgress.Percent:SetAlpha(0)
		arg_1_0.RadialProgress.Progress:SetRGBFromTable(PROGRESSION.CORE_MILITARY_PROGRESSION_COLOR)
		arg_1_0.Badge:setImage(RegisterMaterial(arg_1_1.image))
		ACTIONS.AnimateSequence(arg_1_0, "Core")
		ACTIONS.AnimateSequence(arg_1_0, "HighRezRadialBar")

		if PROGRESSION.GetPlayerIsInSeasonalProgression(arg_1_1.controllerIndex) then
			local var_1_1 = PROGRESSION.GetPlayerAtMaxRank(arg_1_1.controllerIndex)

			ACTIONS.AnimateSequence(arg_1_0, var_1_1 and "ShowPrestigeMaster" or "ShowCompleteMark")
		end
	elseif arg_1_1.isSeasonalProgression then
		if arg_1_1.isClassified then
			arg_1_0.Title:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/CLASSIFIED")))
			ACTIONS.AnimateSequence(arg_1_0, "Classified")
		else
			if not arg_1_1.isInSeasonProgression then
				ACTIONS.AnimateSequence(arg_1_0, "NotInSeasonal")
			end

			if arg_1_1.isSeasonActive then
				if arg_1_1.season < SEASON.WZ_LEGACY_SEASON_DISPLAY_NUM then
					Challenge.SetupSeasonEndsTimer(arg_1_0, arg_1_0.Status, "CHALLENGE/SEASON_ENDS")
					arg_1_0.Status:SetAlpha(1)

					if CONDITIONS.IsMagmaGameMode(arg_1_0) then
						arg_1_0.Status:SetRGBFromTable(SWATCHES.CH2.WZGenericButtonLine)
					end
				end

				arg_1_0.RadialProgress:SetProgress(arg_1_1.percentage)
				arg_1_0.RadialProgress.Percent:SetAlpha(0)
				arg_1_0.RadialProgress.Progress:SetRGBFromTable(PROGRESSION.SEASONAL_PROGRESSION_COLOR)
				ACTIONS.AnimateSequence(arg_1_0, "HighRezRadialBar")
			else
				ACTIONS.AnimateSequence(arg_1_0, "Darkened")
			end

			if arg_1_1.season < SEASON.WZ_LEGACY_SEASON_DISPLAY_NUM then
				arg_1_0.Title:setText(Engine.CBEAHDFCFC(SEASON.GetLocalizedName({
					seasonDataNumToUse = arg_1_1.season
				})))
			else
				arg_1_0.Title:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("LUA_MENU/WZ_POST_SEASON")))
			end

			arg_1_0.Badge:setImage(RegisterMaterial(arg_1_1.image))
			arg_1_0.Rank:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/PRESTIGE_VALUE", arg_1_1.prestige)))
			arg_1_0.LevelText:setText(Engine.CBEAHDFCFC(Engine.CBBHFCGDIC("AAR/LEVEL_VALUE", arg_1_1.rankDisplay)))

			local var_1_2 = arg_1_1.seasonDataNum ~= nil and arg_1_1.seasonDataNum or SEASON.GetSeasonDataNumFromDisplayNum(arg_1_1.season)
			local var_1_3 = PROGRESSION.GetPlayerProgressionData({
				_controllerIndex = arg_1_1.controllerIndex,
				_seasonNumOverride = var_1_2
			})
			local var_1_4 = var_1_3._prestigeMasterLevel

			if var_1_4 and var_1_4 ~= PROGRESSION.MASTER_LEVEL.INVALID_LEVEL and PROGRESSION.GetAchievedPrestigeMasterForSeasonalRank(arg_1_1.rank) then
				arg_1_0.PrestigeMasterRibbon:setImage(RegisterMaterial(var_1_3._prestigeMasterRibbon))
				ACTIONS.AnimateSequence(arg_1_0, "ShowPrestigeMasterRibbon")
				ACTIONS.AnimateSequence(arg_1_0, "ShowPrestigeMaster")
			end

			arg_1_0.LevelText:SetRGBFromTable(var_1_3._prestigeMasterColor)
			arg_1_0.PrestigeMasterText:SetRGBFromTable(var_1_3._prestigeMasterColor)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateData = var_0_0
end

function SeasonProgressionOverviewButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 244 * _1080p, 0, 346 * _1080p)

	var_3_0.id = "SeasonProgressionOverviewButton"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "PanelBackingImage"

	var_3_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBackground, 0)
	var_3_4:SetAlpha(0.9, 0)
	var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 244, 0, _1080p * 346)
	var_3_0:addElement(var_3_4)

	var_3_0.PanelBackingImage = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "PrestigeKeyBacker"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.backgroundDisabledFocus, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 38, _1080p * 118, _1080p * 154)
	var_3_0:addElement(var_3_6)

	var_3_0.PrestigeKeyBacker = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "PrestigeKeysCount"

	var_3_8:SetAlpha(0, 0)
	var_3_8:setText("99", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetAlignment(LUI.Alignment.Right)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 32, _1080p * 121, _1080p * 151)
	var_3_0:addElement(var_3_8)

	var_3_0.PrestigeKeysCount = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "PrestigeKeysTitle"

	var_3_10:SetAlpha(0, 0)
	var_3_10:setText(Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_KEYS"), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -120, _1080p * 120, _1080p * 93, _1080p * 111)
	var_3_0:addElement(var_3_10)

	var_3_0.PrestigeKeysTitle = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "CompleteText"

	var_3_12:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_3_12:SetAlpha(0, 0)
	var_3_12:SetScale(-0.2, 0)
	var_3_12:setText(Engine.CBBHFCGDIC("LUA_MENU/COMPLETED_CAPS"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 74, _1080p * 251, _1080p * 294, _1080p * 312)
	var_3_0:addElement(var_3_12)

	var_3_0.CompleteText = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "CompleteImage"

	var_3_14:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_3_14:SetAlpha(0, 0)
	var_3_14:setImage(RegisterMaterial("icon_checkbox_checked"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 72, _1080p * 90, _1080p * 295, _1080p * 313)
	var_3_0:addElement(var_3_14)

	var_3_0.CompleteImage = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIImage.new()

	var_3_16.id = "PrestigeMasterBadge"

	var_3_16:SetRGBFromTable(SWATCHES.genericMenu.warning, 0)
	var_3_16:SetAlpha(0, 0)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 176, _1080p * 315, _1080p * 335)
	var_3_0:addElement(var_3_16)

	var_3_0.PrestigeMasterBadge = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "PrestigeMasterText"

	var_3_18:SetRGBFromTable(SWATCHES.CH2.CH2SeasonMaster, 0)
	var_3_18:SetAlpha(0, 0)
	var_3_18:setText(ToUpperCase(Engine.CBBHFCGDIC("PRESTIGE/PRESTIGE_MASTER")), 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_18:SetWordWrap(false)
	var_3_18:SetAlignment(LUI.Alignment.Center)
	var_3_18:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 235, _1080p * 293, _1080p * 311)
	var_3_0:addElement(var_3_18)

	var_3_0.PrestigeMasterText = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIImage.new()

	var_3_20.id = "PrestigeMasterRibbon"

	var_3_20:SetAlpha(0, 0)
	var_3_20:setImage(RegisterMaterial("ui_icon_prestige_master_01"), 0)
	var_3_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 58, _1080p * 186, _1080p * 311, _1080p * 343)
	var_3_0:addElement(var_3_20)

	var_3_0.PrestigeMasterRibbon = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIText.new()

	var_3_22.id = "LevelText"

	var_3_22:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_22:setText("", 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_22:SetAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -113, _1080p * 113, _1080p * 91, _1080p * 121)
	var_3_0:addElement(var_3_22)

	var_3_0.LevelText = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIStyledText.new()

	var_3_24.id = "Rank"

	var_3_24:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZTitle, 0)
	var_3_24:setText(Engine.CBBHFCGDIC("MP_FRONTEND_ONLY/CALLING_CARD_PRESTIGE_1"), 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetAlignment(LUI.Alignment.Center)
	var_3_24:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_24:SetStartupDelay(1000)
	var_3_24:SetLineHoldTime(1000)
	var_3_24:SetAnimMoveTime(1500)
	var_3_24:SetAnimMoveSpeed(500)
	var_3_24:SetEndDelay(1000)
	var_3_24:SetCrossfadeTime(400)
	var_3_24:SetFadeInTime(300)
	var_3_24:SetFadeOutTime(300)
	var_3_24:SetMaxVisibleLines(1)
	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -113, _1080p * 113, _1080p * 74, _1080p * 92)
	var_3_0:addElement(var_3_24)

	var_3_0.Rank = var_3_24

	local var_3_25
	local var_3_26 = {
		Progress_maskMaterial = "career_button_circle_mask",
		Progress_segmentMaterial = "ui_mp_wz_progress_segment",
		controllerIndex = var_3_1
	}
	local var_3_27 = MenuBuilder.BuildRegisteredType("GenericRadialProgressBar", var_3_26)

	var_3_27.id = "RadialProgress"

	var_3_27.Backer:setImage(RegisterMaterial("ui_mp_wz_progress_backer"), 0)
	var_3_27.Progress:SetRGBFromTable(SWATCHES.CH2.CH2RankCareer, 0)
	var_3_27.Progress:setImage(RegisterMaterial("ui_mp_wz_progress_segment"), 0)
	var_3_27:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -84, _1080p * 84, _1080p * 74, _1080p * 242)
	var_3_0:addElement(var_3_27)

	var_3_0.RadialProgress = var_3_27

	local var_3_28
	local var_3_29 = LUI.UIImage.new()

	var_3_29.id = "Badge"

	var_3_29:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -57, _1080p * 57, _1080p * 101, _1080p * 215)
	var_3_0:addElement(var_3_29)

	var_3_0.Badge = var_3_29

	local var_3_30
	local var_3_31 = LUI.UIImage.new()

	var_3_31.id = "ClassifiedLockBadge"

	var_3_31:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_31:SetAlpha(0, 0)
	var_3_31:setImage(RegisterMaterial("blade_lock"), 0)
	var_3_31:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -16, _1080p * 16, _1080p * 142, _1080p * 174)
	var_3_0:addElement(var_3_31)

	var_3_0.ClassifiedLockBadge = var_3_31

	local var_3_32
	local var_3_33 = MenuBuilder.BuildRegisteredType("WZExclusiveSnipeIcon", {
		controllerIndex = var_3_1
	})

	var_3_33.id = "ExclusiveSnipeIcon"

	var_3_33:SetAlpha(0, 0)
	var_3_33:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 51, _1080p * 451, _1080p * 45, _1080p * 77)
	var_3_0:addElement(var_3_33)

	var_3_0.ExclusiveSnipeIcon = var_3_33

	local var_3_34
	local var_3_35 = LUI.UIText.new()

	var_3_35.id = "Status"

	var_3_35:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZDescription, 0)
	var_3_35:setText("", 0)
	var_3_35:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_35:SetAlignment(LUI.Alignment.Center)
	var_3_35:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 235, _1080p * 51, _1080p * 69)
	var_3_0:addElement(var_3_35)

	var_3_0.Status = var_3_35

	local var_3_36
	local var_3_37 = LUI.UIImage.new()

	var_3_37.id = "HeaderBacking"

	var_3_37:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_37:SetAlpha(0.3, 0)
	var_3_37:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -121, _1080p * 121, _1080p * 2, _1080p * 48)
	var_3_0:addElement(var_3_37)

	var_3_0.HeaderBacking = var_3_37

	local var_3_38
	local var_3_39 = LUI.UIStyledText.new()

	var_3_39.id = "Title"

	var_3_39:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_39:SetAlpha(0.8, 0)
	var_3_39:setText(Engine.CBBHFCGDIC("SEASONS/SEASON_1"), 0)
	var_3_39:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_39:setTextStyle(CoD.TextStyle.Shadowed)
	var_3_39:SetWordWrap(false)
	var_3_39:SetAlignment(LUI.Alignment.Center)
	var_3_39:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_39:SetStartupDelay(1000)
	var_3_39:SetLineHoldTime(400)
	var_3_39:SetAnimMoveTime(1500)
	var_3_39:SetAnimMoveSpeed(1500)
	var_3_39:SetEndDelay(1000)
	var_3_39:SetCrossfadeTime(400)
	var_3_39:SetFadeInTime(300)
	var_3_39:SetFadeOutTime(300)
	var_3_39:SetMaxVisibleLines(1)
	var_3_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -67, _1080p * 67, _1080p * -159, _1080p * -135)
	var_3_0:addElement(var_3_39)

	var_3_0.Title = var_3_39

	local var_3_40
	local var_3_41 = {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	}
	local var_3_42 = LUI.UIBorder.new(var_3_41)

	var_3_42.id = "Border"

	var_3_42:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZBorder, 0)
	var_3_42:SetAlpha(0.5, 0)
	var_3_42:SetBorderThicknessLeft(_1080p * 2, 0)
	var_3_42:SetBorderThicknessRight(_1080p * 2, 0)
	var_3_42:SetBorderThicknessTop(_1080p * 2, 0)
	var_3_42:SetBorderThicknessBottom(_1080p * 2, 0)
	var_3_42:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -122, _1080p * 122, _1080p * -173, _1080p * 173)
	var_3_0:addElement(var_3_42)

	var_3_0.Border = var_3_42

	local var_3_43
	local var_3_44 = LUI.UIImage.new()

	var_3_44.id = "ActiveCh3HighlightBottom"

	var_3_44:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_3_44:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_44:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 344, _1080p * 346)
	var_3_0:addElement(var_3_44)

	var_3_0.ActiveCh3HighlightBottom = var_3_44

	local var_3_45
	local var_3_46 = LUI.UIImage.new()

	var_3_46.id = "ActiveCh3HighlightTop"

	var_3_46:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZHighlight, 0)
	var_3_46:setImage(RegisterMaterial("widg_gradient_center_out"), 0)
	var_3_46:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, 0, _1080p * 2)
	var_3_0:addElement(var_3_46)

	var_3_0.ActiveCh3HighlightTop = var_3_46

	local function var_3_47()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_47

	local var_3_48
	local var_3_49 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Inactive", var_3_49)

	local var_3_50 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_37:RegisterAnimationSequence("Inactive", var_3_50)

	local var_3_51 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_39:RegisterAnimationSequence("Inactive", var_3_51)

	local var_3_52 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Inactive", var_3_52)

	local var_3_53 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("Inactive", var_3_53)

	local var_3_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("Inactive", var_3_54)

	local function var_3_55()
		var_3_4:AnimateSequence("Inactive")
		var_3_37:AnimateSequence("Inactive")
		var_3_39:AnimateSequence("Inactive")
		var_3_42:AnimateSequence("Inactive")
		var_3_44:AnimateSequence("Inactive")
		var_3_46:AnimateSequence("Inactive")
	end

	var_3_0._sequences.Inactive = var_3_55

	local var_3_56
	local var_3_57 = {
		{
			value = 0.5,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Active", var_3_57)

	local var_3_58 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_37:RegisterAnimationSequence("Active", var_3_58)

	local var_3_59 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_39:RegisterAnimationSequence("Active", var_3_59)

	local var_3_60 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Active", var_3_60)

	local var_3_61 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 74
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_44:RegisterAnimationSequence("Active", var_3_61)

	local var_3_62 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 74
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_46:RegisterAnimationSequence("Active", var_3_62)

	local function var_3_63()
		var_3_4:AnimateSequence("Active")
		var_3_37:AnimateSequence("Active")
		var_3_39:AnimateSequence("Active")
		var_3_42:AnimateSequence("Active")
		var_3_44:AnimateSequence("Active")
		var_3_46:AnimateSequence("Active")
	end

	var_3_0._sequences.Active = var_3_63

	local var_3_64
	local var_3_65 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Classified", var_3_65)

	local var_3_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Classified", var_3_66)

	local var_3_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Classified", var_3_67)

	local var_3_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Classified", var_3_68)

	local var_3_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("Classified", var_3_69)

	local var_3_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("Classified", var_3_70)

	local var_3_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_27:RegisterAnimationSequence("Classified", var_3_71)

	local var_3_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_icon_t9_rank_prestige_01")
		}
	}

	var_3_29:RegisterAnimationSequence("Classified", var_3_72)

	local var_3_73 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_31:RegisterAnimationSequence("Classified", var_3_73)

	local var_3_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_35:RegisterAnimationSequence("Classified", var_3_74)

	local var_3_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.blackBackground
		},
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_37:RegisterAnimationSequence("Classified", var_3_75)

	local var_3_76 = {
		{
			value = 0.3,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_39:RegisterAnimationSequence("Classified", var_3_76)

	local var_3_77 = {
		{
			value = 0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Classified", var_3_77)

	local var_3_78 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("Classified", var_3_78)

	local var_3_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("Classified", var_3_79)

	local function var_3_80()
		var_3_4:AnimateSequence("Classified")
		var_3_6:AnimateSequence("Classified")
		var_3_8:AnimateSequence("Classified")
		var_3_10:AnimateSequence("Classified")
		var_3_22:AnimateSequence("Classified")
		var_3_24:AnimateSequence("Classified")
		var_3_27:AnimateSequence("Classified")
		var_3_29:AnimateSequence("Classified")
		var_3_31:AnimateSequence("Classified")
		var_3_35:AnimateSequence("Classified")
		var_3_37:AnimateSequence("Classified")
		var_3_39:AnimateSequence("Classified")
		var_3_42:AnimateSequence("Classified")
		var_3_44:AnimateSequence("Classified")
		var_3_46:AnimateSequence("Classified")
	end

	var_3_0._sequences.Classified = var_3_80

	local var_3_81
	local var_3_82 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.Ch2DarkGrey
		}
	}

	var_3_6:RegisterAnimationSequence("PrestigeShop", var_3_82)

	local var_3_83 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 131
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 161
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 38
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_3_8:RegisterAnimationSequence("PrestigeShop", var_3_83)

	local var_3_84 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 129
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -113
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 113
		},
		{
			value = -0.2,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_10:RegisterAnimationSequence("PrestigeShop", var_3_84)

	local var_3_85 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 307
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 331
		}
	}

	var_3_16:RegisterAnimationSequence("PrestigeShop", var_3_85)

	local var_3_86 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("PrestigeShop", var_3_86)

	local var_3_87 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("PrestigeShop", var_3_87)

	local var_3_88 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_27:RegisterAnimationSequence("PrestigeShop", var_3_88)

	local var_3_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_icon_key_prestige")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 32
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 93
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 212
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 273
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_29:RegisterAnimationSequence("PrestigeShop", var_3_89)

	local var_3_90 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_33:RegisterAnimationSequence("PrestigeShop", var_3_90)

	local var_3_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 98
		}
	}

	var_3_37:RegisterAnimationSequence("PrestigeShop", var_3_91)

	local var_3_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU/PRESTIGE_SHOP_CAPS")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericButtonLine
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -77
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 77
		}
	}

	var_3_39:RegisterAnimationSequence("PrestigeShop", var_3_92)

	local function var_3_93()
		var_3_6:AnimateSequence("PrestigeShop")
		var_3_8:AnimateSequence("PrestigeShop")
		var_3_10:AnimateSequence("PrestigeShop")
		var_3_16:AnimateSequence("PrestigeShop")
		var_3_22:AnimateSequence("PrestigeShop")
		var_3_24:AnimateSequence("PrestigeShop")
		var_3_27:AnimateSequence("PrestigeShop")
		var_3_29:AnimateSequence("PrestigeShop")
		var_3_33:AnimateSequence("PrestigeShop")
		var_3_37:AnimateSequence("PrestigeShop")
		var_3_39:AnimateSequence("PrestigeShop")
	end

	var_3_0._sequences.PrestigeShop = var_3_93

	local var_3_94
	local var_3_95 = {
		{
			value = 0.3,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("ActiveClassified", var_3_95)

	local var_3_96 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_27:RegisterAnimationSequence("ActiveClassified", var_3_96)

	local var_3_97 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_29:RegisterAnimationSequence("ActiveClassified", var_3_97)

	local var_3_98 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_31:RegisterAnimationSequence("ActiveClassified", var_3_98)

	local var_3_99 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.4,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_37:RegisterAnimationSequence("ActiveClassified", var_3_99)

	local var_3_100 = {
		{
			value = 0.5,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_39:RegisterAnimationSequence("ActiveClassified", var_3_100)

	local var_3_101 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("ActiveClassified", var_3_101)

	local var_3_102 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 74
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_44:RegisterAnimationSequence("ActiveClassified", var_3_102)

	local var_3_103 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 74
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_46:RegisterAnimationSequence("ActiveClassified", var_3_103)

	local function var_3_104()
		var_3_4:AnimateSequence("ActiveClassified")
		var_3_27:AnimateSequence("ActiveClassified")
		var_3_29:AnimateSequence("ActiveClassified")
		var_3_31:AnimateSequence("ActiveClassified")
		var_3_37:AnimateSequence("ActiveClassified")
		var_3_39:AnimateSequence("ActiveClassified")
		var_3_42:AnimateSequence("ActiveClassified")
		var_3_44:AnimateSequence("ActiveClassified")
		var_3_46:AnimateSequence("ActiveClassified")
	end

	var_3_0._sequences.ActiveClassified = var_3_104

	local var_3_105
	local var_3_106 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_mp_wz_progress_segment"),
			child = var_3_0.RadialProgress.Progress
		}
	}

	var_3_27:RegisterAnimationSequence("HighRezRadialBar", var_3_106)

	local function var_3_107()
		var_3_27:AnimateSequence("HighRezRadialBar")
	end

	var_3_0._sequences.HighRezRadialBar = var_3_107

	local var_3_108
	local var_3_109 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_27:RegisterAnimationSequence("Darkened", var_3_109)

	local function var_3_110()
		var_3_27:AnimateSequence("Darkened")
	end

	var_3_0._sequences.Darkened = var_3_110

	local var_3_111
	local var_3_112 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ShowPrestigeMaster", var_3_112)

	local function var_3_113()
		var_3_18:AnimateSequence("ShowPrestigeMaster")
	end

	var_3_0._sequences.ShowPrestigeMaster = var_3_113

	local var_3_114
	local var_3_115 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2RankCareer
		}
	}

	var_3_12:RegisterAnimationSequence("ShowCompleteMark", var_3_115)

	local var_3_116 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("ShowCompleteMark", var_3_116)

	local var_3_117 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.CH2SeasonMaster
		}
	}

	var_3_16:RegisterAnimationSequence("ShowCompleteMark", var_3_117)

	local function var_3_118()
		var_3_12:AnimateSequence("ShowCompleteMark")
		var_3_14:AnimateSequence("ShowCompleteMark")
		var_3_16:AnimateSequence("ShowCompleteMark")
	end

	var_3_0._sequences.ShowCompleteMark = var_3_118

	local var_3_119
	local var_3_120 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("HideCompleteMark", var_3_120)

	local var_3_121 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("HideCompleteMark", var_3_121)

	local function var_3_122()
		var_3_12:AnimateSequence("HideCompleteMark")
		var_3_14:AnimateSequence("HideCompleteMark")
	end

	var_3_0._sequences.HideCompleteMark = var_3_122

	local var_3_123
	local var_3_124 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("HidePrestigeMaster", var_3_124)

	local function var_3_125()
		var_3_18:AnimateSequence("HidePrestigeMaster")
	end

	var_3_0._sequences.HidePrestigeMaster = var_3_125

	local var_3_126
	local var_3_127 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_20:RegisterAnimationSequence("ShowPrestigeMasterRibbon", var_3_127)

	local function var_3_128()
		var_3_20:AnimateSequence("ShowPrestigeMasterRibbon")
	end

	var_3_0._sequences.ShowPrestigeMasterRibbon = var_3_128

	local var_3_129
	local var_3_130 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Memorial", var_3_130)

	local var_3_131 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Memorial", var_3_131)

	local var_3_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 277
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 293
		}
	}

	var_3_18:RegisterAnimationSequence("Memorial", var_3_132)

	local var_3_133 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 295
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 327
		}
	}

	var_3_20:RegisterAnimationSequence("Memorial", var_3_133)

	local var_3_134 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		}
	}

	var_3_22:RegisterAnimationSequence("Memorial", var_3_134)

	local var_3_135 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 58
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 76
		}
	}

	var_3_24:RegisterAnimationSequence("Memorial", var_3_135)

	local var_3_136 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_27:RegisterAnimationSequence("Memorial", var_3_136)

	local var_3_137 = {
		{
			value = 0.33,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 93
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 207
		}
	}

	var_3_29:RegisterAnimationSequence("Memorial", var_3_137)

	local var_3_138 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_35:RegisterAnimationSequence("Memorial", var_3_138)

	local var_3_139 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_37:RegisterAnimationSequence("Memorial", var_3_139)

	local var_3_140 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_39:RegisterAnimationSequence("Memorial", var_3_140)

	local var_3_141 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Memorial", var_3_141)

	local var_3_142 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("Memorial", var_3_142)

	local var_3_143 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("Memorial", var_3_143)

	local function var_3_144()
		var_3_4:AnimateSequence("Memorial")
		var_3_10:AnimateSequence("Memorial")
		var_3_18:AnimateSequence("Memorial")
		var_3_20:AnimateSequence("Memorial")
		var_3_22:AnimateSequence("Memorial")
		var_3_24:AnimateSequence("Memorial")
		var_3_27:AnimateSequence("Memorial")
		var_3_29:AnimateSequence("Memorial")
		var_3_35:AnimateSequence("Memorial")
		var_3_37:AnimateSequence("Memorial")
		var_3_39:AnimateSequence("Memorial")
		var_3_42:AnimateSequence("Memorial")
		var_3_44:AnimateSequence("Memorial")
		var_3_46:AnimateSequence("Memorial")
	end

	var_3_0._sequences.Memorial = var_3_144

	local var_3_145
	local var_3_146 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("NotInSeasonal", var_3_146)

	local var_3_147 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("NotInSeasonal", var_3_147)

	local var_3_148 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_27:RegisterAnimationSequence("NotInSeasonal", var_3_148)

	local var_3_149 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_29:RegisterAnimationSequence("NotInSeasonal", var_3_149)

	local var_3_150 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_44:RegisterAnimationSequence("NotInSeasonal", var_3_150)

	local var_3_151 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_46:RegisterAnimationSequence("NotInSeasonal", var_3_151)

	local function var_3_152()
		var_3_22:AnimateSequence("NotInSeasonal")
		var_3_24:AnimateSequence("NotInSeasonal")
		var_3_27:AnimateSequence("NotInSeasonal")
		var_3_29:AnimateSequence("NotInSeasonal")
		var_3_44:AnimateSequence("NotInSeasonal")
		var_3_46:AnimateSequence("NotInSeasonal")
	end

	var_3_0._sequences.NotInSeasonal = var_3_152

	local var_3_153
	local var_3_154 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_22:RegisterAnimationSequence("ActiveNotInSeasonal", var_3_154)

	local var_3_155 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_24:RegisterAnimationSequence("ActiveNotInSeasonal", var_3_155)

	local var_3_156 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_27:RegisterAnimationSequence("ActiveNotInSeasonal", var_3_156)

	local var_3_157 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_29:RegisterAnimationSequence("ActiveNotInSeasonal", var_3_157)

	local var_3_158 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_37:RegisterAnimationSequence("ActiveNotInSeasonal", var_3_158)

	local var_3_159 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 74
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_44:RegisterAnimationSequence("ActiveNotInSeasonal", var_3_159)

	local var_3_160 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 74
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 400,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_3_46:RegisterAnimationSequence("ActiveNotInSeasonal", var_3_160)

	local function var_3_161()
		var_3_22:AnimateSequence("ActiveNotInSeasonal")
		var_3_24:AnimateSequence("ActiveNotInSeasonal")
		var_3_27:AnimateSequence("ActiveNotInSeasonal")
		var_3_29:AnimateSequence("ActiveNotInSeasonal")
		var_3_37:AnimateSequence("ActiveNotInSeasonal")
		var_3_44:AnimateSequence("ActiveNotInSeasonal")
		var_3_46:AnimateSequence("ActiveNotInSeasonal")
	end

	var_3_0._sequences.ActiveNotInSeasonal = var_3_161

	local var_3_162
	local var_3_163 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("SetCurrentCareerMode", var_3_163)

	local var_3_164 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_37:RegisterAnimationSequence("SetCurrentCareerMode", var_3_164)

	local var_3_165 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground
		}
	}

	var_3_39:RegisterAnimationSequence("SetCurrentCareerMode", var_3_165)

	local function var_3_166()
		var_3_4:AnimateSequence("SetCurrentCareerMode")
		var_3_37:AnimateSequence("SetCurrentCareerMode")
		var_3_39:AnimateSequence("SetCurrentCareerMode")
	end

	var_3_0._sequences.SetCurrentCareerMode = var_3_166

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SeasonProgressionOverviewButton", SeasonProgressionOverviewButton)
LockTable(_M)
