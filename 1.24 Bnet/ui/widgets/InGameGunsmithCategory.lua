module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = ATTACHMENT.GetNewAttachmentIDsByCategory(arg_1_3, arg_1_1, arg_1_2)

	if arg_1_0.NewItemSmallIcon then
		arg_1_0.NewItemSmallIcon:UpdateAlpha(#var_1_0 > 0 and 1 or 0, 0, true)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetupContextualMenu({
		title = Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(arg_2_1))
	})

	local var_2_0 = {
		id = "categoryDeselect",
		actionName = Engine.CBBHFCGDIC("LUA_MENU/DESELECT"),
		conditionFunction = function()
			return arg_2_0._selectedIndex
		end,
		actionFunction = function()
			arg_2_0:dispatchEventToCurrentMenu({
				name = "contextual_menu_deselect_category"
			})
		end
	}

	arg_2_0:AddContextualMenuAction(var_2_0)
end

local function var_0_2(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
	assert(arg_5_0.Category)
	assert(arg_5_0.Equipped)
	assert(arg_5_0.Selected)
	assert(arg_5_0.Image)

	arg_5_0._attachments = arg_5_3
	arg_5_0._category = arg_5_2
	arg_5_0._selectedIndex = GUNSMITH.GetSelectedAttachIndexForCategory(arg_5_2, arg_5_4)
	arg_5_0._blocked = arg_5_5 ~= nil

	local var_5_0 = arg_5_0._selectedIndex and ATTACHMENT.GetRef(arg_5_4.attachments[arg_5_0._selectedIndex].ref, arg_5_4.weapon)

	arg_5_0.Category:setText(Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(arg_5_2)))

	if var_5_0 then
		arg_5_0.Equipped:setText(ATTACHMENT.GetName(var_5_0))
		arg_5_0.Selected:SetAlpha(1)
		arg_5_0.Image:SetAlpha(1)
		arg_5_0.Image:setImage(RegisterMaterial(ATTACHMENT.GetImage(var_5_0)))
		ACTIONS.AnimateSequence(arg_5_0, "EquippedAndNew")
	elseif arg_5_0._blocked then
		arg_5_0.Equipped:setText(GUNSMITH.GetBlockedCategoryButtonWarning(arg_5_4, arg_5_5))
		arg_5_0.Image:SetAlpha(1)
		arg_5_0.Image:setImage(RegisterMaterial("icon_empty_circle"))
		arg_5_0.Selected:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_5_0, "NotEquippedAndNew")
	else
		arg_5_0.Equipped:setText(Engine.CBBHFCGDIC("CAS/NO_SELECTED_ATTACH"))
		arg_5_0.Image:SetAlpha(0)
		arg_5_0.Selected:SetAlpha(0)
		ACTIONS.AnimateSequence(arg_5_0, "NotEquippedAndNew")
	end

	if not arg_5_0._handlersAdded then
		arg_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
			DYN_ATTACHMENT.SetupGunsmithAttachmentStreamer(arg_6_0, arg_6_0._attachments, "image")

			LUI.FlowManager.GetScopedData(arg_6_0).selectedIndex = arg_6_0._selectedIndex
		end)
		arg_5_0:registerEventHandler("button_action", function(arg_7_0, arg_7_1)
			if arg_7_0._blocked then
				return
			end

			local var_7_0 = LUI.FlowManager.GetScopedData(arg_7_0)
			local var_7_1 = {
				weaponSlot = var_7_0.weaponSlot,
				loadoutIndex = var_7_0.loadoutIndex,
				category = arg_7_0._category,
				attachSlot = arg_7_0._selectedIndex,
				attachments = arg_7_0._attachments
			}

			LUI.FlowManager.RequestAddMenu("AttachmentSelect", true, arg_5_1, false, var_7_1)
		end)
		var_0_1(arg_5_0, arg_5_2, arg_5_1)

		arg_5_0._handlersAdded = true
	end

	var_0_0(arg_5_0, arg_5_2, arg_5_4.weapon, arg_5_1)
end

local function var_0_3(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.Setup = var_0_2

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_8_0, "AR")
	end
end

