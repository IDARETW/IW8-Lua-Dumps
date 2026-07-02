module(..., package.seeall)

local function var_0_0(arg_1_0)
	arg_1_0._buttonUnlockedStates = {
		transferOwnership = true,
		editClanSearchLabels = true,
		editClanTag = true,
		editClanName = true,
		editClanPrivacy = true,
		editClanDesc = true,
		disbandClan = true,
		editClanEmblem = false
	}
end

local function var_0_1(arg_2_0)
	arg_2_0.EditClanName.Lock:SetAlpha(arg_2_0._buttonUnlockedStates.editClanName and 0 or 1)
	arg_2_0.EditClanDescription.Lock:SetAlpha(arg_2_0._buttonUnlockedStates.editClanDesc and 0 or 1)
	arg_2_0.EditClanTag.Lock:SetAlpha(arg_2_0._buttonUnlockedStates.editClanTag and 0 or 1)
	arg_2_0.EditClanEmblem.Lock:SetAlpha(arg_2_0._buttonUnlockedStates.editClanEmblem and 0 or 1)
	arg_2_0.EditSearchLabels.Lock:SetAlpha(arg_2_0._buttonUnlockedStates.editClanSearchLabels and 0 or 1)
	arg_2_0.EditPrivacy.Lock:SetAlpha(arg_2_0._buttonUnlockedStates.editClanPrivacy and 0 or 1)
	arg_2_0.TransferOwnership.Lock:SetAlpha(arg_2_0._buttonUnlockedStates.transferOwnership and 0 or 1)
	arg_2_0.DisbandClan.Lock:SetAlpha(arg_2_0._buttonUnlockedStates.disbandClan and 0 or 1)

	if arg_2_0._memberRole == CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER then
		arg_2_0.DisbandClan.Text:setText(Engine.CBBHFCGDIC("CLANS/DISBAND_CLAN"))
	else
		arg_2_0.DisbandClan.Text:setText(Engine.CBBHFCGDIC("CLANS/LEAVE_CLAN"))
	end
end

local function var_0_2(arg_3_0)
	var_0_0(arg_3_0)

	local var_3_0 = arg_3_0._memberRole

	if var_3_0 < CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN then
		arg_3_0._buttonUnlockedStates.editClanTag = false
		arg_3_0._buttonUnlockedStates.editClanSearchLabels = false
		arg_3_0._buttonUnlockedStates.editClanPrivacy = false
	end

	if var_3_0 < CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER then
		arg_3_0._buttonUnlockedStates.editClanName = false
		arg_3_0._buttonUnlockedStates.editClanDesc = false
		arg_3_0._buttonUnlockedStates.transferOwnership = false
		arg_3_0._buttonUnlockedStates.disbandClan = false
	end

	if var_3_0 == CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER then
		if Clans2.DGGFBEFIBC(arg_3_0._controllerIndex, arg_3_0._clanId) > 1 then
			arg_3_0._buttonUnlockedStates.disbandClan = false
		else
			arg_3_0._buttonUnlockedStates.disbandClan = true
		end
	else
		arg_3_0._buttonUnlockedStates.disbandClan = true
	end

	var_0_1(arg_3_0)
end

local function var_0_3(arg_4_0)
	local var_4_0 = arg_4_0._controllerIndex

	arg_4_0._clanDetails = Clans2.GFFJCJFIJ(var_4_0, arg_4_0._clanId)

	local var_4_1 = Engine.EAGGAEGHHA(var_4_0)

	arg_4_0._memberRole = Clans2.CFDHGBFICH(var_4_0, arg_4_0._clanId, var_4_1)

	local var_4_2 = arg_4_0._clanDetails.clanName
	local var_4_3 = arg_4_0._clanDetails.clanTag

	arg_4_0.ClanNameAndTag:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_4_3), Engine.JCBDICCAH(var_4_2)))
	arg_4_0.ClanDescriptionLabel:setText(arg_4_0._clanDetails.clanDescription)
	var_0_2(arg_4_0)
	Clans2.BJFEDEICAC(var_4_0, arg_4_0._clanId)

	local var_4_4 = ""

	if arg_4_0._memberRole == CLANS.CLAN_MEMBER_ROLE.CLAN_MEMBER then
		var_4_4 = Engine.CBBHFCGDIC("CLANS/CLAN_MEMBER_ROLE_EXPANDED")
	elseif arg_4_0._memberRole == CLANS.CLAN_MEMBER_ROLE.CLAN_OFFICER then
		var_4_4 = Engine.CBBHFCGDIC("CLANS/CLAN_OFFICER_ROLE_EXPANDED")
	elseif arg_4_0._memberRole == CLANS.CLAN_MEMBER_ROLE.CLAN_ADMIN then
		var_4_4 = Engine.CBBHFCGDIC("CLANS/CLAN_ADMIN_ROLE_EXPANDED")
	elseif arg_4_0._memberRole == CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER then
		var_4_4 = Engine.CBBHFCGDIC("CLANS/CLAN_OWNER_ROLE_EXPANDED")
	end

	arg_4_0.MemberRole:setText(var_4_4)
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0.VanguardOnlyLabel:SetAlpha(arg_5_1 and 1 or 0)
	arg_5_0.VanguardOnlyIcon:SetAlpha(arg_5_1 and 1 or 0)
end

local function var_0_5(arg_6_0, arg_6_1)
	arg_6_0.ClanTransferOwnershipDesc:SetAlpha(arg_6_1 and 1 or 0)
end

