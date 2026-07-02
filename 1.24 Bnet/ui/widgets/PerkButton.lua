module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	return false
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.NewItemNotification then
		local var_2_0 = LOOT.GetItemID(LOOT.itemTypes.PERK, arg_2_2)

		if arg_2_1 then
			arg_2_0.NewItemNotification:UpdateBreadcrumbByID(arg_2_0._controllerIndex, var_2_0, true)
		else
			arg_2_0.NewItemNotification:SetAlpha(0)
			arg_2_0.NewItemNotification:ClearBreadcrumbByID(arg_2_0._controllerIndex, var_2_0, true)
		end
	end

	arg_2_0.isNew = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_3 then
		ACTIONS.AnimateSequence(arg_3_0, "HideLock")
		ACTIONS.AnimateSequence(arg_3_0, "ShowRestriction")
	else
		ACTIONS.AnimateSequence(arg_3_0, "HideRestriction")

		if arg_3_1 then
			ACTIONS.AnimateSequence(arg_3_0, "HideLock")
		elseif arg_3_2 then
			ACTIONS.AnimateSequence(arg_3_0, "Disabled")
		end
	end

	if CONDITIONS.IsBRGameType(arg_3_0) and arg_3_0.BRWarning then
		if Cac.GetIsPerkDisabledForBR(arg_3_0.perkData.ref) then
			ACTIONS.AnimateSequence(arg_3_0.BRWarning, arg_3_2 and "Locked" or "Show")
		else
			ACTIONS.AnimateSequence(arg_3_0.BRWarning, "Hide")
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	assert(arg_4_0.Selected)
	ACTIONS.AnimateSequence(arg_4_0.Selected, arg_4_1 and "On" or "Off")

	arg_4_0.isSelected = arg_4_1
end

local function var_0_4(arg_5_0, arg_5_1)
	if arg_5_0.perkData then
		arg_5_0:dispatchEventToParent({
			name = "perk_button_over",
			perkData = arg_5_0.perkData,
			isSelect = arg_5_0.isSelected,
			source = arg_5_0
		})
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	local var_6_0 = PlayerData.BFFBGAJGD(arg_6_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers

	if arg_6_0.perkData and not arg_6_0.perkData.isConflict then
		arg_6_0:dispatchEventToParent({
			name = "perk_button_action",
			perkData = arg_6_0.perkData,
			playerData = var_6_0,
			source = arg_6_0
		})
	end
end

local function var_0_6(arg_7_0, arg_7_1)
	if arg_7_0.isNew then
		var_0_1(arg_7_0, false, arg_7_0.perkData.ref)
		arg_7_0:dispatchEventToParent({
			name = "perk_button_up",
			perkData = arg_7_0.perkData
		})
	end
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.SetNew = var_0_1
	arg_8_0.GetNew = var_0_0
	arg_8_0.SetSelected = var_0_3
	arg_8_0.SetButtonConflicted = var_0_2
	arg_8_0.HandleButtonFocus = var_0_4
	arg_8_0._controllerIndex = arg_8_1

	arg_8_0:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		var_0_5(arg_9_0, arg_8_1)
	end)
	arg_8_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		var_0_4(arg_10_0, arg_8_1)
	end)
	arg_8_0:addEventHandler("button_over_disable", function(arg_11_0, arg_11_1)
		var_0_4(arg_11_0, arg_8_1)
	end)
	arg_8_0:addEventHandler("button_up", function(arg_12_0, arg_12_1)
		var_0_6(arg_12_0, arg_8_1)
	end)
end