function InGameGunsmithCategory(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIButton.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 424 * _1080p, 0, 80 * _1080p)

	var_9_0.id = "InGameGunsmithCategory"
	var_9_0._animationSets = var_9_0._animationSets or {}
	var_9_0._sequences = var_9_0._sequences or {}

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0
	local var_9_3
	local var_9_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_9_1
	})

	var_9_4.id = "Background"

	var_9_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_9_0:addElement(var_9_4)

	var_9_0.Background = var_9_4

	local var_9_5
	local var_9_6 = LUI.UIText.new()

	var_9_6.id = "Category"

	var_9_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_9_6:setText("", 0)
	var_9_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_6:SetAlignment(LUI.Alignment.Left)
	var_9_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 275, _1080p * 17, _1080p * 41)
	var_9_0:addElement(var_9_6)

	var_9_0.Category = var_9_6

	local var_9_7
	local var_9_8 = LUI.UIStyledText.new()

	var_9_8.id = "Equipped"

	var_9_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_9_8:setText(Engine.CBBHFCGDIC("CAS/NO_SELECTED_ATTACH"), 0)
	var_9_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_9_8:SetWordWrap(false)
	var_9_8:SetAlignment(LUI.Alignment.Left)
	var_9_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_9_8:SetStartupDelay(2000)
	var_9_8:SetLineHoldTime(400)
	var_9_8:SetAnimMoveTime(2000)
	var_9_8:SetAnimMoveSpeed(150)
	var_9_8:SetEndDelay(2000)
	var_9_8:SetCrossfadeTime(250)
	var_9_8:SetFadeInTime(300)
	var_9_8:SetFadeOutTime(300)
	var_9_8:SetMaxVisibleLines(1)
	var_9_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 20, _1080p * 303, _1080p * 42, _1080p * 62)
	var_9_0:addElement(var_9_8)

	var_9_0.Equipped = var_9_8

	local var_9_9
	local var_9_10 = LUI.UIImage.new()

	var_9_10.id = "Image"

	var_9_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -107, _1080p * -41, _1080p * -33, _1080p * 33)
	var_9_0:addElement(var_9_10)

	var_9_0.Image = var_9_10

	local var_9_11
	local var_9_12 = LUI.UIImage.new()

	var_9_12.id = "Selected"

	var_9_12:SetRGBFromTable(SWATCHES.CAC.equipped, 0)
	var_9_12:SetAlpha(0, 0)
	var_9_12:setImage(RegisterMaterial("cac_equip_fill"), 0)
	var_9_12:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -19, _1080p * -3, _1080p * 7, _1080p * 23)
	var_9_0:addElement(var_9_12)

	var_9_0.Selected = var_9_12

	local var_9_13

	if not CONDITIONS.IsSplitscreen(var_9_0) then
		var_9_13 = MenuBuilder.BuildRegisteredType("NewItemSmallIcon", {
			controllerIndex = var_9_1
		})
		var_9_13.id = "NewItemSmallIcon"

		var_9_13:SetAlpha(0, 0)
		var_9_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -15, _1080p * -7, _1080p * 11, _1080p * 19)
		var_9_0:addElement(var_9_13)

		var_9_0.NewItemSmallIcon = var_9_13
	end

	local function var_9_14()
		return
	end

	var_9_0._sequences.DefaultSequence = var_9_14

	local var_9_15
	local var_9_16 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_9_6:RegisterAnimationSequence("ButtonOver", var_9_16)

	local function var_9_17()
		var_9_6:AnimateSequence("ButtonOver")
	end

	var_9_0._sequences.ButtonOver = var_9_17

	local var_9_18
	local var_9_19 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_9_6:RegisterAnimationSequence("ButtonUp", var_9_19)

	local function var_9_20()
		var_9_6:AnimateSequence("ButtonUp")
	end

	var_9_0._sequences.ButtonUp = var_9_20

	local var_9_21
	local var_9_22 = {
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

	var_9_6:RegisterAnimationSequence("AR", var_9_22)

	local function var_9_23()
		var_9_6:AnimateSequence("AR")
	end

	var_9_0._sequences.AR = var_9_23

	local var_9_24

	if not CONDITIONS.IsSplitscreen(var_9_0) then
		local var_9_25 = {
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

		var_9_13:RegisterAnimationSequence("EquippedAndNew", var_9_25)
	end

	local function var_9_26()
		if not CONDITIONS.IsSplitscreen(var_9_0) then
			var_9_13:AnimateSequence("EquippedAndNew")
		end
	end

	var_9_0._sequences.EquippedAndNew = var_9_26

	local var_9_27

	if not CONDITIONS.IsSplitscreen(var_9_0) then
		local var_9_28 = {
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

		var_9_13:RegisterAnimationSequence("NotEquippedAndNew", var_9_28)
	end

	local function var_9_29()
		if not CONDITIONS.IsSplitscreen(var_9_0) then
			var_9_13:AnimateSequence("NotEquippedAndNew")
		end
	end

	var_9_0._sequences.NotEquippedAndNew = var_9_29

	var_9_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonOver")
	end)
	var_9_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_9_1
		end

		ACTIONS.AnimateSequence(var_9_0, "ButtonUp")
	end)
	var_0_3(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("InGameGunsmithCategory", InGameGunsmithCategory)
LockTable(_M)
