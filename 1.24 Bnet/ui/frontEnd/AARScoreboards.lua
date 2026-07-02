module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	if CONDITIONS.InFrontend(arg_1_0) and AAR.IsScoreboardDataValid(arg_1_1) then
		local var_1_0

		if CONDITIONS.IsCoreMultiplayer() then
			if AAR.IsBRFrontendScoreboardAvailable() then
				local var_1_1 = "BrTeamScoreboard"

				if CONDITIONS.IsInGameNewAARScoreboardEnabled(arg_1_0) then
					var_1_1 = "BRAARScoreboard"
				end

				var_1_0 = MenuBuilder.BuildRegisteredType(var_1_1, {
					controllerIndex = arg_1_1
				})
				var_1_0.id = "AARBrScoreboard"

				var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 354, _1080p * 1080)
			elseif AAR.IsFFAMatch(arg_1_1) then
				var_1_0 = MenuBuilder.BuildRegisteredType("AARFFAScoreboard", {
					controllerIndex = arg_1_1
				})
				var_1_0.id = "AARFFAScoreboard"

				var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 96, _1080p * 1080)
			else
				var_1_0 = MenuBuilder.BuildRegisteredType("AARTeamScoreboard", {
					controllerIndex = arg_1_1
				})
				var_1_0.id = "AARTeamScoreboard"

				var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, -100, _1080p * 1920, _1080p * 200, _1080p * 1000)
			end
		else
			var_1_0 = MenuBuilder.BuildRegisteredType("CPAARScoreboard", {
				controllerIndex = arg_1_1
			})
			var_1_0.id = "CPAARScoreboard"

			var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1920, _1080p * 96, _1080p * 1080)
		end

		arg_1_0:addElement(var_1_0)

		arg_1_0.AARTScoreboard = var_1_0

		arg_1_0.AARTScoreboard:SetAlpha(0)
		arg_1_0.AARTScoreboard:SetAlpha(1, 200)
	end
end

function AARScoreboards(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "AARScoreboards"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0

	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("AARScoreboards", AARScoreboards)
LockTable(_M)
