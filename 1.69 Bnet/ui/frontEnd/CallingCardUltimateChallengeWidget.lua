module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.ChallengeHeader.Line:SetAlpha(0)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function CallingCardUltimateChallengeWidget(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1100 * _1080p, 0, 200 * _1080p)

	var_2_0.id = "CallingCardUltimateChallengeWidget"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "DoubleNotchedBacker"

	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1100, 0, _1080p * 200)
	var_2_0:addElement(var_2_4)

	var_2_0.DoubleNotchedBacker = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("MPChallengeProgressBar", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "ChallengeProgressBar"

	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 545, _1080p * 130, _1080p * 147)
	var_2_0:addElement(var_2_6)

	var_2_0.ChallengeProgressBar = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "UltimateChallenge"

	var_2_8:setText(Engine.CBBHFCGDIC("CHALLENGE/ULTIMATE_CHALLENGE"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 520, _1080p * 23, _1080p * 53)
	var_2_0:addElement(var_2_8)

	var_2_0.UltimateChallenge = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("ChallengeHeader", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "ChallengeHeader"

	var_2_10.Title:setText("", 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 546, _1080p * 80, _1080p * 120)
	var_2_0:addElement(var_2_10)

	var_2_0.ChallengeHeader = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "Reward"

	var_2_12:SetRGBFromTable(SWATCHES.genericMenu.frame, 0)
	var_2_12:setText(Engine.CBBHFCGDIC("LUA_MENU/REWARD"), 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 585, _1080p * 680, _1080p * 23, _1080p * 47)
	var_2_0:addElement(var_2_12)

	var_2_0.Reward = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIText.new()

	var_2_14.id = "RewardName"

	var_2_14:setText("", 0)
	var_2_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_14:SetAlignment(LUI.Alignment.Left)
	var_2_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 585, _1080p * 873, _1080p * 88, _1080p * 106)
	var_2_0:addElement(var_2_14)

	var_2_0.RewardName = var_2_14

	local var_2_15
	local var_2_16 = MenuBuilder.BuildRegisteredType("QualityWithText", {
		controllerIndex = var_2_1
	})

	var_2_16.id = "QualityWithText"

	var_2_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 585, _1080p * 745, _1080p * 130, _1080p * 162)
	var_2_0:addElement(var_2_16)

	var_2_0.QualityWithText = var_2_16

	local var_2_17
	local var_2_18 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_2_1
	})

	var_2_18.id = "LootItemCardMini"

	var_2_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 950, _1080p * 1100, 0, _1080p * 200)
	var_2_0:addElement(var_2_18)

	var_2_0.LootItemCardMini = var_2_18

	local function var_2_19()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_19

	local var_2_20
	local var_2_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText
		}
	}

	var_2_12:RegisterAnimationSequence("WZWipSetup", var_2_21)

	local function var_2_22()
		var_2_12:AnimateSequence("WZWipSetup")
	end

	var_2_0._sequences.WZWipSetup = var_2_22

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("CallingCardUltimateChallengeWidget", CallingCardUltimateChallengeWidget)
LockTable(_M)
