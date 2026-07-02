module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_2.saveSlot)
	assert(arg_1_0.PopupButtons.SaveButton)
	assert(arg_1_0.PopupButtons.NameInputButton)
	assert(arg_1_0.PopupButtons.DescriptionInputButton)
	assert(arg_1_0.MenuTitle)

	local var_1_0 = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_NAME")
	local var_1_1 = Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_DESC")
	local var_1_2 = 19
	local var_1_3 = 127

	if arg_1_2.renameOnly then
		arg_1_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/RENAME_CUSTOM_MODE")))

		arg_1_0.PopupButtons.NameInputButton._firstInteraction = false
		arg_1_0.PopupButtons.DescriptionInputButton._firstInteraction = false
		var_1_0 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, arg_1_2.saveSlot, MP.MatchRulesSaveHeaderLookup.NAME)
		var_1_1 = MatchRules.HIEBFADEC(MP.MatchRulesSaveLocation.PLAYERSAVED, arg_1_2.saveSlot, MP.MatchRulesSaveHeaderLookup.DESCRIPTION)
	else
		arg_1_0.MenuTitle:SetTitle(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CREATE_CUSTOM_MODE")))
	end

	arg_1_0.PopupButtons.NameInputButton:SetupUITextEdit(arg_1_1, var_1_2, var_1_0)
	arg_1_0.PopupButtons.DescriptionInputButton:SetupUITextEdit(arg_1_1, var_1_3, var_1_1)

	function arg_1_0.PopupButtons.NameInputButton.buttonActionCallbackFunc()
		if LUI.IsLastInputGamepad(arg_1_1) then
			arg_1_0.PopupButtons.NameInputButton:TextEditOff()

			local var_2_0 = arg_1_0.PopupButtons.NameInputButton.textEdit:getText()

			OSK.CBJGJDGFC(arg_1_1, Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_NAME"), var_2_0, var_1_2, true, true, true, function(arg_3_0, arg_3_1, arg_3_2)
				if arg_3_1 then
					arg_1_0.PopupButtons.NameInputButton.textEdit:setTextEditText(arg_3_1)

					if arg_3_1 ~= "" then
						arg_1_0.PopupButtons.NameInputButton:processEvent({
							name = "lose_focus"
						})
						arg_1_0.PopupButtons.DescriptionInputButton:processEvent({
							name = "gain_focus"
						})
					end
				end
			end)
		end
	end

	function arg_1_0.PopupButtons.DescriptionInputButton.buttonActionCallbackFunc()
		if LUI.IsLastInputGamepad(arg_1_1) then
			arg_1_0.PopupButtons.DescriptionInputButton:TextEditOff()

			local var_4_0 = arg_1_0.PopupButtons.DescriptionInputButton.textEdit:getText()

			OSK.CBJGJDGFC(arg_1_1, Engine.CBBHFCGDIC("LUA_MENU/CUSTOM_MODE_DESC"), var_4_0, var_1_3, true, true, true, function(arg_5_0, arg_5_1, arg_5_2)
				if arg_5_1 then
					arg_1_0.PopupButtons.DescriptionInputButton.textEdit:setTextEditText(arg_5_1)

					if arg_5_1 ~= "" then
						arg_1_0.PopupButtons.DescriptionInputButton:processEvent({
							name = "lose_focus"
						})
						arg_1_0.PopupButtons.SaveButton:processEvent({
							name = "gain_focus"
						})
					end
				end
			end)
		end
	end

	arg_1_0.PopupButtons.SaveButton:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		local var_6_0 = arg_1_0.PopupButtons.NameInputButton.textEdit
		local var_6_1 = arg_1_0.PopupButtons.DescriptionInputButton.textEdit
		local var_6_2 = not var_6_0._firstInteraction and var_6_0:getText() or ""
		local var_6_3 = not var_6_1._firstInteraction and var_6_1:getText() or ""

		if not var_6_2 or #var_6_2 == 0 then
			return
		end

		if arg_1_2.renameOnly then
			if MatchRules.DEAJJIDDHJ(arg_1_2.saveSlot) then
				MatchRules.CBHIFDJIJC(Lobby.MatchRulesMembers.RecipeName, var_6_2)
				MatchRules.CBHIFDJIJC(Lobby.MatchRulesMembers.RecipeDescription, var_6_3)
				MatchRules.BHEDIECCBD(arg_1_2.saveSlot)
			end

			arg_1_0:dispatchEventToRoot({
				name = "recipe_rename_complete"
			})
		else
			MatchRules.CIGFFEAEFD(Lobby.MatchRulesMembers.RecipeName, var_6_2)
			MatchRules.CIGFFEAEFD(Lobby.MatchRulesMembers.RecipeDescription, var_6_3)
			MatchRules.JJFCFBDAA(arg_1_2.saveSlot)
		end

		arg_1_0.PopupButtons.NameInputButton:TextEditOff()
		arg_1_0.PopupButtons.DescriptionInputButton:TextEditOff()
		LUI.FlowManager.RequestLeaveMenu(arg_1_0, true, true)
		LUI.FlowManager.RequestLeaveMenuByName("RecipeDeleteMenu", true)
	end)

	local function var_1_4(arg_7_0, arg_7_1)
		arg_1_0.PopupButtons.NameInputButton:TextEditOff()
		arg_1_0.PopupButtons.DescriptionInputButton:TextEditOff()
		ACTIONS.LeaveMenu(arg_1_0)
	end

	arg_1_0.PopupButtons.CancelButton:addEventHandler("button_action", var_1_4)
	arg_1_0.bindButton:addEventHandler("button_secondary", var_1_4)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end

	ACTIONS.ScaleStretchAnchorFullscreen(arg_1_0.Fade)
