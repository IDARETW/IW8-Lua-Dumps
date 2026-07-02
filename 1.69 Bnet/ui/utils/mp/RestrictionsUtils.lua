Restrictions = Restrictions or {}

function Restrictions.AreSupersRestricted()
	return not Dvar.IBEGCHEFE("scr_game_allowsupers") or not Dvar.IBEGCHEFE("scr_war_allowsupers")
end

function Restrictions.AreKillStreaksRestricted()
	return not Dvar.IBEGCHEFE("scr_game_allowkillstreaks") or not Dvar.IBEGCHEFE("scr_war_allowkillstreaks")
end

function Restrictions.ArePerksRestricted()
	return not Dvar.IBEGCHEFE("scr_game_allowperks")
end

function Restrictions.IsPerkRestricted(arg_4_0)
	return Restrictions.ArePerksRestricted() or MatchRules.CJBJJHJCI(arg_4_0)
end

function Restrictions.AreBarebonesRulesInUse()
	return Restrictions.AreSupersRestricted() and Restrictions.AreKillStreaksRestricted() and Restrictions.ArePerksRestricted()
end

function Restrictions.AreAnyRestrictionInUse(arg_6_0)
	return Restrictions.AreSupersRestricted() and Restrictions.AreKillStreaksRestricted() and Restrictions.ArePerksRestricted() or LOADOUT.MATCHRULES.IsThereARestrictedKillstreak(arg_6_0) and LOADOUT.MATCHRULES.IsThereARestrictedFieldUpgrade(arg_6_0) and LOADOUT.MATCHRULES.IsThereARestrictedLoadout(arg_6_0)
end
