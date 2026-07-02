module(..., package.seeall)

FenceFNF = LUI.Class(LUI.Fence)

function FenceFNF.init(arg_1_0)
	FenceFNF.super.init(arg_1_0)
end

function FenceFNF.Start(arg_2_0)
	DebugPrint("FenceFNF.Start")
end

function FenceFNF.Stop(arg_3_0)
	DebugPrint("FenceFNF.Stop")
end

function FenceFNF.UpdateState(arg_4_0)
	assert(arg_4_0._state ~= LUI.Fence.STATE.fail)

	local var_4_0 = Dvar.IBEGCHEFE("NTSTSTRPTO") == true

	arg_4_0._packageType = Dvar.DHEEJCCJBH("LMMLNRSLKS")

	if var_4_0 or arg_4_0._packageType ~= "autobuild_mp" and arg_4_0._packageType ~= "current_mp_fnf" then
		arg_4_0._state = LUI.Fence.STATE.pass

		return
	end

	arg_4_0._buildNumber = Engine.DGCGDAJCCI()
	arg_4_0._expectedBuildNumber = Dvar.CFHDGABACF("MQPMMLSOOM")

	if arg_4_0._expectedBuildNumber == 0 or arg_4_0._buildNumber == arg_4_0._expectedBuildNumber then
		arg_4_0._state = LUI.Fence.STATE.pass

		return
	end

	if not LUI.FlowManager.IsInStack("BadBuild") then
		local var_4_1 = "You are running an outdated build. You may not be able to participate in Friday Night Fights.\nThis build: '%s'\nCorrect build: '%s'\nPackage type: '%s'"
		local var_4_2 = string.format(var_4_1, tostring(arg_4_0._buildNumber), tostring(arg_4_0._expectedBuildNumber), tostring(arg_4_0._packageType))

		LUI.FlowManager.RequestPopupMenu(nil, "BadBuild", false, nil, false, {
			message = var_4_2
		}, nil, true, false)
	end

	arg_4_0._state = LUI.Fence.STATE.block
end

local function var_0_0(arg_5_0, arg_5_1)
	assert(arg_5_1)
	assert(arg_5_1.message)

	local var_5_0 = {
		title = Engine.CBBHFCGDIC("MENU/ERROR"),
		message = arg_5_1.message
	}

	var_5_0.label = "Play Anyway"

	function var_5_0.action()
		Dvar.DHEGHJJJHI("NTSTSTRPTO", true)
	end

	local var_5_1 = MenuBuilder.BuildRegisteredType("PopupOK", var_5_0)

	var_5_1.id = "BadBuild"

	return var_5_1
end

MenuBuilder.registerType("BadBuild", var_0_0)
LUI.Fence.Register("fnf", FenceFNF)
LockTable(_M)
