module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if not arg_1_1 or #arg_1_1 == 0 then
		return
	end

	local var_1_0 = {
		arg_1_0.Star1,
		arg_1_0.Star2,
		arg_1_0.Star3
	}
	local var_1_1 = {
		arg_1_0.Score1,
		arg_1_0.Score2,
		arg_1_0.Score3
	}
	local var_1_2 = {
		arg_1_0.XPValue1,
		arg_1_0.XPValue2,
		arg_1_0.XPValue3
	}
	local var_1_3 = StringTable.DIFCHIGDFB(CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, arg_1_1, CSV.mpMapTable.cols.name)
	local var_1_4 = CP.GetClassicSpecOpsMissionInfo(arg_1_1)

	arg_1_0.GenericItemInfo.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC(var_1_3)))
	arg_1_0.GenericItemInfo.BodyText:setText(Engine.CBBHFCGDIC(var_1_4.desc))

	if not IsSystemLink() then
		local var_1_5 = CP.GetStarsEarnedForMap(arg_1_1, arg_1_0._controllerIndex)
		local var_1_6 = LUI.clamp(var_1_5, 0, #var_1_0)

		for iter_1_0 = 1, #var_1_0 do
			if iter_1_0 <= var_1_6 then
				ACTIONS.AnimateSequence(var_1_0[iter_1_0], "Star" .. iter_1_0 .. "On")
			else
				ACTIONS.AnimateSequence(var_1_0[iter_1_0], "Star" .. iter_1_0 .. "Empty")
			end
		end

		for iter_1_1 = 1, #var_1_1 do
			if var_1_4.scoreType == "time" then
				if iter_1_1 == 1 then
					var_1_1[iter_1_1]:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/SUCCEED"))
				else
					local var_1_7 = tonumber(var_1_4["tier" .. iter_1_1]) or 0

					var_1_1[iter_1_1]:setText(Engine.BFBIAHJJFA(var_1_7))
				end
			else
				var_1_1[iter_1_1]:setText("")
			end
		end

		for iter_1_2 = 1, #var_1_2 do
			local var_1_8 = tonumber(var_1_4["xpReward" .. iter_1_2]) or 0

			var_1_2[iter_1_2]:setText(var_1_8)
		end

		local var_1_9 = CP.GetBestScoreForMap(arg_1_1, arg_1_0._controllerIndex)

		arg_1_0.BestScore:setText(Engine.BFBIAHJJFA(var_1_9))

		local var_1_10 = tonumber(var_1_4.iwBest) or 0

		arg_1_0.IWScore:setText(Engine.BFBIAHJJFA(var_1_10))
	else
		ACTIONS.AnimateSequence(arg_1_0, "Offline")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.GenericItemInfo)

	arg_2_0.SetMap = var_0_0
	arg_2_0._controllerIndex = arg_2_1

	if not IsSystemLink() then
		if CONDITIONS.AreSpecOpsRewardsEnabled() then
			arg_2_0.bindButton = LUI.UIBindButton.new()
			arg_2_0.bindButton.id = "selfBindButton"

			arg_2_0:addElement(arg_2_0.bindButton)
			arg_2_0.bindButton:registerEventHandler("button_alt1", function(arg_3_0, arg_3_1)
				Engine.BJDBIAGIDA(CoD.SFX.MouseClick)
				LUI.FlowManager.RequestPopupMenu(arg_2_0, "SORewardsPopup", false, arg_2_1, false, {})
			end)
		else
			arg_2_0.ViewChallengesPrompt:SetAlpha(0)
			arg_2_0.XP1:SetAlpha(0)
			arg_2_0.XP2:SetAlpha(0)
			arg_2_0.XP3:SetAlpha(0)
			arg_2_0.XPValue1:SetAlpha(0)
			arg_2_0.XPValue2:SetAlpha(0)
			arg_2_0.XPValue3:SetAlpha(0)
			arg_2_0.XPDividerLeft:SetAlpha(0)
			arg_2_0.XPDividerRight:SetAlpha(0)
		end

		local var_2_0 = CP.GetStarUnlocksTable()

		for iter_2_0 = 1, #var_2_0 do
			local var_2_1 = var_2_0[iter_2_0]
		end
	end
end

