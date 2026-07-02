module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1.isNoWeapon then
		ACTIONS.AnimateSequence(arg_1_0, "Hide")

		return 0
	end

	local var_1_0 = arg_1_1.gameSourceID
	local var_1_1 = arg_1_1.gameSourceExclusivityID

	if arg_1_1.weaponRef then
		local var_1_2
		local var_1_3 = LOOT.GetBaseWeaponItemID(arg_1_1.weaponRef)

		if var_1_3 then
			var_1_0 = LOOT.GetGameSourceIDFromItemID(var_1_3)
		end
	end

	local var_1_4 = {
		[LUI.GAME_SOURCE_ID.COLD_WAR] = {
			itemExclusivity = LOOT.itemSourceExclusivityTable[LOOT.itemSourceExclusivity.CW_EXCLUSIVE]
		},
		[LUI.GAME_SOURCE_ID.WARZONE] = {
			itemExclusivity = LOOT.itemSourceExclusivityTable[LOOT.itemSourceExclusivity.WZ_EXCLUSIVE]
		},
		[LUI.GAME_SOURCE_ID.MODERN_WARFARE] = {
			itemExclusivity = LOOT.itemSourceExclusivityTable[LOOT.itemSourceExclusivity.MW_EXCLUSIVE]
		},
		[LUI.GAME_SOURCE_ID.VANGUARD] = {
			itemExclusivity = LOOT.itemSourceExclusivityTable[LOOT.itemSourceExclusivity.VG_EXCLUSIVE]
		}
	}
	local var_1_5 = {}

	if var_1_4[var_1_0] then
		var_1_5 = var_1_4[var_1_0].itemExclusivity
	else
		var_1_5 = LOOT.itemSourceExclusivityTable[var_1_1]
	end

	local var_1_6
	local var_1_7 = arg_1_1.condensed and var_1_5.snipeIcon_condensed_selected or var_1_5.snipeIcon_selected

	if #var_1_7 > 0 then
		local var_1_8 = RegisterMaterial(var_1_7)

		arg_1_0.Icon:setImage(var_1_8)

		local var_1_9 = LAYOUT.GetElementHeight(arg_1_0) * Engine.DFEIGFBEH(var_1_8)

		if arg_1_1.alignment == LUI.Alignment.Left then
			arg_1_0.Icon:SetAnchorsAndPosition(0, 1, 0, 0, 0, var_1_9, 0, 0)
		elseif arg_1_1.alignment == LUI.Alignment.Right then
			arg_1_0.Icon:SetAnchorsAndPosition(1, 0, 0, 0, -1 * var_1_9, 0, 0, 0)
		else
			local var_1_10 = var_1_9 * 0.5

			arg_1_0.Icon:SetAnchorsAndPosition(0.5, 0.5, 0, 0, -1 * var_1_10, var_1_10, 0, 0)
		end

		ACTIONS.AnimateSequence(arg_1_0, arg_1_1.selected and "Selected" or "Unselected")

		return var_1_9
	else
		ACTIONS.AnimateSequence(arg_1_0, "Hide")

		return 0
	end
end

local function var_0_1(arg_2_0)
	arg_2_0.UpdateSnipeIcon = var_0_0
end

function WZSnipeIcon(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 400 * _1080p, 0, 100 * _1080p)

	var_3_0.id = "WZSnipeIcon"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Icon"

	var_3_4:SetRGBFromTable(SWATCHES.WZGlobalSwatches.WZText, 0)
	var_3_4:setImage(RegisterMaterial("ui_icon_snipe_vanguard_warzone"), 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0, 0, _1080p * -200, _1080p * 200, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Icon = var_3_4

	local function var_3_5()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_5

	local var_3_6
	local var_3_7 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Selected", var_3_7)

	local function var_3_8()
		var_3_4:AnimateSequence("Selected")
	end

	var_3_0._sequences.Selected = var_3_8

	local var_3_9
	local var_3_10 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Unselected", var_3_10)

	local function var_3_11()
		var_3_4:AnimateSequence("Unselected")
	end

	var_3_0._sequences.Unselected = var_3_11

	local var_3_12
	local var_3_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_13)

	local function var_3_14()
		var_3_4:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_14

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("WZSnipeIcon", WZSnipeIcon)
LockTable(_M)
