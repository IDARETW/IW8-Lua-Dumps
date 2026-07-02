module(..., package.seeall)
CoD.PrintModuleLoad(_NAME)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = {
		title = Engine.CBBHFCGDIC("CAS/MOD_SLOTS_FULL")
	}

	var_1_0.imageOverride = "icon_warning_large"

	local var_1_1 = arg_1_1.weaponRef or "iw8_ar_akilo47"
	local var_1_2 = WEAPON.GetName(var_1_1)

	var_1_0.message = Engine.CBBHFCGDIC("CAS/SLOTS_FULL_DESC", var_1_2, 0)
	var_1_0.controllerIndex = arg_1_1.controllerIndex
	var_1_0.buttons = {
		{
			type = "GenericHoldButton",
			label = Engine.CBBHFCGDIC("CAS/DELETE_MODIFICATION"),
			action = function()
				local var_2_0 = {}

				var_2_0.deletingForWeapon = true
				var_2_0.weaponRef = var_1_1

				LUI.FlowManager.RequestAddMenu("WeaponLocker", true, arg_1_1.controllerIndex, true, var_2_0)
			end
		},
		{
			label = Engine.CBBHFCGDIC("LUA_MENU/CANCEL"),
			action = function()
				LUI.FlowManager.RequestLeaveMenu()
			end
		}
	}

	return MenuBuilder.BuildRegisteredType("GenericImagePopup", var_1_0)
end

MenuBuilder.registerType("CustomModSlotsFull", var_0_0)
LockTable(_M)
