module(..., package.seeall)

local var_0_0 = 10
local var_0_1 = 15

local function var_0_2(arg_1_0, arg_1_1)
	for iter_1_0 = 1, var_0_0 do
		ACTIONS.AnimateSequence(arg_1_0._pips[iter_1_0], "NotHighlighted")

		if iter_1_0 <= arg_1_1 then
			ACTIONS.AnimateSequence(arg_1_0._pips[iter_1_0], "Highlighted")
		end
	end

	arg_1_0.CompletedChallenges:setText(Engine.CBBHFCGDIC("LUA_MENU/X_OF_Y", arg_1_1, var_0_0))
end

local function var_0_3(arg_2_0, arg_2_1)
	local var_2_0 = 30
	local var_2_1 = var_2_0 + var_0_1

	for iter_2_0 = 1, var_0_0 do
		local var_2_2
		local var_2_3 = MenuBuilder.BuildRegisteredType("Pip", {
			controllerIndex = arg_2_1
		})

		var_2_3.id = "FillPip"

		var_2_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_2_0, _1080p * var_2_1, _1080p * 400, _1080p * 410)
		arg_2_0:addElement(var_2_3)
		table.insert(arg_2_0._pips, var_2_3)

		var_2_0 = var_2_1 + 5
		var_2_1 = var_2_0 + var_0_1
	end
end

local function var_0_4(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._pips = {}
	arg_3_0.UpdatePips = var_0_2

	var_0_3(arg_3_0, arg_3_1)
end

function MasterChallengesWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 800 * _1080p)

	var_4_0.id = "MasterChallengesWidget"

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

	var_4_4.id = "DoubleNotchedBacker"

	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 800)
	var_4_0:addElement(var_4_4)

	var_4_0.DoubleNotchedBacker = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIText.new()

	var_4_6.id = "HeaderLabel"

	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Center)
	var_4_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 28, _1080p * 58)
	var_4_0:addElement(var_4_6)

	var_4_0.HeaderLabel = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIText.new()

	var_4_8.id = "MasterChallengeCompletionText"

	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Center)
	var_4_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 400, _1080p * 344, _1080p * 372)
	var_4_0:addElement(var_4_8)

	var_4_0.MasterChallengeCompletionText = var_4_8

	local var_4_9
	local var_4_10 = MenuBuilder.BuildRegisteredType("LootItemCardMini", {
		controllerIndex = var_4_1
	})

	var_4_10.id = "LootItemCardMini"

	var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 125, _1080p * 275, _1080p * 538, _1080p * 738)
	var_4_0:addElement(var_4_10)

	var_4_0.LootItemCardMini = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIImage.new()

	var_4_12.id = "Shield"

	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 89, _1080p * 311, _1080p * 85, _1080p * 286)
	var_4_0:addElement(var_4_12)

	var_4_0.Shield = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIText.new()

	var_4_14.id = "CompletedChallenges"

	var_4_14:setText("1/10", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_14:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetVerticalAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 94, _1080p * 306, _1080p * 450, _1080p * 467)
	var_4_0:addElement(var_4_14)

	var_4_0.CompletedChallenges = var_4_14

	var_0_4(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MasterChallengesWidget", MasterChallengesWidget)
LockTable(_M)
