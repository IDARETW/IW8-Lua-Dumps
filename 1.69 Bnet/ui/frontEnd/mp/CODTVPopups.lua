module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

function CODTVFencePopup(arg_1_0, arg_1_1)
	assert(arg_1_1 and arg_1_1.onCancel and arg_1_1.callingFence)

	local var_1_0 = {
		message = Engine.CBBHFCGDIC("CODTV/FENCE_TEXT"),
		cancel_func = arg_1_1.onCancel
	}
	local var_1_1 = MenuBuilder.BuildRegisteredType("live_dialog_text_box", var_1_0)

	var_1_1.id = "CODTVFencePopup"
	var_1_1.fence = arg_1_1.callingFence

	return var_1_1
end

MenuBuilder.registerType("CODTVFencePopup", CODTVFencePopup)
