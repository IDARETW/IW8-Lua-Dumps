module(..., package.seeall)

function TournamentFinalsBracket(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIElement.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 816 * _1080p, 0, 738 * _1080p)

	var_1_0.id = "TournamentFinalsBracket"

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("TournamentRoundTitle", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "TournamentRoundTitle"

	var_1_4:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -294, _1080p * 294, _1080p * 393, _1080p * 434)
	var_1_0:addElement(var_1_4)

	var_1_0.TournamentRoundTitle = var_1_4

	local var_1_5
	local var_1_6 = MenuBuilder.BuildRegisteredType("MatchGroupFinals", {
		controllerIndex = var_1_1
	})

	var_1_6.id = "MatchGroup1"

	var_1_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -408, _1080p * 408, _1080p * 444, _1080p * 586)
	var_1_0:addElement(var_1_6)

	var_1_0.MatchGroup1 = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "TrophyFlare"

	var_1_8:SetAlpha(0, 0)
	var_1_8:setImage(RegisterMaterial("arena_winner_flare_temp"), 0)
	var_1_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -198, _1080p * 198, _1080p * -514, _1080p * -118)
	var_1_0:addElement(var_1_8)

	var_1_0.TrophyFlare = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("TournamentLogo", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "TournamentLogo"

	var_1_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -311, _1080p * 9)
	var_1_0:addElement(var_1_10)

	var_1_0.TournamentLogo = var_1_10

	return var_1_0
end

MenuBuilder.registerType("TournamentFinalsBracket", TournamentFinalsBracket)
LockTable(_M)
