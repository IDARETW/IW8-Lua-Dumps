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

	if arg_4_0.perkData.mpDisabled and arg_4_0.SnipeIcon then
		arg_4_0.SnipeIcon:UpdateSnipeIcon({
			gameSourceID = LUI.GAME_SOURCE_ID.WARZONE,
			selected = arg_4_1
		})
	end
end

local function var_0_4(arg_5_0, arg_5_1)
	local var_5_0 = PROGRESSION.GetPlayerProgressionData({
		_combinedRankNum = arg_5_1
	})
	local var_5_1 = {
		type = LOOT.unlockTypes.LEVEL,
		level = var_5_0._rankDisplay
	}

	if arg_5_0.Lock then
		arg_5_0.Lock:Setup(var_5_1)
	end
end

local function var_0_5(arg_6_0, arg_6_1)
	if arg_6_0.perkData then
		arg_6_0:dispatchEventToParent({
			name = "perk_button_over",
			perkData = arg_6_0.perkData,
			isSelect = arg_6_0.isSelected,
			source = arg_6_0
		})

		if arg_6_0.perkData.mpDisabled and arg_6_0.SnipeIcon then
			arg_6_0.SnipeIcon:UpdateSnipeIcon({
				selected = true,
				gameSourceID = LUI.GAME_SOURCE_ID.WARZONE
			})
		end
	end
end

local function var_0_6(arg_7_0, arg_7_1)
	local var_7_0 = PlayerData.BFFBGAJGD(arg_7_1, LOADOUT.GetLoadoutStatsGroup()).squadMembers

	if arg_7_0.perkData and not arg_7_0.perkData.isConflict then
		arg_7_0:dispatchEventToParent({
			name = "perk_button_action",
			perkData = arg_7_0.perkData,
			playerData = var_7_0,
			source = arg_7_0
		})
	end
end

local function var_0_7(arg_8_0, arg_8_1)
	if arg_8_0.isNew then
		var_0_1(arg_8_0, false, arg_8_0.perkData.ref)
		arg_8_0:dispatchEventToParent({
			name = "perk_button_up",
			perkData = arg_8_0.perkData
		})
	end

	if arg_8_0.perkData.mpDisabled and arg_8_0.SnipeIcon and not arg_8_0.isSelected then
		arg_8_0.SnipeIcon:UpdateSnipeIcon({
			gameSourceID = LUI.GAME_SOURCE_ID.WARZONE
		})
	end
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.SetNew = var_0_1
	arg_9_0.GetNew = var_0_0
	arg_9_0.SetSelected = var_0_3
	arg_9_0.SetupLock = var_0_4
	arg_9_0.SetButtonConflicted = var_0_2
	arg_9_0.HandleButtonFocus = var_0_5
	arg_9_0._controllerIndex = arg_9_1

	arg_9_0:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		var_0_6(arg_10_0, arg_9_1)
	end)
	arg_9_0:addEventHandler("button_over", function(arg_11_0, arg_11_1)
		var_0_5(arg_11_0, arg_9_1)
	end)
	arg_9_0:addEventHandler("button_over_disable", function(arg_12_0, arg_12_1)
		var_0_5(arg_12_0, arg_9_1)
	end)
	arg_9_0:addEventHandler("button_up", function(arg_13_0, arg_13_1)
		var_0_7(arg_13_0, arg_9_1)
	end)
	THEMES.ApplyRandomMaskRotation(arg_9_0)
end

