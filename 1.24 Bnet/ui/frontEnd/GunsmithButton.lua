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

local function var_0_5(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
	arg_11_0._attachments = arg_11_3
	arg_11_0._category = arg_11_2
	arg_11_0._selectedIndex = GUNSMITH.GetSelectedAttachIndexForCategory(arg_11_2, arg_11_4)
	arg_11_0._weapon = arg_11_4.weapon
	arg_11_0._blocked = arg_11_5 ~= nil
	arg_11_0._selectedAttachment = arg_11_0._selectedIndex and ATTACHMENT.GetRef(arg_11_4.attachments[arg_11_0._selectedIndex].ref, arg_11_4.weapon)
	arg_11_0._variantID = arg_11_0._selectedIndex and arg_11_4.attachments[arg_11_0._selectedIndex].variantID

	local var_11_0 = arg_11_0._selectedIndex and arg_11_4.attachments[arg_11_0._selectedIndex].ref

	arg_11_0._variants = {}

	for iter_11_0 = 1, #arg_11_0._attachments do
		if arg_11_0._attachments[iter_11_0].unlocked and arg_11_0._attachments[iter_11_0].baseRef == var_11_0 then
			arg_11_0._variants = arg_11_0._attachments[iter_11_0].variants
			arg_11_0._unlocked = arg_11_0._attachments[iter_11_0].unlocked

			break
		end
	end

	local var_11_1 = arg_11_0:GetCurrentMenu()

	if var_11_1 then
		if arg_11_0._selectedAttachment then
			if LUI.IsLastInputGamepad(arg_11_1) then
				var_11_1.HelperBar.ButtonHelperText:PushButtonPrompt({
					side = "left",
					button_ref = "button_alt1",
					priority = 3,
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
				})
			end
		else
			var_11_1.HelperBar.ButtonHelperText:PopButtonPrompt({
				side = "left",
				button_ref = "button_alt1",
				helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
			})
		end
	end

	LUI.MouseCursorTooltipLayer.RefreshTooltip(arg_11_1)

	local var_11_2 = Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(arg_11_2))
	local var_11_3 = Engine.CBBHFCGDIC("CAS/ATTACHMENT_VARIANT", var_11_2)

	arg_11_0.Category:setText(arg_11_0._variantID and arg_11_0._variantID > WEAPON.baseVariant and var_11_3 or var_11_2)
	arg_11_0.Image:SetAlpha(1)

	if arg_11_0._selectedAttachment then
		arg_11_0.Name:setText(ATTACHMENT.GetName(arg_11_0._selectedAttachment))

		local var_11_4 = ATTACHMENT.GetImage(arg_11_0._selectedAttachment)

		if var_11_4 and #var_11_4 > 0 then
			arg_11_0.Image:setImage(RegisterMaterial(var_11_4))
		else
			arg_11_0.Image:SetAlpha(0)
		end

		arg_11_0.Selected:SetAlpha(1)

		if MatchRules.EBCADBGDHB(arg_11_4.attachments[arg_11_0._selectedIndex].ref, arg_11_0._weapon) and CONDITIONS.AreRestrictionsActive(arg_11_1) then
			ACTIONS.AnimateSequence(arg_11_0, "Restriction")
		end
	elseif arg_11_0._blocked then
		arg_11_0.Name:setText(GUNSMITH.GetBlockedCategoryButtonWarning(arg_11_4, arg_11_5))
		arg_11_0.Image:setImage(RegisterMaterial("icon_empty_circle"))
		arg_11_0.Selected:SetAlpha(0)
	else
		arg_11_0.Name:setText(Engine.CBBHFCGDIC("CAS/NO_SELECTED_ATTACH"))
		arg_11_0.Image:SetAlpha(0)
		arg_11_0.Selected:SetAlpha(0)
	end

	local function var_11_5()
		local var_12_0 = ATTACHMENT.GetNewAttachmentIDsByCategory(arg_11_1, arg_11_2, arg_11_4.weapon)

		ACTIONS.AnimateSequence(arg_11_0, #var_12_0 > 0 and "UnlocksPlusNew" or "UnlocksNoNew")
	end

	local var_11_6
	local var_11_7
	local var_11_8

	if arg_11_0:isInFocus() then
		var_11_6 = "ButtonOver"
		var_11_8 = "ButtonOverEmpty"
	else
		var_11_6 = "ButtonUp"
		var_11_8 = "ButtonUpEmpty"
	end

	ACTIONS.AnimateSequence(arg_11_0, (arg_11_0._selectedAttachment or arg_11_0._blocked) and var_11_6 or var_11_8)

	if var_11_8 == "ButtonOverEmpty" then
		var_11_5()
	end

	arg_11_0:SetButtonDisabled(arg_11_0._blocked)

	local var_11_9 = #arg_11_0._attachments
	local var_11_10 = 0

	for iter_11_1 = 1, var_11_9 do
		if arg_11_0._attachments[iter_11_1].unlocked then
			var_11_10 = var_11_10 + 1
		end
	end

	arg_11_0.Unlocks:setText(Engine.CBBHFCGDIC("CAS/GUNSMITH_UNLOCKS", var_11_10, var_11_9))

	if not arg_11_0._handlersAdded then
		arg_11_0:addEventHandler("button_over", function(arg_13_0, arg_13_1)
			DYN_ATTACHMENT.SetupGunsmithAttachmentStreamer(arg_13_0, arg_13_0._attachments, "image")

			local var_13_0 = LUI.FlowManager.GetScopedData(arg_13_0)

			var_13_0.selectedIndex = arg_13_0._selectedIndex

			if GUNSMITH.IsGunsmithCustomsAvailable(arg_11_1, arg_13_0._unlocked, arg_13_0._variants, arg_13_0._weapon, arg_13_0._category) then
				arg_13_0.GunsmithCustomizePrompt:SetAlpha(1)

				var_13_0.appearanceOptions = var_0_2(arg_13_0)
			else
				var_13_0.appearanceOptions = nil
			end

			local var_13_1 = arg_13_0:GetCurrentMenu()

			var_13_1.HelperBar.ButtonHelperText:PushButtonPrompt({
				side = "left",
				priority = 3,
				replaceTop = true,
				button_ref = "button_alt1",
				helper_text = ""
			})

			if arg_13_0._selectedAttachment then
				if LUI.IsLastInputGamepad(arg_11_1) then
					var_13_1.HelperBar.ButtonHelperText:PushButtonPrompt({
						side = "left",
						priority = 3,
						replaceTop = true,
						button_ref = "button_alt1",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
					})
				end
			else
				var_13_1.HelperBar.ButtonHelperText:PopButtonPrompt({
					side = "left",
					button_ref = "button_alt1",
					helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
				})
			end

			ACTIONS.AnimateSequence(arg_11_0, (arg_13_0._selectedAttachment or arg_13_0._blocked) and "ButtonOver" or "ButtonOverEmpty")

			if not arg_13_0._selectedAttachment and not arg_13_0._blocked then
				var_11_5()
			end

			var_0_0(arg_11_0, arg_11_4.weapon, arg_11_2)
			arg_11_0.Unlocks:SetAlpha(var_11_9 == var_11_10 and 0 or 1)
		end)
		arg_11_0:addEventHandler("button_up", function(arg_14_0, arg_14_1)
			ACTIONS.AnimateSequence(arg_11_0, (arg_14_0._selectedAttachment or arg_14_0._blocked) and "ButtonUp" or "ButtonUpEmpty")

			if arg_11_0._attachLine then
				arg_11_0._attachLine:SetAlpha(0)
			end

			arg_11_0.Unlocks:SetAlpha(0)

			LUI.FlowManager.GetScopedData(arg_14_0).selectedIndex = nil

			arg_14_0.GunsmithCustomizePrompt:SetAlpha(0)
		end)
		arg_11_0:registerEventHandler("button_action", function(arg_15_0, arg_15_1)
			if arg_15_0._blocked then
				return
			end

			local var_15_0 = LUI.FlowManager.GetScopedData(arg_15_0)
			local var_15_1 = {
				weaponSlot = var_15_0.weaponSlot,
				loadoutIndex = var_15_0.loadoutIndex,
				category = arg_15_0._category,
				attachSlot = arg_15_0._selectedIndex,
				attachments = arg_15_0._attachments
			}

			LUI.FlowManager.RequestAddMenu("AttachmentSelect", true, arg_11_1, false, var_15_1)
		end)

		local function var_11_11(arg_16_0, arg_16_1)
			local var_16_0 = arg_16_0:GetCurrentMenu()

			if var_16_0 then
				if LUI.IsLastInputGamepad(arg_16_1.controllerIndex) and arg_16_0._selectedAttachment then
					var_16_0.HelperBar.ButtonHelperText:PushButtonPrompt({
						side = "left",
						priority = 3,
						replaceTop = true,
						button_ref = "button_alt1",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
					})
				else
					var_16_0.HelperBar.ButtonHelperText:PopButtonPrompt({
						side = "left",
						button_ref = "button_alt1",
						helper_text = Engine.CBBHFCGDIC("LUA_MENU/DESELECT")
					})
				end
			end

			local var_16_1 = LUI.FlowManager.GetScopedData(arg_16_0)
			local var_16_2 = var_16_1.selectedIndex and var_16_1.selectedIndex == arg_16_0._selectedIndex

			arg_16_0.GunsmithCustomizePrompt:SetAlpha(0)

			if var_16_2 and GUNSMITH.IsGunsmithCustomsAvailable(arg_11_1, arg_16_0._unlocked, arg_16_0._variants, arg_16_0._weapon, arg_16_0._category) then
				if LUI.IsLastInputGamepad(arg_11_1) then
					arg_16_0.GunsmithCustomizePrompt:SetAlpha(1)

					var_16_1.appearanceOptions = var_0_2(arg_16_0)
				end
			else
				var_16_1.appearanceOptions = nil
			end
		end

		arg_11_0:addAndCallEventHandler("update_input_type", var_11_11, {
			controllerIndex = arg_11_1
		})
		arg_11_0:registerEventHandler("scene_transitioned", function(arg_17_0, arg_17_1)
			GUNSMITH.SetupAttachLine(arg_17_0, arg_11_4.weapon, arg_11_4.variantID, arg_17_0._category)

			if arg_17_0:isInFocus() then
				var_0_0(arg_17_0)
			end
		end)
		var_0_1(arg_11_0, arg_11_1)
		var_0_3(arg_11_0, arg_11_1)

		arg_11_0._handlersAdded = true
	end

	var_0_4(arg_11_0, arg_11_2, arg_11_4.weapon, arg_11_1)
end

local function var_0_6(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.Setup = var_0_5

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_18_0, "AR")
	end

	arg_18_0._isNew = false
end

function GunsmithButton(arg_19_0, arg_19_1)
	local var_19_0 = LUI.UIButton.new()

	var_19_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 440 * _1080p, 0, 64 * _1080p)

	var_19_0.id = "GunsmithButton"
	var_19_0._animationSets = var_19_0._animationSets or {}
	var_19_0._sequences = var_19_0._sequences or {}

	local var_19_1 = arg_19_1 and arg_19_1.controllerIndex

	if not var_19_1 and not Engine.DDJFBBJAIG() then
		var_19_1 = var_19_0:getRootController()
	end

	assert(var_19_1)

	local var_19_2 = var_19_0
	local var_19_3
	local var_19_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_19_1
	})

	var_19_4.id = "LoadoutItemButtonBackground"

	var_19_4:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 90, _1080p * -90, 0, _1080p * 44)
	var_19_0:addElement(var_19_4)

	var_19_0.LoadoutItemButtonBackground = var_19_4

	local var_19_5
	local var_19_6 = LUI.UIImage.new()

	var_19_6.id = "Image"

	var_19_6:SetAlpha(0, 0)
	var_19_6:setImage(RegisterMaterial("icon_attachment_reflex_east01"), 0)
	var_19_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -165, _1080p * -121, _1080p * 10, _1080p * -10)
	var_19_0:addElement(var_19_6)

	var_19_0.Image = var_19_6

	local var_19_7
	local var_19_8 = LUI.UIStyledText.new()

	var_19_8.id = "Category"

	var_19_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_19_8:setText("", 0)
	var_19_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_8:SetWordWrap(false)
	var_19_8:SetAlignment(LUI.Alignment.Left)
	var_19_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_8:SetStartupDelay(1000)
	var_19_8:SetLineHoldTime(400)
	var_19_8:SetAnimMoveTime(150)
	var_19_8:SetAnimMoveSpeed(50)
	var_19_8:SetEndDelay(1000)
	var_19_8:SetCrossfadeTime(400)
	var_19_8:SetFadeInTime(300)
	var_19_8:SetFadeOutTime(300)
	var_19_8:SetMaxVisibleLines(1)
	var_19_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 98, _1080p * -142, _1080p * 10, _1080p * 34)
	var_19_0:addElement(var_19_8)

	var_19_0.Category = var_19_8

	local var_19_9
	local var_19_10 = LUI.UIStyledText.new()

	var_19_10.id = "Name"

	var_19_10:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_19_10:SetAlpha(0, 0)
	var_19_10:setText("", 0)
	var_19_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_10:SetAlignment(LUI.Alignment.Left)
	var_19_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_19_10:SetStartupDelay(2000)
	var_19_10:SetLineHoldTime(400)
	var_19_10:SetAnimMoveTime(2000)
	var_19_10:SetAnimMoveSpeed(150)
	var_19_10:SetEndDelay(2000)
	var_19_10:SetCrossfadeTime(250)
	var_19_10:SetFadeInTime(300)
	var_19_10:SetFadeOutTime(300)
	var_19_10:SetMaxVisibleLines(1)
	var_19_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 110, _1080p * -106, _1080p * 36, _1080p * 56)
	var_19_0:addElement(var_19_10)

	var_19_0.Name = var_19_10

	local var_19_11
	local var_19_12 = LUI.UIImage.new()

	var_19_12.id = "Selected"

	var_19_12:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_19_12:SetAlpha(0, 0)
	var_19_12:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_19_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -110, _1080p * -94, _1080p * 14, _1080p * 30)
	var_19_0:addElement(var_19_12)

	var_19_0.Selected = var_19_12

	local var_19_13
	local var_19_14 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
		controllerIndex = var_19_1
	})

	var_19_14.id = "NewItemSmallIcon"

	var_19_14:SetAlpha(0, 0)
	var_19_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 334, _1080p * 342, _1080p * 18, _1080p * 26)
	var_19_0:addElement(var_19_14)

	var_19_0.NewItemSmallIcon = var_19_14

	local var_19_15
	local var_19_16 = LUI.UIStyledText.new()

	var_19_16.id = "Unlocks"

	var_19_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_19_16:SetAlpha(0, 0)
	var_19_16:setText("2/20", 0)
	var_19_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_16:SetWordWrap(false)
	var_19_16:SetAlignment(LUI.Alignment.Right)
	var_19_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -118, _1080p * -74, _1080p * 36, _1080p * 56)
	var_19_0:addElement(var_19_16)

	var_19_0.Unlocks = var_19_16

	local var_19_17
	local var_19_18 = LUI.UIImage.new()

	var_19_18.id = "RestrictionWarning"

	var_19_18:SetAlpha(0, 0)
	var_19_18:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_19_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 90, _1080p * 126, _1080p * -28, _1080p * 8)
	var_19_0:addElement(var_19_18)

	var_19_0.RestrictionWarning = var_19_18

	local var_19_19
	local var_19_20 = LUI.UIStyledText.new()

	var_19_20.id = "GunsmithCustomizePrompt"

	var_19_20:setText(Engine.CBBHFCGDIC("CAS/GUNSMITH_CUSTOM_PROMPT"), 0)
	var_19_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_19_20:SetAlignment(LUI.Alignment.Left)
	var_19_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 91, _1080p * 326, _1080p * 67, _1080p * 85)
	var_19_0:addElement(var_19_20)

	var_19_0.GunsmithCustomizePrompt = var_19_20

	local function var_19_21()
		return
	end

	var_19_0._sequences.DefaultSequence = var_19_21

	local var_19_22
	local var_19_23 = {
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

	var_19_4:RegisterAnimationSequence("ButtonOver", var_19_23)

	local var_19_24 = {
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

	var_19_6:RegisterAnimationSequence("ButtonOver", var_19_24)

	local var_19_25 = {
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

	var_19_8:RegisterAnimationSequence("ButtonOver", var_19_25)

	local var_19_26 = {
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

	var_19_10:RegisterAnimationSequence("ButtonOver", var_19_26)

	local var_19_27 = {
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

	var_19_12:RegisterAnimationSequence("ButtonOver", var_19_27)

	local var_19_28 = {
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

	var_19_14:RegisterAnimationSequence("ButtonOver", var_19_28)

	local var_19_29 = {
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

	var_19_16:RegisterAnimationSequence("ButtonOver", var_19_29)

	local var_19_30 = {
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

	var_19_20:RegisterAnimationSequence("ButtonOver", var_19_30)

	local function var_19_31()
		var_19_4:AnimateSequence("ButtonOver")
		var_19_6:AnimateSequence("ButtonOver")
		var_19_8:AnimateSequence("ButtonOver")
		var_19_10:AnimateSequence("ButtonOver")
		var_19_12:AnimateSequence("ButtonOver")
		var_19_14:AnimateSequence("ButtonOver")
		var_19_16:AnimateSequence("ButtonOver")
		var_19_20:AnimateSequence("ButtonOver")
	end

	var_19_0._sequences.ButtonOver = var_19_31

	local var_19_32
	local var_19_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_19_8:RegisterAnimationSequence("ButtonOverDisabled", var_19_33)

	local var_19_34 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_19_10:RegisterAnimationSequence("ButtonOverDisabled", var_19_34)

	local function var_19_35()
		var_19_8:AnimateSequence("ButtonOverDisabled")
		var_19_10:AnimateSequence("ButtonOverDisabled")
	end

	var_19_0._sequences.ButtonOverDisabled = var_19_35

	local var_19_36
	local var_19_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_19_8:RegisterAnimationSequence("ButtonUpDisabled", var_19_37)

	local var_19_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.AAR.AARdescription
		}
	}

	var_19_10:RegisterAnimationSequence("ButtonUpDisabled", var_19_38)

	local function var_19_39()
		var_19_8:AnimateSequence("ButtonUpDisabled")
		var_19_10:AnimateSequence("ButtonUpDisabled")
	end

	var_19_0._sequences.ButtonUpDisabled = var_19_39

	local var_19_40
	local var_19_41 = {
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

	var_19_4:RegisterAnimationSequence("ButtonOverEmpty", var_19_41)

	local var_19_42 = {
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

	var_19_6:RegisterAnimationSequence("ButtonOverEmpty", var_19_42)

	local var_19_43 = {
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

	var_19_8:RegisterAnimationSequence("ButtonOverEmpty", var_19_43)

	local var_19_44 = {
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

	var_19_10:RegisterAnimationSequence("ButtonOverEmpty", var_19_44)

	local var_19_45 = {
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

	var_19_12:RegisterAnimationSequence("ButtonOverEmpty", var_19_45)

	local var_19_46 = {
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

	var_19_14:RegisterAnimationSequence("ButtonOverEmpty", var_19_46)

	local function var_19_47()
		var_19_4:AnimateSequence("ButtonOverEmpty")
		var_19_6:AnimateSequence("ButtonOverEmpty")
		var_19_8:AnimateSequence("ButtonOverEmpty")
		var_19_10:AnimateSequence("ButtonOverEmpty")
		var_19_12:AnimateSequence("ButtonOverEmpty")
		var_19_14:AnimateSequence("ButtonOverEmpty")
	end

	var_19_0._sequences.ButtonOverEmpty = var_19_47

	local var_19_48
	local var_19_49 = {
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

	var_19_4:RegisterAnimationSequence("ButtonUpEmpty", var_19_49)

	local var_19_50 = {
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

	var_19_6:RegisterAnimationSequence("ButtonUpEmpty", var_19_50)

	local var_19_51 = {
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

	var_19_8:RegisterAnimationSequence("ButtonUpEmpty", var_19_51)

	local var_19_52 = {
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

	var_19_10:RegisterAnimationSequence("ButtonUpEmpty", var_19_52)

	local var_19_53 = {
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

	var_19_12:RegisterAnimationSequence("ButtonUpEmpty", var_19_53)

	local var_19_54 = {
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

	var_19_14:RegisterAnimationSequence("ButtonUpEmpty", var_19_54)

	local var_19_55 = {
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

	var_19_16:RegisterAnimationSequence("ButtonUpEmpty", var_19_55)

	local function var_19_56()
		var_19_4:AnimateSequence("ButtonUpEmpty")
		var_19_6:AnimateSequence("ButtonUpEmpty")
		var_19_8:AnimateSequence("ButtonUpEmpty")
		var_19_10:AnimateSequence("ButtonUpEmpty")
		var_19_12:AnimateSequence("ButtonUpEmpty")
		var_19_14:AnimateSequence("ButtonUpEmpty")
		var_19_16:AnimateSequence("ButtonUpEmpty")
	end

	var_19_0._sequences.ButtonUpEmpty = var_19_56

	local var_19_57
	local var_19_58 = {
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

	var_19_4:RegisterAnimationSequence("ButtonUp", var_19_58)

	local var_19_59 = {
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

	var_19_6:RegisterAnimationSequence("ButtonUp", var_19_59)

	local var_19_60 = {
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

	var_19_8:RegisterAnimationSequence("ButtonUp", var_19_60)

	local var_19_61 = {
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

	var_19_10:RegisterAnimationSequence("ButtonUp", var_19_61)

	local var_19_62 = {
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

	var_19_12:RegisterAnimationSequence("ButtonUp", var_19_62)

	local var_19_63 = {
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

	var_19_14:RegisterAnimationSequence("ButtonUp", var_19_63)

	local var_19_64 = {
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

	var_19_16:RegisterAnimationSequence("ButtonUp", var_19_64)

	local var_19_65 = {
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

	var_19_20:RegisterAnimationSequence("ButtonUp", var_19_65)

	local function var_19_66()
		var_19_4:AnimateSequence("ButtonUp")
		var_19_6:AnimateSequence("ButtonUp")
		var_19_8:AnimateSequence("ButtonUp")
		var_19_10:AnimateSequence("ButtonUp")
		var_19_12:AnimateSequence("ButtonUp")
		var_19_14:AnimateSequence("ButtonUp")
		var_19_16:AnimateSequence("ButtonUp")
		var_19_20:AnimateSequence("ButtonUp")
	end

	var_19_0._sequences.ButtonUp = var_19_66

	local var_19_67
	local var_19_68 = {
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

	var_19_8:RegisterAnimationSequence("AR", var_19_68)

	local var_19_69 = {
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

	var_19_10:RegisterAnimationSequence("AR", var_19_69)

	local function var_19_70()
		var_19_8:AnimateSequence("AR")
		var_19_10:AnimateSequence("AR")
	end

	var_19_0._sequences.AR = var_19_70

	local var_19_71
	local var_19_72 = {
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

	var_19_16:RegisterAnimationSequence("UnlocksNoNew", var_19_72)

	local function var_19_73()
		var_19_16:AnimateSequence("UnlocksNoNew")
	end

	var_19_0._sequences.UnlocksNoNew = var_19_73

	local function var_19_74()
		return
	end

	var_19_0._sequences.NewHasAllUnlocks = var_19_74

	local var_19_75
	local var_19_76 = {
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

	var_19_16:RegisterAnimationSequence("UnlocksPlusNew", var_19_76)

	local function var_19_77()
		var_19_16:AnimateSequence("UnlocksPlusNew")
	end

	var_19_0._sequences.UnlocksPlusNew = var_19_77

	local var_19_78
	local var_19_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_19_8:RegisterAnimationSequence("Restriction", var_19_79)

	local var_19_80 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_19_18:RegisterAnimationSequence("Restriction", var_19_80)

	local function var_19_81()
		var_19_8:AnimateSequence("Restriction")
		var_19_18:AnimateSequence("Restriction")
	end

	var_19_0._sequences.Restriction = var_19_81

	var_19_0:addEventHandler("button_over_disable", function(arg_32_0, arg_32_1)
		if not arg_32_1.controller then
			local var_32_0 = var_19_1
		end

		ACTIONS.AnimateSequence(var_19_0, "ButtonOverDisabled")
	end)
	var_19_0:addEventHandler("button_disable", function(arg_33_0, arg_33_1)
		if not arg_33_1.controller then
			local var_33_0 = var_19_1
		end

		ACTIONS.AnimateSequence(var_19_0, "ButtonUpDisabled")
	end)
	var_0_6(var_19_0, var_19_1, arg_19_1)

	return var_19_0
end

MenuBuilder.registerType("GunsmithButton", GunsmithButton)
LockTable(_M)
