module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.PercentCompleteValue)

	local function var_1_0()
		local var_2_0 = arg_1_0:GetDataSource().currentProgressPercent:GetValue(arg_1_1)
		local var_2_1 = math.floor(var_2_0 * 1000) / 10

		if var_2_1 - math.floor(var_2_1) == 0 then
			arg_1_0.PercentCompleteValue:setText(var_2_1 .. "%")
		else
			arg_1_0.PercentCompleteValue:setText(string.format("%.1f", var_2_1) .. "%")
		end
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "currentProgressPercent", var_1_0)

	local function var_1_1()
		local var_3_0 = arg_1_0:GetDataSource().currentProgress:GetValue(arg_1_1)
		local var_3_1 = arg_1_0:GetDataSource().currentTierMax:GetValue(arg_1_1)
		local var_3_2 = Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", tostring(var_3_0), tostring(var_3_1))

		;(CONDITIONS.IsThirdGameMode(arg_1_0) and arg_1_0.ChallengeScoreLabelCP or arg_1_0.ChallengeScoreLabel):setText(var_3_2, 0)
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "currentProgress", var_1_1)
end

function MasterChallenge(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1219 * _1080p, 0, 142 * _1080p)

	var_4_0.id = "MasterChallenge"
	var_4_0._animationSets = {}
	var_4_0._sequences = {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_4 = LUI.UIBlur.new()

		var_4_4.id = "ListBlur"

		var_4_4:SetBlurStrength(1.5, 0)
		var_4_0:addElement(var_4_4)

		var_4_0.ListBlur = var_4_4
	end

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "GradientBackgroundInGameOnly"

	var_4_6:SetRGBFromInt(0, 0)
	var_4_6:SetAlpha(0.6, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.GradientBackgroundInGameOnly = var_4_6

	local var_4_7

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_8 = LUI.UIImage.new()

		var_4_8.id = "TicBRCopy1"

		var_4_8:SetAlpha(0.8, 0)
		var_4_8:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -15, _1080p * -1, _1080p * -4, _1080p * -1)
		var_4_0:addElement(var_4_8)

		var_4_0.TicBRCopy1 = var_4_8
	end

	local var_4_9

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_10 = LUI.UIImage.new()

		var_4_10.id = "TicBRCopy2"

		var_4_10:SetAlpha(0.8, 0)
		var_4_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -15, _1080p * -1, _1080p * 1, _1080p * 4)
		var_4_0:addElement(var_4_10)

		var_4_0.TicBRCopy2 = var_4_10
	end

	local var_4_11

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_12 = LUI.UIImage.new()

		var_4_12.id = "TicBRCopy3"

		var_4_12:SetAlpha(0.8, 0)
		var_4_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 1, _1080p * 15, _1080p * -4, _1080p * -1)
		var_4_0:addElement(var_4_12)

		var_4_0.TicBRCopy3 = var_4_12
	end

	local var_4_13

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_14 = LUI.UIImage.new()

		var_4_14.id = "TicBRCopy4"

		var_4_14:SetAlpha(0.8, 0)
		var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1, _1080p * 15, _1080p * 1, _1080p * 4)
		var_4_0:addElement(var_4_14)

		var_4_0.TicBRCopy4 = var_4_14
	end

	local var_4_15

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_16 = LUI.UIImage.new()

		var_4_16.id = "black"

		var_4_16:SetRGBFromInt(0, 0)
		var_4_16:SetAlpha(0.5, 0)
		var_4_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 819.66, _1080p * 1144.2, _1080p * 16.5, _1080p * 42.5)
		var_4_0:addElement(var_4_16)

		var_4_0.black = var_4_16
	end

	local var_4_17
	local var_4_18 = LUI.UIImage.new()

	var_4_18.id = "GradientBackgroundInGameOnlyCopy0"

	var_4_18:SetRGBFromInt(0, 0)
	var_4_18:SetAlpha(0.5, 0)
	var_4_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 516, _1080p * 807, _1080p * 16, _1080p * 133.5)
	var_4_0:addElement(var_4_18)

	var_4_0.GradientBackgroundInGameOnlyCopy0 = var_4_18

	local var_4_19
	local var_4_20 = LUI.UIImage.new()

	var_4_20.id = "GraphBG"

	var_4_20:setImage(RegisterMaterial("challenges_progress_circle_bg"), 0)
	var_4_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1074.13, _1080p * 1218.13, _1080p * 4, _1080p * 148)
	var_4_0:addElement(var_4_20)

	var_4_0.GraphBG = var_4_20

	local var_4_21
	local var_4_22 = LUI.UIText.new()

	var_4_22.id = "PercentCompleteValue"

	var_4_22:setText("xx.x%", 0)
	var_4_22:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_22:SetAlignment(LUI.Alignment.Center)
	var_4_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1084.26, _1080p * 1204.13, _1080p * 65.5, _1080p * 84.5)
	var_4_0:addElement(var_4_22)

	var_4_0.PercentCompleteValue = var_4_22

	local var_4_23

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_24 = LUI.UIText.new()

		var_4_24.id = "MasterChallengeLabel"

		var_4_24:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MASTER_CHALLENGE")), 0)
		var_4_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_24:SetAlignment(LUI.Alignment.Center)
		var_4_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19.13, _1080p * 502.13, _1080p * 30, _1080p * 64)
		var_4_0:addElement(var_4_24)

		var_4_0.MasterChallengeLabel = var_4_24
	end

	local var_4_25

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_26 = LUI.UIText.new()

		var_4_26.id = "MasterChallengeLabelCP"

		var_4_26:SetRGBFromTable(SWATCHES.Zombies.menuHeader, 0)
		var_4_26:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MASTER_CHALLENGE")), 0)
		var_4_26:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_4_26:SetAlignment(LUI.Alignment.Left)
		var_4_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 430, _1080p * 17, _1080p * 47)
		var_4_0:addElement(var_4_26)

		var_4_0.MasterChallengeLabelCP = var_4_26
	end

	local var_4_27

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		var_4_27 = LUI.UIText.new()
		var_4_27.id = "MasterChallengeDescription"

		var_4_27:SetRGBFromInt(12171705, 0)
		var_4_27:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_27:SetAlignment(LUI.Alignment.Center)
		var_4_27:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 19.13, _1080p * 502.13, _1080p * 72, _1080p * 92)

		local function var_4_28()
			local var_5_0 = var_4_0:GetDataSource().desc:GetValue(var_4_1)

			if var_5_0 ~= nil then
				var_4_27:setText(var_5_0, 0)
			end
		end

		var_4_27:SubscribeToModelThroughElement(var_4_0, "desc", var_4_28)
		var_4_0:addElement(var_4_27)

		var_4_0.MasterChallengeDescription = var_4_27
	end

	local var_4_29

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		var_4_29 = LUI.UIText.new()
		var_4_29.id = "MasterChallengeDescriptionCP"

		var_4_29:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_4_29:SetAlignment(LUI.Alignment.Left)
		var_4_29:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 430, _1080p * 50, _1080p * 78)

		local function var_4_30()
			local var_6_0 = var_4_0:GetDataSource().desc:GetValue(var_4_1)

			if var_6_0 ~= nil then
				var_4_29:setText(ToUpperCase(var_6_0), 0)
			end
		end

		var_4_29:SubscribeToModelThroughElement(var_4_0, "desc", var_4_30)
		var_4_0:addElement(var_4_29)

		var_4_0.MasterChallengeDescriptionCP = var_4_29
	end

	local var_4_31

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_32 = LUI.UIText.new()

		var_4_32.id = "ChallengeScoreDescription"

		var_4_32:setText(ToUpperCase("CHALLENGE_PROGRESS_TITLE"), 0)
		var_4_32:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_32:SetAlignment(LUI.Alignment.Left)
		var_4_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 831.13, _1080p * 1079, _1080p * 20, _1080p * 40)
		var_4_0:addElement(var_4_32)

		var_4_0.ChallengeScoreDescription = var_4_32
	end

	local var_4_33

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_34 = LUI.UIText.new()

		var_4_34.id = "ChallengeScoreDescriptionCP"

		var_4_34:SetRGBFromTable(SWATCHES.Zombies.menuHeader, 0)
		var_4_34:setText(ToUpperCase("CHALLENGE_PROGRESS_TITLE"), 0)
		var_4_34:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_4_34:SetAlignment(LUI.Alignment.Left)
		var_4_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 770, _1080p * 1080, _1080p * 17, _1080p * 47)
		var_4_0:addElement(var_4_34)

		var_4_0.ChallengeScoreDescriptionCP = var_4_34
	end

	local var_4_35

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_36 = LUI.UIText.new()

		var_4_36.id = "ChallengeScoreLabel"

		var_4_36:setText("XXX/XXX", 0)
		var_4_36:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_4_36:SetAlignment(LUI.Alignment.Center)
		var_4_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 831.13, _1080p * 1079, _1080p * 67, _1080p * 97)
		var_4_0:addElement(var_4_36)

		var_4_0.ChallengeScoreLabel = var_4_36
	end

	local var_4_37

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_38 = LUI.UIText.new()

		var_4_38.id = "ChallengeScoreLabelCP"

		var_4_38:setText("XXX/XXX", 0)
		var_4_38:SetFont(FONTS.GetFont(FONTS.MainBold.File))
		var_4_38:SetAlignment(LUI.Alignment.Left)
		var_4_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 770, _1080p * 1080, _1080p * 50, _1080p * 78)
		var_4_0:addElement(var_4_38)

		var_4_0.ChallengeScoreLabelCP = var_4_38
	end

	local var_4_39
	local var_4_40 = LUI.UIImage.new()

	var_4_40.id = "Reward"

	var_4_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 516, _1080p * 807, _1080p * 16, _1080p * 134)

	local function var_4_41()
		local var_7_0 = var_4_0:GetDataSource().image:GetValue(var_4_1)

		if var_7_0 ~= nil then
			var_4_40:setImage(RegisterMaterial(var_7_0), 0)
		end
	end

	var_4_40:SubscribeToModelThroughElement(var_4_0, "image", var_4_41)
	var_4_0:addElement(var_4_40)

	var_4_0.Reward = var_4_40

	local var_4_42

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_43 = LUI.UIImage.new()

		var_4_43.id = "LockedRewardOverlayCP"

		var_4_43:SetRGBFromInt(0, 0)
		var_4_43:SetAlpha(0.5, 0)
		var_4_43:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 456, _1080p * 747, _1080p * 13, _1080p * 130)
		var_4_0:addElement(var_4_43)

		var_4_0.LockedRewardOverlayCP = var_4_43
	end

	local var_4_44

	if CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_45 = LUI.UIImage.new()

		var_4_45.id = "RewardLineVertCP"

		var_4_45:SetAlpha(0.2, 0)
		var_4_45:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 440, _1080p * 445, _1080p * 13, _1080p * 130)
		var_4_0:addElement(var_4_45)

		var_4_0.RewardLineVertCP = var_4_45
	end

	local var_4_46

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_47 = MenuBuilder.BuildRegisteredType("EmblemBoxLine", {
			controllerIndex = var_4_1
		})

		var_4_47.id = "Line"

		var_4_47:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 516, _1080p * 807, _1080p * 15, _1080p * 16)
		var_4_0:addElement(var_4_47)

		var_4_0.Line = var_4_47
	end

	local var_4_48
	local var_4_49 = MenuBuilder.BuildRegisteredType("CaCButtonRectrictionOverlay", {
		controllerIndex = var_4_1
	})

	var_4_49.id = "RectrictionOverlay"

	var_4_49:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 807, _1080p * 516, _1080p * 133, _1080p * 16.5)
	var_4_0:addElement(var_4_49)

	var_4_0.RectrictionOverlay = var_4_49

	local var_4_50

	if not CONDITIONS.IsThirdGameMode(var_4_0) then
		local var_4_51 = MenuBuilder.BuildRegisteredType("EmblemBoxLine", {
			controllerIndex = var_4_1
		})

		var_4_51.id = "Line2"

		var_4_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 516, _1080p * 807, _1080p * 133, _1080p * 134)
		var_4_0:addElement(var_4_51)

		var_4_0.Line2 = var_4_51
	end

	local var_4_52
	local var_4_53 = {
		segmentMaterial = "challenges_progress_circle_segment",
		snapToMultiplesOfAngle = 0,
		maskMaterial = "wdg_circle_progressbar_back_rim",
		segmentCount = 2,
		controllerIndex = var_4_1
	}
	local var_4_54 = MenuBuilder.BuildRegisteredType("UIRadialProgressBar", var_4_53)

	var_4_54.id = "ProgressBar"

	var_4_54:setImage(RegisterMaterial("challenges_progress_circle_segment"), 0)
	var_4_54:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1072.2, _1080p * 1216.2, _1080p * 4, _1080p * 148)

	local function var_4_55()
		local var_8_0 = var_4_0:GetDataSource().currentProgressPercent:GetValue(var_4_1)

		if var_8_0 ~= nil then
			var_4_54:SetProgress(var_8_0)
		end
	end

	var_4_54:SubscribeToModelThroughElement(var_4_0, "currentProgressPercent", var_4_55)
	var_4_0:addElement(var_4_54)

	var_4_0.ProgressBar = var_4_54

	local var_4_56 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("DefaultSequence", var_4_56)

	local var_4_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_49:RegisterAnimationSequence("DefaultSequence", var_4_57)

	local function var_4_58()
		var_4_40:AnimateSequence("DefaultSequence")
		var_4_49:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_58

	local var_4_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_40:RegisterAnimationSequence("Locked", var_4_59)

	local var_4_60 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_49:RegisterAnimationSequence("Locked", var_4_60)

	local function var_4_61()
		var_4_40:AnimateSequence("Locked")
		var_4_49:AnimateSequence("Locked")
	end

	var_4_0._sequences.Locked = var_4_61

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("MasterChallenge", MasterChallenge)
LockTable(_M)
