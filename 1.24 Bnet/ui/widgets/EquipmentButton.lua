module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	return false
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.NewItemNotification then
		arg_2_0.NewItemNotification:UpdateAlpha(arg_2_1 and 1 or 0, 0, true)

		local var_2_0 = LOOT.GetItemID(LOOT.itemTypes.EQUIPMENT, arg_2_2)

		if arg_2_1 then
			arg_2_0.NewItemNotification:UpdateBreadcrumbByID(arg_2_0._controllerIndex, var_2_0, true)
		else
			arg_2_0.NewItemNotification:ClearBreadcrumbByID(arg_2_0._controllerIndex, var_2_0, true)
		end
	end

	arg_2_0._itemRef = arg_2_2
	arg_2_0._isNew = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	assert(arg_3_0.Selected)
	ACTIONS.AnimateSequence(arg_3_0.Selected, arg_3_1 and "On" or "Off")

	if arg_3_1 and arg_3_0.NewItemNotification then
		arg_3_0.NewItemNotification:SetAlpha(0)
	end

	arg_3_0.isSelected = arg_3_1
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_1 then
		ACTIONS.AnimateSequence(arg_4_0, "ShowRestriction")
	else
		ACTIONS.AnimateSequence(arg_4_0, "HideRestriction")
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetNew = var_0_1
	arg_5_0.GetNew = var_0_0
	arg_5_0.SetSelected = var_0_2
	arg_5_0.SetupRestriction = var_0_3
	arg_5_0._controllerIndex = arg_5_1

	arg_5_0:addEventHandler("button_up", function(arg_6_0, arg_6_1)
		if arg_6_0._isNew then
			var_0_1(arg_6_0, false, arg_6_0._itemRef)
		end
	end)
end

function EquipmentButton(arg_7_0, arg_7_1)
	local var_7_0 = MenuBuilder.BuildRegisteredType("ProgressionItemButton", arg_7_1)

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 546 * _1080p, 0, 62 * _1080p)

	var_7_0.id = "EquipmentButton"
	var_7_0._animationSets = var_7_0._animationSets or {}
	var_7_0._sequences = var_7_0._sequences or {}

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3

	if not CONDITIONS.AreCDLRulesActive(var_7_1) then
		var_7_3 = LUI.UIImage.new()
		var_7_3.id = "Lock"

		var_7_3:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
		var_7_3:SetAlpha(0, 0)
		var_7_3:setImage(RegisterMaterial("icon_lock"), 0)
		var_7_3:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -57, _1080p * -11, _1080p * -23, _1080p * 23)
		var_7_0:addElement(var_7_3)

		var_7_0.Lock = var_7_3
	end

	local var_7_4

	if CONDITIONS.IsWaveGameType(var_7_0) then
		var_7_4 = LUI.UIStyledText.new()
		var_7_4.id = "CPWaveSurvivalCost"

		var_7_4:SetRGBFromInt(8421504, 0)
		var_7_4:SetAlpha(0.6, 0)
		var_7_4:setText("", 0)
		var_7_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_7_4:SetAlignment(LUI.Alignment.Right)
		var_7_4:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_7_4:SetStartupDelay(2000)
		var_7_4:SetLineHoldTime(400)
		var_7_4:SetAnimMoveTime(300)
		var_7_4:SetAnimMoveSpeed(50)
		var_7_4:SetEndDelay(1500)
		var_7_4:SetCrossfadeTime(750)
		var_7_4:SetFadeInTime(300)
		var_7_4:SetFadeOutTime(300)
		var_7_4:SetMaxVisibleLines(1)
		var_7_4:SetOutlineRGBFromInt(0, 0)
		var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 252, _1080p * 380, _1080p * 38, _1080p * 62)
		var_7_0:addElement(var_7_4)

		var_7_0.CPWaveSurvivalCost = var_7_4
	end

	local var_7_5
	local var_7_6 = LUI.UIImage.new()

	var_7_6.id = "RestrictionWarning"

	var_7_6:SetAlpha(0, 0)
	var_7_6:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_7_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -92, _1080p * -52, _1080p * -20, _1080p * 20)
	var_7_0:addElement(var_7_6)

	var_7_0.RestrictionWarning = var_7_6

	local var_7_7

	if CONDITIONS.IsWaveGameType(var_7_0) then
		local var_7_8 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 220
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 348
			}
		}

		var_7_4:RegisterAnimationSequence("DefaultSequence", var_7_8)
	end

	local function var_7_9()
		if CONDITIONS.IsWaveGameType(var_7_0) then
			var_7_4:AnimateSequence("DefaultSequence")
		end
	end

	var_7_0._sequences.DefaultSequence = var_7_9

	local function var_7_10()
		return
	end

	var_7_0._sequences.ButtonOver = var_7_10

	local function var_7_11()
		return
	end

	var_7_0._sequences.ButtonUp = var_7_11

	local var_7_12

	if not CONDITIONS.AreCDLRulesActive(var_7_1) then
		local var_7_13 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_3:RegisterAnimationSequence("Disabled", var_7_13)
	end

	local function var_7_14()
		if not CONDITIONS.AreCDLRulesActive(var_7_1) then
			var_7_3:AnimateSequence("Disabled")
		end
	end

	var_7_0._sequences.Disabled = var_7_14

	local var_7_15

	if not CONDITIONS.AreCDLRulesActive(var_7_1) then
		local var_7_16 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_7_3:RegisterAnimationSequence("Enabled", var_7_16)
	end

	local function var_7_17()
		if not CONDITIONS.AreCDLRulesActive(var_7_1) then
			var_7_3:AnimateSequence("Enabled")
		end
	end

	var_7_0._sequences.Enabled = var_7_17

	local var_7_18
	local var_7_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("ShowRestriction", var_7_19)

	local function var_7_20()
		var_7_6:AnimateSequence("ShowRestriction")
	end

	var_7_0._sequences.ShowRestriction = var_7_20

	local var_7_21
	local var_7_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_7_6:RegisterAnimationSequence("HideRestriction", var_7_22)

	local function var_7_23()
		var_7_6:AnimateSequence("HideRestriction")
	end

	var_7_0._sequences.HideRestriction = var_7_23

	var_7_0:addEventHandler("button_over", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "ButtonOver")
	end)
	var_7_0:addEventHandler("button_up", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "ButtonUp")
	end)
	var_7_0:addEventHandler("disable", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "Disabled")
	end)
	var_7_0:addEventHandler("enable", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_7_1
		end

		ACTIONS.AnimateSequence(var_7_0, "Enabled")
	end)
	var_0_4(var_7_0, var_7_1, arg_7_1)
	ACTIONS.AnimateSequence(var_7_0, "DefaultSequence")

	return var_7_0
end

MenuBuilder.registerType("EquipmentButton", EquipmentButton)
LockTable(_M)
