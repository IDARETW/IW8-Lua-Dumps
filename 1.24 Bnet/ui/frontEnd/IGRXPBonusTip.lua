module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0:setPriority(11)

	local var_1_0 = Engine.DDAEJCJEA()

	arg_1_0.RankXPBonusDesc:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_XP_BONUS_TIP", tostring(var_1_0 * 100)))

	local var_1_1 = Engine.BAHJDDBGHC()

	arg_1_0.WeaponXPBonusDesc:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_WEAPON_XP_BONUS_TIP", tostring(var_1_1 * 100)))

	local var_1_2 = Engine.DGEJEAHEGH()

	arg_1_0.BattlePassXPBonusDesc:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_BATTLE_PASS_PROGRESSION_TIP", tostring(var_1_2 * 100)))
end

function IGRXPBonusTip(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 70 * _1080p)

	var_2_0.id = "IGRXPBonusTip"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIImage.new()

	var_2_4.id = "XPBonusIcon"

	var_2_4:setImage(RegisterMaterial("icon_xp"), 0)
	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 26, _1080p * 62, _1080p * 17, _1080p * 53)
	var_2_0:addElement(var_2_4)

	var_2_0.XPBonusIcon = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIStyledText.new()

	var_2_6.id = "RankXPBonusDesc"

	var_2_6:SetRGBFromTable(SWATCHES.MainMenu.IGRBonusText, 0)
	var_2_6:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_XP_BONUS_TIP"), 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 590, _1080p * 22, _1080p * 46)
	var_2_0:addElement(var_2_6)

	var_2_0.RankXPBonusDesc = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIStyledText.new()

	var_2_8.id = "WeaponXPBonusDesc"

	var_2_8:SetRGBFromTable(SWATCHES.MainMenu.IGRBonusText, 0)
	var_2_8:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_WEAPON_XP_BONUS_TIP"), 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 548, _1080p * 22, _1080p * 46)
	var_2_0:addElement(var_2_8)

	var_2_0.WeaponXPBonusDesc = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIStyledText.new()

	var_2_10.id = "BattlePassXPBonusDesc"

	var_2_10:SetRGBFromTable(SWATCHES.MainMenu.IGRBonusText, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/DESC_IGR_BATTLE_PASS_PROGRESSION_TIP"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 68, _1080p * 668, _1080p * 22, _1080p * 46)
	var_2_0:addElement(var_2_10)

	var_2_0.BattlePassXPBonusDesc = var_2_10

	local function var_2_11()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_11

	local var_2_12
	local var_2_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_igr_operator_unlock_all")
		}
	}

	var_2_4:RegisterAnimationSequence("WeaponXPBonus", var_2_13)

	local var_2_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("WeaponXPBonus", var_2_14)

	local var_2_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("WeaponXPBonus", var_2_15)

	local var_2_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("WeaponXPBonus", var_2_16)

	local function var_2_17()
		var_2_4:AnimateSequence("WeaponXPBonus")
		var_2_6:AnimateSequence("WeaponXPBonus")
		var_2_8:AnimateSequence("WeaponXPBonus")
		var_2_10:AnimateSequence("WeaponXPBonus")
	end

	var_2_0._sequences.WeaponXPBonus = var_2_17

	local var_2_18
	local var_2_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_xp")
		}
	}

	var_2_4:RegisterAnimationSequence("RankXPBonus", var_2_19)

	local var_2_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("RankXPBonus", var_2_20)

	local var_2_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("RankXPBonus", var_2_21)

	local var_2_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("RankXPBonus", var_2_22)

	local function var_2_23()
		var_2_4:AnimateSequence("RankXPBonus")
		var_2_6:AnimateSequence("RankXPBonus")
		var_2_8:AnimateSequence("RankXPBonus")
		var_2_10:AnimateSequence("RankXPBonus")
	end

	var_2_0._sequences.RankXPBonus = var_2_23

	local var_2_24
	local var_2_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_xp")
		}
	}

	var_2_4:RegisterAnimationSequence("BattlePassXPBonus", var_2_25)

	local var_2_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_6:RegisterAnimationSequence("BattlePassXPBonus", var_2_26)

	local var_2_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_8:RegisterAnimationSequence("BattlePassXPBonus", var_2_27)

	local var_2_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_2_10:RegisterAnimationSequence("BattlePassXPBonus", var_2_28)

	local function var_2_29()
		var_2_4:AnimateSequence("BattlePassXPBonus")
		var_2_6:AnimateSequence("BattlePassXPBonus")
		var_2_8:AnimateSequence("BattlePassXPBonus")
		var_2_10:AnimateSequence("BattlePassXPBonus")
	end

	var_2_0._sequences.BattlePassXPBonus = var_2_29

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("IGRXPBonusTip", IGRXPBonusTip)
LockTable(_M)
