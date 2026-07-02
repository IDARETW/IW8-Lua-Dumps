CODCASTER_CONDITIONS = {
	IsCODCastingAllowed = function(arg_1_0)
		return CODCASTER.CanCODCast()
	end,
	IsCODCaster = function(arg_2_0)
		return CODCASTER.IsCODCaster()
	end,
	IsMPCODCaster = function()
		return Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and CODCASTER.IsCODCaster()
	end
}
