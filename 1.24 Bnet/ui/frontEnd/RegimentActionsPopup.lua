module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.action)
	assert(arg_1_2.clanID)

	arg_1_0._action = arg_1_2.action
	arg_1_0._clanID = arg_1_2.clanID

	local function var_1_0()
		arg_1_0.CancelButton:SetButtonDisabled(true)
		arg_1_0.CancelButton:SetFocusable(false)
		arg_1_0.CancelButton:SetHandleMouse(false)
		ACTIONS.AnimateSequence(arg_1_0, "ConfirmOnly")
		arg_1_0.OKButton:registerEventHandler("button_action", function(arg_3_0, arg_3_1)
			ACTIONS.LeaveMenu(arg_1_0)
		end)
	end

	local function var_1_1()
		arg_1_0.Header:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_DELETED")))
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_DELETED_DESC"))
		var_1_0()
	end

	local function var_1_2()
		arg_1_0.Header:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEFT")))
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_LEFT_DESC"))
		var_1_0()
	end

	local function var_1_3()
		arg_1_0.Header:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OWNERSHIP_TRANSFERRED")))
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/OWNERSHIP_TRANSFERRED_DESC"))
		var_1_0()
	end

	local function var_1_4(arg_7_0, arg_7_1, arg_7_2)
		local var_7_0 = ""

		if arg_7_2 == FRIENDS.RegimentPopupActions.DELETE then
			var_7_0 = Engine.CBBHFCGDIC("REGIMENTS/DELETING_REGIMENT")
		elseif arg_7_2 == FRIENDS.RegimentPopupActions.LEAVE then
			var_7_0 = Engine.CBBHFCGDIC("REGIMENTS/LEAVING_REGIMENT")
		else
			assert(false, "Unknown action!")
		end

		LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_1_1, false, {
			controllerIndex = arg_1_1,
			message = var_7_0
		})

		if not Clans.DBGGAGHJDG(arg_1_1, arg_7_1) then
			LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
			LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
				title = Engine.CBBHFCGDIC("MENU/ERROR"),
				message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
			})
		end

		arg_1_0:registerEventHandler("clans_notification", function(arg_8_0, arg_8_1)
			local var_8_0 = arg_8_1.options

			if var_8_0.genEventName == "clans_left_clan_active" or var_8_0.genEventName == "clans_left_clan_inactive" then
				LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)

				if var_8_0.success then
					if arg_7_0 then
						if arg_7_0 ~= -1 then
							LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_1_1, false, {
								controllerIndex = arg_1_1,
								message = Engine.CBBHFCGDIC("LUA_MENU/SWITCHING_REGIMENTS")
							})

							if not Clans.FAFJFADBJ(arg_1_1, arg_7_0) then
								LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
								LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
									title = Engine.CBBHFCGDIC("MENU/ERROR"),
									message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
								})
							end
						else
							arg_1_0:dispatchEventToRoot({
								name = "change_active_clan",
								newActiveClanID = arg_7_0
							})
						end
					end

					if arg_7_2 == FRIENDS.RegimentPopupActions.DELETE then
						arg_1_0._action = FRIENDS.RegimentPopupActions.DELETED

						var_1_1()
					elseif arg_7_2 == FRIENDS.RegimentPopupActions.LEAVE then
						arg_1_0._action = FRIENDS.RegimentPopupActions.LEFT

						var_1_2()
					else
						assert(false, "Unknown action!")
					end
				else
					local var_8_1 = Engine.CBBHFCGDIC("MENU/ERROR")
					local var_8_2 = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")

					LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
						title = var_8_1,
						message = var_8_2
					})
				end
			end
		end)
	end

	if arg_1_0._action == FRIENDS.RegimentPopupActions.DELETE then
		arg_1_0.Header:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/DELETE_REGIMENT")))
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/DELETE_REGIMENT_DESC"))
		arg_1_0.OKButton:registerEventHandler("button_action", function(arg_9_0, arg_9_1)
			var_1_4(arg_1_2.switchToID, arg_1_0._clanID, arg_1_0._action)
		end)
	elseif arg_1_0._action == FRIENDS.RegimentPopupActions.DELETED then
		var_1_1()
	elseif arg_1_0._action == FRIENDS.RegimentPopupActions.CANNOT_DELETE then
		arg_1_0.Header:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CANNOT_DELETE_REGIMENT")))
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/CANNOT_DELETE_REGIMENT_DESC"))
		var_1_0()
	elseif arg_1_0._action == FRIENDS.RegimentPopupActions.TRANSFER then
		assert(arg_1_2.transferToXUID)
		arg_1_0.Header:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP")))
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP_DESC"))
		arg_1_0.OKButton:registerEventHandler("button_action", function(arg_10_0, arg_10_1)
			LUI.FlowManager.RequestPopupMenu(nil, "RegimentsFenceDialogPopup", true, arg_1_1, false, {
				controllerIndex = arg_1_1,
				message = Engine.CBBHFCGDIC("LUA_MENU/TRANSFERRING_OWNERSHIP")
			})

			if not Clans.BJDBJGDJBB(arg_1_1, arg_1_0._clanID, arg_1_2.transferToXUID) then
				LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
				LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
					title = Engine.CBBHFCGDIC("MENU/ERROR"),
					message = Engine.CBBHFCGDIC("LUA_MENU/REGIMENT_GENERIC_ERROR")
				})
			end
		end)
		arg_1_0:registerEventHandler("clans_notification", function(arg_11_0, arg_11_1)
			if arg_11_1.options.genEventName == "clans_max_clans_owned" then
				ACTIONS.LeaveMenu(arg_1_0)

				local var_11_0 = Engine.CBBHFCGDIC("LUA_MENU/TRANSFERRING_OWNERSHIP_FAILED")
				local var_11_1 = Engine.CBBHFCGDIC("LUA_MENU/TRANSFERRING_OWNERSHIP_FAILED_DESC")

				LUI.FlowManager.RequestPopupMenu(arg_1_0, "PopupOK", true, arg_1_1, false, {
					title = var_11_0,
					message = var_11_1
				})
				LUI.FlowManager.RequestLeaveMenuByName("RegimentsFenceDialogPopup", true, true)
			end
		end)
	elseif arg_1_0._action == FRIENDS.RegimentPopupActions.TRANSFERRED then
		var_1_3()
	elseif arg_1_0._action == FRIENDS.RegimentPopupActions.LEAVE then
		arg_1_0.Header:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/LEAVE_REGIMENT")))
		arg_1_0.Message:setText(Engine.CBBHFCGDIC("LUA_MENU/LEAVE_REGIMENT_DESC"))
		arg_1_0.OKButton:registerEventHandler("button_action", function(arg_12_0, arg_12_1)
			var_1_4(arg_1_2.switchToID, arg_1_0._clanID, arg_1_0._action)
		end)
	elseif arg_1_0._action == FRIENDS.RegimentPopupActions.LEFT then
		var_1_2()
	else
		assert(false, "Unknown action!")
	end

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
end