function PerkButton(arg_14_0, arg_14_1)
	local var_14_0 = MenuBuilder.BuildRegisteredType("ProgressionItemButton", arg_14_1)

	var_14_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 546 * _1080p, 0, 62 * _1080p)

	var_14_0.id = "PerkButton"
	var_14_0._animationSets = var_14_0._animationSets or {}
	var_14_0._sequences = var_14_0._sequences or {}

	local var_14_1 = arg_14_1 and arg_14_1.controllerIndex

	if not var_14_1 and not Engine.DDJFBBJAIG() then
		var_14_1 = var_14_0:getRootController()
	end

	assert(var_14_1)

	local var_14_2 = var_14_0
	local var_14_3

	if CONDITIONS.IsBRGameType() then
		var_14_3 = MenuBuilder.BuildRegisteredType("BRWarningIcon", {
			controllerIndex = var_14_1
		})
		var_14_3.id = "BRWarning"

		var_14_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 417, _1080p * 481, _1080p * 11, _1080p * 51)
		var_14_0:addElement(var_14_3)

		var_14_0.BRWarning = var_14_3
	end

	local var_14_4
	local var_14_5 = LUI.UIImage.new()

	var_14_5.id = "RestrictionWarning"

	var_14_5:SetAlpha(0, 0)
	var_14_5:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_14_5:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -63, _1080p * -23, _1080p * -20, _1080p * 20)
	var_14_0:addElement(var_14_5)

	var_14_0.RestrictionWarning = var_14_5

	local var_14_6

	if not CONDITIONS.AreCDLRulesActive(var_14_1) then
		var_14_6 = MenuBuilder.BuildRegisteredType("GenericLock", {
			controllerIndex = var_14_1
		})
		var_14_6.id = "Lock"

		var_14_6:SetAlpha(0, 0)
		var_14_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 209, _1080p * 259, _1080p * -25, _1080p * 25)
		var_14_0:addElement(var_14_6)

		var_14_0.Lock = var_14_6
	end

	local var_14_7

	if CONDITIONS.IsMagmaGameMode() then
		local var_14_8 = MenuBuilder.BuildRegisteredType("WZSnipeIcon", {
			controllerIndex = var_14_1
		})

		var_14_8.id = "SnipeIcon"

		var_14_8:SetScale(-0.64, 0)
		var_14_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -279, _1080p * 121, _1080p * -50, _1080p * 50)
		var_14_0:addElement(var_14_8)

		var_14_0.SnipeIcon = var_14_8
	end

	local var_14_9

	if CONDITIONS.IsVanguardRevealed() then
		local var_14_10 = LUI.UIImage.new()

		var_14_10.id = "Mask"

		var_14_10:SetZRotation(180, 0)
		var_14_10:setImage(RegisterMaterial("ui_mp_wz_bkg_button_3"), 0)
		var_14_10:Setup3SliceHorizontalImage(_1080p * 100, 0.2)
		var_14_10:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 1, _1080p * -1)
		var_14_0:addElement(var_14_10)

		var_14_0.Mask = var_14_10
	end

	local function var_14_11()
		return
	end

	var_14_0._sequences.DefaultSequence = var_14_11

	local var_14_12

	if not CONDITIONS.AreCDLRulesActive(var_14_1) then
		local var_14_13 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_6:RegisterAnimationSequence("ButtonOver", var_14_13)
	end

	local function var_14_14()
		if not CONDITIONS.AreCDLRulesActive(var_14_1) then
			var_14_6:AnimateSequence("ButtonOver")
		end
	end

	var_14_0._sequences.ButtonOver = var_14_14

	local var_14_15

	if not CONDITIONS.AreCDLRulesActive(var_14_1) then
		local var_14_16 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_6:RegisterAnimationSequence("ButtonUp", var_14_16)
	end

	local function var_14_17()
		if not CONDITIONS.AreCDLRulesActive(var_14_1) then
			var_14_6:AnimateSequence("ButtonUp")
		end
	end

	var_14_0._sequences.ButtonUp = var_14_17

	local var_14_18

	if not CONDITIONS.AreCDLRulesActive(var_14_1) then
		local var_14_19 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_6:RegisterAnimationSequence("Enabled", var_14_19)
	end

	local function var_14_20()
		if not CONDITIONS.AreCDLRulesActive(var_14_1) then
			var_14_6:AnimateSequence("Enabled")
		end
	end

	var_14_0._sequences.Enabled = var_14_20

	local var_14_21

	if CONDITIONS.IsBRGameType() then
		local var_14_22 = {
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

		var_14_3:RegisterAnimationSequence("AR", var_14_22)
	end

	local function var_14_23()
		if CONDITIONS.IsBRGameType() then
			var_14_3:AnimateSequence("AR")
		end
	end

	var_14_0._sequences.AR = var_14_23

	local var_14_24

	if not CONDITIONS.AreCDLRulesActive(var_14_1) then
		local var_14_25 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_6:RegisterAnimationSequence("ButtonOverDisabled", var_14_25)
	end

	local function var_14_26()
		if not CONDITIONS.AreCDLRulesActive(var_14_1) then
			var_14_6:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_14_0._sequences.ButtonOverDisabled = var_14_26

	local var_14_27

	if not CONDITIONS.AreCDLRulesActive(var_14_1) then
		local var_14_28 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_6:RegisterAnimationSequence("ButtonUpDisabled", var_14_28)
	end

	local function var_14_29()
		if not CONDITIONS.AreCDLRulesActive(var_14_1) then
			var_14_6:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_14_0._sequences.ButtonUpDisabled = var_14_29

	local var_14_30

	if not CONDITIONS.AreCDLRulesActive(var_14_1) then
		local var_14_31 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_6:RegisterAnimationSequence("HideLock", var_14_31)
	end

	local function var_14_32()
		if not CONDITIONS.AreCDLRulesActive(var_14_1) then
			var_14_6:AnimateSequence("HideLock")
		end
	end

	var_14_0._sequences.HideLock = var_14_32

	local var_14_33
	local var_14_34 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_5:RegisterAnimationSequence("ShowRestriction", var_14_34)

	local function var_14_35()
		var_14_5:AnimateSequence("ShowRestriction")
	end

	var_14_0._sequences.ShowRestriction = var_14_35

	local var_14_36
	local var_14_37 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_14_5:RegisterAnimationSequence("HideRestriction", var_14_37)

	local function var_14_38()
		var_14_5:AnimateSequence("HideRestriction")
	end

	var_14_0._sequences.HideRestriction = var_14_38

	local var_14_39

	if not CONDITIONS.AreCDLRulesActive(var_14_1) then
		local var_14_40 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_14_6:RegisterAnimationSequence("Disabled", var_14_40)
	end

	local function var_14_41()
		if not CONDITIONS.AreCDLRulesActive(var_14_1) then
			var_14_6:AnimateSequence("Disabled")
		end
	end

	var_14_0._sequences.Disabled = var_14_41

	var_14_0:addEventHandler("disable", function(arg_26_0, arg_26_1)
		if not arg_26_1.controller then
			local var_26_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "Disabled")
	end)
	var_14_0:addEventHandler("enable", function(arg_27_0, arg_27_1)
		if not arg_27_1.controller then
			local var_27_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "Enabled")
	end)
	var_14_0:addEventHandler("button_disable", function(arg_28_0, arg_28_1)
		if not arg_28_1.controller then
			local var_28_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonUpDisabled")
	end)
	var_14_0:addEventHandler("button_over_disable", function(arg_29_0, arg_29_1)
		if not arg_29_1.controller then
			local var_29_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonOverDisabled")
	end)
	var_14_0:addEventHandler("button_over", function(arg_30_0, arg_30_1)
		if not arg_30_1.controller then
			local var_30_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonOver")
	end)
	var_14_0:addEventHandler("button_up", function(arg_31_0, arg_31_1)
		if not arg_31_1.controller then
			local var_31_0 = var_14_1
		end

		ACTIONS.AnimateSequence(var_14_0, "ButtonUp")
	end)
	var_0_8(var_14_0, var_14_1, arg_14_1)

	return var_14_0
end

MenuBuilder.registerType("PerkButton", PerkButton)
LockTable(_M)