local function var_0_6(arg_7_0, arg_7_1)
	arg_7_0.ClanPrivacyDesc:SetAlpha(arg_7_1 and 1 or 0)
	arg_7_0.ClanNameTagHeader:SetAlpha(arg_7_1 and 1 or 0)
	arg_7_0.SingleLineText:SetAlpha(arg_7_1 and 1 or 0)
end

local function var_0_7(arg_8_0, arg_8_1)
	arg_8_0.ClanNameTagHeader:SetAlpha(arg_8_1 and 1 or 0)
	arg_8_0.ClanNameAndTag:SetAlpha(arg_8_1 and 1 or 0)
end

local function var_0_8(arg_9_0, arg_9_1)
	arg_9_0.ClanDescriptionBackground:SetAlpha(arg_9_1 and 0.5 or 0)
	arg_9_0.ClanDescriptionLabel:SetAlpha(arg_9_1 and 1 or 0)
	arg_9_0.ClanNameTagHeader:SetAlpha(arg_9_1 and 1 or 0)
end

local function var_0_9(arg_10_0, arg_10_1)
	arg_10_0.ClanSearchLabelGrid:SetAlpha(arg_10_1 and 1 or 0)
	arg_10_0.ClanNameTagHeader:SetAlpha(arg_10_1 and 1 or 0)
	arg_10_0.SingleLineText:SetAlpha(arg_10_1 and 1 or 0)
end

local function var_0_10(arg_11_0, arg_11_1)
	arg_11_0.CautionIcon:SetAlpha(arg_11_1 and 1 or 0)
	arg_11_0.CautionLabel:SetAlpha(arg_11_1 and 1 or 0)
end

local function var_0_11(arg_12_0)
	var_0_4(arg_12_0, false)
	var_0_6(arg_12_0, false)
	var_0_5(arg_12_0, false)
	var_0_10(arg_12_0, false)
	var_0_7(arg_12_0, false)
	var_0_8(arg_12_0, false)
	var_0_9(arg_12_0, false)
end

local function var_0_12(arg_13_0, arg_13_1)
	arg_13_0.ClanActionTitle:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_13_1._actionText)))
	arg_13_0.ClanActionDescription:setText(arg_13_1._descText ~= "" and Engine.CBBHFCGDIC(arg_13_1._descText) or "")

	arg_13_0._buttonGainFocusTime = Engine.BFBIDEGDFB()
end

local function var_0_13(arg_14_0)
	var_0_11(arg_14_0)
	var_0_7(arg_14_0, true)
	var_0_12(arg_14_0, {
		_actionText = "LUA_MENU/CLAN_NAME",
		_descText = "LUA_MENU/EDIT_CLAN_NAME_DESC"
	})
	arg_14_0.ClanNameTagHeader:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_CLAN_NAME"))

	arg_14_0._selectedAction = CLANS.CLAN_ACTIONS.EDIT_NAME
end

local function var_0_14(arg_15_0)
	var_0_11(arg_15_0)
	var_0_8(arg_15_0, true)
	var_0_12(arg_15_0, {
		_actionText = "LUA_MENU/CLAN_DESCRIPTION",
		_descText = "LUA_MENU/EDIT_CLAN_DESC_INFO"
	})
	arg_15_0.ClanNameTagHeader:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_CLAN_DESCRIPTION"))

	arg_15_0._selectedAction = CLANS.CLAN_ACTIONS.EDIT_DESCRIPTION
end

local function var_0_15(arg_16_0)
	var_0_11(arg_16_0)
	var_0_7(arg_16_0, true)
	var_0_12(arg_16_0, {
		_actionText = "LUA_MENU/CLAN_TAG",
		_descText = "LUA_MENU/EDIT_CLAN_TAG_DESC"
	})
	arg_16_0.ClanNameTagHeader:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_CLAN_TAG"))

	arg_16_0._selectedAction = CLANS.CLAN_ACTIONS.EDIT_TAG
end

local function var_0_16(arg_17_0)
	var_0_11(arg_17_0)
	var_0_4(arg_17_0, true)
	var_0_12(arg_17_0, {
		_actionText = "LUA_MENU/CLAN_EMBLEM",
		_descText = "LUA_MENU/EDIT_CLAN_EMBLEM_DESC"
	})

	arg_17_0._selectedAction = CLANS.CLAN_ACTIONS.EDIT_EMBLEM
end

local function var_0_17(arg_18_0)
	var_0_11(arg_18_0)
	var_0_9(arg_18_0, true)
	var_0_12(arg_18_0, {
		_actionText = "LUA_MENU/EDIT_CLAN_SEARCH_LABELS_TITLE",
		_descText = "LUA_MENU/EDIT_CLAN_SEARCH_LABELS_DESC"
	})
	arg_18_0.ClanNameTagHeader:setText(Engine.CBBHFCGDIC("CLANS/CURRENT_CLAN_LABELS"))
	arg_18_0.SingleLineText:setText("")

	arg_18_0._selectedAction = CLANS.CLAN_ACTIONS.EDIT_SEARCH_LABELS
end

local function var_0_18(arg_19_0)
	var_0_11(arg_19_0)
	var_0_6(arg_19_0, true)
	var_0_12(arg_19_0, {
		_actionText = "LUA_MENU/EDIT_CLAN_PRIVACY_TITLE",
		_descText = ""
	})
	arg_19_0.ClanNameTagHeader:setText(Engine.CBBHFCGDIC("CLANS/CURRENT_CLAN_PRIVACY"))
	arg_19_0.SingleLineText:setText(Engine.CBBHFCGDIC(CLANS.CLAN_PRIVACY_LEVEL_STRINGS[arg_19_0._clanDetails.clanPrivacyLevel]))

	arg_19_0._selectedAction = CLANS.CLAN_ACTIONS.EDIT_PRIVACY
end