function RegimentActionsPopup(arg_13_0, arg_13_1)
	local var_13_0 = LUI.UIVerticalNavigator.new()

	var_13_0.id = "RegimentActionsPopup"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3
	local var_13_4 = LUI.UIImage.new()

	var_13_4.id = "Darkener"

	var_13_4:SetRGBFromInt(0, 0)
	var_13_4:SetAlpha(0.8, 0)
	var_13_0:addElement(var_13_4)

	var_13_0.Darkener = var_13_4

	local var_13_5
	local var_13_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_13_1
	})

	var_13_6.id = "GenericPopupWindow"

	var_13_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 856, _1080p * -150, _1080p * 206)
	var_13_0:addElement(var_13_6)

	var_13_0.GenericPopupWindow = var_13_6

	local var_13_7
	local var_13_8 = LUI.UIText.new()

	var_13_8.id = "Header"

	var_13_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_13_8:setText("", 0)
	var_13_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_13_8:SetAlignment(LUI.Alignment.Left)
	var_13_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 770, _1080p * -104, _1080p * -44)
	var_13_0:addElement(var_13_8)

	var_13_0.Header = var_13_8

	local var_13_9
	local var_13_10 = LUI.UIText.new()

	var_13_10.id = "Message"

	var_13_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_13_10:setText("", 0)
	var_13_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_13_10:SetAlignment(LUI.Alignment.Left)
	var_13_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 770, _1080p * -36, _1080p * -14)
	var_13_0:addElement(var_13_10)

	var_13_0.Message = var_13_10

	local var_13_11
	local var_13_12 = LUI.UIImage.new()

	var_13_12.id = "Image"

	var_13_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_13_12:SetAlpha(0.6, 0)
	var_13_12:setImage(RegisterMaterial("icon_warning_large"), 0)
	var_13_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -726, _1080p * -462, _1080p * -104, _1080p * 160)
	var_13_0:addElement(var_13_12)

	var_13_0.Image = var_13_12

	local var_13_13
	local var_13_14 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_13_1
	})

	var_13_14.id = "ButtonHelperBar"

	var_13_14.Background:SetAlpha(0, 0)
	var_13_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 210, _1080p * 270)
	var_13_0:addElement(var_13_14)

	var_13_0.ButtonHelperBar = var_13_14

	local var_13_15
	local var_13_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_16.id = "OKButton"

	var_13_16.Text:SetLeft(_1080p * 20, 0)
	var_13_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CONFIRM"), 0)
	var_13_16.Text:SetAlignment(LUI.Alignment.Left)
	var_13_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 656, _1080p * 1256, _1080p * 616, _1080p * 654)
	var_13_0:addElement(var_13_16)

	var_13_0.OKButton = var_13_16

	local var_13_17
	local var_13_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_13_1
	})

	var_13_18.id = "CancelButton"

	var_13_18.Text:SetLeft(_1080p * 20, 0)
	var_13_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/CANCEL"), 0)
	var_13_18.Text:SetAlignment(LUI.Alignment.Left)
	var_13_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 656, _1080p * 1256, _1080p * 663, _1080p * 701)
	var_13_0:addElement(var_13_18)

	var_13_0.CancelButton = var_13_18

	local function var_13_19()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_19

	local var_13_20
	local var_13_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 663
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 701
		}
	}

	var_13_16:RegisterAnimationSequence("ConfirmOnly", var_13_21)

	local var_13_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_18:RegisterAnimationSequence("ConfirmOnly", var_13_22)

	local function var_13_23()
		var_13_16:AnimateSequence("ConfirmOnly")
		var_13_18:AnimateSequence("ConfirmOnly")
	end

	var_13_0._sequences.ConfirmOnly = var_13_23

	local var_13_24
	local var_13_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		}
	}

	var_13_8:RegisterAnimationSequence("AR", var_13_25)

	local var_13_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_13_10:RegisterAnimationSequence("AR", var_13_26)

	local function var_13_27()
		var_13_8:AnimateSequence("AR")
		var_13_10:AnimateSequence("AR")
	end

	var_13_0._sequences.AR = var_13_27

	var_13_18:addEventHandler("button_action", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_13_1
		end

		ACTIONS.LeaveMenu(var_13_0)
	end)

	function var_13_0.addButtonHelperFunction(arg_18_0, arg_18_1)
		arg_18_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_18_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_13_0:addEventHandler("menu_create", var_13_0.addButtonHelperFunction)

	local var_13_28 = LUI.UIBindButton.new()

	var_13_28.id = "selfBindButton"

	var_13_0:addElement(var_13_28)

	var_13_0.bindButton = var_13_28

	var_13_0.bindButton:addEventHandler("button_secondary", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_13_1
		end

		ACTIONS.LeaveMenu(var_13_0)
	end)
	var_0_0(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("RegimentActionsPopup", RegimentActionsPopup)
LockTable(_M)