function SOMapDetails(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1072 * _1080p, 0, 360 * _1080p)

	var_4_0.id = "SOMapDetails"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "DetailsBacker"

	var_4_4:SetAlpha(0.5, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 674, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.DetailsBacker = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "StatsBacker"

	var_4_6:SetAlpha(0.5, 0)
	var_4_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -358, 0, 0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.StatsBacker = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "BestScore"

	var_4_8:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_8:setText("00:00", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 962, _1080p * 1048, _1080p * 110, _1080p * 140)
	var_4_0:addElement(var_4_8)

	var_4_0.BestScore = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "IWScore"

	var_4_10:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_10:setText("00:00", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 962, _1080p * 1048, _1080p * 60, _1080p * 90)
	var_4_0:addElement(var_4_10)

	var_4_0.IWScore = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIText.new()

	var_4_12.id = "BestLabel"

	var_4_12:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_12:setText(Engine.CBBHFCGDIC("LUA_MENU/PERSONAL_BEST"), 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Left)
	var_4_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 738, _1080p * 938, _1080p * 110, _1080p * 140)
	var_4_0:addElement(var_4_12)

	var_4_0.BestLabel = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "IWLabel"

	var_4_14:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_14:setText(Engine.CBBHFCGDIC("LUA_MENU/IW_BEST"), 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Left)
	var_4_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 738, _1080p * 938, _1080p * 60, _1080p * 90)
	var_4_0:addElement(var_4_14)

	var_4_0.IWLabel = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "StatsTitle"

	var_4_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/STATISTICS"), 0)
	var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 714, _1080p * 1072, 0, _1080p * 48)
	var_4_0:addElement(var_4_16)

	var_4_0.StatsTitle = var_4_16

	local var_4_17
	local var_4_18 = LUI.UIStyledText.new()

	var_4_18.id = "XPValue3"

	var_4_18:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_18:setText("", 0)
	var_4_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_18:SetAlignment(LUI.Alignment.Center)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 461, _1080p * 621, _1080p * 296, _1080p * 326)
	var_4_0:addElement(var_4_18)

	var_4_0.XPValue3 = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIStyledText.new()

	var_4_20.id = "XPValue2"

	var_4_20:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_20:setText("", 0)
	var_4_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_20:SetAlignment(LUI.Alignment.Center)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 245, _1080p * 405, _1080p * 296, _1080p * 326)
	var_4_0:addElement(var_4_20)

	var_4_0.XPValue2 = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIStyledText.new()

	var_4_22.id = "XPValue1"

	var_4_22:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_22:setText("", 0)
	var_4_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_22:SetAlignment(LUI.Alignment.Center)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 188, _1080p * 296, _1080p * 326)
	var_4_0:addElement(var_4_22)

	var_4_0.XPValue1 = var_4_22

	local var_4_23
	local var_4_24 = LUI.UIImage.new()

	var_4_24.id = "XP3"

	var_4_24:setImage(RegisterMaterial("icon_xp_token"), 0)
	var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 509, _1080p * 573, _1080p * 241, _1080p * 305)
	var_4_0:addElement(var_4_24)

	var_4_0.XP3 = var_4_24

	local var_4_25
	local var_4_26 = LUI.UIImage.new()

	var_4_26.id = "XP2"

	var_4_26:setImage(RegisterMaterial("icon_xp_token"), 0)
	var_4_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 293, _1080p * 357, _1080p * 241, _1080p * 305)
	var_4_0:addElement(var_4_26)

	var_4_0.XP2 = var_4_26

	local var_4_27
	local var_4_28 = LUI.UIImage.new()

	var_4_28.id = "XP1"

	var_4_28:setImage(RegisterMaterial("icon_xp_token"), 0)
	var_4_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 76, _1080p * 140, _1080p * 241, _1080p * 305)
	var_4_0:addElement(var_4_28)

	var_4_0.XP1 = var_4_28

	local var_4_29
	local var_4_30 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_4_1
	})

	var_4_30.id = "XPDividerRight"

	var_4_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 434, _1080p * 436, _1080p * 254, _1080p * 326)
	var_4_0:addElement(var_4_30)

	var_4_0.XPDividerRight = var_4_30

	local var_4_31
	local var_4_32 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_4_1
	})

	var_4_32.id = "XPDividerLeft"

	var_4_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 217, _1080p * 219, _1080p * 254, _1080p * 326)
	var_4_0:addElement(var_4_32)

	var_4_0.XPDividerLeft = var_4_32

	local var_4_33
	local var_4_34 = LUI.UIStyledText.new()

	var_4_34.id = "Score3"

	var_4_34:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_34:setText("", 0)
	var_4_34:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_34:SetAlignment(LUI.Alignment.Center)
	var_4_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 461, _1080p * 621, _1080p * 195, _1080p * 225)
	var_4_0:addElement(var_4_34)

	var_4_0.Score3 = var_4_34

	local var_4_35
	local var_4_36 = LUI.UIStyledText.new()

	var_4_36.id = "Score2"

	var_4_36:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_36:setText("", 0)
	var_4_36:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_36:SetAlignment(LUI.Alignment.Center)
	var_4_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 245, _1080p * 405, _1080p * 195, _1080p * 225)
	var_4_0:addElement(var_4_36)

	var_4_0.Score2 = var_4_36

	local var_4_37
	local var_4_38 = LUI.UIStyledText.new()

	var_4_38.id = "Score1"

	var_4_38:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_38:setText("", 0)
	var_4_38:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_38:SetAlignment(LUI.Alignment.Center)
	var_4_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 28, _1080p * 188, _1080p * 195, _1080p * 225)
	var_4_0:addElement(var_4_38)

	var_4_0.Score1 = var_4_38

	local var_4_39
	local var_4_40 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_4_1
	})

	var_4_40.id = "StarDividerRight"

	var_4_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 434, _1080p * 436, _1080p * 153, _1080p * 225)
	var_4_0:addElement(var_4_40)

	var_4_0.StarDividerRight = var_4_40

	local var_4_41
	local var_4_42 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_4_1
	})

	var_4_42.id = "StarDividerLeft"

	var_4_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 217, _1080p * 219, _1080p * 153, _1080p * 225)
	var_4_0:addElement(var_4_42)

	var_4_0.StarDividerLeft = var_4_42

	local var_4_43
	local var_4_44 = LUI.UIText.new()

	var_4_44.id = "OfflineWarning"

	var_4_44:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_4_44:SetAlpha(0, 0)
	var_4_44:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/STARS_LOCAL_PLAY_WARNING"), 0)
	var_4_44:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_44:SetAlignment(LUI.Alignment.Left)
	var_4_44:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 66, _1080p * 426, _1080p * 160, _1080p * 184)
	var_4_0:addElement(var_4_44)

	var_4_0.OfflineWarning = var_4_44

	local var_4_45
	local var_4_46 = LUI.UIImage.new()

	var_4_46.id = "StarIcon"

	var_4_46:SetAlpha(0, 0)
	var_4_46:setImage(RegisterMaterial("star_on"), 0)
	var_4_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 57, _1080p * 154, _1080p * 186)
	var_4_0:addElement(var_4_46)

	var_4_0.StarIcon = var_4_46

	local var_4_47
	local var_4_48 = MenuBuilder.BuildRegisteredType("GenericItemInfo", {
		controllerIndex = var_4_1
	})

	var_4_48.id = "GenericItemInfo"

	var_4_48.BodyText:setText("", 0)
	var_4_48.HeaderText:setText(ToUpperCase(""), 0)
	var_4_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 699, _1080p * 27, _1080p * 160)
	var_4_0:addElement(var_4_48)

	var_4_0.GenericItemInfo = var_4_48

	local var_4_49
	local var_4_50 = MenuBuilder.BuildRegisteredType("SORewardStarsSmall", {
		controllerIndex = var_4_1
	})

	var_4_50.id = "Star1"

	var_4_50:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 198, _1080p * 147, _1080p * 197)
	var_4_0:addElement(var_4_50)

	var_4_0.Star1 = var_4_50

	local var_4_51
	local var_4_52 = MenuBuilder.BuildRegisteredType("SORewardStarsSmall", {
		controllerIndex = var_4_1
	})

	var_4_52.id = "Star2"

	var_4_52:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 235, _1080p * 415, _1080p * 147, _1080p * 197)
	var_4_0:addElement(var_4_52)

	var_4_0.Star2 = var_4_52

	local var_4_53
	local var_4_54 = MenuBuilder.BuildRegisteredType("SORewardStarsSmall", {
		controllerIndex = var_4_1
	})

	var_4_54.id = "Star3"

	var_4_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 451, _1080p * 631, _1080p * 147, _1080p * 197)
	var_4_0:addElement(var_4_54)

	var_4_0.Star3 = var_4_54

	local var_4_55

	if CONDITIONS.AreSpecOpsRewardsEnabled(var_4_0) then
		var_4_55 = MenuBuilder.BuildRegisteredType("SOTotalStars", {
			controllerIndex = var_4_1
		})
		var_4_55.id = "TotalStars"

		var_4_55:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 547, _1080p * 1072, _1080p * -116, _1080p * -45)
		var_4_0:addElement(var_4_55)

		var_4_0.TotalStars = var_4_55
	end

	local function var_4_56()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_56

	local var_4_57 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -160
		}
	}

	var_4_4:RegisterAnimationSequence("Offline", var_4_57)

	local var_4_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("Offline", var_4_58)

	local var_4_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("Offline", var_4_59)

	local var_4_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("Offline", var_4_60)

	local var_4_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("Offline", var_4_61)

	local var_4_62 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_14:RegisterAnimationSequence("Offline", var_4_62)

	local var_4_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_16:RegisterAnimationSequence("Offline", var_4_63)

	local var_4_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_18:RegisterAnimationSequence("Offline", var_4_64)

	local var_4_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_20:RegisterAnimationSequence("Offline", var_4_65)

	local var_4_66 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_22:RegisterAnimationSequence("Offline", var_4_66)

	local var_4_67 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_24:RegisterAnimationSequence("Offline", var_4_67)

	local var_4_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_26:RegisterAnimationSequence("Offline", var_4_68)

	local var_4_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_28:RegisterAnimationSequence("Offline", var_4_69)

	local var_4_70 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_30:RegisterAnimationSequence("Offline", var_4_70)

	local var_4_71 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_32:RegisterAnimationSequence("Offline", var_4_71)

	local var_4_72 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_34:RegisterAnimationSequence("Offline", var_4_72)

	local var_4_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_36:RegisterAnimationSequence("Offline", var_4_73)

	local var_4_74 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_38:RegisterAnimationSequence("Offline", var_4_74)

	local var_4_75 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("Offline", var_4_75)

	local var_4_76 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_42:RegisterAnimationSequence("Offline", var_4_76)

	local var_4_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_44:RegisterAnimationSequence("Offline", var_4_77)

	local var_4_78 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_46:RegisterAnimationSequence("Offline", var_4_78)

	local var_4_79 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_50:RegisterAnimationSequence("Offline", var_4_79)

	local var_4_80 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_52:RegisterAnimationSequence("Offline", var_4_80)

	local var_4_81 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_54:RegisterAnimationSequence("Offline", var_4_81)

	if CONDITIONS.AreSpecOpsRewardsEnabled(var_4_0) then
		local var_4_82 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_55:RegisterAnimationSequence("Offline", var_4_82)
	end

	local function var_4_83()
		var_4_4:AnimateSequence("Offline")
		var_4_6:AnimateSequence("Offline")
		var_4_8:AnimateSequence("Offline")
		var_4_10:AnimateSequence("Offline")
		var_4_12:AnimateSequence("Offline")
		var_4_14:AnimateSequence("Offline")
		var_4_16:AnimateSequence("Offline")
		var_4_18:AnimateSequence("Offline")
		var_4_20:AnimateSequence("Offline")
		var_4_22:AnimateSequence("Offline")
		var_4_24:AnimateSequence("Offline")
		var_4_26:AnimateSequence("Offline")
		var_4_28:AnimateSequence("Offline")
		var_4_30:AnimateSequence("Offline")
		var_4_32:AnimateSequence("Offline")
		var_4_34:AnimateSequence("Offline")
		var_4_36:AnimateSequence("Offline")
		var_4_38:AnimateSequence("Offline")
		var_4_40:AnimateSequence("Offline")
		var_4_42:AnimateSequence("Offline")
		var_4_44:AnimateSequence("Offline")
		var_4_46:AnimateSequence("Offline")
		var_4_50:AnimateSequence("Offline")
		var_4_52:AnimateSequence("Offline")
		var_4_54:AnimateSequence("Offline")

		if CONDITIONS.AreSpecOpsRewardsEnabled(var_4_0) then
			var_4_55:AnimateSequence("Offline")
		end
	end

	var_4_0._sequences.Offline = var_4_83

	var_0_1(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("SOMapDetails", SOMapDetails)
LockTable(_M)
