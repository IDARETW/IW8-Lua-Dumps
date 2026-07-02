module(..., package.seeall)

local var_0_0 = {
	NO_AMMO_BULLETS = 1,
	NO_GRENADE = 11,
	NOT_ENOUGH_CLEARANCE = 8,
	CANT_USE_IN_PRONE = 13,
	NO_AMMO_GRENADE = 2,
	NO_AMMO_SECONDARY_GRENADE = 9,
	CROUCH_BLOCKED = 4,
	TURRET_BLOCKED = 12,
	PRONE_BLOCKED = 5,
	NO_AMMO_SPECIAL = 10,
	STAND_BLOCKED = 3,
	TARGET_TOO_CLOSE = 6,
	LOCKON_REQUIRED = 7,
	NONE = 0
}

local function var_0_1(arg_1_0)
	if CONDITIONS.IsMagmaGameMode() and DataSources.inGame.player.BRData.PlayerStatusIsZombie:GetValue(arg_1_0) == true and DataSources.inGame.HUD.hints.invalidCmdHintType:GetValue(arg_1_0) == var_0_0.NO_GRENADE then
		return false
	end

	return true
end

function PostLoadFunc(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.TutorialText)

	local var_2_0 = arg_2_0.TutorialText

	arg_2_0._controllerIndex = arg_2_1

	var_2_0:SetShadowUOffset(-0.001)
	var_2_0:SetShadowVOffset(-0.001)

	local var_2_1 = DataSources.inGame.HUD.hints.tutorialMessageText
	local var_2_2 = arg_2_0:GetCurrentAnchorsAndPositions()
	local var_2_3 = var_2_2.top
	local var_2_4 = var_2_2.bottom

	local function var_2_5(arg_3_0, arg_3_1)
		if not arg_3_0._lineHeight then
			local var_3_0, var_3_1, var_3_2, var_3_3 = arg_3_0.TutorialText:getLocalRect()

			arg_3_0._lineHeight = math.abs(var_3_3 - var_3_1)
			arg_3_0._lineMaxWidth = math.abs(var_3_2 - var_3_0)
		end

		local var_3_4 = arg_3_0._lineHeight
		local var_3_5 = arg_3_0._lineMaxWidth
		local var_3_6 = arg_3_0.TutorialText:GetCurrentFont()
		local var_3_7, var_3_8, var_3_9, var_3_10 = GetTextDimensions(arg_3_1, var_3_6, var_3_4, var_3_5)
		local var_3_11 = var_3_9 - var_3_7
		local var_3_12 = var_3_8 - var_3_10
		local var_3_13 = var_3_11 + 30
		local var_3_14 = var_3_12 + 20
		local var_3_15 = var_3_13 * 0.5
		local var_3_16 = var_3_14 * 0.5

		if not CONDITIONS.IsCoreMultiplayerNotBr(arg_3_0) then
			arg_3_0.Background:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -var_3_15, var_3_15, -var_3_16, var_3_16)
		end

		local var_3_17 = var_3_12 * -0.5
		local var_3_18 = var_3_17 + var_3_4

		arg_3_0.TutorialText:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 30, -30, var_3_17, var_3_18)
		arg_3_0.TutorialText:setText(arg_3_1)
	end

	local function var_2_6(arg_4_0, arg_4_1)
		if arg_4_1 ~= nil and arg_4_1 ~= "" and arg_4_1 ~= "none" then
			local var_4_0 = 0

			if Engine.CAADCDEEIA() and DataSources.inGame.SP.apacheVisible and DataSources.inGame.SP.apacheVisible:GetValue(arg_2_1) == 1 then
				var_4_0 = -72 * _1080p
			end

			arg_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, var_2_3 + var_4_0, var_2_4 + var_4_0)
			var_2_5(arg_4_0, arg_4_1)

			if DataSources.inGame.HUD.hints.invalidCmdHintShow:GetValue(arg_2_1) then
				if var_0_1(arg_2_1) then
					ACTIONS.AnimateSequence(arg_4_0, "FadeInInvalidCmd")
				end
			else
				ACTIONS.AnimateSequence(arg_4_0, "FadeIn")
			end
		else
			ACTIONS.AnimateSequence(arg_4_0, "FadeOut")
		end
	end

	local function var_2_7(arg_5_0)
		local var_5_0 = var_2_1:GetValue(arg_2_1)

		var_2_6(arg_5_0, var_5_0)
	end

	arg_2_0:SubscribeToModel(var_2_1:GetModel(arg_2_1), function()
		var_2_7(arg_2_0)
	end)
	var_2_7(arg_2_0)

	if CONDITIONS.IsMagmaGameMode() then
		local function var_2_8(arg_7_0)
			if DataSources.inGame.MP.brShowMountTutorial:GetValue(arg_2_1) then
				local var_7_0 = Engine.CEHIEICIFD(arg_2_1)

				var_2_6(arg_7_0, var_7_0)
			else
				var_2_7(arg_7_0)
			end
		end

		arg_2_0:SubscribeToModel(DataSources.inGame.MP.brShowMountTutorial:GetModel(arg_2_1), function()
			var_2_8(arg_2_0)
		end)
		var_2_8(arg_2_0)
	end

	arg_2_0._messageTextDataSource = var_2_1

	local function var_2_9(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_0._messageTextDataSource:GetValue(arg_9_0._controllerIndex)

		if var_9_0 ~= nil and var_9_0 ~= "" and var_9_0 ~= "none" then
			var_2_5(arg_9_0, var_9_0)
		else
			ACTIONS.AnimateSequence(arg_9_0, "FadeOut")
		end
	end

	local function var_2_10(arg_10_0, arg_10_1)
		arg_10_0:SetAlpha(0)
	end

	local function var_2_11(arg_11_0, arg_11_1)
		if Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() then
			var_2_9(arg_11_0, arg_11_1)
			arg_11_0:SetAlpha(1)
		end
	end

	arg_2_0:registerEventHandler("non_empty_menu_stack", var_2_10)
	arg_2_0:registerEventHandler("empty_menu_stack", var_2_11)
end

function TutorialMessage(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1200 * _1080p, 0, 36 * _1080p)

	var_12_0.id = "TutorialMessage"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		var_12_3 = MenuBuilder.BuildRegisteredType("TutorialMessageBackground", {
			controllerIndex = var_12_1
		})
		var_12_3.id = "Background"

		var_12_3:SetAlpha(0, 0)
		var_12_3:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -600, _1080p * 600, _1080p * -18, _1080p * 18)
		var_12_0:addElement(var_12_3)

		var_12_0.Background = var_12_3
	end

	local var_12_4
	local var_12_5 = LUI.UIStyledText.new()

	var_12_5.id = "TutorialText"

	var_12_5:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_12_5:setText(LocalizeString(""), 0)
	var_12_5:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_5:SetAlignment(LUI.Alignment.Center)
	var_12_5:SetShadowMinDistance(-0.2, 0)
	var_12_5:SetShadowMaxDistance(0.2, 0)
	var_12_5:SetShadowUOffset(0.002, 0)
	var_12_5:SetShadowRGBFromTable(SWATCHES.HUD.HUDShadow, 0)
	var_12_5:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -550, _1080p * 550, _1080p * -15, _1080p * 15)
	var_12_0:addElement(var_12_5)

	var_12_0.TutorialText = var_12_5

	local function var_12_6()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_6

	local var_12_7

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_12_8 = {
			{
				value = 1,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_3:RegisterAnimationSequence("FadeIn", var_12_8)
	end

	local var_12_9 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_5:RegisterAnimationSequence("FadeIn", var_12_9)

	local function var_12_10()
		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_12_3:AnimateSequence("FadeIn")
		end

		var_12_5:AnimateSequence("FadeIn")
	end

	var_12_0._sequences.FadeIn = var_12_10

	local var_12_11

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_12_12 = {
			{
				value = 0,
				duration = 300,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_3:RegisterAnimationSequence("FadeOut", var_12_12)
	end

	local var_12_13 = {
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_5:RegisterAnimationSequence("FadeOut", var_12_13)

	local function var_12_14()
		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_12_3:AnimateSequence("FadeOut")
		end

		var_12_5:AnimateSequence("FadeOut")
	end

	var_12_0._sequences.FadeOut = var_12_14

	local var_12_15

	if not CONDITIONS.IsCoreMultiplayerNotBr() then
		local var_12_16 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_3:RegisterAnimationSequence("FadeInInvalidCmd", var_12_16)
	end

	local var_12_17 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_5:RegisterAnimationSequence("FadeInInvalidCmd", var_12_17)

	local function var_12_18()
		if not CONDITIONS.IsCoreMultiplayerNotBr() then
			var_12_3:AnimateSequence("FadeInInvalidCmd")
		end

		var_12_5:AnimateSequence("FadeInInvalidCmd")
	end

	var_12_0._sequences.FadeInInvalidCmd = var_12_18

	PostLoadFunc(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("TutorialMessage", TutorialMessage)
LockTable(_M)
