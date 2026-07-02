module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.TutorialText)

	local var_1_0 = arg_1_0.TutorialText

	arg_1_0._controllerIndex = arg_1_1

	var_1_0:SetShadowUOffset(-0.001)
	var_1_0:SetShadowVOffset(-0.001)

	local var_1_1 = DataSources.inGame.HUD.hints.tutorialMessageText
	local var_1_2 = arg_1_0:GetCurrentAnchorsAndPositions()
	local var_1_3 = var_1_2.top
	local var_1_4 = var_1_2.bottom

	local function var_1_5(arg_2_0, arg_2_1)
		if not arg_2_0._lineHeight then
			local var_2_0, var_2_1, var_2_2, var_2_3 = arg_2_0.TutorialText:getLocalRect()

			arg_2_0._lineHeight = math.abs(var_2_3 - var_2_1)
			arg_2_0._lineMaxWidth = math.abs(var_2_2 - var_2_0)
		end

		local var_2_4 = arg_2_0._lineHeight
		local var_2_5 = arg_2_0._lineMaxWidth
		local var_2_6 = arg_2_0.TutorialText:GetCurrentFont()
		local var_2_7, var_2_8, var_2_9, var_2_10 = GetTextDimensions(arg_2_1, var_2_6, var_2_4, var_2_5)
		local var_2_11 = var_2_9 - var_2_7
		local var_2_12 = var_2_8 - var_2_10
		local var_2_13 = var_2_11 + 30
		local var_2_14 = var_2_12 + 20
		local var_2_15 = var_2_13 * 0.5
		local var_2_16 = var_2_14 * 0.5

		if not CONDITIONS.IsCoreMultiplayerNotBr(arg_2_0) then
			arg_2_0.Background:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -var_2_15, var_2_15, -var_2_16, var_2_16)
		end

		local var_2_17 = var_2_12 * -0.5
		local var_2_18 = var_2_17 + var_2_4

		arg_2_0.TutorialText:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 30, -30, var_2_17, var_2_18)
		arg_2_0.TutorialText:setText(arg_2_1)
	end

	local function var_1_6(arg_3_0, arg_3_1)
		if arg_3_1 ~= nil and arg_3_1 ~= "" and arg_3_1 ~= "none" then
			local var_3_0 = 0

			if Engine.CAADCDEEIA() and DataSources.inGame.SP.apacheVisible and DataSources.inGame.SP.apacheVisible:GetValue(arg_1_1) == 1 then
				var_3_0 = -72 * _1080p
			end

			arg_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, var_1_3 + var_3_0, var_1_4 + var_3_0)
			var_1_5(arg_3_0, arg_3_1)

			if DataSources.inGame.HUD.hints.invalidCmdHintShow:GetValue(arg_1_1) then
				ACTIONS.AnimateSequence(arg_3_0, "FadeInInvalidCmd")
			else
				ACTIONS.AnimateSequence(arg_3_0, "FadeIn")
			end
		else
			ACTIONS.AnimateSequence(arg_3_0, "FadeOut")
		end
	end

	local function var_1_7(arg_4_0)
		local var_4_0 = var_1_1:GetValue(arg_1_1)

		var_1_6(arg_4_0, var_4_0)
	end

	arg_1_0:SubscribeToModel(var_1_1:GetModel(arg_1_1), function()
		var_1_7(arg_1_0)
	end)
	var_1_7(arg_1_0)

	if CONDITIONS.IsBRGameType() then
		local function var_1_8(arg_6_0)
			if DataSources.inGame.MP.brShowMountTutorial:GetValue(arg_1_1) then
				local var_6_0 = Engine.CEHIEICIFD(arg_1_1)

				var_1_6(arg_6_0, var_6_0)
			else
				var_1_7(arg_6_0)
			end
		end

		arg_1_0:SubscribeToModel(DataSources.inGame.MP.brShowMountTutorial:GetModel(arg_1_1), function()
			var_1_8(arg_1_0)
		end)
		var_1_8(arg_1_0)
	end

	arg_1_0._messageTextDataSource = var_1_1

	local function var_1_9(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_0._messageTextDataSource:GetValue(arg_8_0._controllerIndex)

		if var_8_0 ~= nil and var_8_0 ~= "" and var_8_0 ~= "none" then
			var_1_5(arg_8_0, var_8_0)
		else
			ACTIONS.AnimateSequence(arg_8_0, "FadeOut")
		end
	end

	local function var_1_10(arg_9_0, arg_9_1)
		arg_9_0:SetAlpha(0)
	end

	local function var_1_11(arg_10_0, arg_10_1)
		if Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() then
			var_1_9(arg_10_0, arg_10_1)
			arg_10_0:SetAlpha(1)
		end
	end

	arg_1_0:registerEventHandler("non_empty_menu_stack", var_1_10)
	arg_1_0:registerEventHandler("empty_menu_stack", var_1_11)
end

function TutorialMessage(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 36 * _1080p)

	var_11_0.id = "TutorialMessage"
	var_11_0._animationSets = var_11_0._animationSets or {}
	var_11_0._sequences = var_11_0._sequences or {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3

	if not CONDITIONS.IsCoreMultiplayerNotBr(var_11_0) then
		var_11_3 = MenuBuilder.BuildRegisteredType("TutorialMessageBackground", {
			controllerIndex = var_11_1
		})
		var_11_3.id = "Background"

		var_11_3:SetAlpha(0, 0)
		var_11_3:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -600, _1080p * 600, _1080p * -18, _1080p * 18)
		var_11_0:addElement(var_11_3)

		var_11_0.Background = var_11_3
	end

	local var_11_4
	local var_11_5 = LUI.UIStyledText.new()

	var_11_5.id = "TutorialText"

	var_11_5:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_11_5:setText(LocalizeString(""), 0)
	var_11_5:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_11_5:SetAlignment(LUI.Alignment.Center)
	var_11_5:SetShadowMinDistance(-0.2, 0)
	var_11_5:SetShadowMaxDistance(0.2, 0)
	var_11_5:SetShadowUOffset(0.002, 0)
	var_11_5:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_11_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -550, _1080p * 550, _1080p * -15, _1080p * 15)
	var_11_0:addElement(var_11_5)

	var_11_0.TutorialText = var_11_5

	local function var_11_6()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_6

	local var_11_7

	if not CONDITIONS.IsCoreMultiplayerNotBr(var_11_0) then
		local var_11_8 = {
			{
				value = 1,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_3:RegisterAnimationSequence("FadeIn", var_11_8)
	end

	local var_11_9 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_5:RegisterAnimationSequence("FadeIn", var_11_9)

	local function var_11_10()
		if not CONDITIONS.IsCoreMultiplayerNotBr(var_11_0) then
			var_11_3:AnimateSequence("FadeIn")
		end

		var_11_5:AnimateSequence("FadeIn")
	end

	var_11_0._sequences.FadeIn = var_11_10

	local var_11_11

	if not CONDITIONS.IsCoreMultiplayerNotBr(var_11_0) then
		local var_11_12 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_3:RegisterAnimationSequence("FadeOut", var_11_12)
	end

	local var_11_13 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_5:RegisterAnimationSequence("FadeOut", var_11_13)

	local function var_11_14()
		if not CONDITIONS.IsCoreMultiplayerNotBr(var_11_0) then
			var_11_3:AnimateSequence("FadeOut")
		end

		var_11_5:AnimateSequence("FadeOut")
	end

	var_11_0._sequences.FadeOut = var_11_14

	local var_11_15

	if not CONDITIONS.IsCoreMultiplayerNotBr(var_11_0) then
		local var_11_16 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_11_3:RegisterAnimationSequence("FadeInInvalidCmd", var_11_16)
	end

	local var_11_17 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_5:RegisterAnimationSequence("FadeInInvalidCmd", var_11_17)

	local function var_11_18()
		if not CONDITIONS.IsCoreMultiplayerNotBr(var_11_0) then
			var_11_3:AnimateSequence("FadeInInvalidCmd")
		end

		var_11_5:AnimateSequence("FadeInInvalidCmd")
	end

	var_11_0._sequences.FadeInInvalidCmd = var_11_18

	local var_11_19
	local var_11_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 10
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10
		}
	}

	var_11_5:RegisterAnimationSequence("JP", var_11_20)

	local function var_11_21()
		var_11_5:AnimateSequence("JP")
	end

	var_11_0._sequences.JP = var_11_21

	if CONDITIONS.IsJapanese(var_11_0) then
		ACTIONS.AnimateSequence(var_11_0, "JP")
	end

	PostLoadFunc(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("TutorialMessage", TutorialMessage)
LockTable(_M)