end

function RecipeCreatePopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0.id = "RecipeCreatePopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Fade"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.8, 0)
	var_8_0:addElement(var_8_4)

	var_8_0.Fade = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "ButtonHelperBar"

	var_8_6.Background:SetAlpha(0, 0)
	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -710, _1080p * 60, _1080p * 213, _1080p * 273)
	var_8_0:addElement(var_8_6)

	var_8_0.ButtonHelperBar = var_8_6

	local var_8_7
	local var_8_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_8.id = "GenericPopupWindow"

	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 694, _1080p * -257, _1080p * 213)
	var_8_0:addElement(var_8_8)

	var_8_0.GenericPopupWindow = var_8_8

	local var_8_9
	local var_8_10 = MenuBuilder.BuildRegisteredType("RecipeCreatePopupButtons", {
		controllerIndex = var_8_1
	})

	var_8_10.id = "PopupButtons"

	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -519, _1080p * 81, _1080p * -75, _1080p * 181)
	var_8_0:addElement(var_8_10)

	var_8_0.PopupButtons = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIText.new()

	var_8_12.id = "Description"

	var_8_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_12:setText(Engine.CBBHFCGDIC("LUA_MENU/CREATE_CUSTOM_MODE_DESC"), 0)
	var_8_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_8_12:SetAlignment(LUI.Alignment.Left)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -519, _1080p * 564, _1080p * -160, _1080p * -140)
	var_8_0:addElement(var_8_12)

	var_8_0.Description = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("MenuTitle", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "MenuTitle"

	var_8_14.MenuTitle:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/CREATE_CUSTOM_MODE")), 0)
	var_8_14.Line:SetLeft(0, 0)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -713, _1080p * 151, _1080p * -240, _1080p * -180)
	var_8_0:addElement(var_8_14)

	var_8_0.MenuTitle = var_8_14

	local function var_8_15()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_15

	local var_8_16
	local var_8_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 415
		}
	}

	var_8_12:RegisterAnimationSequence("AR", var_8_17)

	local function var_8_18()
		var_8_12:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_18

	function var_8_0.addButtonHelperFunction(arg_11_0, arg_11_1)
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
		arg_11_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
	end

	var_8_0:addEventHandler("menu_create", var_8_0.addButtonHelperFunction)

	local var_8_19 = LUI.UIBindButton.new()

	var_8_19.id = "selfBindButton"

	var_8_0:addElement(var_8_19)

	var_8_0.bindButton = var_8_19

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("RecipeCreatePopup", RecipeCreatePopup)
LockTable(_M)
