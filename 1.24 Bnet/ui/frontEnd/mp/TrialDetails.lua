module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, "ShowBestScore")

	local var_1_0 = arg_1_1.bestScore

	if arg_1_1.scoreType == "time" then
		arg_1_0.BestScore:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_BEST_TIME", Engine.JCBDICCAH(TIME.FormatMilliseconds(var_1_0, TIME.Format.STOPWATCH))))
	else
		arg_1_0.BestScore:setText(Engine.CBBHFCGDIC("MPUI/TRIAL_BEST_SCORE", var_1_0))
	end

	if arg_1_1.bestScore ~= 0 then
		if arg_1_1.scoreType == "time" then
			if arg_1_1.bestScore <= tonumber(arg_1_1.tier3) then
				ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier3")
			elseif arg_1_1.bestScore <= tonumber(arg_1_1.tier2) then
				ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier2")
			elseif arg_1_1.bestScore <= tonumber(arg_1_1.tier1) then
				ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier1")
			else
				ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier0")
			end
		elseif arg_1_1.bestScore >= tonumber(arg_1_1.tier3) then
			ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier3")
		elseif arg_1_1.bestScore >= tonumber(arg_1_1.tier2) then
			ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier2")
		elseif arg_1_1.bestScore >= tonumber(arg_1_1.tier1) then
			ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier1")
		else
			ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier0")
		end
	else
		ACTIONS.AnimateSequence(arg_1_0.TrialRewardStarsSmall, "Tier0")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdateBestScore = var_0_0
end

function TrialDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 416 * _1080p, 0, 580 * _1080p)

	var_3_0.id = "TrialDetails"
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

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "BackgroundImage"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 416, _1080p * 46, _1080p * 280)
	var_3_0:addElement(var_3_6)

	var_3_0.BackgroundImage = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "Lock"

	var_3_8:SetAlpha(0, 0)
	var_3_8:setImage(RegisterMaterial("icon_slot_locked"), 0)
	var_3_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -231, _1080p * -169, _1080p * -31, _1080p * 31)
	var_3_0:addElement(var_3_8)

	var_3_0.Lock = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "Description"

	var_3_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetShadowRGBFromTable(SWATCHES.genericButton.textGlow, 0)
	var_3_10:SetOutlineRGBFromInt(0, 0)
	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 400, _1080p * 286, _1080p * 306)
	var_3_0:addElement(var_3_10)

	var_3_0.Description = var_3_10

	local var_3_11
	local var_3_12 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_12.id = "Header"

	var_3_12.Text:setText("", 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 385, 0, _1080p * 46)
	var_3_0:addElement(var_3_12)

	var_3_0.Header = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Darken"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_14:SetAlpha(0.7, 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 416, _1080p * 230, _1080p * 280)
	var_3_0:addElement(var_3_14)

	var_3_0.Darken = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "BestScore"

	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Left)
	var_3_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 231, _1080p * 241, _1080p * 269)
	var_3_0:addElement(var_3_16)

	var_3_0.BestScore = var_3_16

	local var_3_17
	local var_3_18 = MenuBuilder.BuildRegisteredType("TrialRewardStarsSmall", {
		controllerIndex = var_3_1
	})

	var_3_18.id = "TrialRewardStarsSmall"

	var_3_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 236, _1080p * 416, _1080p * 230, _1080p * 280)
	var_3_0:addElement(var_3_18)

	var_3_0.TrialRewardStarsSmall = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 316
		}
	}

	var_3_10:RegisterAnimationSequence("isArabic", var_3_20)

	local function var_3_21()
		var_3_10:AnimateSequence("isArabic")
	end

	var_3_0._sequences.isArabic = var_3_21

	local var_3_22 = {
		{
			value = 0.7,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("ShowBestScore", var_3_22)

	local var_3_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("ShowBestScore", var_3_23)

	local function var_3_24()
		var_3_14:AnimateSequence("ShowBestScore")
		var_3_18:AnimateSequence("ShowBestScore")
	end

	var_3_0._sequences.ShowBestScore = var_3_24

	local var_3_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("HideBestScore", var_3_25)

	local var_3_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("HideBestScore", var_3_26)

	local function var_3_27()
		var_3_16:AnimateSequence("HideBestScore")
		var_3_18:AnimateSequence("HideBestScore")
	end

	var_3_0._sequences.HideBestScore = var_3_27

	var_3_0:addEventHandler("disable", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "Disabled")
	end)
	var_3_0:addEventHandler("enable", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "Enabled")
	end)
	var_0_1(var_3_0, var_3_1, arg_3_1)

	if CONDITIONS.IsArabic(var_3_0) then
		ACTIONS.AnimateSequence(var_3_0, "isArabic")
	end

	return var_3_0
end

MenuBuilder.registerType("TrialDetails", TrialDetails)
LockTable(_M)
