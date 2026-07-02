LUI.UIWeaponModel = LUI.Class(LUI.UIElement)

function LUI.UIWeaponModel.init(arg_1_0, arg_1_1)
	LUI.UIWeaponModel.super.init(arg_1_0)
	assert(arg_1_1)
	assert(arg_1_1.controllerIndex)
	assert(arg_1_1.clientWeaponIndex)
	assert(arg_1_1.basePosition)

	arg_1_0._clientWeaponIndex = arg_1_1.clientWeaponIndex
	arg_1_0._dataCSVFile = arg_1_1.dataCSVFile or CSV.weaponOffsets.file

	local var_1_0 = {
		base2DPosition = arg_1_1.basePosition
	}

	arg_1_0._baseOffsets = arg_1_1.baseOffsets

	arg_1_0:SetupWeaponModel(var_1_0)
	arg_1_0:SetWeaponIndex(arg_1_0._clientWeaponIndex)
end

function LUI.UIWeaponModel.GetDebugOffsets(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = Dvar.BJJCJHDBII("SQNKKRMN")
	local var_2_1 = Dvar.BJJCJHDBII("LOKLRRNSSM")
	local var_2_2 = Dvar.BJJCJHDBII("RLOROROPR")
	local var_2_3 = Dvar.BJJCJHDBII("OKOMQMTSOK")
	local var_2_4 = Dvar.BJJCJHDBII("NKQRRKPMPR")
	local var_2_5 = Dvar.BJJCJHDBII("MTKOSMRROQ")

	if var_2_0 ~= arg_2_1 then
		arg_2_1 = var_2_0
	end

	if var_2_1 ~= arg_2_2 then
		arg_2_2 = var_2_1
	end

	if var_2_2 ~= arg_2_3 then
		arg_2_3 = var_2_2
	end

	arg_2_1 = arg_2_1 + var_2_3
	arg_2_2 = arg_2_2 + var_2_4
	arg_2_3 = arg_2_3 + var_2_5

	return arg_2_1, arg_2_2, arg_2_3
end

function LUI.UIWeaponModel.GetDebugRotations(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = Dvar.BJJCJHDBII("LMORQMKNQS")
	local var_3_1 = Dvar.BJJCJHDBII("LQPRNSLLNN")
	local var_3_2 = Dvar.BJJCJHDBII("MPSMRTRLNL")

	if var_3_0 ~= arg_3_1 then
		arg_3_1 = var_3_0
	end

	if var_3_1 ~= arg_3_2 then
		arg_3_2 = var_3_1
	end

	if var_3_2 ~= arg_3_3 then
		arg_3_3 = var_3_2
	end

	return arg_3_1, arg_3_2, arg_3_3
end

function LUI.UIWeaponModel.ApplyBaseOffsets(arg_4_0, arg_4_1)
	if arg_4_0._baseOffsets then
		local var_4_0 = arg_4_0._baseOffsets

		if var_4_0.xOffset then
			arg_4_1.xOffset = arg_4_1.xOffset + var_4_0.xOffset
		end

		if var_4_0.yOffset then
			arg_4_1.yOffset = arg_4_1.yOffset + var_4_0.yOffset
		end

		if var_4_0.zOffset then
			arg_4_1.zOffset = arg_4_1.zOffset + var_4_0.zOffset
		end
	end
end

function LUI.UIWeaponModel.SetOffsetsAndRotations(arg_5_0, arg_5_1)
	assert(arg_5_0._clientWeaponIndex)

	local var_5_0 = arg_5_0._clientWeaponIndex
	local var_5_1 = FrontEndScene.GetWeaponModelOffset(arg_5_1, arg_5_0._dataCSVFile)

	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("LPKPKPTMKR") then
		var_5_1.xOffset, var_5_1.yOffset, var_5_1.zOffset = arg_5_0:GetDebugOffsets(var_5_1.xOffset, var_5_1.yOffset, var_5_1.zOffset)
	end

	arg_5_0:ApplyBaseOffsets(var_5_1)
	arg_5_0:SetWeaponOffset(var_5_1.xOffset, var_5_1.yOffset, var_5_1.zOffset)
	ClientWeapon.CEFJAHCDGA(var_5_0, var_5_1.xRotationCenter, var_5_1.yRotationCenter, var_5_1.zRotationCenter)

	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("LPKPKPTMKR") then
		var_5_1.pitch, var_5_1.yaw, var_5_1.roll = arg_5_0:GetDebugRotations(var_5_1.pitch, var_5_1.yaw, var_5_1.roll)
	end

	ClientWeapon.EAADFDDHJF(var_5_0, var_5_1.pitch, var_5_1.yaw, var_5_1.roll)
end

function LUI.UIWeaponModel.GetOffsetsAndRotations(arg_6_0, arg_6_1)
	assert(arg_6_0._clientWeaponIndex)

	local var_6_0 = arg_6_0._clientWeaponIndex
	local var_6_1 = FrontEndScene.GetWeaponModelOffset(arg_6_1, arg_6_0._dataCSVFile)

	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("LPKPKPTMKR") then
		var_6_1.xOffset, var_6_1.yOffset, var_6_1.zOffset = arg_6_0:GetDebugOffsets(var_6_1.xOffset, var_6_1.yOffset, var_6_1.zOffset)
	end

	if Engine.BHICADFIHA() and Dvar.IBEGCHEFE("LPKPKPTMKR") then
		var_6_1.pitch, var_6_1.yaw, var_6_1.roll = arg_6_0:GetDebugRotations(var_6_1.pitch, var_6_1.yaw, var_6_1.roll)
	end

	return var_6_1
end

function LUI.UIWeaponModel.SetWeaponModel(arg_7_0, arg_7_1)
	assert(arg_7_0._clientWeaponIndex)

	local var_7_0 = arg_7_0._clientWeaponIndex

	FrontEndScene.SetWeaponModel(var_7_0, arg_7_1)
	arg_7_0:SetOffsetsAndRotations(arg_7_1)
	ClientWeapon.BHDGACCFEF(var_7_0, true)
end

function LUI.UIWeaponModel.GetEntityNum(arg_8_0)
	assert(arg_8_0._clientWeaponIndex)

	local var_8_0 = arg_8_0._clientWeaponIndex

	return ClientWeapon.CJABBBHHFC(var_8_0)
end

LUI.UIWeaponModel.id = "UIWeaponModel"