local function var_0_19(arg_20_0)
	var_0_11(arg_20_0)
	var_0_12(arg_20_0, {
		_actionText = "LUA_MENU/EQUIP_CLAN_EMBLEM_TITLE",
		_descText = "LUA_MENU/EQUIP_CLAN_EMBLEM_DESC"
	})

	arg_20_0._selectedAction = CLANS.CLAN_ACTIONS.USE_CLAN_EMBLEM
end

local function var_0_20(arg_21_0)
	var_0_11(arg_21_0)
	var_0_7(arg_21_0, true)
	var_0_12(arg_21_0, {
		_actionText = "LUA_MENU/EQUIP_CLAN_TAG_TITLE",
		_descText = "LUA_MENU/EQUIP_CLAN_TAG_DESC"
	})
	arg_21_0.ClanNameTagHeader:setText(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_CLAN_TAG"))

	arg_21_0._selectedAction = CLANS.CLAN_ACTIONS.USE_CLAN_TAG
end

local function var_0_21(arg_22_0)
	var_0_11(arg_22_0)
	var_0_5(arg_22_0, true)
	var_0_10(arg_22_0, true)
	var_0_12(arg_22_0, {
		_actionText = "LUA_MENU/TRANSFER_OWNERSHIP",
		_descText = ""
	})

	arg_22_0._selectedAction = CLANS.CLAN_ACTIONS.TRANSFER_OWNERSHIP
end

local function var_0_22(arg_23_0)
	var_0_11(arg_23_0)
	var_0_10(arg_23_0, true)

	if arg_23_0._memberRole == CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER then
		var_0_12(arg_23_0, {
			_actionText = "CLANS/DISBAND_CLAN",
			_descText = "CLANS/DISBAND_CLAN_DESC"
		})
	else
		var_0_12(arg_23_0, {
			_actionText = "CLANS/LEAVE_CLAN",
			_descText = "CLANS/LEAVE_CLAN_DESC"
		})
	end

	arg_23_0._selectedAction = CLANS.CLAN_ACTIONS.DISBAND_OR_LEAVE
end

local function var_0_23(arg_24_0)
	if LUI.IsLastInputGamepad(arg_24_0._controllerIndex) then
		arg_24_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			side = "left",
			button_ref = "button_primary",
			priority = 2,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	else
		arg_24_0.HelperBar.ButtonHelperText:PopButtonPrompt({
			button_ref = "button_primary"
		})
	end
end

local function var_0_24(arg_25_0)
	local var_25_0 = LUI.UIBindButton.new()

	var_25_0.id = "selfBindButton"

	arg_25_0:addElement(var_25_0)

	arg_25_0._bindButton = var_25_0

	arg_25_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 1,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	arg_25_0._bindButton:addEventHandler("button_secondary", function(arg_26_0, arg_26_1)
		ACTIONS.LeaveMenu(arg_25_0)
	end)
	arg_25_0:addAndCallEventHandler("update_input_type", arg_25_0.UpdateInputType, {
		controllerIndex = arg_25_0._controllerIndex
	})
end

local function var_0_25(arg_27_0)
	arg_27_0.EditClanName:addEventHandler("gain_focus", function(arg_28_0, arg_28_1)
		var_0_13(arg_27_0)
	end)
	arg_27_0.EditClanDescription:addEventHandler("gain_focus", function(arg_29_0, arg_29_1)
		var_0_14(arg_27_0)
	end)
	arg_27_0.EditClanTag:addEventHandler("gain_focus", function(arg_30_0, arg_30_1)
		var_0_15(arg_27_0)
	end)
	arg_27_0.EditClanEmblem:addEventHandler("gain_focus", function(arg_31_0, arg_31_1)
		var_0_16(arg_27_0)
	end)
	arg_27_0.EditSearchLabels:addEventHandler("gain_focus", function(arg_32_0, arg_32_1)
		var_0_17(arg_27_0)
	end)
	arg_27_0.EditPrivacy:addEventHandler("gain_focus", function(arg_33_0, arg_33_1)
		var_0_18(arg_27_0)
	end)
	arg_27_0.UseClanEmblem:addEventHandler("gain_focus", function(arg_34_0, arg_34_1)
		var_0_19(arg_27_0)
	end)
	arg_27_0.UseClanTag:addEventHandler("gain_focus", function(arg_35_0, arg_35_1)
		var_0_20(arg_27_0)
	end)
	arg_27_0.TransferOwnership:addEventHandler("gain_focus", function(arg_36_0, arg_36_1)
		var_0_21(arg_27_0)
	end)
	arg_27_0.DisbandClan:addEventHandler("gain_focus", function(arg_37_0, arg_37_1)
		var_0_22(arg_27_0)
		arg_27_0.DisbandClan.Text:SetRGBFromTable(SWATCHES.genericButton.warzoneTextFocus)
	end)
end

local function var_0_26(arg_38_0)
	arg_38_0.EditClanName:addEventHandler("button_action", function(arg_39_0, arg_39_1)
		if arg_38_0._buttonUnlockedStates.editClanName then
			LUI.FlowManager.RequestPopupMenu(arg_38_0, "ClanActionChangeNamePopup", true, arg_39_1.controller, false, {
				controllerIndex = arg_38_0._controllerIndex,
				clanDetails = arg_38_0._clanDetails,
				usage = CLANS.CLAN_POPUP_INPUT.CLAN_NAME
			})
		end
	end)
	arg_38_0.EditClanDescription:addEventHandler("button_action", function(arg_40_0, arg_40_1)
		if arg_38_0._buttonUnlockedStates.editClanName then
			LUI.FlowManager.RequestPopupMenu(arg_38_0, "ClanActionChangeNamePopup", true, arg_40_1.controller, false, {
				controllerIndex = arg_38_0._controllerIndex,
				clanDetails = arg_38_0._clanDetails,
				usage = CLANS.CLAN_POPUP_INPUT.CLAN_DESCRIPTION
			})
		end
	end)
	arg_38_0.EditClanTag:addEventHandler("button_action", function(arg_41_0, arg_41_1)
		if arg_38_0._buttonUnlockedStates.editClanTag then
			LUI.FlowManager.RequestPopupMenu(arg_38_0, "ClanTagUsedPopup", true, arg_41_1.controller, false, {
				controllerIndex = arg_38_0._controllerIndex,
				clanDetails = arg_38_0._clanDetails,
				usage = CLANS.CLAN_POPUP_INPUT.CLAN_TAG,
				clanTag = arg_38_0._clanDetails.clanTag
			})
		end
	end)
	arg_38_0.EditSearchLabels:addEventHandler("button_action", function(arg_42_0, arg_42_1)
		if arg_38_0._buttonUnlockedStates.editClanSearchLabels then
			LUI.FlowManager.RequestAddMenu("ClanEditSearchLabels", true, arg_42_1.controller, false, {
				controllerIndex = arg_38_0._controllerIndex,
				searchLabelIndices = arg_38_0._searchLabelIndices,
				clanId = arg_38_0._clanId
			}, false)
		end
	end)
	arg_38_0.EditPrivacy:addEventHandler("button_action", function(arg_43_0, arg_43_1)
		if arg_38_0._buttonUnlockedStates.editClanPrivacy then
			LUI.FlowManager.RequestAddMenu("ClanEditPrivacyMenu", true, arg_43_1.controller, false, {
				controllerIndex = arg_38_0._controllerIndex,
				clanPrivacy = arg_38_0._clanDetails.clanPrivacyLevel,
				clanId = arg_38_0._clanId
			}, false)
		end
	end)
	arg_38_0.TransferOwnership:addEventHandler("button_action", function(arg_44_0, arg_44_1)
		if arg_38_0._buttonUnlockedStates.transferOwnership then
			local var_44_0 = Engine.EAGGAEGHHA(arg_38_0._controllerIndex)
			local var_44_1 = Clans2.CFDHGBFICH(arg_38_0._controllerIndex, arg_38_0._clanDetails.clanId, var_44_0)

			if var_44_1 then
				LUI.FlowManager.RequestAddMenu("ClanTransferOwnerMenu", true, arg_38_0._controllerIndex, false, {
					clanId = arg_38_0._clanDetails.clanId,
					viewerMemberRole = var_44_1
				}, false)
			end
		end
	end)
	arg_38_0.DisbandClan:addEventHandler("button_action", function(arg_45_0, arg_45_1)
		if arg_38_0._buttonUnlockedStates.disbandClan then
			local var_45_0 = arg_38_0._memberRole == CLANS.CLAN_MEMBER_ROLE.CLAN_OWNER and CLANS.CLAN_POPUP_INPUT.CLAN_DISBAND_CLAN or CLANS.CLAN_POPUP_INPUT.CLAN_LEAVE_CLAN

			LUI.FlowManager.RequestPopupMenu(arg_38_0, "ClanConfirmActionPopup", true, arg_45_1.controller, false, {
				controllerIndex = arg_38_0._controllerIndex,
				clanId = arg_38_0._clanId,
				usage = var_45_0,
				clanDetails = arg_38_0._clanDetails
			})
		end
	end)
	arg_38_0.UseClanTag:addEventHandler("button_action", function(arg_46_0, arg_46_1)
		arg_38_0._isClanTagEquipped = not arg_38_0._isClanTagEquipped

		Engine.GGIHFEAGD(arg_38_0._controllerIndex, arg_38_0._isClanTagEquipped and ClanTagType.OFFICIAL or ClanTagType.CUSTOM)
		arg_38_0.UseClanTag.Selected:SetEquipped(arg_38_0._isClanTagEquipped)

		local var_46_0 = arg_38_0._isClanTagEquipped and CLANS.CLAN_EQUIPPED_NOTIFICATION_IMAGE or CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE
		local var_46_1 = arg_38_0._isClanTagEquipped and "CLANS/CLAN_TAG_EQUIPPED" or "CLANS/CLAN_TAG_UNEQUIPPED"
		local var_46_2 = Engine.BBFCBBIECH(arg_38_0._controllerIndex)

		CLANS.DispatchClanNotification(arg_38_0, Engine.CBBHFCGDIC(var_46_1), "[" .. var_46_2 .. "]", var_46_0)
	end)
	arg_38_0.UseClanEmblem:addEventHandler("button_action", function(arg_47_0, arg_47_1)
		arg_38_0._isClanEmblemEquipped = not arg_38_0._isClanEmblemEquipped

		Engine.BJHHJHIEHF(arg_38_0._controllerIndex, arg_38_0._isClanEmblemEquipped and LOOT.EmblemType.CLAN or LOOT.EmblemType.CUSTOM)
		EmblemEditorUtils.ToggleClanEmblem(arg_38_0._controllerIndex)
		arg_38_0.UseClanEmblem.Selected:SetEquipped(arg_38_0._isClanEmblemEquipped)

		local var_47_0 = LOOT.GetEquippedEmblemRef(arg_38_0._controllerIndex)
		local var_47_1 = EmblemEditorUtils.GetEmblemIDFromRef(var_47_0)
		local var_47_2 = EmblemEditorUtils.GetEmblemImageFromID(var_47_1)
		local var_47_3 = arg_38_0._isClanEmblemEquipped and CLANS.CLAN_DEFAULT_NOTIFICATION_IMAGE or var_47_2
		local var_47_4 = arg_38_0._isClanEmblemEquipped and "CLANS/CLAN_EMBLEM_EQUIPPED" or "LUA_MENU/EMBLEM_EQUIPPED"

		CLANS.DispatchClanNotification(arg_38_0, Engine.CBBHFCGDIC(var_47_4), "", var_47_3)
	end)
end

local function var_0_27(arg_48_0)
	arg_48_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_NAME_EDITED, function(arg_49_0, arg_49_1)
		local var_49_0 = arg_48_0._clanDetails.clanTag
		local var_49_1 = arg_49_1.options.newName

		if not Clans2.DDBHGCBIBD(arg_48_0._controllerIndex, arg_48_0._clanId, var_49_1) then
			CLANS.DispatchClanNotification(arg_48_0, Engine.CBBHFCGDIC("LUA_MENU/FAILED_TO_UPDATE_CLAN_NAME"), Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_49_0), Engine.JCBDICCAH(var_49_1)))
		else
			CLANS.DispatchClanNotification(arg_48_0, Engine.CBBHFCGDIC("LUA_MENU/UPDATED_CLAN_NAME"), Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_49_0), Engine.JCBDICCAH(var_49_1)))
		end
	end)
	arg_48_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_DESCRIPTION_EDITED, function(arg_50_0, arg_50_1)
		local var_50_0 = arg_50_1.options.newDescription

		if not Clans2.CCJIJCGAFE(arg_48_0._controllerIndex, arg_48_0._clanId, var_50_0) then
			CLANS.DispatchClanNotification(arg_48_0, Engine.CBBHFCGDIC("LUA_MENU/FAILED_TO_UPDATE_CLAN_DESCRIPTION"), "")
		else
			CLANS.DispatchClanNotification(arg_48_0, Engine.CBBHFCGDIC("LUA_MENU/UPDATED_CLAN_DESCRIPTION"), "")
		end
	end)
	arg_48_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_TAG_EDITED, function(arg_51_0, arg_51_1)
		local var_51_0 = arg_51_1.options.newTag
		local var_51_1 = arg_48_0._clanDetails.clanName

		if not Clans2.CCABCJFAI(arg_48_0._controllerIndex, arg_48_0._clanId, var_51_0) then
			CLANS.DispatchClanNotification(arg_48_0, Engine.CBBHFCGDIC("LUA_MENU/FAILED_TO_UPDATE_CLAN_TAG"), Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_51_0), Engine.JCBDICCAH(var_51_1)))
		else
			CLANS.DispatchClanNotification(arg_48_0, Engine.CBBHFCGDIC("LUA_MENU/UPDATED_CLAN_TAG"), Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_51_0), Engine.JCBDICCAH(var_51_1)))
		end
	end)
	arg_48_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_LEAVE_FROM_POPUP, function(arg_52_0, arg_52_1)
		if Clans2.DBGGAGHJDG(arg_48_0._controllerIndex, arg_48_0._clanId) then
			ACTIONS.LeaveMenu(arg_48_0)
		else
			local var_52_0 = arg_48_0._clanDetails.clanTag
			local var_52_1 = arg_48_0._clanDetails.clanName

			CLANS.DispatchClanNotification(arg_48_0, Engine.CBBHFCGDIC("CLANS/FAILED_TO_LEAVE_CLAN"), Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_52_0), Engine.JCBDICCAH(var_52_1)))
		end
	end)
	arg_48_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_DISBAND_FROM_POPUP, function(arg_53_0, arg_53_1)
		if Clans2.BBJFIICBE(arg_48_0._controllerIndex, arg_48_0._clanId) then
			ACTIONS.LeaveMenu(arg_48_0)
		else
			local var_53_0 = arg_48_0._clanDetails.clanTag
			local var_53_1 = arg_48_0._clanDetails.clanName

			CLANS.DispatchClanNotification(arg_48_0, Engine.CBBHFCGDIC("CLANS/FAILED_TO_DISBAND_CLAN"), Engine.CBBHFCGDIC("LUA_MENU/CLAN_TAG_AND_NAME_LABEL", Engine.JCBDICCAH(var_53_0), Engine.JCBDICCAH(var_53_1)))
		end
	end)
