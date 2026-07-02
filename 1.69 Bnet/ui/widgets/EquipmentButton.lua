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
	assert(arg_4_0.Lock, "EquipmentButton -> SetupLock() -> self.Lock is the name of a widget that's expected to be non-nil here")

	local var_4_0 = {}

	if arg_4_1 and arg_4_1 >= PROGRESSION.FIRST_VALID_RANK then
		local var_4_1 = PROGRESSION.GetPlayerProgressionData({
			_combinedRankNum = arg_4_1
		})

		var_4_0.type = LOOT.unlockTypes.LEVEL
		var_4_0.level = var_4_1._rankDisplay
	else
		var_4_0.type = LOOT.unlockTypes.PURCHASE
	end

	arg_4_0.Lock:Setup(var_4_0)
end

local function var_0_4(arg_5_0, arg_5_1)
	if arg_5_1 then
		ACTIONS.AnimateSequence(arg_5_0, "ShowRestriction")
	else
		ACTIONS.AnimateSequence(arg_5_0, "HideRestriction")
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.SetNew = var_0_1
	arg_6_0.GetNew = var_0_0
	arg_6_0.SetSelected = var_0_2
	arg_6_0.SetupLock = var_0_3
	arg_6_0.SetupRestriction = var_0_4
	arg_6_0._controllerIndex = arg_6_1

	arg_6_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if arg_7_0._isNew then
			var_0_1(arg_7_0, false, arg_7_0._itemRef)
		end
	end)
end

