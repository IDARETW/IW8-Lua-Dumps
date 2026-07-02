module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._controllerIndex = arg_1_1

	assert(arg_1_0.MenuTitle)
	arg_1_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_REGIMENT"))

	if Engine.DDJFBBJAIG() then
		FrontEndScene.HideAllCharacters()
		Engine.DHFCHIIJCA("squad_lobby")
	end

	assert(arg_1_2.clanID)
	assert(arg_1_2.localClientRole)

	arg_1_0._clanID = arg_1_2.clanID
	arg_1_0._localClientRole = arg_1_2.localClientRole
	arg_1_0.ManagementButtons._clanID = arg_1_2.clanID

	arg_1_0.ManagementButtons.HappyHourButton:SetClanID(arg_1_2.clanID)

	arg_1_0.ManagementButtons._localClientRole = arg_1_2.localClientRole

	if arg_1_0._localClientRole ~= OnlineClanRole.OWNER then
		arg_1_0.ManagementButtons.AddOfficersButton:SetButtonDisabled(true)
		arg_1_0.ManagementButtons.RemoveOfficersButton:SetButtonDisabled(true)
		arg_1_0.ManagementButtons.TransferOwnershipButton:SetButtonDisabled(true)
		arg_1_0.ManagementButtons.DeleteButton.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/LEAVE_REGIMENT"))
	end

	local function var_1_0()
		LUI.FlowManager.RequestLeaveMenuByName("RegimentsHappyHourMenu", true, true)
		LUI.FlowManager.RequestLeaveMenuByName("RegimentsMemberManagementPopup", true, true)
		LUI.FlowManager.RequestLeaveMenuByName("RegimentActionsPopup", true, true)
		LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
		ACTIONS.LeaveMenu(arg_1_0)
	end

	arg_1_0:registerEventHandler("clans_notification", function(arg_3_0, arg_3_1)
		local var_3_0 = arg_3_1.options

		if var_3_0.genEventName == "clans_promoted_to_owner" or var_3_0.genEventName == "clans_promoted_to_officer" or var_3_0.genEventName == "clans_demoted_to_member" or var_3_0.genEventName == "clans_demoted_to_officer" or var_3_0.genEventName == "clans_kicked_from_clan" then
			if var_3_0.success then
				if var_3_0.genEventName == "clans_kicked_from_clan" then
					if arg_1_0._clanID == var_3_0.clanId then
						local var_3_1 = Clans.CEACCICGB(arg_1_1) or {}

						if #var_3_1 > 0 then
							LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_1_1, false, {
								controllerIndex = arg_1_1,
								message = Engine.CBBHFCGDIC("LUA_MENU/SWITCHING_REGIMENTS")
							})

							if not Clans.FAFJFADBJ(arg_1_1, var_3_1[1]) then
								LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
								LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
									title = Engine.CBBHFCGDIC("MENU/ERROR"),
									message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
								})
							end
						else
							var_1_0()
						end
					end
				else
					var_1_0()
				end
			else
				local var_3_2 = var_3_0.error
				local var_3_3 = Engine.CBBHFCGDIC("MENU/ERROR")
				local var_3_4 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

				LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
				LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
					title = var_3_3,
					message = var_3_4
				})
			end
		elseif var_3_0.genEventName == "clans_activated_clan" then
			if var_3_0.success then
				var_1_0()
			end

			LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
		end
	end)
	ACTIONS.ScaleFullscreen(arg_1_0.Darken)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.TabBacker)

	if not CONDITIONS.InGameSPOrFrontendMP() then
		ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.BackgroundImage)
	end
end

function ManageRegimentMenu(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0.id = "ManageRegimentMenu"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	var_4_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_4_1
	})
	var_4_0.HelperBar.id = "HelperBar"

	var_4_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_4_0.HelperBar:setPriority(10)
	var_4_0:addElement(var_4_0.HelperBar)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = {
		worldBlur = 1,
		controllerIndex = var_4_1
	}
	local var_4_5 = MenuBuilder.BuildRegisteredType("WorldBlur", var_4_4)

	var_4_5.id = "WorldBlur"

	var_4_5:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_4_0:addElement(var_4_5)

	var_4_0.WorldBlur = var_4_5

	local var_4_6
	local var_4_7 = LUI.UIImage.new()

	var_4_7.id = "Darken"

	var_4_7:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_4_7:SetAlpha(0.5, 0)
	var_4_0:addElement(var_4_7)

	var_4_0.Darken = var_4_7

	local var_4_8

	if not CONDITIONS.InGameSPOrFrontendMP(var_4_0) then
		local var_4_9 = LUI.UIImage.new()

		var_4_9.id = "BackgroundImage"

		var_4_9:setImage(RegisterMaterial("frontend_option_bg"), 0)
		var_4_0:addElement(var_4_9)

		var_4_0.BackgroundImage = var_4_9
	end

	local var_4_10
	local var_4_11 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_4_1
	})

	var_4_11.id = "TabBacker"

	var_4_11:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_4_0:addElement(var_4_11)

	var_4_0.TabBacker = var_4_11

	local var_4_12
	local var_4_13 = MenuBuilder.BuildRegisteredType("RegimentsManagementButtons", {
		controllerIndex = var_4_1
	})

	var_4_13.id = "ManagementButtons"

	var_4_13:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 526, _1080p * 216, _1080p * 716)
	var_4_0:addElement(var_4_13)

	var_4_0.ManagementButtons = var_4_13

	local var_4_14
	local var_4_15 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_4_1
	})

	var_4_15.id = "MenuTitle"

	var_4_15.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/MANAGE_REGIMENT")), 0)
	var_4_15.Line:SetLeft(0, 0)
	var_4_15:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 562, 0, _1080p * 100)
	var_4_0:addElement(var_4_15)

	var_4_0.MenuTitle = var_4_15

	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_4_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_primary",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
	})

	local var_4_16 = LUI.UIBindButton.new()

	var_4_16.id = "selfBindButton"

	var_4_0:addElement(var_4_16)

	var_4_0.bindButton = var_4_16

	var_4_0.bindButton:addEventHandler("button_secondary", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_4_1
		end

		ACTIONS.LeaveMenu(var_4_0)
	end)
	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("ManageRegimentMenu", ManageRegimentMenu)
LockTable(_M)