end

local function var_0_28(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	local var_54_0 = arg_54_3 + arg_54_2
	local var_54_1 = arg_54_0._searchLabelIndices[var_54_0]
	local var_54_2 = CLANS.CLAN_LABEL_STRINGS[var_54_1]

	arg_54_1.Label:setText(Engine.CBBHFCGDIC(var_54_2))
end

local function var_0_29(arg_55_0, arg_55_1, arg_55_2)
	assert(arg_55_2.clanId)

	arg_55_0.UpdateInputType = var_0_23
	arg_55_0._controllerIndex = arg_55_1
	arg_55_0._buttonGainFocusTime = Engine.BFBIDEGDFB()
	arg_55_0._buttonUnlockedStates = {}
	arg_55_0._clanId = arg_55_2.clanId
	arg_55_0._clanDetails = Clans2.GFFJCJFIJ(arg_55_1, arg_55_2.clanId)
	arg_55_0._searchLabelIndices = {}
	arg_55_0._selectedAction = CLANS.CLAN_ACTIONS.NONE
	arg_55_0._isClanEmblemEquipped = EmblemEditorUtils.IsClanEmblemEnabled(arg_55_1)

	arg_55_0.UseClanEmblem.Selected:SetEquipped(arg_55_0._isClanEmblemEquipped)

	arg_55_0._isClanTagEquipped = Engine.DIHDIGEBJF(arg_55_1) == ClanTagType.OFFICIAL and true or false

	arg_55_0.UseClanTag.Selected:SetEquipped(arg_55_0._isClanTagEquipped)

	local var_55_0 = Engine.EAGGAEGHHA(arg_55_1)

	arg_55_0._memberRole = Clans2.CFDHGBFICH(arg_55_1, arg_55_2.clanId, var_55_0)

	var_0_2(arg_55_0)
	var_0_11(arg_55_0)
	var_0_25(arg_55_0)
	var_0_26(arg_55_0)
	var_0_27(arg_55_0)
	var_0_24(arg_55_0)
	arg_55_0.ClanSearchLabelGrid:SetSnapOnWrapEnabled(true)
	arg_55_0.ClanSearchLabelGrid:SetRefreshChild(function(arg_56_0, arg_56_1, arg_56_2)
		var_0_28(arg_55_0, arg_56_0, arg_56_1, arg_56_2)
	end)
	arg_55_0.ClanSearchLabelGrid:SetNumChildren(0)
	arg_55_0.ClanSearchLabelGrid:RefreshContent()
	arg_55_0:addEventHandler(CLANS.CLAN_EVENTS.CLAN_SEARCH_TAGS, function(arg_57_0, arg_57_1)
		local var_57_0 = CLANS.ClanEventHasKey(arg_57_1.keys, CLANS.CLAN_SEARCH_LABEL_KEY)

		if var_57_0 ~= -1 then
			local var_57_1 = arg_57_1.keys[var_57_0].values

			arg_55_0._searchLabelIndices = var_57_1

			local var_57_2 = #var_57_1

			if var_57_1[0] ~= nil then
				var_57_2 = var_57_2 + 1
			end

			if arg_55_0._selectedAction == CLANS.CLAN_ACTIONS.EDIT_SEARCH_LABELS then
				arg_55_0.SingleLineText:setText("")
			end

			arg_55_0.ClanSearchLabelGrid:SetNumChildren(var_57_2)
			arg_55_0.ClanSearchLabelGrid:RefreshContent()
		else
			if arg_55_0._selectedAction == CLANS.CLAN_ACTIONS.EDIT_SEARCH_LABELS then
				arg_55_0.SingleLineText:setText(Engine.CBBHFCGDIC("CLANS/NO_SEARCH_LABELS_ACTION_MENU"))
			end

			arg_55_0.ClanSearchLabelGrid:SetNumChildren(0)
			arg_55_0.ClanSearchLabelGrid:RefreshContent()
		end
	end)
	arg_55_0:addAndCallEventHandler(CLANS.CLAN_EVENTS.NOTIFICATION, function(arg_58_0, arg_58_1)
		var_0_3(arg_55_0)
	end)
	arg_55_0.MenuTitle:SetTitle(Engine.CBBHFCGDIC("CLANS/CLAN_ACTIONS"))
	ACTIONS.ScaleStretchAnchorFullscreen(arg_55_0.TabBacker)
	LAYOUT.AddAspectRatioFadeFrameWithOptions(arg_55_0, arg_55_1, {
		addScreenDarkener = true,
		addWorldBlur = true
	})
end

function ClanActionsMenu(arg_59_0, arg_59_1)
	local var_59_0 = LUI.UIVerticalNavigator.new()

	var_59_0.id = "ClanActionsMenu"

	local var_59_1 = arg_59_1 and arg_59_1.controllerIndex

	if not var_59_1 and not Engine.DDJFBBJAIG() then
		var_59_1 = var_59_0:getRootController()
	end

	assert(var_59_1)

	var_59_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_59_1
	})
	var_59_0.HelperBar.id = "HelperBar"

	var_59_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_59_0.HelperBar:setPriority(10)
	var_59_0:addElement(var_59_0.HelperBar)

	local var_59_2 = var_59_0
	local var_59_3
	local var_59_4 = LUI.UIText.new()

	var_59_4.id = "ClanActionsHeaderDescription"

	var_59_4:setText(Engine.CBBHFCGDIC("LUA_MENU/CLAN_ACTION_DESC"), 0)
	var_59_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_4:SetAlignment(LUI.Alignment.Left)
	var_59_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 185, _1080p * 209)
	var_59_0:addElement(var_59_4)

	var_59_0.ClanActionsHeaderDescription = var_59_4

	local var_59_5
	local var_59_6 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_6.id = "EditClanName"

	var_59_6.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_NAME"), 0)
	var_59_6.Text:SetAlignment(LUI.Alignment.Left)
	var_59_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 263, _1080p * 309)
	var_59_0:addElement(var_59_6)

	var_59_0.EditClanName = var_59_6

	local var_59_7
	local var_59_8 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_8.id = "EditClanDescription"

	var_59_8.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_DESC"), 0)
	var_59_8.Text:SetAlignment(LUI.Alignment.Left)
	var_59_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 318, _1080p * 364)
	var_59_0:addElement(var_59_8)

	var_59_0.EditClanDescription = var_59_8

	local var_59_9
	local var_59_10 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_10.id = "EditClanTag"

	var_59_10.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_TAG"), 0)
	var_59_10.Text:SetAlignment(LUI.Alignment.Left)
	var_59_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 375, _1080p * 421)
	var_59_0:addElement(var_59_10)

	var_59_0.EditClanTag = var_59_10

	local var_59_11
	local var_59_12 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_12.id = "EditClanEmblem"

	var_59_12.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_EMBLEM"), 0)
	var_59_12.Text:SetAlignment(LUI.Alignment.Left)
	var_59_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 430, _1080p * 476)
	var_59_0:addElement(var_59_12)

	var_59_0.EditClanEmblem = var_59_12

	local var_59_13
	local var_59_14 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_14.id = "EditSearchLabels"

	var_59_14.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_SEARCH_LABELS"), 0)
	var_59_14.Text:SetAlignment(LUI.Alignment.Left)
	var_59_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 486, _1080p * 532)
	var_59_0:addElement(var_59_14)

	var_59_0.EditSearchLabels = var_59_14

	local var_59_15
	local var_59_16 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_16.id = "EditPrivacy"

	var_59_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/EDIT_CLAN_PRIVACY"), 0)
	var_59_16.Text:SetAlignment(LUI.Alignment.Left)
	var_59_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 540, _1080p * 586)
	var_59_0:addElement(var_59_16)

	var_59_0.EditPrivacy = var_59_16

	local var_59_17
	local var_59_18 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_18.id = "UseClanEmblem"

	var_59_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/USE_CLAN_EMBLEM"), 0)
	var_59_18.Text:SetAlignment(LUI.Alignment.Left)
	var_59_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 633, _1080p * 679)
	var_59_0:addElement(var_59_18)

	var_59_0.UseClanEmblem = var_59_18

	local var_59_19
	local var_59_20 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_20.id = "UseClanTag"

	var_59_20.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/USE_CLAN_TAG"), 0)
	var_59_20.Text:SetAlignment(LUI.Alignment.Left)
	var_59_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 687, _1080p * 733)
	var_59_0:addElement(var_59_20)

	var_59_0.UseClanTag = var_59_20

	local var_59_21
	local var_59_22 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_22.id = "TransferOwnership"

	var_59_22.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/TRANSFER_OWNERSHIP"), 0)
	var_59_22.Text:SetAlignment(LUI.Alignment.Left)
	var_59_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 787, _1080p * 833)
	var_59_0:addElement(var_59_22)

	var_59_0.TransferOwnership = var_59_22

	local var_59_23
	local var_59_24 = MenuBuilder.BuildRegisteredType("GenericSelectionButton", {
		controllerIndex = var_59_1
	})

	var_59_24.id = "DisbandClan"

	var_59_24.Text:setText(Engine.CBBHFCGDIC("CLANS/DISBAND_CLAN"), 0)
	var_59_24.Text:SetAlignment(LUI.Alignment.Left)
	var_59_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 130, _1080p * 676, _1080p * 842, _1080p * 888)
	var_59_0:addElement(var_59_24)

	var_59_0.DisbandClan = var_59_24

	local var_59_25
	local var_59_26 = LUI.UIText.new()

	var_59_26.id = "ClanActionTitle"

	var_59_26:setText(ToUpperCase(""), 0)
	var_59_26:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_26:SetAlignment(LUI.Alignment.Left)
	var_59_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1758, _1080p * 246, _1080p * 294)
	var_59_0:addElement(var_59_26)

	var_59_0.ClanActionTitle = var_59_26

	local var_59_27
	local var_59_28 = LUI.UIText.new()

	var_59_28.id = "ClanActionDescription"

	var_59_28:setText("", 0)
	var_59_28:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_28:SetAlignment(LUI.Alignment.Left)
	var_59_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1720, _1080p * 318, _1080p * 348)
	var_59_0:addElement(var_59_28)

	var_59_0.ClanActionDescription = var_59_28

	local var_59_29
	local var_59_30 = LUI.UIText.new()

	var_59_30.id = "VanguardOnlyLabel"

	var_59_30:SetRGBFromTable(SWATCHES.HUD.playerIndicator, 0)
	var_59_30:setText(Engine.CBBHFCGDIC("LUA_MENU/VANGUARD_EXCLUSIVE"), 0)
	var_59_30:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_30:SetAlignment(LUI.Alignment.Left)
	var_59_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 820, _1080p * 1661, _1080p * 509, _1080p * 533)
	var_59_0:addElement(var_59_30)

	var_59_0.VanguardOnlyLabel = var_59_30

	local var_59_31
	local var_59_32 = LUI.UIImage.new()

	var_59_32.id = "VanguardOnlyIcon"

	var_59_32:SetScale(-0.63, 0)
	var_59_32:setImage(RegisterMaterial("icon_battle_net_vanguard"), 0)
	var_59_32:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 766, _1080p * 830, _1080p * 489, _1080p * 553)
	var_59_0:addElement(var_59_32)

	var_59_0.VanguardOnlyIcon = var_59_32

	local var_59_33
	local var_59_34 = MenuBuilder.BuildRegisteredType("ClanPrivacyDescWidget", {
		controllerIndex = var_59_1
	})

	var_59_34.id = "ClanPrivacyDesc"

	var_59_34:SetAlpha(0, 0)
	var_59_34:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 779, _1080p * 1692, _1080p * 318, _1080p * 744)
	var_59_0:addElement(var_59_34)

	var_59_0.ClanPrivacyDesc = var_59_34

	local var_59_35
	local var_59_36 = MenuBuilder.BuildRegisteredType("ClanTransferOwnershipDescWidget", {
		controllerIndex = var_59_1
	})

	var_59_36.id = "ClanTransferOwnershipDesc"

	var_59_36:SetAlpha(0, 0)
	var_59_36:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 779, _1080p * 1682, _1080p * 318, _1080p * 742)
	var_59_0:addElement(var_59_36)

	var_59_0.ClanTransferOwnershipDesc = var_59_36

	local var_59_37
	local var_59_38 = LUI.UIImage.new()

	var_59_38.id = "CautionIcon"

	var_59_38:SetScale(-0.47, 0)
	var_59_38:setImage(RegisterMaterial("ui_mp_br_ping_icon_caution"), 0)
	var_59_38:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 736, _1080p * 864, _1080p * 780, _1080p * 908)
	var_59_0:addElement(var_59_38)

	var_59_0.CautionIcon = var_59_38

	local var_59_39
	local var_59_40 = LUI.UIText.new()

	var_59_40.id = "CautionLabel"

	var_59_40:SetRGBFromTable(SWATCHES.genericMenu.notificationHighlight, 0)
	var_59_40:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CLAN_ACTION_CAUTION")), 0)
	var_59_40:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_40:SetAlignment(LUI.Alignment.Left)
	var_59_40:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 864, _1080p * 1364, _1080p * 829, _1080p * 859)
	var_59_0:addElement(var_59_40)

	var_59_0.CautionLabel = var_59_40

	local var_59_41
	local var_59_42 = LUI.UIText.new()

	var_59_42.id = "ClanNameTagHeader"

	var_59_42:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CURRENT_CLAN_NAME")), 0)
	var_59_42:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_59_42:SetAlignment(LUI.Alignment.Left)
	var_59_42:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1289, _1080p * 675, _1080p * 699)
	var_59_0:addElement(var_59_42)

	var_59_0.ClanNameTagHeader = var_59_42

	local var_59_43
	local var_59_44 = LUI.UIText.new()

	var_59_44.id = "ClanNameAndTag"

	var_59_44:setText("", 0)
	var_59_44:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_44:SetAlignment(LUI.Alignment.Left)
	var_59_44:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1720, _1080p * 710, _1080p * 758)
	var_59_0:addElement(var_59_44)

	var_59_0.ClanNameAndTag = var_59_44

	local var_59_45
	local var_59_46 = LUI.UIImage.new()

	var_59_46.id = "ClanDescriptionBackground"

	var_59_46:SetRGBFromInt(0, 0)
	var_59_46:SetAlpha(0.5, 0)
	var_59_46:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1720, _1080p * 710, _1080p * 952)
	var_59_0:addElement(var_59_46)

	var_59_0.ClanDescriptionBackground = var_59_46

	local var_59_47
	local var_59_48 = LUI.UIText.new()

	var_59_48.id = "ClanDescriptionLabel"

	var_59_48:setText("", 0)
	var_59_48:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_48:SetAlignment(LUI.Alignment.Left)
	var_59_48:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 800, _1080p * 1708, _1080p * 720, _1080p * 750)
	var_59_0:addElement(var_59_48)

	var_59_0.ClanDescriptionLabel = var_59_48

	local var_59_49
	local var_59_50 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 7,
		maxVisibleRows = 1,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_59_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("ClanLabelWidget", {
				controllerIndex = var_59_1
			})
		end,
		refreshChild = function(arg_61_0, arg_61_1, arg_61_2)
			return
		end,
		spacingX = _1080p * 4,
		spacingY = _1080p * 4,
		columnWidth = _1080p * 152,
		rowHeight = _1080p * 28,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_59_51 = LUI.UIGrid.new(var_59_50)

	var_59_51.id = "ClanSearchLabelGrid"

	var_59_51:setUseStencil(true)
	var_59_51:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1720, _1080p * 710, _1080p * 787)
	var_59_0:addElement(var_59_51)

	var_59_0.ClanSearchLabelGrid = var_59_51

	local var_59_52
	local var_59_53 = LUI.UIText.new()

	var_59_53.id = "SingleLineText"

	var_59_53:setText("", 0)
	var_59_53:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_53:SetAlignment(LUI.Alignment.Left)
	var_59_53:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1790, _1080p * 708, _1080p * 738)
	var_59_0:addElement(var_59_53)

	var_59_0.SingleLineText = var_59_53

	local var_59_54
	local var_59_55 = MenuBuilder.BuildRegisteredType("TabBacker", {
		controllerIndex = var_59_1
	})

	var_59_55.id = "TabBacker"

	var_59_55:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 160)
	var_59_0:addElement(var_59_55)

	var_59_0.TabBacker = var_59_55

	local var_59_56
	local var_59_57 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_59_1
	})

	var_59_57.id = "MenuTitle"

	var_59_57.MenuTitle:setText(ToUpperCase(""), 0)
	var_59_57.Line:SetLeft(0, 0)
	var_59_57:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1024, 0, _1080p * 100)
	var_59_0:addElement(var_59_57)

	var_59_0.MenuTitle = var_59_57

	local var_59_58

	if CONDITIONS.InFrontend() then
		local var_59_59 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
			controllerIndex = var_59_1
		})

		var_59_59.id = "LobbyMembersFooter"

		var_59_59:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
		var_59_0:addElement(var_59_59)

		var_59_0.LobbyMembersFooter = var_59_59
	end

	local var_59_60

	if CONDITIONS.IsUserSignedInDemonware(var_59_1) then
		local var_59_61 = MenuBuilder.BuildRegisteredType("MPPlayerDetails", {
			controllerIndex = var_59_1
		})

		var_59_61.id = "PlayerDetailsMP"

		var_59_61:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -596, _1080p * -96, _1080p * 54, _1080p * 114)
		var_59_0:addElement(var_59_61)

		var_59_0.PlayerDetailsMP = var_59_61
	end

	local var_59_62
	local var_59_63 = LUI.UIText.new()

	var_59_63.id = "MemberRole"

	var_59_63:setText("", 0)
	var_59_63:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_59_63:SetAlignment(LUI.Alignment.Left)
	var_59_63:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 789, _1080p * 1824, _1080p * 188, _1080p * 224)
	var_59_0:addElement(var_59_63)

	var_59_0.MemberRole = var_59_63

	var_0_29(var_59_0, var_59_1, arg_59_1)

	return var_59_0
end

MenuBuilder.registerType("ClanActionsMenu", ClanActionsMenu)
LockTable(_M)
