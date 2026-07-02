module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0._lastState ~= arg_1_1 then
		arg_1_0._lastState = arg_1_1

		WZWIP.AnimateThemeElement(arg_1_0, arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = ATTACHMENT.GetNewAttachmentIDsByCategory(arg_2_3, arg_2_1, arg_2_2)

	if arg_2_0.NewItemSmallIcon then
		arg_2_0.NewItemSmallIcon:UpdateAlpha(#var_2_0 > 0 and 1 or 0, 0, true)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(arg_3_1))
	})

	local var_3_0 = {
		id = "categoryDeselect",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/DESELECT"),
		conditionFunction = function()
			return arg_3_0._selectedIndex
		end,
		actionFunction = function()
			arg_3_0:dispatchEventToCurrentMenu({
				name = "contextual_menu_deselect_category"
			})
		end
	}

	arg_3_0:AddContextualMenuAction(var_3_0)
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
	assert(arg_6_0.Category)
	assert(arg_6_0.Equipped)
	assert(arg_6_0.Selected)
	assert(arg_6_0.Image)

	arg_6_0._attachments = arg_6_3
	arg_6_0._category = arg_6_2
	arg_6_0._selectedIndex = GUNSMITH.GetSelectedAttachIndexForCategory(arg_6_2, arg_6_4)
	arg_6_0._blocked = arg_6_5 ~= nil

	local var_6_0 = arg_6_0._selectedIndex and ATTACHMENT.GetRef(arg_6_4.attachments[arg_6_0._selectedIndex].ref, arg_6_4.weapon)

	arg_6_0.Category:setText(Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(arg_6_2)))

	if var_6_0 then
		arg_6_0.Equipped:setText(ATTACHMENT.GetName(var_6_0))
		arg_6_0.Selected:SetAlpha(1)
		arg_6_0.Image:SetAlpha(1)
		arg_6_0.Image:setImage(RegisterMaterial(ATTACHMENT.GetImage(var_6_0)))
		ACTIONS.AnimateSequence(arg_6_0, "EquippedAndNew")
	elseif arg_6_0._blocked then
		arg_6_0.Equipped:setText(GUNSMITH.GetBlockedCategoryButtonWarning(arg_6_4, arg_6_5))
		arg_6_0.Image:SetAlpha(1)
		arg_6_0.Image:setImage(RegisterMaterial("icon_empty_circle"))
		arg_6_0.Selected:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_6_0, "NotEquippedAndNew")
	else
		arg_6_0.Equipped:setText(Engine.CBBHFCGDIC("CAS/NO_SELECTED_ATTACH"))
		arg_6_0.Image:SetAlpha(0)
		arg_6_0.Selected:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_6_0, "NotEquippedAndNew")
	end

	if not arg_6_0._handlersAdded then
		arg_6_0:addEventHandler("button_over", function(arg_7_0, arg_7_1)
			DYN_ATTACHMENT.SetupGunsmithAttachmentStreamer(arg_7_0, arg_7_0._attachments, "image")

			LUI.FlowManager.GetScopedData(arg_7_0).selectedIndex = arg_7_0._selectedIndex
		end)
		arg_6_0:registerEventHandler("button_action", function(arg_8_0, arg_8_1)
			if arg_8_0._blocked then
				return
			end

			local var_8_0 = LUI.FlowManager.GetScopedData(arg_8_0)
			local var_8_1 = {
				weaponSlot = var_8_0.weaponSlot,
				loadoutIndex = var_8_0.loadoutIndex,
				category = arg_8_0._category,
				attachSlot = arg_8_0._selectedIndex,
				attachments = arg_8_0._attachments
			}

			LUI.FlowManager.RequestAddMenu("AttachmentSelect", true, arg_6_1, false, var_8_1)
		end)
		var_0_2(arg_6_0, arg_6_2, arg_6_1)

		arg_6_0._handlersAdded = true
	end

	var_0_1(arg_6_0, arg_6_2, arg_6_4.weapon, arg_6_1)
end

local function var_0_4(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.Setup = var_0_3

	arg_9_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		var_0_0(arg_10_0, "ButtonOver")
	end)
	arg_9_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		var_0_0(arg_11_0, "ButtonUp")
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_9_0, "AR")
	end

	if CONDITIONS.IsMagmaGameMode() then
		THEMES.ApplyRandomMaskRotation(arg_9_0, {
			elementToMask = arg_9_0.Background
		})
		ACTIONS.AnimateSequence(arg_9_0, "WZSetup")
	end
end