function PerkButton(arg_13_0, arg_13_1)
	local var_13_0 = MenuBuilder.BuildRegisteredType("ProgressionItemButton", arg_13_1)

	var_13_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 546 * _1080p, 0, 62 * _1080p)

	var_13_0.id = "PerkButton"
	var_13_0._animationSets = var_13_0._animationSets or {}
	var_13_0._sequences = var_13_0._sequences or {}

	local var_13_1 = arg_13_1 and arg_13_1.controllerIndex

	if not var_13_1 and not Engine.DDJFBBJAIG() then
		var_13_1 = var_13_0:getRootController()
	end

	assert(var_13_1)

	local var_13_2 = var_13_0
	local var_13_3

	if not CONDITIONS.AreCDLRulesActive(var_13_1) then
		var_13_3 = LUI.UIImage.new()
		var_13_3.id = "Lock"

		var_13_3:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
		var_13_3:SetAlpha(0, 0)
		var_13_3:setImage(RegisterMaterial("icon_lock"), 0)
		var_13_3:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 216, _1080p * 259, _1080p * -21, _1080p * 21)
		var_13_0:addElement(var_13_3)

		var_13_0.Lock = var_13_3
	end

	local var_13_4

	if CONDITIONS.IsBRGameType(var_13_0) then
		var_13_4 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_13_1
		})
		var_13_4.id = "BRWarning"

		var_13_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 417, _1080p * 481, _1080p * 11, _1080p * 51)
		var_13_0:addElement(var_13_4)

		var_13_0.BRWarning = var_13_4
	end

	local var_13_5
	local var_13_6 = LUI.UIImage.new()

	var_13_6.id = "RestrictionWarning"

	var_13_6:SetAlpha(0, 0)
	var_13_6:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_13_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -63, _1080p * -23, _1080p * -20, _1080p * 20)
	var_13_0:addElement(var_13_6)

	var_13_0.RestrictionWarning = var_13_6

	local function var_13_7()
		return
	end

	var_13_0._sequences.DefaultSequence = var_13_7

	local function var_13_8()
		return
	end

	var_13_0._sequences.ButtonOver = var_13_8

	local function var_13_9()
		return
	end

	var_13_0._sequences.ButtonUp = var_13_9

	local var_13_10

	if not CONDITIONS.AreCDLRulesActive(var_13_1) then
		local var_13_11 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_3:RegisterAnimationSequence("Disabled", var_13_11)
	end

	local function var_13_12()
		if not CONDITIONS.AreCDLRulesActive(var_13_1) then
			var_13_3:AnimateSequence("Disabled")
		end
	end

	var_13_0._sequences.Disabled = var_13_12

	local var_13_13

	if not CONDITIONS.AreCDLRulesActive(var_13_1) then
		local var_13_14 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_3:RegisterAnimationSequence("Enabled", var_13_14)
	end

	local function var_13_15()
		if not CONDITIONS.AreCDLRulesActive(var_13_1) then
			var_13_3:AnimateSequence("Enabled")
		end
	end

	var_13_0._sequences.Enabled = var_13_15

	local var_13_16

	if not CONDITIONS.AreCDLRulesActive(var_13_1) then
		local var_13_17 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 16
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 60
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Left_Anchor
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Right_Anchor
			}
		}

		var_13_3:RegisterAnimationSequence("AR", var_13_17)
	end

	if CONDITIONS.IsBRGameType(var_13_0) then
		local var_13_18 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * 65
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 129
			}
		}

		var_13_4:RegisterAnimationSequence("AR", var_13_18)
	end

	local function var_13_19()
		if not CONDITIONS.AreCDLRulesActive(var_13_1) then
			var_13_3:AnimateSequence("AR")
		end

		if CONDITIONS.IsBRGameType(var_13_0) then
			var_13_4:AnimateSequence("AR")
		end
	end

	var_13_0._sequences.AR = var_13_19

	local function var_13_20()
		return
	end

	var_13_0._sequences.ButtonOverDisabled = var_13_20

	local function var_13_21()
		return
	end

	var_13_0._sequences.ButtonUpDisabled = var_13_21

	local var_13_22

	if not CONDITIONS.AreCDLRulesActive(var_13_1) then
		local var_13_23 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_13_3:RegisterAnimationSequence("HideLock", var_13_23)
	end

	local function var_13_24()
		if not CONDITIONS.AreCDLRulesActive(var_13_1) then
			var_13_3:AnimateSequence("HideLock")
		end
	end

	var_13_0._sequences.HideLock = var_13_24

	local var_13_25
	local var_13_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("ShowRestriction", var_13_26)

	local function var_13_27()
		var_13_6:AnimateSequence("ShowRestriction")
	end

	var_13_0._sequences.ShowRestriction = var_13_27

	local var_13_28
	local var_13_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_13_6:RegisterAnimationSequence("HideRestriction", var_13_29)

	local function var_13_30()
		var_13_6:AnimateSequence("HideRestriction")
	end

	var_13_0._sequences.HideRestriction = var_13_30

	var_13_0:addEventHandler("disable", function(arg_25_0, arg_25_1)
		if not arg_25_1.controller then
			local var_25_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "Disabled")
	end)
	var_13_0:addEventHandler("enable", function(arg_26_0, arg_26_1)
		if not arg_26_1.controller then
			local var_26_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "Enabled")
	end)
	var_13_0:addEventHandler("button_disable", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonUpDisabled")
	end)
	var_13_0:addEventHandler("button_over_disable", function(arg_28_0, arg_28_1)
		if not arg_28_1.controller then
			local var_28_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonOverDisabled")
	end)
	var_13_0:addEventHandler("button_over", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonOver")
	end)
	var_13_0:addEventHandler("button_up", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_13_1
		end

		ACTIONS.AnimateSequence(var_13_0, "ButtonUp")
	end)
	var_0_7(var_13_0, var_13_1, arg_13_1)

	return var_13_0
end

MenuBuilder.registerType("PerkButton", PerkButton)
LockTable(_M)
