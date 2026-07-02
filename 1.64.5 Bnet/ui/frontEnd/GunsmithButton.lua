module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._attachLine and #Dvar.DHEEJCCJBH("NRLKQRRMKK") == 0 then
		arg_1_0._attachLine:SetAlpha(0.2)
		arg_1_0._attachLine:SetVertexPadding(LUI.UILine.END, 1)
		arg_1_0._attachLine:SetVertexPadding(LUI.UILine.END, 0, GUNSMITH.lineDuration, LUI.EASING.outQuadratic)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local function var_2_0()
		return arg_2_0._selectedAttachment == nil
	end

	local var_2_1 = {
		promptsData = {
			{
				kbmTooltipPromptOverload = "button_alt1",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT"),
				disabledFunction = var_2_0
			}
		}
	}

	assert(arg_2_0.LoadoutItemButtonBackground)
	arg_2_0.LoadoutItemButtonBackground:AddTooltipData(arg_2_1, var_2_1)
end

local function var_0_2(arg_4_0)
	local var_4_0 = LUI.FlowManager.GetScopedData(arg_4_0)

	return {
		weaponSlot = var_4_0.weaponSlot,
		loadoutIndex = var_4_0.loadoutIndex,
		category = arg_4_0._category,
		attachSlot = arg_4_0._selectedIndex,
		attachments = arg_4_0._attachments,
		attachmentRef = arg_4_0._selectedAttachment,
		variants = arg_4_0._variants
	}
end

local function var_0_3(arg_5_0, arg_5_1)
	assert(arg_5_0.Name)
	arg_5_0:SetupContextualMenu({
		title = arg_5_0.Name:getText()
	})

	local var_5_0 = {
		id = "attachmentDeselect",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/DESELECT"),
		conditionFunction = function()
			return arg_5_0._selectedAttachment
		end,
		actionFunction = function()
			arg_5_0:dispatchEventToCurrentMenu({
				name = "contextual_menu_deselect_attachment"
			})
		end
	}

	arg_5_0:AddContextualMenuAction(var_5_0)

	local var_5_1 = {
		id = "attachmentGunsmithCustomize",
		actionName = Engine.CBBHFCGDIC("CAS/GUNSMITH_CUSTOM"),
		conditionFunction = function()
			return GUNSMITH.IsGunsmithCustomsAvailable(arg_5_1, arg_5_0._unlocked, arg_5_0._variants, arg_5_0._weapon, arg_5_0._category)
		end,
		actionFunction = function()
			local var_9_0 = LUI.FlowManager.GetScopedData(arg_5_0)
			local var_9_1 = var_0_2(arg_5_0)

			LUI.FlowManager.RequestAddMenu("AttachmentAppearanceSelect", true, arg_5_1, false, var_9_1)
		end
	}

	arg_5_0:AddContextualMenuAction(var_5_1)
end

