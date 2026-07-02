CODCASTER_CONDITIONS = {
	IsCODCastingAllowed = function()
		return CODCASTER.CanCODCast()
	end,
	IsCODCaster = function()
		return CODCASTER.IsCODCaster()
	end,
	IsMPCODCaster = function()
		return Engine.ECHCFGDDDF() and CODCASTER.CanCODCast() and CODCASTER.IsCODCaster()
	end
}