function InGameGunsmithCategory(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 424 * _1080p, 0, 80 * _1080p)

	var_12_0.id = "InGameGunsmithCategory"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_12_1
	})

	var_12_4.id = "Background"

	var_12_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Background = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIText.new()

	var_12_6.id = "Category"

	var_12_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_12_6:setText("", 0)
	var_12_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_6:SetAlignment(LUI.Alignment.Left)
	var_12_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 275, _1080p * 16, _1080p * 40)
	var_12_0:addElement(var_12_6)

	var_12_0.Category = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIStyledText.new()

	var_12_8.id = "Equipped"

	var_12_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_12_8:setText(Engine.CBBHFCGDIC("CAS/NO_SELECTED_ATTACH"), 0)
	var_12_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_8:SetWordWrap(false)
	var_12_8:SetAlignment(LUI.Alignment.Left)
	var_12_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_12_8:SetStartupDelay(2000)
	var_12_8:SetLineHoldTime(400)
	var_12_8:SetAnimMoveTime(2000)
	var_12_8:SetAnimMoveSpeed(150)
	var_12_8:SetEndDelay(2000)
	var_12_8:SetCrossfadeTime(250)
	var_12_8:SetFadeInTime(300)
	var_12_8:SetFadeOutTime(300)
	var_12_8:SetMaxVisibleLines(1)
	var_12_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 303, _1080p * 42, _1080p * 62)
	var_12_0:addElement(var_12_8)

	var_12_0.Equipped = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "Image"

	var_12_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -107, _1080p * -41, _1080p * -33, _1080p * 33)
	var_12_0:addElement(var_12_10)

	var_12_0.Image = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIImage.new()

	var_12_12.id = "Selected"

	var_12_12:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_12_12:SetAlpha(0, 0)
	var_12_12:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_12_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -3, _1080p * 7, _1080p * 23)
	var_12_0:addElement(var_12_12)

	var_12_0.Selected = var_12_12

	local var_12_13

	if not CONDITIONS.IsSplitscreen() then
		var_12_13 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
			controllerIndex = var_12_1
		})
		var_12_13.id = "NewItemSmallIcon"

		var_12_13:SetAlpha(0, 0)
		var_12_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -15, _1080p * -7, _1080p * 11, _1080p * 19)
		var_12_0:addElement(var_12_13)

		var_12_0.NewItemSmallIcon = var_12_13
	end

	local var_12_14

	if CONDITIONS.IsMagmaGameMode() then
		var_12_14 = LUI.UIImage.new()
		var_12_14.id = "Mask"

		var_12_14:SetAlpha(0, 0)
		var_12_14:setImage(RegisterMaterial("ui_mp_wz_bkg_button_2"), 0)
		var_12_0:addElement(var_12_14)

		var_12_0.Mask = var_12_14
	end

	local function var_12_15()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_15

	local var_12_16
	local var_12_17 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOver", var_12_17)

	local function var_12_18()
		var_12_6:AnimateSequence("ButtonOver")
	end

	var_12_0._sequences.ButtonOver = var_12_18

	local var_12_19
	local var_12_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonUp", var_12_20)

	local function var_12_21()
		var_12_6:AnimateSequence("ButtonUp")
	end

	var_12_0._sequences.ButtonUp = var_12_21

	local var_12_22
	local var_12_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		}
	}

	var_12_6:RegisterAnimationSequence("AR", var_12_23)

	local function var_12_24()
		var_12_6:AnimateSequence("AR")
	end

	var_12_0._sequences.AR = var_12_24

	local var_12_25

	if not CONDITIONS.IsSplitscreen() then
		local var_12_26 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 30
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 38
			}
		}

		var_12_13:RegisterAnimationSequence("EquippedAndNew", var_12_26)
	end

	local function var_12_27()
		if not CONDITIONS.IsSplitscreen() then
			var_12_13:AnimateSequence("EquippedAndNew")
		end
	end

	var_12_0._sequences.EquippedAndNew = var_12_27

	local var_12_28

	if not CONDITIONS.IsSplitscreen() then
		local var_12_29 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 11
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 19
			}
		}

		var_12_13:RegisterAnimationSequence("NotEquippedAndNew", var_12_29)
	end

	local function var_12_30()
		if not CONDITIONS.IsSplitscreen() then
			var_12_13:AnimateSequence("NotEquippedAndNew")
		end
	end

	var_12_0._sequences.NotEquippedAndNew = var_12_30

	local var_12_31
	local var_12_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZGlobalSwatches.WZText
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZSetup", var_12_32)

	if CONDITIONS.IsMagmaGameMode() then
		local var_12_33 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_12_14:RegisterAnimationSequence("WZSetup", var_12_33)
	end

	local function var_12_34()
		var_12_6:AnimateSequence("WZSetup")

		if CONDITIONS.IsMagmaGameMode() then
			var_12_14:AnimateSequence("WZSetup")
		end
	end

	var_12_0._sequences.WZSetup = var_12_34

	local var_12_35
	local var_12_36 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZWipButtonOver", var_12_36)

	local function var_12_37()
		var_12_6:AnimateSequence("WZWipButtonOver")
	end

	var_12_0._sequences.WZWipButtonOver = var_12_37

	local var_12_38
	local var_12_39 = {
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("WZWipButtonUp", var_12_39)

	local function var_12_40()
		var_12_6:AnimateSequence("WZWipButtonUp")
	end

	var_12_0._sequences.WZWipButtonUp = var_12_40

	var_0_4(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("InGameGunsmithCategory", InGameGunsmithCategory)
LockTable(_M)
