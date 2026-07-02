module(..., package.seeall)

function TournamentResultRewardList(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalStackedLayout.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1714 * _1080p, 0, 158 * _1080p)

	var_1_0.id = "TournamentResultRewardList"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(36 * _1080p)

	return var_1_0
end

MenuBuilder.registerType("TournamentResultRewardList", TournamentResultRewardList)
LockTable(_M)