local function var_0_4(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = ATTACHMENT.GetNewAttachmentIDsByCategory(arg_10_3, arg_10_1, arg_10_2)

	arg_10_0.NewItemSmallIcon:UpdateAlpha(#var_10_0 > 0 and not CONDITIONS.AreRestrictionsActive(arg_10_3) and 1 or 0, 0, true)
end

local function var_0_5(arg_11_0, arg_11_1)
	ACTIONS.AnimateSequence(arg_11_0, arg_11_1 and "SetCustomizePromptTop" or "SetCustomizePromptBottom")
end

local function var_0_6(arg_12_0, arg_12_1, arg_12_2)
	assert(arg_12_2 and type(arg_12_2) == "table", "You must provide a table of options.")
	assert(arg_12_2.buttonIndex, "You must provide the button index.")
	assert(arg_12_2.weaponTable and type(arg_12_2.weaponTable) == "table", "You must provide the weapon table.")
	assert(arg_12_2.category, "You must provide the weapon category for this button.")

	local var_12_0 = arg_12_2.weaponTable
	local var_12_1 = arg_12_2.category

	arg_12_0._attachments = arg_12_2.attachments
	arg_12_0._category = arg_12_2.category
	arg_12_0._selectedIndex = GUNSMITH.GetSelectedAttachIndexForCategory(var_12_1, var_12_0)
	arg_12_0._weapon = var_12_0.weapon
	arg_12_0._blocked = arg_12_2.blockedCategory ~= nil
	arg_12_0._selectedAttachment = arg_12_0._selectedIndex and ATTACHMENT.GetRef(var_12_0.attachments[arg_12_0._selectedIndex].ref, var_12_0.weapon)
	arg_12_0._variantID = arg_12_0._selectedIndex and var_12_0.attachments[arg_12_0._selectedIndex].variantID

	local var_12_2 = arg_12_0._selectedIndex and var_12_0.attachments[arg_12_0._selectedIndex].ref

	arg_12_0._variants = {}

	for iter_12_0 = 1, #arg_12_0._attachments do
		if arg_12_0._attachments[iter_12_0].unlocked and arg_12_0._attachments[iter_12_0].baseRef == var_12_2 then
			arg_12_0._variants = arg_12_0._attachments[iter_12_0].variants
			arg_12_0._unlocked = arg_12_0._attachments[iter_12_0].unlocked

			break
		end
	end

	local var_12_3 = arg_12_0:GetCurrentMenu()

	if var_12_3 then
		if arg_12_0._selectedAttachment then
			if LUI.IsLastInputGamepad(arg_12_1) then
				var_12_3.HelperBar.ButtonHelperText:PushButtonPrompt({
					side = "left",
					button_ref = "button_alt1",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
				})
			end
		else
			var_12_3.HelperBar.ButtonHelperText:PopButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
			})
		end
	end

	LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_12_1)

	local var_12_4 = Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(var_12_1))
	local var_12_5 = Engine.CBBHFCGDIC("CAS/ATTACHMENT_VARIANT", var_12_4)

	arg_12_0.Category:setText(arg_12_0._variantID and arg_12_0._variantID > WEAPON.baseVariant and var_12_5 or var_12_4)
	arg_12_0.Image:SetAlpha(1)

	if arg_12_0._selectedAttachment then
		arg_12_0.Name:setText(ATTACHMENT.GetName(arg_12_0._selectedAttachment))

		local var_12_6 = ATTACHMENT.GetImage(arg_12_0._selectedAttachment)

		if var_12_6 and #var_12_6 > 0 then
			arg_12_0.Image:setImage(RegisterMaterial(var_12_6))
		else
			arg_12_0.Image:SetAlpha(0)
		end

		arg_12_0.Selected:SetAlpha(1)

		if MLG.IsAttachmentRestricted(var_12_0.attachments[arg_12_0._selectedIndex].ref, arg_12_0._weapon) and CONDITIONS.AreRestrictionsActive(arg_12_1) then
			ACTIONS.AnimateSequence(arg_12_0, "Restriction")
		end
	elseif arg_12_0._blocked then
		arg_12_0.Name:setText(GUNSMITH.GetBlockedCategoryButtonWarning(var_12_0, arg_12_2.blockedCategory))
		arg_12_0.Image:setImage(RegisterMaterial("icon_empty_circle"))
		arg_12_0.Selected:SetAlpha(0)
	else
		arg_12_0.Name:setText(Engine.CBBHFCGDIC("CAS/NO_SELECTED_ATTACH"))
		arg_12_0.Image:SetAlpha(0)
		arg_12_0.Selected:SetAlpha(0)
	end

	local function var_12_7()
		local var_13_0 = ATTACHMENT.GetNewAttachmentIDsByCategory(arg_12_1, var_12_1, var_12_0.weapon)

		ACTIONS.AnimateSequence(arg_12_0, #var_13_0 > 0 and "UnlocksPlusNew" or "UnlocksNoNew")
	end

	local var_12_8
	local var_12_9
	local var_12_10

	if arg_12_0:isInFocus() then
		var_12_8 = "ButtonOver"
		var_12_10 = "ButtonOverEmpty"
	else
		var_12_8 = "ButtonUp"
		var_12_10 = "ButtonUpEmpty"
	end

	WZWIP.AnimateThemeElement(arg_12_0, (arg_12_0._selectedAttachment or arg_12_0._blocked) and var_12_8 or var_12_10)

	if var_12_10 == "ButtonOverEmpty" then
		var_12_7()
	end

	arg_12_0:SetButtonDisabled(arg_12_0._blocked)

	local var_12_11 = #arg_12_0._attachments
	local var_12_12 = 0

	for iter_12_1 = 1, var_12_11 do
		if arg_12_0._attachments[iter_12_1].unlocked then
			var_12_12 = var_12_12 + 1
		end
	end

	arg_12_0.Unlocks:setText(Engine.CBBHFCGDIC("CAS/GUNSMITH_UNLOCKS", var_12_12, var_12_11))

	if not arg_12_0._handlersAdded then
		arg_12_0:addEventHandler("button_over", function(arg_14_0, arg_14_1)
			DYN_ATTACHMENT.SetupGunsmithAttachmentStreamer(arg_14_0, arg_14_0._attachments, "image")

			local var_14_0 = LUI.FlowManager.GetScopedData(arg_14_0)

			var_14_0.selectedIndex = arg_14_0._selectedIndex

			if GUNSMITH.IsGunsmithCustomsAvailable(arg_12_1, arg_14_0._unlocked, arg_14_0._variants, arg_14_0._weapon, arg_14_0._category) then
				arg_14_0.GunsmithCustomizePrompt:SetAlpha(1)

				var_14_0.appearanceOptions = var_0_2(arg_14_0)
			else
				var_14_0.appearanceOptions = nil
			end

			local var_14_1 = arg_14_0:GetCurrentMenu()

			var_14_1.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				priority = 3,
				replaceTop = true,
				button_ref = "button_alt1",
				helper_text = ""
			})

			if arg_14_0._selectedAttachment then
				if LUI.IsLastInputGamepad(arg_12_1) then
					var_14_1.HelperBar.ButtonHelperText:PushButtonPrompt({
						side = "left",
						priority = 3,
						replaceTop = true,
						button_ref = "button_alt1",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
					})
				end
			else
				var_14_1.HelperBar.ButtonHelperText:PopButtonPrompt({
					side = "left",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
				})
			end

			WZWIP.AnimateThemeElement(arg_12_0, (arg_14_0._selectedAttachment or arg_14_0._blocked) and "ButtonOver" or "ButtonOverEmpty")

			if not arg_14_0._selectedAttachment and not arg_14_0._blocked then
				var_12_7()
			end

			var_0_0(arg_12_0, var_12_0.weapon, var_12_1)
			arg_12_0.Unlocks:SetAlpha(var_12_11 == var_12_12 and 0 or 1)
		end)
		arg_12_0:addEventHandler("button_up", function(arg_15_0, arg_15_1)
			WZWIP.AnimateThemeElement(arg_12_0, (arg_15_0._selectedAttachment or arg_15_0._blocked) and "ButtonUp" or "ButtonUpEmpty")

			if arg_12_0._attachLine then
				arg_12_0._attachLine:SetAlpha(0)
			end

			arg_12_0.Unlocks:SetAlpha(0)

			LUI.FlowManager.GetScopedData(arg_15_0).selectedIndex = nil

			arg_15_0.GunsmithCustomizePrompt:SetAlpha(0)
		end)
		arg_12_0:registerEventHandler("button_action", function(arg_16_0, arg_16_1)
			if arg_16_0._blocked then
				return
			end

			local var_16_0 = LUI.FlowManager.GetScopedData(arg_16_0)
			local var_16_1 = {
				weaponSlot = var_16_0.weaponSlot,
				loadoutIndex = var_16_0.loadoutIndex,
				category = arg_16_0._category,
				attachSlot = arg_16_0._selectedIndex,
				attachments = arg_16_0._attachments
			}

			LUI.FlowManager.RequestAddMenu("AttachmentSelect", true, arg_12_1, false, var_16_1)
		end)

		local function var_12_13(arg_17_0, arg_17_1)
			local var_17_0 = arg_17_0:GetCurrentMenu()

			if var_17_0 then
				if LUI.IsLastInputGamepad(arg_17_1.controllerIndex) and arg_17_0._selectedAttachment then
					var_17_0.HelperBar.ButtonHelperText:PushButtonPrompt({
						side = "left",
						priority = 3,
						replaceTop = true,
						button_ref = "button_alt1",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
					})
				else
					var_17_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						side = "left",
						button_ref = "button_alt1",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
					})
				end
			end

			local var_17_1 = LUI.FlowManager.GetScopedData(arg_17_0)
			local var_17_2 = var_17_1.selectedIndex and var_17_1.selectedIndex == arg_17_0._selectedIndex

			arg_17_0.GunsmithCustomizePrompt:SetAlpha(0)

			if var_17_2 and GUNSMITH.IsGunsmithCustomsAvailable(arg_12_1, arg_17_0._unlocked, arg_17_0._variants, arg_17_0._weapon, arg_17_0._category) then
				if LUI.IsLastInputGamepad(arg_12_1) then
					arg_17_0.GunsmithCustomizePrompt:SetAlpha(1)

					var_17_1.appearanceOptions = var_0_2(arg_17_0)
				end
			else
				var_17_1.appearanceOptions = nil
			end
		end

		arg_12_0:addAndCallEventHandler("update_input_type", var_12_13, {
			controllerIndex = arg_12_1
		})
		var_0_1(arg_12_0, arg_12_1)
		var_0_3(arg_12_0, arg_12_1)

		arg_12_0._handlersAdded = true
	end

	GUNSMITH.SetupAttachLine(arg_12_0, var_12_0.weapon, var_12_0.variantID, arg_12_0._category)

	if arg_12_0:isInFocus() then
		var_0_0(arg_12_0)
	end

	var_0_4(arg_12_0, var_12_1, var_12_0.weapon, arg_12_1)
