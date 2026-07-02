module(..., package.seeall)

FencePremiumInterface = LUI.Class(LUI.Fence)

function FencePremiumInterface.init(arg_1_0)
	FencePremiumInterface.super.init(arg_1_0)
end

function FencePremiumInterface.UpdateState(arg_2_0)
	arg_2_0._state = LUI.Fence.STATE.fail

	for iter_2_0 = 0, Engine.DCJGJDDEHE() - 1 do
		if arg_2_0:PassCondition(iter_2_0) then
			arg_2_0._state = LUI.Fence.STATE.pass

			break
		end
	end
end

FencePremium = LUI.Class(FencePremiumInterface)

function FencePremium.PassCondition(arg_3_0, arg_3_1)
	return Engine.CFHBIHABCB(arg_3_1)
end

function FencePremium.PostFail(arg_4_0)
	if arg_4_0._state == LUI.Fence.STATE.fail then
		local var_4_0 = Engine.IJEBHJIJF()

		Engine.DAGFFDGFII("xstopprivateparty", var_4_0)
		Engine.DAGFFDGFII("xstartprivateparty")
		LUI.FlowManager.RequestPopupMenu(nil, "BlockedPremiumMenuPopup", true, var_4_0, false, {}, nil, true, true)
	end
end

LUI.Fence.Register("premium", FencePremium)

FencePremiumOrLaunchChunk = LUI.Class(FencePremiumInterface)

function FencePremiumOrLaunchChunk.PassCondition(arg_5_0, arg_5_1)
	return Engine.CFHBIHABCB(arg_5_1) or CONDITIONS.IsLaunchChunk()
end

function FencePremiumOrLaunchChunk.PostFail(arg_6_0)
	if arg_6_0._state == LUI.Fence.STATE.fail then
		local var_6_0 = Engine.IJEBHJIJF()

		Engine.DAGFFDGFII("xstopprivateparty", var_6_0)
		Engine.DAGFFDGFII("xstartprivateparty")
	end
end

LUI.Fence.Register("premiumOrLaunchChunk", FencePremiumOrLaunchChunk)

function BlockedPremiumMenuPopup(arg_7_0, arg_7_1)
	local var_7_0 = {
		title = Engine.CBBHFCGDIC("LUA_MENU/NOT_AVAILABLE"),
		message = Engine.CBBHFCGDIC("LUA_MENU/UPSELL_MENU_BLOCKED"),
		buttons = {}
	}

	if CONDITIONS.ShouldDisplayUpsellPopup(arg_7_1.controllerIndex) then
		table.insert(var_7_0.buttons, {
			label = Engine.CBBHFCGDIC("LUA_MENU/PURCHASE_MW"),
			action = function(arg_8_0)
				LUI.FlowManager.RequestPopupMenu(nil, "StoreGameUpsellPopup", true, arg_7_1.controllerIndex, false, nil)
			end
		})
	end

	table.insert(var_7_0.buttons, {
		label = Engine.CBBHFCGDIC("MENU/BACK"),
		action = function()
			return
		end
	})

	local var_7_1 = MenuBuilder.BuildRegisteredType("PopupMessageAndButtons", var_7_0)

	var_7_1.id = "BlockedPremiumMenuPopup"

	return var_7_1
end

MenuBuilder.registerType("BlockedPremiumMenuPopup", BlockedPremiumMenuPopup)
LockTable(_M)
