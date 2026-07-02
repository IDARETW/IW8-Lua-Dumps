module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		arg_1_0.TournamentMapInfoRound1,
		arg_1_0.TournamentMapInfoQuarterFinals,
		arg_1_0.TournamentMapInfoSemiFinals,
		arg_1_0.TournamentMapInfoFinal
	}

	for iter_1_0 = 1, #var_1_0 do
		local var_1_1 = TOURNAMENT.GetMapInfoForRound(iter_1_0)

		if var_1_1 then
			if var_1_1.name and #var_1_1.name > 0 then
				var_1_0[iter_1_0].MapName:setText(Engine.CBBHFCGDIC(var_1_1.name))
			end

			if var_1_1.image and #var_1_1.image > 0 then
				var_1_0[iter_1_0].MapImage:setImage(RegisterMaterial(var_1_1.image))
			end
		end
	end
end

function TournamentMapInfoList(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIVerticalStackedLayout.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 375 * _1080p, 0, 500 * _1080p)

	var_2_0.id = "TournamentMapInfoList"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	var_2_0:SetSpacing(22 * _1080p)

	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("TournamentMapInfo", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "TournamentMapInfoRound1"

	var_2_4.Round:setText(Engine.CBBHFCGDIC("TOURNAMENT/ROUND_ONE"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 375, 0, _1080p * 108)
	var_2_0:addElement(var_2_4)

	var_2_0.TournamentMapInfoRound1 = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("TournamentMapInfo", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "TournamentMapInfoQuarterFinals"

	var_2_6.Round:setText(Engine.CBBHFCGDIC("TOURNAMENT/QUARTER_FINALS"), 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 375, _1080p * 130, _1080p * 238)
	var_2_0:addElement(var_2_6)

	var_2_0.TournamentMapInfoQuarterFinals = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("TournamentMapInfo", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "TournamentMapInfoSemiFinals"

	var_2_8.Round:setText(Engine.CBBHFCGDIC("TOURNAMENT/SEMI_FINALS"), 0)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 375, _1080p * 260, _1080p * 368)
	var_2_0:addElement(var_2_8)

	var_2_0.TournamentMapInfoSemiFinals = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("TournamentMapInfo", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "TournamentMapInfoFinal"

	var_2_10.Round:setText(Engine.CBBHFCGDIC("TOURNAMENT/FINAL"), 0)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 375, _1080p * 390, _1080p * 498)
	var_2_0:addElement(var_2_10)

	var_2_0.TournamentMapInfoFinal = var_2_10

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("TournamentMapInfoList", TournamentMapInfoList)
LockTable(_M)
