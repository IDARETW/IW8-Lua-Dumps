module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0:GetCurrentMenu()

	if arg_1_2 then
		arg_1_2.shouldShowCategory = true
		arg_1_0.MasterChallengeWidget._forceHideProgress = true

		arg_1_0.MasterChallengeWidget:SetChallengeData(var_1_0, arg_1_2)
		arg_1_0.MasterChallengeWidget:PreviewChallenge()

		if arg_1_2.tierDesc and #arg_1_2.tierDesc > 0 then
			local var_1_1 = arg_1_2.tierDesc and Engine.CBBHFCGDIC(arg_1_2.tierDesc) or ""

			if arg_1_2.numTiers > 1 then
				var_1_1 = arg_1_2.tierDesc and Engine.CBBHFCGDIC(arg_1_2.tierDesc, arg_1_2.currentChallengeMaxAmount) or ""
			else
				arg_1_0.MasterChallengeWidget.ChallengeTier:SetAlpha(0)
				arg_1_0.MasterChallengeWidget.TierBacker:SetAlpha(0)
			end

			arg_1_0.CurrentTierDescription:setText(LAYOUT.SetWarzoneStringHighlightOverride(var_1_1))
		end

		if arg_1_2.currentChallengeProgressAmount and arg_1_2.currentChallengeMaxAmount then
			local var_1_2 = LUI.clamp(tonumber(arg_1_2.currentChallengeProgressAmount), 0, tonumber(arg_1_2.currentChallengeMaxAmount))

			arg_1_0.ProgressText:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_PROGRESS", var_1_2, arg_1_2.currentChallengeMaxAmount))
		end

		if arg_1_2.progress then
			arg_1_0.ProgressBar:SetProgress(arg_1_2.progress)
		else
			arg_1_0.ProgressBar:SetProgress(0)
		end

		if arg_1_2.isChallengeActive ~= nil and not arg_1_2.isChallengeActive then
			WZWIP.AnimateThemeElement(arg_1_0, "Complete")
			arg_1_0.MasterChallengeWidget.TierBacker:SetAlpha(1)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0

	if CONDITIONS.IsMagmaGameMode() then
		ACTIONS.AnimateSequence(arg_2_0, "WZSetup")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function CurrentMasterChallengeWidget(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1060 * _1080p, 0, 140 * _1080p)

	var_3_0.id = "CurrentMasterChallengeWidget"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3

	if not CONDITIONS.IsMagmaGameMode() then
		local var_3_4 = LUI.UIImage.new()

		var_3_4.id = "Backer"

		var_3_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
		var_3_4:SetAlpha(0.5, 0)
		var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 392, 0, 0, 0)
		var_3_0:addElement(var_3_4)

		var_3_0.Backer = var_3_4
	end

	local var_3_5

	if CONDITIONS.IsMagmaGameMode() then
		local var_3_6 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
			controllerIndex = var_3_1
		})

		var_3_6.id = "ContentContainer"

		var_3_6.Background:SetAlpha(0.5, 0)
		var_3_6.TitleBackground:SetLeft(_1080p * 4, 0)
		var_3_6.TitleBackground:SetRight(_1080p * -4, 0)
		var_3_6.TitleBackground:SetTop(_1080p * 19, 0)
		var_3_6.TitleBackground:SetBottom(_1080p * 47, 0)
		var_3_6.TitleBackground:SetAlpha(0, 0)
		var_3_6.Title:SetLeft(_1080p * 14, 0)
		var_3_6.Title:SetRight(_1080p * -14, 0)
		var_3_6.Title:SetTop(_1080p * 19, 0)
		var_3_6.Title:SetBottom(_1080p * 43, 0)
		var_3_6.Title:SetAlpha(0, 0)
		var_3_6.Title:setText("", 0)
		var_3_6.Title:SetAlignment(LUI.Alignment.Center)
		var_3_6.BorderBacker:SetLeft(0, 0)
		var_3_6.BorderBacker:SetRight(0, 0)
		var_3_6.BorderBacker:SetTop(0, 0)
		var_3_6.BorderBacker:SetBottom(0, 0)
		var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 394, 0, 0, 0)
		var_3_0:addElement(var_3_6)

		var_3_0.ContentContainer = var_3_6
	end

	local var_3_7

	if not CONDITIONS.IsMagmaGameMode() then
		local var_3_8 = LUI.UIImage.new()

		var_3_8.id = "TextureLayer"

		var_3_8:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
		var_3_8:SetAlpha(0.1, 0)
		var_3_8:setImage(RegisterMaterial("ui_default_white"), 0)
		var_3_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 392, _1080p * -8, 0, 0)
		var_3_0:addElement(var_3_8)

		var_3_0.TextureLayer = var_3_8
	end

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("CallingCardMasterChallengeWidget", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "MasterChallengeWidget"

	var_3_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, 0, _1080p * 140)
	var_3_0:addElement(var_3_10)

	var_3_0.MasterChallengeWidget = var_3_10

	local var_3_11

	if CONDITIONS.IsMagmaGameMode() then
		local var_3_12 = MenuBuilder.BuildRegisteredType("WZRewardContainer", {
			controllerIndex = var_3_1
		})

		var_3_12.id = "CardContainer"

		var_3_12.Background:SetAlpha(0, 0)
		var_3_12.TitleBackground:SetLeft(_1080p * 4, 0)
		var_3_12.TitleBackground:SetRight(_1080p * -4, 0)
		var_3_12.TitleBackground:SetTop(_1080p * 19, 0)
		var_3_12.TitleBackground:SetBottom(_1080p * 47, 0)
		var_3_12.TitleBackground:SetAlpha(0, 0)
		var_3_12.Title:SetLeft(_1080p * 14, 0)
		var_3_12.Title:SetRight(_1080p * -14, 0)
		var_3_12.Title:SetTop(_1080p * 19, 0)
		var_3_12.Title:SetBottom(_1080p * 43, 0)
		var_3_12.Title:SetAlpha(0, 0)
		var_3_12.Title:setText("", 0)
		var_3_12.Title:SetAlignment(LUI.Alignment.Center)
		var_3_12.BorderBacker:SetLeft(0, 0)
		var_3_12.BorderBacker:SetRight(0, 0)
		var_3_12.BorderBacker:SetTop(0, 0)
		var_3_12.BorderBacker:SetBottom(0, 0)
		var_3_12:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -680, 0, 0)
		var_3_0:addElement(var_3_12)

		var_3_0.CardContainer = var_3_12
	end

	local var_3_13
	local var_3_14 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_14.id = "ProgressBar"

	var_3_14.Overlay:SetRGBFromTable(SWATCHES.masterChallenges.progressBackground, 0)
	var_3_14.Fill:SetRGBFromTable(SWATCHES.masterChallenges.progressFill, 0)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 412, _1080p * -28, _1080p * 100, _1080p * 120)
	var_3_0:addElement(var_3_14)

	var_3_0.ProgressBar = var_3_14

	local var_3_15
	local var_3_16 = LUI.UIText.new()

	var_3_16.id = "ProgressText"

	var_3_16:SetRGBFromTable(SWATCHES.masterChallenges.description, 0)
	var_3_16:setText("", 0)
	var_3_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_16:SetAlignment(LUI.Alignment.Right)
	var_3_16:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 412, _1080p * -28, _1080p * 75, _1080p * 95)
	var_3_0:addElement(var_3_16)

	var_3_0.ProgressText = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIText.new()

	var_3_18.id = "CurrentTierDescription"

	var_3_18:SetRGBFromTable(SWATCHES.masterChallenges.description, 0)
	var_3_18:setText("", 0)
	var_3_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_18:SetAlignment(LUI.Alignment.Left)
	var_3_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 412, _1080p * -28, _1080p * 19, _1080p * 39)
	var_3_0:addElement(var_3_18)

	var_3_0.CurrentTierDescription = var_3_18

	local function var_3_19()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_19

	local var_3_20
	local var_3_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_3_0.ProgressBar.Fill
		}
	}

	var_3_14:RegisterAnimationSequence("Complete", var_3_21)

	local function var_3_22()
		var_3_14:AnimateSequence("Complete")
	end

	var_3_0._sequences.Complete = var_3_22

	local var_3_23
	local var_3_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		}
	}

	var_3_18:RegisterAnimationSequence("AR", var_3_24)

	local function var_3_25()
		var_3_18:AnimateSequence("AR")
	end

	var_3_0._sequences.AR = var_3_25

	local var_3_26
	local var_3_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZBackground,
			child = var_3_0.ProgressBar.Overlay
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZProgressBar,
			child = var_3_0.ProgressBar.Fill
		}
	}

	var_3_14:RegisterAnimationSequence("WZSetup", var_3_27)

	local var_3_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		}
	}

	var_3_16:RegisterAnimationSequence("WZSetup", var_3_28)

	local var_3_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZDescription
		}
	}

	var_3_18:RegisterAnimationSequence("WZSetup", var_3_29)

	local function var_3_30()
		var_3_14:AnimateSequence("WZSetup")
		var_3_16:AnimateSequence("WZSetup")
		var_3_18:AnimateSequence("WZSetup")
	end

	var_3_0._sequences.WZSetup = var_3_30

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CurrentMasterChallengeWidget", CurrentMasterChallengeWidget)
LockTable(_M)
