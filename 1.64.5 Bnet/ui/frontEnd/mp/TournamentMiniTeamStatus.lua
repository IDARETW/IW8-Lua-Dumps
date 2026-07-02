module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = TOURNAMENT.GetTeamData(arg_1_1, arg_1_2, arg_1_3)

	arg_1_0.Name:setText(var_1_0.name)
	arg_1_0.Score:setText(var_1_0.wins)
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.Name)
	assert(arg_2_0.Score)

	arg_2_0.Update = var_0_0
end

function TournamentMiniTeamStatus(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 380 * _1080p, 0, 54 * _1080p)

	var_3_0.id = "TournamentMiniTeamStatus"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromInt(0, 0)
	var_3_4:SetAlpha(0.7, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Color"

	var_3_6:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 14, 0, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Color = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "Name"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 18, _1080p * 282, _1080p * 16, _1080p * 38)
	var_3_0:addElement(var_3_8)

	var_3_0.Name = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "Score"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Right)
	var_3_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 290, _1080p * -8, _1080p * 15, _1080p * 39)
	var_3_0:addElement(var_3_10)

	var_3_0.Score = var_3_10

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("TournamentMiniTeamStatus", TournamentMiniTeamStatus)
LockTable(_M)
