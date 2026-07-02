COLOR_BLIND = COLOR_BLIND or {}
COLOR_BLIND.modes = {
	deuteranope = 3,
	protanope = 2,
	tritanope = 4,
	none = 1
}
COLOR_BLIND.UIFilter = {}
COLOR_BLIND.UIFilter[COLOR_BLIND.modes.none] = {
	HUD = {
		enemyTeam = SWATCHES.HUD.enemyTeam,
		friendlyTeam = SWATCHES.HUD.friendlyTeam,
		contested = SWATCHES.HUD.contested,
		you = SWATCHES.HUD.you,
		party = SWATCHES.HUD.party
	},
	BattleRoyale = {
		BRPlayer1Color = SWATCHES.BattleRoyale.BRPlayer1Color,
		BRPlayer2Color = SWATCHES.BattleRoyale.BRPlayer2Color,
		BRPlayer3Color = SWATCHES.BattleRoyale.BRPlayer3Color,
		BRPlayer4Color = SWATCHES.BattleRoyale.BRPlayer4Color
	}
}
COLOR_BLIND.UIFilter[COLOR_BLIND.modes.protanope] = {
	HUD = {
		enemyTeam = COLORS.prot_enemy,
		friendlyTeam = COLORS.prot_ally,
		contested = COLORS.prot_contest,
		you = COLORS.prot_you,
		party = COLORS.prot_party
	},
	BattleRoyale = {
		BRPlayer1Color = COLORS.prot_player1,
		BRPlayer2Color = COLORS.prot_player2,
		BRPlayer3Color = COLORS.prot_player3,
		BRPlayer4Color = COLORS.prot_player4
	}
}
COLOR_BLIND.UIFilter[COLOR_BLIND.modes.deuteranope] = {
	HUD = {
		enemyTeam = COLORS.deut_enemy,
		friendlyTeam = COLORS.deut_ally,
		contested = COLORS.deut_contest,
		you = COLORS.deut_you,
		party = COLORS.deut_party
	},
	BattleRoyale = {
		BRPlayer1Color = COLORS.deut_player1,
		BRPlayer2Color = COLORS.deut_player2,
		BRPlayer3Color = COLORS.deut_player3,
		BRPlayer4Color = COLORS.deut_player4
	}
}
COLOR_BLIND.UIFilter[COLOR_BLIND.modes.tritanope] = {
	HUD = {
		enemyTeam = COLORS.trit_enemy,
		friendlyTeam = COLORS.trit_ally,
		contested = COLORS.trit_contest,
		you = COLORS.trit_you,
		party = COLORS.trit_party
	},
	BattleRoyale = {
		BRPlayer1Color = COLORS.trit_player1,
		BRPlayer2Color = COLORS.trit_player2,
		BRPlayer3Color = COLORS.trit_player3,
		BRPlayer4Color = COLORS.trit_player4
	}
}

function COLOR_BLIND.GetFilteredColor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0, var_1_1 = Engine.CBCJIDDIED(arg_1_0)
	local var_1_2 = var_1_1 and Engine.BECCFCBIAA("colorBlindMode", arg_1_0) + 1 or COLOR_BLIND.modes.none

	return COLOR_BLIND.UIFilter[var_1_2][arg_1_1][arg_1_2]
end

function COLOR_BLIND.UpdateAllSwatches(arg_2_0)
	local var_2_0, var_2_1 = Engine.CBCJIDDIED(arg_2_0)
	local var_2_2 = var_2_1 and Engine.BECCFCBIAA("colorBlindMode", arg_2_0) + 1 or COLOR_BLIND.modes.none

	for iter_2_0, iter_2_1 in pairs(COLOR_BLIND.UIFilter[var_2_2]) do
		for iter_2_2, iter_2_3 in pairs(iter_2_1) do
			SWATCHES[iter_2_0][iter_2_2] = iter_2_3
		end
	end
end

function COLOR_BLIND.UpdateSwatches()
	for iter_3_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if Engine.BBHAECABBD(iter_3_0) and Engine.BFDACIJIAD(iter_3_0) then
			COLOR_BLIND.UpdateAllSwatches(iter_3_0)
		end
	end
end
