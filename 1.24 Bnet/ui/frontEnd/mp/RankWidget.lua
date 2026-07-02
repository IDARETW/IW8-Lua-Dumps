module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Rank)
	assert(arg_1_0.RankIcon)
	arg_1_0.Rank:SetShadowVOffset(-0.001)
	arg_1_0.Rank:SetShadowVOffset(-0.001)
	arg_1_0.Rank:setText(PROGRESSION.GetPlayerRank(arg_1_1))
	arg_1_0.RankIcon:setImage(RegisterMaterial(PROGRESSION.GetPlayerRankIcon(arg_1_1)))
end

function RankWidget(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 40 * _1080p)

	var_2_0.id = "RankWidget"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "RankIcon"

	var_2_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16)
	var_2_0:addElement(var_2_4)

	var_2_0.RankIcon = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "Rank"

	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_2_6:SetStartupDelay(1250)
	var_2_6:SetLineHoldTime(400)
	var_2_6:SetAnimMoveTime(300)
	var_2_6:SetEndDelay(1000)
	var_2_6:SetCrossfadeTime(500)
	var_2_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_2_6:SetMaxVisibleLines(1)
	var_2_6:SetShadowMinDistance(-0.2, 0)
	var_2_6:SetShadowMaxDistance(0.2, 0)
	var_2_6:SetShadowRGBFromInt(0, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 37, 0, _1080p * -9, _1080p * 13)
	var_2_0:addElement(var_2_6)

	var_2_0.Rank = var_2_6

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("RankWidget", RankWidget)
LockTable(_M)
