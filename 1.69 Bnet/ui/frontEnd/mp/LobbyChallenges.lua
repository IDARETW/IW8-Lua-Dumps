module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Challenge.DebugGetChallengesData(arg_1_1)
	local var_1_1 = {
		arg_1_0.ChallengeInfo1,
		arg_1_0.ChallengeInfo2,
		arg_1_0.ChallengeInfo3
	}
	local var_1_2 = math.min(#var_1_0, #var_1_1)

	for iter_1_0 = 1, var_1_2 do
		var_1_1[iter_1_0]:SetupChallengeInfo(var_1_0[iter_1_0])
	end
end

function LobbyChallenges(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 300 * _1080p)

	var_2_0.id = "LobbyChallenges"

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

	var_2_4.id = "Background"

	var_2_4:SetAlpha(0.5, 0)
	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Background = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "MoreChallenges"

	var_2_6:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU/MORE_CHALLENGES"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 40, _1080p * 500, _1080p * 9, _1080p * 31)
	var_2_0:addElement(var_2_6)

	var_2_0.MoreChallenges = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("ChallengeLabel", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "ChallengeInfo1"

	var_2_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 67, _1080p * -23, _1080p * 70, _1080p * 110)
	var_2_0:addElement(var_2_8)

	var_2_0.ChallengeInfo1 = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("ChallengeLabel", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "ChallengeInfo2"

	var_2_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 67, _1080p * -23, _1080p * 150, _1080p * 190)
	var_2_0:addElement(var_2_10)

	var_2_0.ChallengeInfo2 = var_2_10

	local var_2_11
	local var_2_12 = MenuBuilder.BuildRegisteredType("ChallengeLabel", {
		controllerIndex = var_2_1
	})

	var_2_12.id = "ChallengeInfo3"

	var_2_12:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 67, _1080p * -23, _1080p * 230, _1080p * 270)
	var_2_0:addElement(var_2_12)

	var_2_0.ChallengeInfo3 = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "ButtonImage"

	var_2_14:SetRGBFromTable(SWATCHES.Lobby.Default, 0)
	var_2_14:setImage(RegisterMaterial("button_select"), 0)
	var_2_14:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 5, _1080p * 35, _1080p * 5, _1080p * 35)
	var_2_0:addElement(var_2_14)

	var_2_0.ButtonImage = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIImage.new()

	var_2_16.id = "Divider"

	var_2_16:SetRGBFromTable(SWATCHES.genericMenu.headerBoarder, 0)
	var_2_16:setImage(RegisterMaterial("widg_gradient_left_to_right"), 0)
	var_2_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 46, _1080p * 47)
	var_2_0:addElement(var_2_16)

	var_2_0.Divider = var_2_16

	local var_2_17
	local var_2_18 = LUI.UIText.new()

	var_2_18.id = "ChallengesTitle"

	var_2_18:SetRGBFromTable(SWATCHES.genericMenu.header, 0)
	var_2_18:setText(Engine.CBBHFCGDIC("LUA_MENU/CHALLENGES"), 0)
	var_2_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_18:SetAlignment(LUI.Alignment.Left)
	var_2_18:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 20, 0, _1080p * 17, _1080p * 41)
	var_2_0:addElement(var_2_18)

	var_2_0.ChallengesTitle = var_2_18

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("LobbyChallenges", LobbyChallenges)
LockTable(_M)
