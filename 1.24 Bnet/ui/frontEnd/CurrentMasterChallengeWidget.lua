module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_0:GetCurrentMenu()

	if arg_1_2 then
		arg_1_2.shouldShowCategory = true

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

			arg_1_0.CurrentTierDescription:setText(var_1_1)
		end

		if arg_1_2.currentChallengeProgressAmount and arg_1_2.currentChallengeMaxAmount then
			arg_1_0.ProgressText:setText(Engine.CBBHFCGDIC("CAS/CHALLENGE_PROGRESS", arg_1_2.currentChallengeProgressAmount, arg_1_2.currentChallengeMaxAmount))
		end

		if arg_1_2.progress then
			arg_1_0.ProgressBar:SetProgress(arg_1_2.progress)
		else
			arg_1_0.ProgressBar:SetProgress(0)
		end

		if arg_1_2.isChallengeActive ~= nil and not arg_1_2.isChallengeActive then
			ACTIONS.AnimateSequence(arg_1_0, "Complete")
			arg_1_0.MasterChallengeWidget.TierBacker:SetAlpha(1)
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.Setup = var_0_0
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
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 400, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "TextureLayer"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_3_6:SetAlpha(0.1, 0)
	var_3_6:SetPixelGridEnabled(true)
	var_3_6:SetPixelGridContrast(0.8, 0)
	var_3_6:SetPixelGridBlockWidth(2, 0)
	var_3_6:SetPixelGridBlockHeight(2, 0)
	var_3_6:SetPixelGridGutterWidth(1, 0)
	var_3_6:SetPixelGridGutterHeight(1, 0)
	var_3_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_3_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 400, 0, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.TextureLayer = var_3_6

	local var_3_7
	local var_3_8 = MenuBuilder.BuildRegisteredType("CallingCardMasterChallengeWidget", {
		controllerIndex = var_3_1
	})

	var_3_8.id = "MasterChallengeWidget"

	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 380, 0, _1080p * 140)
	var_3_0:addElement(var_3_8)

	var_3_0.MasterChallengeWidget = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "ProgressBar"

	var_3_10.Overlay:SetRGBFromTable(SWATCHES.masterChallenges.progressBackground, 0)
	var_3_10.Fill:SetRGBFromTable(SWATCHES.masterChallenges.progressFill, 0)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 420, _1080p * -20, _1080p * 100, _1080p * 120)
	var_3_0:addElement(var_3_10)

	var_3_0.ProgressBar = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "ProgressText"

	var_3_12:SetRGBFromTable(SWATCHES.masterChallenges.description, 0)
	var_3_12:setText("", 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Right)
	var_3_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 420, _1080p * -20, _1080p * 75, _1080p * 95)
	var_3_0:addElement(var_3_12)

	var_3_0.ProgressText = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIText.new()

	var_3_14.id = "CurrentTierDescription"

	var_3_14:SetRGBFromTable(SWATCHES.masterChallenges.description, 0)
	var_3_14:setText("", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Left)
	var_3_14:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 420, _1080p * -20, _1080p * 20, _1080p * 40)
	var_3_0:addElement(var_3_14)

	var_3_0.CurrentTierDescription = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16
	local var_3_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_3_0.ProgressBar.Fill
		}
	}

	var_3_10:RegisterAnimationSequence("Complete", var_3_17)

	local function var_3_18()
		var_3_10:AnimateSequence("Complete")
	end

	var_3_0._sequences.Complete = var_3_18

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("CurrentMasterChallengeWidget", CurrentMasterChallengeWidget)
LockTable(_M)
