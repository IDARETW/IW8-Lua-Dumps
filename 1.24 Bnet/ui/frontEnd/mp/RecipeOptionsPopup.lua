module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.buttonIndex)
	arg_1_0.RenameButton:addEventHandler("button_action", function(arg_2_0, arg_2_1)
		ACTIONS.LeaveMenu(arg_1_0)
		LUI.FlowManager.RequestPopupMenu(nil, "RecipeCreatePopup", true, arg_1_1, false, {
			renameOnly = true,
			saveSlot = arg_1_2.buttonIndex
		})
	end)

	local function var_1_0()
		MatchRules.DBIHEGAAEG(arg_1_2.buttonIndex)

		local var_3_0 = Dvar.CFHDGABACF("NPSTLPMPSS")

		if var_3_0 > -1 and var_3_0 == arg_1_2.buttonIndex then
			Dvar.DFIJDJFIFD("NPSTLPMPSS", -1)
		elseif var_3_0 > arg_1_2.buttonIndex then
			Dvar.DFIJDJFIFD("NPSTLPMPSS", var_3_0 - 1)
		end

		arg_1_0:dispatchEventToRoot({
			name = "recipe_delete_complete"
		})
	end

	arg_1_0.DeleteButton:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		ACTIONS.LeaveMenu(arg_1_0)
		LUI.FlowManager.RequestPopupMenu(nil, "PopupYesNo", true, arg_1_1, false, {
			yesAction = var_1_0,
			message = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_DELETE")
		})
	end)
	arg_1_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")))
end

function RecipeOptionsPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIVerticalNavigator.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 700 * _1080p, 0, 1080 * _1080p)

	var_5_0.id = "RecipeOptionsPopup"

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "RenameButton"

	var_5_4.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/RENAME")), 0)
	var_5_4.Text:SetAlignment(LUI.Alignment.Left)
	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 650, _1080p * 249, _1080p * 289)
	var_5_0:addElement(var_5_4)

	var_5_0.RenameButton = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("MenuButton", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "DeleteButton"

	var_5_6.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/DELETE")), 0)
	var_5_6.Text:SetAlignment(LUI.Alignment.Left)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 650, _1080p * 317, _1080p * 357)
	var_5_0:addElement(var_5_6)

	var_5_0.DeleteButton = var_5_6

	local var_5_7
	local var_5_8 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_5_1
	})

	var_5_8.id = "MenuTitle"

	var_5_8.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPTIONS")), 0)
	var_5_8.Line:SetLeft(0, 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1020, 0, _1080p * 100)
	var_5_0:addElement(var_5_8)

	var_5_0.MenuTitle = var_5_8

	var_0_0(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("RecipeOptionsPopup", RecipeOptionsPopup)
LockTable(_M)