end

local function var_0_7(arg_18_0)
	return arg_18_0._selectedAttachment or arg_18_0._blocked
end

local function var_0_8(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.Setup = var_0_6
	arg_19_0.SetPromptPosition = var_0_5
	arg_19_0.IsAttachmentEquipped = var_0_7

	arg_19_0:addEventHandler("button_over_disable", function(arg_20_0, arg_20_1)
		WZWIP.AnimateThemeElement(arg_20_0, "ButtonOverDisabled")
	end)
	arg_19_0:addEventHandler("button_disable", function(arg_21_0, arg_21_1)
		WZWIP.AnimateThemeElement(arg_21_0, "ButtonUpDisabled")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_19_0, "AR")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_19_0, "WZWipSetup")
	end

	arg_19_0._isNew = false
end

function GunsmithButton(arg_22_0, arg_22_1)
	local var_22_0 = LUI.UIButton.new()

	var_22_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 440 * _1080p, 0, 64 * _1080p)

	var_22_0.id = "GunsmithButton"
	var_22_0._animationSets = var_22_0._animationSets or {}
	var_22_0._sequences = var_22_0._sequences or {}

	local var_22_1 = arg_22_1 and arg_22_1.controllerIndex

	if not var_22_1 and not Engine.DDJFBBJAIG() then
		var_22_1 = var_22_0:getRootController()
	end

	assert(var_22_1)

	local var_22_2 = var_22_0
	local var_22_3
	local var_22_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_22_1
	})

	var_22_4.id = "LoadoutItemButtonBackground"

	var_22_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 90, _1080p * -90, 0, _1080p * 44)
	var_22_0:addElement(var_22_4)

	var_22_0.LoadoutItemButtonBackground = var_22_4

	local var_22_5
	local var_22_6 = LUI.UIImage.new()

	var_22_6.id = "Image"

	var_22_6:SetAlpha(0, 0)
	var_22_6:setImage(RegisterMaterial("icon_attachment_reflex_east01"), 0)
	var_22_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -165, _1080p * -121, _1080p * 10, _1080p * -10)
	var_22_0:addElement(var_22_6)

	var_22_0.Image = var_22_6

	local var_22_7
	local var_22_8 = LUI.UIStyledText.new()

	var_22_8.id = "Category"

	var_22_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_22_8:setText("", 0)
	var_22_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_8:SetWordWrap(false)
	var_22_8:SetAlignment(LUI.Alignment.Left)
	var_22_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_22_8:SetStartupDelay(1000)
	var_22_8:SetLineHoldTime(400)
	var_22_8:SetAnimMoveTime(150)
	var_22_8:SetAnimMoveSpeed(50)
	var_22_8:SetEndDelay(1000)
	var_22_8:SetCrossfadeTime(400)
	var_22_8:SetFadeInTime(300)
	var_22_8:SetFadeOutTime(300)
	var_22_8:SetMaxVisibleLines(1)
	var_22_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 98, _1080p * -142, _1080p * 10, _1080p * 34)
	var_22_0:addElement(var_22_8)

	var_22_0.Category = var_22_8

	local var_22_9
	local var_22_10 = LUI.UIStyledText.new()

	var_22_10.id = "Name"

	var_22_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_22_10:SetAlpha(0, 0)
	var_22_10:setText("", 0)
	var_22_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_10:SetAlignment(LUI.Alignment.Left)
	var_22_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_22_10:SetStartupDelay(2000)
	var_22_10:SetLineHoldTime(400)
	var_22_10:SetAnimMoveTime(2000)
	var_22_10:SetAnimMoveSpeed(150)
	var_22_10:SetEndDelay(2000)
	var_22_10:SetCrossfadeTime(250)
	var_22_10:SetFadeInTime(300)
	var_22_10:SetFadeOutTime(300)
	var_22_10:SetMaxVisibleLines(1)
	var_22_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 110, _1080p * -106, _1080p * 36, _1080p * 56)
	var_22_0:addElement(var_22_10)

	var_22_0.Name = var_22_10

	local var_22_11
	local var_22_12 = LUI.UIImage.new()

	var_22_12.id = "Selected"

	var_22_12:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_22_12:SetAlpha(0, 0)
	var_22_12:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_22_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -115, _1080p * -99, _1080p * 4, _1080p * 20)
	var_22_0:addElement(var_22_12)

	var_22_0.Selected = var_22_12

	local var_22_13
	local var_22_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_22_1
	})

	var_22_14.id = "NewItemSmallIcon"

	var_22_14:SetAlpha(0, 0)
	var_22_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 334, _1080p * 342, _1080p * 18, _1080p * 26)
	var_22_0:addElement(var_22_14)

	var_22_0.NewItemSmallIcon = var_22_14

	local var_22_15
	local var_22_16 = LUI.UIStyledText.new()

	var_22_16.id = "Unlocks"

	var_22_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_22_16:SetAlpha(0, 0)
	var_22_16:setText("2/20", 0)
	var_22_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_16:SetWordWrap(false)
	var_22_16:SetAlignment(LUI.Alignment.Right)
	var_22_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -118, _1080p * -74, _1080p * 36, _1080p * 56)
	var_22_0:addElement(var_22_16)

	var_22_0.Unlocks = var_22_16

	local var_22_17
	local var_22_18 = LUI.UIImage.new()

	var_22_18.id = "RestrictionWarning"

	var_22_18:SetAlpha(0, 0)
	var_22_18:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_22_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 90, _1080p * 126, _1080p * -28, _1080p * 8)
	var_22_0:addElement(var_22_18)

	var_22_0.RestrictionWarning = var_22_18

	local var_22_19
	local var_22_20 = LUI.UIStyledText.new()

	var_22_20.id = "GunsmithCustomizePrompt"

	var_22_20:setText(Engine.CBBHFCGDIC("CAS/GUNSMITH_CUSTOM_PROMPT"), 0)
	var_22_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_22_20:SetAlignment(LUI.Alignment.Left)
	var_22_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 90, _1080p * 325, _1080p * 64, _1080p * 82)
	var_22_0:addElement(var_22_20)

	var_22_0.GunsmithCustomizePrompt = var_22_20

	local function var_22_21()
		return
	end

	var_22_0._sequences.DefaultSequence = var_22_21

	local var_22_22
	local var_22_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -70,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_4:RegisterAnimationSequence("ButtonOver", var_22_23)

	local var_22_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -366,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -322,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("ButtonOver", var_22_24)

	local var_22_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 123,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -117,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonOver", var_22_25)

	local var_22_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 123,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -137,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_22_10:RegisterAnimationSequence("ButtonOver", var_22_26)

	local var_22_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -74,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_12:RegisterAnimationSequence("ButtonOver", var_22_27)

	local var_22_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 332
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_22_14:RegisterAnimationSequence("ButtonOver", var_22_28)

	local var_22_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		}
	}

	var_22_16:RegisterAnimationSequence("ButtonOver", var_22_29)

	local var_22_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 306
		}
	}

	var_22_20:RegisterAnimationSequence("ButtonOver", var_22_30)

	local function var_22_31()
		var_22_4:AnimateSequence("ButtonOver")
		var_22_6:AnimateSequence("ButtonOver")
		var_22_8:AnimateSequence("ButtonOver")
		var_22_10:AnimateSequence("ButtonOver")
		var_22_12:AnimateSequence("ButtonOver")
		var_22_14:AnimateSequence("ButtonOver")
		var_22_16:AnimateSequence("ButtonOver")
		var_22_20:AnimateSequence("ButtonOver")
	end

	var_22_0._sequences.ButtonOver = var_22_31

	local var_22_32
	local var_22_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonOverDisabled", var_22_33)

	local var_22_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_22_10:RegisterAnimationSequence("ButtonOverDisabled", var_22_34)

	local function var_22_35()
		var_22_8:AnimateSequence("ButtonOverDisabled")
		var_22_10:AnimateSequence("ButtonOverDisabled")
	end

	var_22_0._sequences.ButtonOverDisabled = var_22_35

	local var_22_36
	local var_22_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonUpDisabled", var_22_37)

	local var_22_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_22_10:RegisterAnimationSequence("ButtonUpDisabled", var_22_38)

	local function var_22_39()
		var_22_8:AnimateSequence("ButtonUpDisabled")
		var_22_10:AnimateSequence("ButtonUpDisabled")
	end

	var_22_0._sequences.ButtonUpDisabled = var_22_39

	local var_22_40
	local var_22_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -90
		}
	}

	var_22_4:RegisterAnimationSequence("ButtonOverEmpty", var_22_41)

	local var_22_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -121
		}
	}

	var_22_6:RegisterAnimationSequence("ButtonOverEmpty", var_22_42)

	local var_22_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -132
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonOverEmpty", var_22_43)

	local var_22_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -150
		}
	}

	var_22_10:RegisterAnimationSequence("ButtonOverEmpty", var_22_44)

	local var_22_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		}
	}

	var_22_12:RegisterAnimationSequence("ButtonOverEmpty", var_22_45)

	local var_22_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 334
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 342
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_22_14:RegisterAnimationSequence("ButtonOverEmpty", var_22_46)

	local function var_22_47()
		var_22_4:AnimateSequence("ButtonOverEmpty")
		var_22_6:AnimateSequence("ButtonOverEmpty")
		var_22_8:AnimateSequence("ButtonOverEmpty")
		var_22_10:AnimateSequence("ButtonOverEmpty")
		var_22_12:AnimateSequence("ButtonOverEmpty")
		var_22_14:AnimateSequence("ButtonOverEmpty")
	end

	var_22_0._sequences.ButtonOverEmpty = var_22_47

	local var_22_48
	local var_22_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 90
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -90
		}
	}

	var_22_4:RegisterAnimationSequence("ButtonUpEmpty", var_22_49)

	local var_22_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -121
		}
	}

	var_22_6:RegisterAnimationSequence("ButtonUpEmpty", var_22_50)

	local var_22_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -133
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonUpEmpty", var_22_51)

	local var_22_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_22_10:RegisterAnimationSequence("ButtonUpEmpty", var_22_52)

	local var_22_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		}
	}

	var_22_12:RegisterAnimationSequence("ButtonUpEmpty", var_22_53)

	local var_22_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 334
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 342
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_22_14:RegisterAnimationSequence("ButtonUpEmpty", var_22_54)

	local var_22_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_22_16:RegisterAnimationSequence("ButtonUpEmpty", var_22_55)

	local function var_22_56()
		var_22_4:AnimateSequence("ButtonUpEmpty")
		var_22_6:AnimateSequence("ButtonUpEmpty")
		var_22_8:AnimateSequence("ButtonUpEmpty")
		var_22_10:AnimateSequence("ButtonUpEmpty")
		var_22_12:AnimateSequence("ButtonUpEmpty")
		var_22_14:AnimateSequence("ButtonUpEmpty")
		var_22_16:AnimateSequence("ButtonUpEmpty")
	end

	var_22_0._sequences.ButtonUpEmpty = var_22_56

	local var_22_57
	local var_22_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -70,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_4:RegisterAnimationSequence("ButtonUp", var_22_58)

	local var_22_59 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -366,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -322,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("ButtonUp", var_22_59)

	local var_22_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 123,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -117,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_8:RegisterAnimationSequence("ButtonUp", var_22_60)

	local var_22_61 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 123,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -138,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_10:RegisterAnimationSequence("ButtonUp", var_22_61)

	local var_22_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -74,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_12:RegisterAnimationSequence("ButtonUp", var_22_62)

	local var_22_63 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 332
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_22_14:RegisterAnimationSequence("ButtonUp", var_22_63)

	local var_22_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		}
	}

	var_22_16:RegisterAnimationSequence("ButtonUp", var_22_64)

	local function var_22_65()
		var_22_4:AnimateSequence("ButtonUp")
		var_22_6:AnimateSequence("ButtonUp")
		var_22_8:AnimateSequence("ButtonUp")
		var_22_10:AnimateSequence("ButtonUp")
		var_22_12:AnimateSequence("ButtonUp")
		var_22_14:AnimateSequence("ButtonUp")
		var_22_16:AnimateSequence("ButtonUp")
	end

	var_22_0._sequences.ButtonUp = var_22_65

	local var_22_66
	local var_22_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		}
	}

	var_22_8:RegisterAnimationSequence("AR", var_22_67)

	local var_22_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -108
		}
	}

	var_22_10:RegisterAnimationSequence("AR", var_22_68)

	local function var_22_69()
		var_22_8:AnimateSequence("AR")
		var_22_10:AnimateSequence("AR")
	end

	var_22_0._sequences.AR = var_22_69

	local var_22_70
	local var_22_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_22_16:RegisterAnimationSequence("UnlocksNoNew", var_22_71)

	local function var_22_72()
		var_22_16:AnimateSequence("UnlocksNoNew")
	end

	var_22_0._sequences.UnlocksNoNew = var_22_72

	local function var_22_73()
		return
	end

	var_22_0._sequences.NewHasAllUnlocks = var_22_73

	local var_22_74
	local var_22_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -161
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -117
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_22_16:RegisterAnimationSequence("UnlocksPlusNew", var_22_75)

	local function var_22_76()
		var_22_16:AnimateSequence("UnlocksPlusNew")
	end

	var_22_0._sequences.UnlocksPlusNew = var_22_76

	local var_22_77
	local var_22_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_22_8:RegisterAnimationSequence("Restriction", var_22_78)

	local var_22_79 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_18:RegisterAnimationSequence("Restriction", var_22_79)

	local function var_22_80()
		var_22_8:AnimateSequence("Restriction")
		var_22_18:AnimateSequence("Restriction")
	end

	var_22_0._sequences.Restriction = var_22_80

	local var_22_81
	local var_22_82 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -70
		}
	}

	var_22_4:RegisterAnimationSequence("WZWipSetup", var_22_82)

	local var_22_83 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -160
		}
	}

	var_22_8:RegisterAnimationSequence("WZWipSetup", var_22_83)

	local var_22_84 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 71
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 306
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		}
	}

	var_22_20:RegisterAnimationSequence("WZWipSetup", var_22_84)

	local function var_22_85()
		var_22_4:AnimateSequence("WZWipSetup")
		var_22_8:AnimateSequence("WZWipSetup")
		var_22_20:AnimateSequence("WZWipSetup")
	end

	var_22_0._sequences.WZWipSetup = var_22_85

	local var_22_86
	local var_22_87 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -70,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_4:RegisterAnimationSequence("WZWipButtonOver", var_22_87)

	local var_22_88 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -361,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -317,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("WZWipButtonOver", var_22_88)

	local var_22_89 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -112,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("WZWipButtonOver", var_22_89)

	local var_22_90 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -132,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_22_10:RegisterAnimationSequence("WZWipButtonOver", var_22_90)

	local var_22_91 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -74,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_12:RegisterAnimationSequence("WZWipButtonOver", var_22_91)

	local var_22_92 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 332
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_22_14:RegisterAnimationSequence("WZWipButtonOver", var_22_92)

	local var_22_93 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		}
	}

	var_22_16:RegisterAnimationSequence("WZWipButtonOver", var_22_93)

	local function var_22_94()
		var_22_4:AnimateSequence("WZWipButtonOver")
		var_22_6:AnimateSequence("WZWipButtonOver")
		var_22_8:AnimateSequence("WZWipButtonOver")
		var_22_10:AnimateSequence("WZWipButtonOver")
		var_22_12:AnimateSequence("WZWipButtonOver")
		var_22_14:AnimateSequence("WZWipButtonOver")
		var_22_16:AnimateSequence("WZWipButtonOver")
	end

	var_22_0._sequences.WZWipButtonOver = var_22_94

	local var_22_95
	local var_22_96 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("WZWipButtonOverDisabled", var_22_96)

	local var_22_97 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_22_10:RegisterAnimationSequence("WZWipButtonOverDisabled", var_22_97)

	local function var_22_98()
		var_22_8:AnimateSequence("WZWipButtonOverDisabled")
		var_22_10:AnimateSequence("WZWipButtonOverDisabled")
	end

	var_22_0._sequences.WZWipButtonOverDisabled = var_22_98

	local var_22_99
	local var_22_100 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		}
	}

	var_22_4:RegisterAnimationSequence("WZWipButtonOverEmpty", var_22_100)

	local var_22_101 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -121
		}
	}

	var_22_6:RegisterAnimationSequence("WZWipButtonOverEmpty", var_22_101)

	local var_22_102 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 80
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -160
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("WZWipButtonOverEmpty", var_22_102)

	local var_22_103 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -150
		}
	}

	var_22_10:RegisterAnimationSequence("WZWipButtonOverEmpty", var_22_103)

	local var_22_104 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		}
	}

	var_22_12:RegisterAnimationSequence("WZWipButtonOverEmpty", var_22_104)

	local var_22_105 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 334
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 342
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_22_14:RegisterAnimationSequence("WZWipButtonOverEmpty", var_22_105)

	local function var_22_106()
		var_22_4:AnimateSequence("WZWipButtonOverEmpty")
		var_22_6:AnimateSequence("WZWipButtonOverEmpty")
		var_22_8:AnimateSequence("WZWipButtonOverEmpty")
		var_22_10:AnimateSequence("WZWipButtonOverEmpty")
		var_22_12:AnimateSequence("WZWipButtonOverEmpty")
		var_22_14:AnimateSequence("WZWipButtonOverEmpty")
	end

	var_22_0._sequences.WZWipButtonOverEmpty = var_22_106

	local var_22_107
	local var_22_108 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 64
		}
	}

	var_22_4:RegisterAnimationSequence("WZWipButtonUp", var_22_108)

	local var_22_109 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -361,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -317,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_6:RegisterAnimationSequence("WZWipButtonUp", var_22_109)

	local var_22_110 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -97,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("WZWipButtonUp", var_22_110)

	local var_22_111 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 128,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -118,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_10:RegisterAnimationSequence("WZWipButtonUp", var_22_111)

	local var_22_112 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -90,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -74,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_22_12:RegisterAnimationSequence("WZWipButtonUp", var_22_112)

	local var_22_113 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 332
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_22_14:RegisterAnimationSequence("WZWipButtonUp", var_22_113)

	local var_22_114 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -118
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 36
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 56
		}
	}

	var_22_16:RegisterAnimationSequence("WZWipButtonUp", var_22_114)

	local function var_22_115()
		var_22_4:AnimateSequence("WZWipButtonUp")
		var_22_6:AnimateSequence("WZWipButtonUp")
		var_22_8:AnimateSequence("WZWipButtonUp")
		var_22_10:AnimateSequence("WZWipButtonUp")
		var_22_12:AnimateSequence("WZWipButtonUp")
		var_22_14:AnimateSequence("WZWipButtonUp")
		var_22_16:AnimateSequence("WZWipButtonUp")
	end

	var_22_0._sequences.WZWipButtonUp = var_22_115

	local var_22_116
	local var_22_117 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("WZWipButtonUpDisabled", var_22_117)

	local var_22_118 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_22_10:RegisterAnimationSequence("WZWipButtonUpDisabled", var_22_118)

	local var_22_119 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_22_20:RegisterAnimationSequence("WZWipButtonUpDisabled", var_22_119)

	local function var_22_120()
		var_22_8:AnimateSequence("WZWipButtonUpDisabled")
		var_22_10:AnimateSequence("WZWipButtonUpDisabled")
		var_22_20:AnimateSequence("WZWipButtonUpDisabled")
	end

	var_22_0._sequences.WZWipButtonUpDisabled = var_22_120

	local var_22_121
	local var_22_122 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Top
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 44
		}
	}

	var_22_4:RegisterAnimationSequence("WZWipButtonUpEmpty", var_22_122)

	local var_22_123 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -165
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -121
		}
	}

	var_22_6:RegisterAnimationSequence("WZWipButtonUpEmpty", var_22_123)

	local var_22_124 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_22_8:RegisterAnimationSequence("WZWipButtonUpEmpty", var_22_124)

	local var_22_125 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 98
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -150
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_22_10:RegisterAnimationSequence("WZWipButtonUpEmpty", var_22_125)

	local var_22_126 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		}
	}

	var_22_12:RegisterAnimationSequence("WZWipButtonUpEmpty", var_22_126)

	local var_22_127 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 334
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 342
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 26
		}
	}

	var_22_14:RegisterAnimationSequence("WZWipButtonUpEmpty", var_22_127)

	local var_22_128 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -138
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -94
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 12
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 32
		}
	}

	var_22_16:RegisterAnimationSequence("WZWipButtonUpEmpty", var_22_128)

	local var_22_129 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 71
		}
	}

	var_22_20:RegisterAnimationSequence("WZWipButtonUpEmpty", var_22_129)

	local function var_22_130()
		var_22_4:AnimateSequence("WZWipButtonUpEmpty")
		var_22_6:AnimateSequence("WZWipButtonUpEmpty")
		var_22_8:AnimateSequence("WZWipButtonUpEmpty")
		var_22_10:AnimateSequence("WZWipButtonUpEmpty")
		var_22_12:AnimateSequence("WZWipButtonUpEmpty")
		var_22_14:AnimateSequence("WZWipButtonUpEmpty")
		var_22_16:AnimateSequence("WZWipButtonUpEmpty")
		var_22_20:AnimateSequence("WZWipButtonUpEmpty")
	end

	var_22_0._sequences.WZWipButtonUpEmpty = var_22_130

	local var_22_131
	local var_22_132 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -26
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -8
		}
	}

	var_22_20:RegisterAnimationSequence("SetCustomizePromptTop", var_22_132)

	local function var_22_133()
		var_22_20:AnimateSequence("SetCustomizePromptTop")
	end

	var_22_0._sequences.SetCustomizePromptTop = var_22_133

	local var_22_134
	local var_22_135 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 79
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 97
		}
	}

	var_22_20:RegisterAnimationSequence("SetCustomizePromptBottom", var_22_135)

	local function var_22_136()
		var_22_20:AnimateSequence("SetCustomizePromptBottom")
	end

	var_22_0._sequences.SetCustomizePromptBottom = var_22_136

	var_0_8(var_22_0, var_22_1, arg_22_1)

	return var_22_0
end

MenuBuilder.registerType("GunsmithButton", GunsmithButton)
LockTable(_M)
