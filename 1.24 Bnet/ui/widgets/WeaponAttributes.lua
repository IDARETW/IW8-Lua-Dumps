module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.AccuracyBar:UpdateAttributes(arg_1_1.statAccuracy, arg_1_2.statAccuracy, arg_1_3)
	arg_1_0.DamageBar:UpdateAttributes(arg_1_1.statDamage, arg_1_2.statDamage, arg_1_3)
	arg_1_0.RangeBar:UpdateAttributes(arg_1_1.statRange, arg_1_2.statRange, arg_1_3)
	arg_1_0.FireRateBar:UpdateAttributes(arg_1_1.statFireRate, arg_1_2.statFireRate, arg_1_3)
	arg_1_0.MobilityBar:UpdateAttributes(arg_1_1.statMobility, arg_1_2.statMobility, arg_1_3)
	arg_1_0.ControlBar:UpdateAttributes(arg_1_1.statControl, arg_1_2.statControl, arg_1_3)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0

	if arg_2_1.equipped then
		var_2_0 = arg_2_1.weaponData[arg_2_0] + (arg_2_1.prevWeaponTableWeaponData[arg_2_0] - arg_2_1.modData[arg_2_0])
	else
		var_2_0 = arg_2_1.weaponData[arg_2_0] + arg_2_1.prevWeaponTableWeaponData[arg_2_0]
	end

	return var_2_0
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0

	if arg_3_1.equipped then
		var_3_0 = arg_3_1.modData[arg_3_0]
	else
		var_3_0 = arg_3_1.modData[arg_3_0] - arg_3_1.prevWeaponTableWeaponData[arg_3_0]
	end

	return var_3_0
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
	local var_4_0 = {
		weaponData = arg_4_1,
		prevWeaponTableWeaponData = arg_4_2,
		modData = arg_4_3,
		equipped = arg_4_5
	}

	arg_4_0.AccuracyBar:UpdateAttributes(var_0_1("statAccuracy", var_4_0), var_0_2("statAccuracy", var_4_0), arg_4_4, arg_4_1.statAccuracy)
	arg_4_0.DamageBar:UpdateAttributes(var_0_1("statDamage", var_4_0), var_0_2("statDamage", var_4_0), arg_4_4, arg_4_1.statDamage)
	arg_4_0.RangeBar:UpdateAttributes(var_0_1("statRange", var_4_0), var_0_2("statRange", var_4_0), arg_4_4, arg_4_1.statRange)
	arg_4_0.FireRateBar:UpdateAttributes(var_0_1("statFireRate", var_4_0), var_0_2("statFireRate", var_4_0), arg_4_4, arg_4_1.statFireRate)
	arg_4_0.MobilityBar:UpdateAttributes(var_0_1("statMobility", var_4_0), var_0_2("statMobility", var_4_0), arg_4_4, arg_4_1.statMobility)
	arg_4_0.ControlBar:UpdateAttributes(var_0_1("statControl", var_4_0), var_0_2("statControl", var_4_0), arg_4_4, arg_4_1.statControl)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	assert(arg_5_3.attachments)
	assert(#arg_5_3.attachments > 0)

	local var_5_0 = ATTACHMENT.GetStatsForAttachments(arg_5_3.weapon, arg_5_3.attachments)

	if arg_5_2 then
		local var_5_1 = ATTACHMENT.GetStatsForAttachments(arg_5_3.weapon, arg_5_2.attachments)

		var_0_3(arg_5_0, arg_5_1, var_5_1, var_5_0, true, arg_5_4)
	else
		var_0_0(arg_5_0, arg_5_1, var_5_0, true)
	end
end

local function var_0_5(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = StringTable.BJJBBCJGEJ(CSV.weapons.file, CSV.weapons.cols.ref, arg_6_2)
	local var_6_1 = CSV.ReadRow(CSV.weapons, var_6_0)
	local var_6_2 = {
		statAccuracy = arg_6_1.statAccuracy - var_6_1.statAccuracy,
		statDamage = arg_6_1.statDamage - var_6_1.statDamage,
		statRange = arg_6_1.statRange - var_6_1.statRange,
		statFireRate = arg_6_1.statFireRate - var_6_1.statFireRate,
		statMobility = arg_6_1.statMobility - var_6_1.statMobility,
		statControl = arg_6_1.statControl - var_6_1.statControl
	}

	var_0_0(arg_6_0, arg_6_1, var_6_2, false)
end

local function var_0_6(arg_7_0, arg_7_1)
	arg_7_0.AccuracyBar:UpdateAttributes(arg_7_1.statAccuracy)
	arg_7_0.DamageBar:UpdateAttributes(arg_7_1.statDamage)
	arg_7_0.RangeBar:UpdateAttributes(arg_7_1.statRange)
	arg_7_0.FireRateBar:UpdateAttributes(arg_7_1.statFireRate)
	arg_7_0.MobilityBar:UpdateAttributes(arg_7_1.statMobility)
	arg_7_0.ControlBar:UpdateAttributes(arg_7_1.statControl)
end

local function var_0_7(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	assert(arg_8_0.AccuracyBar)
	assert(arg_8_0.DamageBar)
	assert(arg_8_0.RangeBar)
	assert(arg_8_0.FireRateBar)
	assert(arg_8_0.MobilityBar)
	assert(arg_8_0.ControlBar)

	local var_8_0 = StringTable.BJJBBCJGEJ(CSV.weapons.file, CSV.weapons.cols.ref, arg_8_1.weapon)
	local var_8_1 = CSV.ReadRow(CSV.weapons, var_8_0)

	if arg_8_1.attachments and #arg_8_1.attachments > 0 then
		var_0_4(arg_8_0, var_8_1, arg_8_3, arg_8_1, arg_8_4)
	elseif arg_8_2 ~= nil then
		var_0_5(arg_8_0, var_8_1, arg_8_2)
	else
		var_0_6(arg_8_0, var_8_1)
	end
end

local function var_0_8(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.Setup = var_0_7

	if IsLanguageChinese() then
		ACTIONS.AnimateSequence(arg_9_0, "CHT")
	elseif IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_9_0, "AR")
	elseif IsLanguageJapanese() then
		ACTIONS.AnimateSequence(arg_9_0, "JP")
	end
end

function WeaponAttributes(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, -206 * _1080p, 206 * _1080p, -80 * _1080p, 80 * _1080p)

	var_10_0.id = "WeaponAttributes"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "DoubleNotchedBacker"

	var_10_4:SetAlpha(0.5, 0)
	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.DoubleNotchedBacker = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIStyledText.new()

	var_10_6.id = "Accuracy"

	var_10_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_6:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_ACCURACY"), 0)
	var_10_6:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_6:SetAlignment(LUI.Alignment.Right)
	var_10_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_6:SetStartupDelay(1000)
	var_10_6:SetLineHoldTime(400)
	var_10_6:SetAnimMoveTime(150)
	var_10_6:SetAnimMoveSpeed(50)
	var_10_6:SetEndDelay(1000)
	var_10_6:SetCrossfadeTime(400)
	var_10_6:SetFadeInTime(300)
	var_10_6:SetFadeOutTime(300)
	var_10_6:SetMaxVisibleLines(1)
	var_10_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 96, _1080p * -67, _1080p * -45)
	var_10_0:addElement(var_10_6)

	var_10_0.Accuracy = var_10_6

	local var_10_7

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		var_10_7 = LUI.UIText.new()
		var_10_7.id = "AccuracyValue"

		var_10_7:SetAlpha(0, 0)
		var_10_7:setText("", 0)
		var_10_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_7:SetAlignment(LUI.Alignment.Left)
		var_10_7:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -70, _1080p * 69, _1080p * 17, _1080p * 35)
		var_10_0:addElement(var_10_7)

		var_10_0.AccuracyValue = var_10_7
	end

	local var_10_8
	local var_10_9 = LUI.UIStyledText.new()

	var_10_9.id = "Damage"

	var_10_9:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_9:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_DAMAGE"), 0)
	var_10_9:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_9:SetAlignment(LUI.Alignment.Right)
	var_10_9:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_9:SetStartupDelay(1000)
	var_10_9:SetLineHoldTime(400)
	var_10_9:SetAnimMoveTime(150)
	var_10_9:SetAnimMoveSpeed(50)
	var_10_9:SetEndDelay(1000)
	var_10_9:SetCrossfadeTime(400)
	var_10_9:SetFadeInTime(300)
	var_10_9:SetFadeOutTime(300)
	var_10_9:SetMaxVisibleLines(1)
	var_10_9:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 96, _1080p * -43, _1080p * -21)
	var_10_0:addElement(var_10_9)

	var_10_0.Damage = var_10_9

	local var_10_10

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		var_10_10 = LUI.UIText.new()
		var_10_10.id = "DamageValue"

		var_10_10:SetAlpha(0, 0)
		var_10_10:setText("", 0)
		var_10_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_10:SetAlignment(LUI.Alignment.Left)
		var_10_10:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -70, _1080p * 68, _1080p * 39, _1080p * 57)
		var_10_0:addElement(var_10_10)

		var_10_0.DamageValue = var_10_10
	end

	local var_10_11
	local var_10_12 = LUI.UIStyledText.new()

	var_10_12.id = "Range"

	var_10_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_12:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_RANGE"), 0)
	var_10_12:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_12:SetAlignment(LUI.Alignment.Right)
	var_10_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_12:SetStartupDelay(1000)
	var_10_12:SetLineHoldTime(400)
	var_10_12:SetAnimMoveTime(150)
	var_10_12:SetAnimMoveSpeed(50)
	var_10_12:SetEndDelay(1000)
	var_10_12:SetCrossfadeTime(400)
	var_10_12:SetFadeInTime(300)
	var_10_12:SetFadeOutTime(300)
	var_10_12:SetMaxVisibleLines(1)
	var_10_12:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 96, _1080p * -21, _1080p * 1)
	var_10_0:addElement(var_10_12)

	var_10_0.Range = var_10_12

	local var_10_13

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		var_10_13 = LUI.UIText.new()
		var_10_13.id = "RangeValue"

		var_10_13:SetAlpha(0, 0)
		var_10_13:setText("", 0)
		var_10_13:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_13:SetAlignment(LUI.Alignment.Left)
		var_10_13:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -70, _1080p * 68, _1080p * 61, _1080p * 79)
		var_10_0:addElement(var_10_13)

		var_10_0.RangeValue = var_10_13
	end

	local var_10_14
	local var_10_15 = LUI.UIStyledText.new()

	var_10_15.id = "FireRate"

	var_10_15:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_15:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_ROF"), 0)
	var_10_15:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_15:SetAlignment(LUI.Alignment.Right)
	var_10_15:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_15:SetStartupDelay(1000)
	var_10_15:SetLineHoldTime(400)
	var_10_15:SetAnimMoveTime(150)
	var_10_15:SetAnimMoveSpeed(50)
	var_10_15:SetEndDelay(1000)
	var_10_15:SetCrossfadeTime(400)
	var_10_15:SetFadeInTime(300)
	var_10_15:SetFadeOutTime(300)
	var_10_15:SetMaxVisibleLines(1)
	var_10_15:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 96, _1080p * 4, _1080p * 26)
	var_10_0:addElement(var_10_15)

	var_10_0.FireRate = var_10_15

	local var_10_16

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		var_10_16 = LUI.UIText.new()
		var_10_16.id = "FireRateValue"

		var_10_16:SetAlpha(0, 0)
		var_10_16:setText("", 0)
		var_10_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_16:SetAlignment(LUI.Alignment.Left)
		var_10_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -70, _1080p * 68, _1080p * 83, _1080p * 101)
		var_10_0:addElement(var_10_16)

		var_10_0.FireRateValue = var_10_16
	end

	local var_10_17
	local var_10_18 = LUI.UIStyledText.new()

	var_10_18.id = "Mobility"

	var_10_18:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_18:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_MOBILITY"), 0)
	var_10_18:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_18:SetAlignment(LUI.Alignment.Right)
	var_10_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_18:SetStartupDelay(1000)
	var_10_18:SetLineHoldTime(400)
	var_10_18:SetAnimMoveTime(150)
	var_10_18:SetAnimMoveSpeed(50)
	var_10_18:SetEndDelay(1000)
	var_10_18:SetCrossfadeTime(400)
	var_10_18:SetFadeInTime(300)
	var_10_18:SetFadeOutTime(300)
	var_10_18:SetMaxVisibleLines(1)
	var_10_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 96, _1080p * 27, _1080p * 49)
	var_10_0:addElement(var_10_18)

	var_10_0.Mobility = var_10_18

	local var_10_19

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		var_10_19 = LUI.UIText.new()
		var_10_19.id = "MobilityValue"

		var_10_19:SetAlpha(0, 0)
		var_10_19:setText("", 0)
		var_10_19:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_10_19:SetAlignment(LUI.Alignment.Left)
		var_10_19:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -70, _1080p * 68, _1080p * 105, _1080p * 123)
		var_10_0:addElement(var_10_19)

		var_10_0.MobilityValue = var_10_19
	end

	local var_10_20
	local var_10_21 = MenuBuilder.BuildRegisteredType("WeaponAttributesBar", {
		controllerIndex = var_10_1
	})

	var_10_21.id = "AccuracyBar"

	var_10_21:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -23, _1080p * -57, _1080p * -51)
	var_10_0:addElement(var_10_21)

	var_10_0.AccuracyBar = var_10_21

	local var_10_22
	local var_10_23 = MenuBuilder.BuildRegisteredType("WeaponAttributesBar", {
		controllerIndex = var_10_1
	})

	var_10_23.id = "DamageBar"

	var_10_23:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -23, _1080p * -34, _1080p * -28)
	var_10_0:addElement(var_10_23)

	var_10_0.DamageBar = var_10_23

	local var_10_24
	local var_10_25 = MenuBuilder.BuildRegisteredType("WeaponAttributesBar", {
		controllerIndex = var_10_1
	})

	var_10_25.id = "RangeBar"

	var_10_25:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -23, _1080p * -11, _1080p * -5)
	var_10_0:addElement(var_10_25)

	var_10_0.RangeBar = var_10_25

	local var_10_26
	local var_10_27 = MenuBuilder.BuildRegisteredType("WeaponAttributesBar", {
		controllerIndex = var_10_1
	})

	var_10_27.id = "FireRateBar"

	var_10_27:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -23, _1080p * 12, _1080p * 18)
	var_10_0:addElement(var_10_27)

	var_10_0.FireRateBar = var_10_27

	local var_10_28
	local var_10_29 = MenuBuilder.BuildRegisteredType("WeaponAttributesBar", {
		controllerIndex = var_10_1
	})

	var_10_29.id = "MobilityBar"

	var_10_29:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -23, _1080p * 35, _1080p * 41)
	var_10_0:addElement(var_10_29)

	var_10_0.MobilityBar = var_10_29

	local var_10_30
	local var_10_31 = LUI.UIStyledText.new()

	var_10_31.id = "Control"

	var_10_31:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_31:setText(Engine.CBBHFCGDIC("LUA_MENU/WEAPSTATS_CONTROL"), 0)
	var_10_31:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_31:SetAlignment(LUI.Alignment.Right)
	var_10_31:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_31:SetStartupDelay(1000)
	var_10_31:SetLineHoldTime(400)
	var_10_31:SetAnimMoveTime(150)
	var_10_31:SetAnimMoveSpeed(50)
	var_10_31:SetEndDelay(1000)
	var_10_31:SetCrossfadeTime(400)
	var_10_31:SetFadeInTime(300)
	var_10_31:SetFadeOutTime(300)
	var_10_31:SetMaxVisibleLines(1)
	var_10_31:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 4, _1080p * 96, _1080p * 50, _1080p * 72)
	var_10_0:addElement(var_10_31)

	var_10_0.Control = var_10_31

	local var_10_32
	local var_10_33 = MenuBuilder.BuildRegisteredType("WeaponAttributesBar", {
		controllerIndex = var_10_1
	})

	var_10_33.id = "ControlBar"

	var_10_33:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -23, _1080p * 58, _1080p * 64)
	var_10_0:addElement(var_10_33)

	var_10_0.ControlBar = var_10_33

	local function var_10_34()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_34

	local var_10_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_4:RegisterAnimationSequence("Gunsmith", var_10_35)

	local function var_10_36()
		var_10_4:AnimateSequence("Gunsmith")
	end

	var_10_0._sequences.Gunsmith = var_10_36

	local var_10_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -52
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -80
		}
	}

	var_10_6:RegisterAnimationSequence("AR", var_10_37)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_38 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 5
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 23
			}
		}

		var_10_7:RegisterAnimationSequence("AR", var_10_38)
	end

	local var_10_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -55
		}
	}

	var_10_9:RegisterAnimationSequence("AR", var_10_39)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_40 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 31
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 49
			}
		}

		var_10_10:RegisterAnimationSequence("AR", var_10_40)
	end

	local var_10_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -31
		}
	}

	var_10_12:RegisterAnimationSequence("AR", var_10_41)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_42 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 56
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 74
			}
		}

		var_10_13:RegisterAnimationSequence("AR", var_10_42)
	end

	local var_10_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -4
		}
	}

	var_10_15:RegisterAnimationSequence("AR", var_10_43)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_44 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 82
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 100
			}
		}

		var_10_16:RegisterAnimationSequence("AR", var_10_44)
	end

	local var_10_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 20
		}
	}

	var_10_18:RegisterAnimationSequence("AR", var_10_45)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_46 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 107
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 125
			}
		}

		var_10_19:RegisterAnimationSequence("AR", var_10_46)
	end

	local var_10_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -62
		}
	}

	var_10_21:RegisterAnimationSequence("AR", var_10_47)

	local var_10_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -37
		}
	}

	var_10_23:RegisterAnimationSequence("AR", var_10_48)

	local var_10_49 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -11
		}
	}

	var_10_25:RegisterAnimationSequence("AR", var_10_49)

	local var_10_50 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_10_27:RegisterAnimationSequence("AR", var_10_50)

	local var_10_51 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		}
	}

	var_10_29:RegisterAnimationSequence("AR", var_10_51)

	local var_10_52 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 46
		}
	}

	var_10_31:RegisterAnimationSequence("AR", var_10_52)

	local var_10_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		}
	}

	var_10_33:RegisterAnimationSequence("AR", var_10_53)

	local function var_10_54()
		var_10_6:AnimateSequence("AR")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_7:AnimateSequence("AR")
		end

		var_10_9:AnimateSequence("AR")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_10:AnimateSequence("AR")
		end

		var_10_12:AnimateSequence("AR")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_13:AnimateSequence("AR")
		end

		var_10_15:AnimateSequence("AR")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_16:AnimateSequence("AR")
		end

		var_10_18:AnimateSequence("AR")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_19:AnimateSequence("AR")
		end

		var_10_21:AnimateSequence("AR")
		var_10_23:AnimateSequence("AR")
		var_10_25:AnimateSequence("AR")
		var_10_27:AnimateSequence("AR")
		var_10_29:AnimateSequence("AR")
		var_10_31:AnimateSequence("AR")
		var_10_33:AnimateSequence("AR")
	end

	var_10_0._sequences.AR = var_10_54

	local var_10_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		}
	}

	var_10_4:RegisterAnimationSequence("CHT", var_10_55)

	local var_10_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -53
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -77
		}
	}

	var_10_6:RegisterAnimationSequence("CHT", var_10_56)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_57 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 5
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 23
			}
		}

		var_10_7:RegisterAnimationSequence("CHT", var_10_57)
	end

	local var_10_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -52
		}
	}

	var_10_9:RegisterAnimationSequence("CHT", var_10_58)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_59 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 31
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 49
			}
		}

		var_10_10:RegisterAnimationSequence("CHT", var_10_59)
	end

	local var_10_60 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -27
		}
	}

	var_10_12:RegisterAnimationSequence("CHT", var_10_60)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_61 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 56
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 74
			}
		}

		var_10_13:RegisterAnimationSequence("CHT", var_10_61)
	end

	local var_10_62 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 23
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -1
		}
	}

	var_10_15:RegisterAnimationSequence("CHT", var_10_62)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_63 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 82
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 100
			}
		}

		var_10_16:RegisterAnimationSequence("CHT", var_10_63)
	end

	local var_10_64 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 48
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		}
	}

	var_10_18:RegisterAnimationSequence("CHT", var_10_64)

	if not CONDITIONS.IsSplitscreen(var_10_0) then
		local var_10_65 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * 107
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * 125
			}
		}

		var_10_19:RegisterAnimationSequence("CHT", var_10_65)
	end

	local var_10_66 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -68
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -62
		}
	}

	var_10_21:RegisterAnimationSequence("CHT", var_10_66)

	local var_10_67 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -37
		}
	}

	var_10_23:RegisterAnimationSequence("CHT", var_10_67)

	local var_10_68 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -17
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -11
		}
	}

	var_10_25:RegisterAnimationSequence("CHT", var_10_68)

	local var_10_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 14
		}
	}

	var_10_27:RegisterAnimationSequence("CHT", var_10_69)

	local var_10_70 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 33
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		}
	}

	var_10_29:RegisterAnimationSequence("CHT", var_10_70)

	local var_10_71 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 75
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 51
		}
	}

	var_10_31:RegisterAnimationSequence("CHT", var_10_71)

	local var_10_72 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 60
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 66
		}
	}

	var_10_33:RegisterAnimationSequence("CHT", var_10_72)

	local function var_10_73()
		var_10_4:AnimateSequence("CHT")
		var_10_6:AnimateSequence("CHT")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_7:AnimateSequence("CHT")
		end

		var_10_9:AnimateSequence("CHT")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_10:AnimateSequence("CHT")
		end

		var_10_12:AnimateSequence("CHT")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_13:AnimateSequence("CHT")
		end

		var_10_15:AnimateSequence("CHT")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_16:AnimateSequence("CHT")
		end

		var_10_18:AnimateSequence("CHT")

		if not CONDITIONS.IsSplitscreen(var_10_0) then
			var_10_19:AnimateSequence("CHT")
		end

		var_10_21:AnimateSequence("CHT")
		var_10_23:AnimateSequence("CHT")
		var_10_25:AnimateSequence("CHT")
		var_10_27:AnimateSequence("CHT")
		var_10_29:AnimateSequence("CHT")
		var_10_31:AnimateSequence("CHT")
		var_10_33:AnimateSequence("CHT")
	end

	var_10_0._sequences.CHT = var_10_73

	local var_10_74 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -65
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -47
		}
	}

	var_10_6:RegisterAnimationSequence("JP", var_10_74)

	local var_10_75 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -25
		}
	}

	var_10_9:RegisterAnimationSequence("JP", var_10_75)

	local var_10_76 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -1
		}
	}

	var_10_12:RegisterAnimationSequence("JP", var_10_76)

	local var_10_77 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 3
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 21
		}
	}

	var_10_15:RegisterAnimationSequence("JP", var_10_77)

	local var_10_78 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 24
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 42
		}
	}

	var_10_18:RegisterAnimationSequence("JP", var_10_78)

	local var_10_79 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 47
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 65
		}
	}

	var_10_31:RegisterAnimationSequence("JP", var_10_79)

	local function var_10_80()
		var_10_6:AnimateSequence("JP")
		var_10_9:AnimateSequence("JP")
		var_10_12:AnimateSequence("JP")
		var_10_15:AnimateSequence("JP")
		var_10_18:AnimateSequence("JP")
		var_10_31:AnimateSequence("JP")
	end

	var_10_0._sequences.JP = var_10_80

	var_0_8(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("WeaponAttributes", WeaponAttributes)
LockTable(_M)