function EquipmentButton(arg_8_0, arg_8_1)
	local var_8_0 = MenuBuilder.BuildRegisteredType("ProgressionItemButton", arg_8_1)

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 546 * _1080p, 0, 62 * _1080p)

	var_8_0.id = "EquipmentButton"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3

	if CONDITIONS.IsWaveGameType(var_8_0) then
		var_8_3 = LUI.UIStyledText.new()
		var_8_3.id = "CPWaveSurvivalCost"

		var_8_3:SetRGBFromInt(8421504, 0)
		var_8_3:SetAlpha(0.6, 0)
		var_8_3:setText("", 0)
		var_8_3:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_8_3:SetAlignment(LUI.Alignment.Right)
		var_8_3:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
		var_8_3:SetStartupDelay(2000)
		var_8_3:SetLineHoldTime(400)
		var_8_3:SetAnimMoveTime(300)
		var_8_3:SetAnimMoveSpeed(50)
		var_8_3:SetEndDelay(1500)
		var_8_3:SetCrossfadeTime(750)
		var_8_3:SetFadeInTime(300)
		var_8_3:SetFadeOutTime(300)
		var_8_3:SetMaxVisibleLines(1)
		var_8_3:SetOutlineRGBFromInt(0, 0)
		var_8_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 252, _1080p * 380, _1080p * 38, _1080p * 62)
		var_8_0:addElement(var_8_3)

		var_8_0.CPWaveSurvivalCost = var_8_3
	end

	local var_8_4
	local var_8_5 = LUI.UIImage.new()

	var_8_5.id = "RestrictionWarning"

	var_8_5:setImage(RegisterMaterial("ui_streak_warning"), 0)
	var_8_5:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -98, _1080p * -58, _1080p * -20, _1080p * 20)
	var_8_0:addElement(var_8_5)

	var_8_0.RestrictionWarning = var_8_5

	local var_8_6

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		var_8_6 = MenuBuilder.BuildRegisteredType("GenericLock", {
			controllerIndex = var_8_1
		})
		var_8_6.id = "Lock"

		var_8_6:SetAlpha(0, 0)
		var_8_6:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -61, _1080p * -11, _1080p * -25, _1080p * 25)
		var_8_0:addElement(var_8_6)

		var_8_0.Lock = var_8_6
	end

	local var_8_7

	if CONDITIONS.IsWaveGameType(var_8_0) then
		local var_8_8 = {
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

		var_8_3:RegisterAnimationSequence("DefaultSequence", var_8_8)
	end

	local function var_8_9()
		if CONDITIONS.IsWaveGameType(var_8_0) then
			var_8_3:AnimateSequence("DefaultSequence")
		end
	end

	var_8_0._sequences.DefaultSequence = var_8_9

	local var_8_10

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_11 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_6:RegisterAnimationSequence("ButtonOver", var_8_11)
	end

	local function var_8_12()
		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_6:AnimateSequence("ButtonOver")
		end
	end

	var_8_0._sequences.ButtonOver = var_8_12

	local var_8_13

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_14 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_6:RegisterAnimationSequence("ButtonUp", var_8_14)
	end

	local function var_8_15()
		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_6:AnimateSequence("ButtonUp")
		end
	end

	var_8_0._sequences.ButtonUp = var_8_15

	local var_8_16

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_17 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_6:RegisterAnimationSequence("Disabled", var_8_17)
	end

	local function var_8_18()
		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_6:AnimateSequence("Disabled")
		end
	end

	var_8_0._sequences.Disabled = var_8_18

	local var_8_19

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_20 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_6:RegisterAnimationSequence("Enabled", var_8_20)
	end

	local function var_8_21()
		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_6:AnimateSequence("Enabled")
		end
	end

	var_8_0._sequences.Enabled = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_5:RegisterAnimationSequence("ShowRestriction", var_8_23)

	local function var_8_24()
		var_8_5:AnimateSequence("ShowRestriction")
	end

	var_8_0._sequences.ShowRestriction = var_8_24

	local var_8_25
	local var_8_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_5:RegisterAnimationSequence("HideRestriction", var_8_26)

	local function var_8_27()
		var_8_5:AnimateSequence("HideRestriction")
	end

	var_8_0._sequences.HideRestriction = var_8_27

	local var_8_28

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_29 = {
			{
				value = 0.2,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_6:RegisterAnimationSequence("ButtonUpDisabled", var_8_29)
	end

	local function var_8_30()
		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_6:AnimateSequence("ButtonUpDisabled")
		end
	end

	var_8_0._sequences.ButtonUpDisabled = var_8_30

	local var_8_31

	if not CONDITIONS.AreCDLRulesActive(var_8_1) then
		local var_8_32 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_8_6:RegisterAnimationSequence("ButtonOverDisabled", var_8_32)
	end

	local function var_8_33()
		if not CONDITIONS.AreCDLRulesActive(var_8_1) then
			var_8_6:AnimateSequence("ButtonOverDisabled")
		end
	end

	var_8_0._sequences.ButtonOverDisabled = var_8_33

	var_8_0:addEventHandler("button_over", function(arg_18_0, arg_18_1)
		if not arg_18_1.controller then
			local var_18_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonOver")
	end)
	var_8_0:addEventHandler("button_up", function(arg_19_0, arg_19_1)
		if not arg_19_1.controller then
			local var_19_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonUp")
	end)
	var_8_0:addEventHandler("disable", function(arg_20_0, arg_20_1)
		if not arg_20_1.controller then
			local var_20_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "Disabled")
	end)
	var_8_0:addEventHandler("enable", function(arg_21_0, arg_21_1)
		if not arg_21_1.controller then
			local var_21_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "Enabled")
	end)
	var_8_0:addEventHandler("button_over_disable", function(arg_22_0, arg_22_1)
		if not arg_22_1.controller then
			local var_22_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonOverDisabled")
	end)
	var_8_0:addEventHandler("button_disable", function(arg_23_0, arg_23_1)
		if not arg_23_1.controller then
			local var_23_0 = var_8_1
		end

		ACTIONS.AnimateSequence(var_8_0, "ButtonUpDisabled")
	end)
	var_0_5(var_8_0, var_8_1, arg_8_1)
	ACTIONS.AnimateSequence(var_8_0, "DefaultSequence")

	return var_8_0
end

MenuBuilder.registerType("EquipmentButton", EquipmentButton)
LockTable(_M)
