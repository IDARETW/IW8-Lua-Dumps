module(..., package.seeall)

local var_0_0 = "placeholder_x"
local var_0_1 = "hud_icon_snd_alive"
local var_0_2 = "hud_icon_player"
local var_0_3 = "hud_icon_player"
local var_0_4 = {
	0,
	15,
	9,
	5
}

local function var_0_5(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_0.playersLayout)

	if (arg_1_2 or arg_1_3) and not arg_1_1.won and not arg_1_1.lost then
		arg_1_0.playersLayout:SetAlpha(1)

		arg_1_0.playersLayout.visible = true
	elseif arg_1_0.playersLayout.visible then
		arg_1_0.playersLayout:SetAlpha(0)

		arg_1_0.playersLayout.visible = false
	end

	if arg_1_1.won then
		-- block empty
	elseif arg_1_0.playersLayout.visible then
		local var_1_0 = arg_1_0.playersLayout:getFirstChild()
		local var_1_1 = 1

		while var_1_0 do
			local var_1_2

			var_1_0.id = "child: Player" .. var_1_1

			if arg_1_3 then
				var_1_2 = arg_1_1.players[var_1_1].ready and var_0_2 or var_0_3

				if not arg_1_1.players[var_1_1].ready then
					var_1_0:SetRGBFromTable(SWATCHES.Tournament.winnerScore)

					var_1_0.isReadyUp = false
				elseif arg_1_0._teamData and arg_1_1.players[var_1_1].ready ~= arg_1_0._teamData.players[var_1_1].ready then
					if not var_1_0.isReadyUp then
						var_1_0:SetRGBFromTable(SWATCHES.Tournament.bracketBacker)
						var_1_0:SetScale(0.35)
						var_1_0:SetScale(0, 200, LUI.EASING.inQuadratic)

						var_1_0.isReadyUp = true
					end
				else
					var_1_0:SetRGBFromTable(SWATCHES.Tournament.bracketBacker)
				end
			else
				var_1_2 = arg_1_1.players[var_1_1].dead and var_0_0 or var_0_1
			end

			var_1_0:setImage(RegisterMaterial(var_1_2))

			var_1_1 = var_1_1 + 1
			var_1_0 = var_1_0:getNextSibling()
		end
	end

	arg_1_0._teamData = arg_1_1
end

local function var_0_6(arg_2_0, arg_2_1)
	assert(not arg_2_0.playersLayout)

	arg_2_0.playersLayout = LUI.UIHorizontalStackedLayout.new()

	arg_2_0.playersLayout:SetAnchorsAndPosition(0, 0, 0, 0, 10 * _1080p, -10 * _1080p, 0, 0)
	arg_2_0.playersLayout:SetAlignment(LUI.Alignment.Center)
	assert(var_0_4[arg_2_1])
	arg_2_0.playersLayout:SetSpacing(var_0_4[arg_2_1] * _1080p)
	arg_2_0.playersLayout:SetAlpha(0)

	for iter_2_0 = 1, arg_2_1 do
		local var_2_0 = LUI.UIImage.new()

		var_2_0:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, 20 * _1080p, -10 * _1080p, 10 * _1080p)
		arg_2_0.playersLayout:addElement(var_2_0)
		var_2_0:SetAlpha(1)
	end

	arg_2_0:addElement(arg_2_0.playersLayout)
end

local function var_0_7(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.Update = var_0_5
	arg_3_0.SetNumPlayers = var_0_6
end

function TournamentPlayerStatus(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 80 * _1080p, 0, 38 * _1080p)

	var_4_0.id = "TournamentPlayerStatus"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_0_7(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("TournamentPlayerStatus", TournamentPlayerStatus)
LockTable(_M)
