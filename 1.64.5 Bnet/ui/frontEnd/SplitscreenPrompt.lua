module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	if CONDITIONS.IsSeasonalEventActive() and (IsLanguageRussian() or IsLanguageItalian() or IsLanguagePolish() or IsLanguageJapanese()) then
		ACTIONS.AnimateSequence(arg_1_0, "LongPrompt")
	end
end

function SplitscreenPrompt(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 40 * _1080p)

	var_2_0.id = "SplitscreenPrompt"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIStyledText.new()

	var_2_4.id = "PromptText"

	var_2_4:SetRGBFromTable(SWATCHES.Lobby.Header2, 0)
	var_2_4:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_2_4:SetWordWrap(false)
	var_2_4:SetAlignment(LUI.Alignment.Left)
	var_2_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_4:SetStartupDelay(1000)
	var_2_4:SetLineHoldTime(400)
	var_2_4:SetAnimMoveTime(150)
	var_2_4:SetAnimMoveSpeed(50)
	var_2_4:SetEndDelay(1000)
	var_2_4:SetCrossfadeTime(400)
	var_2_4:SetFadeInTime(300)
	var_2_4:SetFadeOutTime(300)
	var_2_4:SetMaxVisibleLines(1)
	var_2_4:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 10, _1080p * -9, _1080p * -11, _1080p * 11)

	local function var_2_5()
		local var_3_0 = DataSources.frontEnd.lobby.splitscreenPromptText:GetValue(var_2_1)

		if var_3_0 ~= nil then
			var_2_4:setText(var_3_0, 0)
		end
	end

	local var_2_6 = DataSources.frontEnd.lobby.splitscreenPromptText

	var_2_4:SubscribeToModel(var_2_6:GetModel(var_2_1), var_2_5)
	var_2_0:addElement(var_2_4)

	var_2_0.PromptText = var_2_4

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -15
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_2_4:RegisterAnimationSequence("AR", var_2_9)

	local function var_2_10()
		var_2_4:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_10

	local var_2_11
	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 220
		}
	}

	var_2_4:RegisterAnimationSequence("LongPrompt", var_2_12)

	local function var_2_13()
		var_2_4:AnimateSequence("LongPrompt")
	end

	var_2_0._sequences.LongPrompt = var_2_13

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("SplitscreenPrompt", SplitscreenPrompt)
LockTable(_M)
