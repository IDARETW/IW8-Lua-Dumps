module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if not arg_1_1 or #arg_1_1 == 0 then
		return
	end

	local var_1_0 = {
		arg_1_0.StarOn1,
		arg_1_0.StarOn2,
		arg_1_0.StarOn3
	}
	local var_1_1 = {
		arg_1_0.Score1,
		arg_1_0.Score2,
		arg_1_0.Score3
	}

	arg_1_0:SetAlpha(1)

	local var_1_2 = StringTable.BJJBBCJGEJ(CSV.specOpsMissionTable.file, CSV.specOpsMissionTable.cols.map, arg_1_1)
	local var_1_3 = CSV.ReadRow(CSV.specOpsMissionTable, var_1_2)

	for iter_1_0 = 1, #var_1_1 do
		local var_1_4 = tonumber(var_1_3["tier" .. iter_1_0]) or 0

		var_1_1[iter_1_0]:setText(Engine.BFBIAHJJFA(var_1_4))
	end

	if not IsSystemLink() then
		local var_1_5 = CP.GetStarsEarnedForMap(arg_1_1, controllerIndex)

		LUI.clamp(var_1_5, 0, #var_1_0)
		ACTIONS.AnimateSequence(arg_1_0, "Tier" .. var_1_5)
		arg_1_0.BestLabel:SetAlpha(0)
		arg_1_0.BestScore:SetAlpha(0)

		local var_1_6 = tonumber(var_1_3.iwBest) or 0

		arg_1_0.IWScore:setText(Engine.BFBIAHJJFA(var_1_6))
	else
		ACTIONS.AnimateSequence(arg_1_0, "Offline")
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetMap = var_0_0
end

function SOStarRequirements(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 650 * _1080p, 0, 350 * _1080p)

	var_3_0.id = "SOStarRequirements"
	var_3_0._animationSets = var_3_0._animationSets or {}
	var_3_0._sequences = var_3_0._sequences or {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_3_1
	})

	var_3_4.id = "Background"

	var_3_4:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_4:SetAlpha(0.5, 0)
	var_3_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Background = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "OfflineWarning"

	var_3_6:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_6:SetAlpha(0, 0)
	var_3_6:setText(Engine.CBBHFCGDIC("LUA_MENU_CP/STARS_LOCAL_PLAY_WARNING"), 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Left)
	var_3_6:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -234, _1080p * 172, _1080p * -177, _1080p * -147)
	var_3_0:addElement(var_3_6)

	var_3_0.OfflineWarning = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "BestLabel"

	var_3_8:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_8:setText(Engine.CBBHFCGDIC("LUA_MENU/PERSONAL_BEST"), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -283, _1080p * -80, _1080p * 281, _1080p * 317)
	var_3_0:addElement(var_3_8)

	var_3_0.BestLabel = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "BestScore"

	var_3_10:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_10:setText("00:00", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -80, _1080p * 80, _1080p * 275, _1080p * 323)
	var_3_0:addElement(var_3_10)

	var_3_0.BestScore = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIText.new()

	var_3_12.id = "IWLabel"

	var_3_12:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_12:setText(Engine.CBBHFCGDIC("LUA_MENU/IW_BEST"), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Left)
	var_3_12:SetVerticalAlignment(LUI.Alignment.Center)
	var_3_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -283, _1080p * -80, _1080p * 231, _1080p * 267)
	var_3_0:addElement(var_3_12)

	var_3_0.IWLabel = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "IWScore"

	var_3_14:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_14:setText("00:00", 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Center)
	var_3_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -80, _1080p * 80, _1080p * 225, _1080p * 273)
	var_3_0:addElement(var_3_14)

	var_3_0.IWScore = var_3_14

	local var_3_15
	local var_3_16 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_16.id = "StatsTitle"

	var_3_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/STATISTICS"), 0)
	var_3_16:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 170, _1080p * 218)
	var_3_0:addElement(var_3_16)

	var_3_0.StatsTitle = var_3_16

	local var_3_17
	local var_3_18 = LUI.UIImage.new()

	var_3_18.id = "StarIcon"

	var_3_18:SetAlpha(0, 0)
	var_3_18:setImage(RegisterMaterial("star_on"), 0)
	var_3_18:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -283, _1080p * -243, _1080p * -182, _1080p * -142)
	var_3_0:addElement(var_3_18)

	var_3_0.StarIcon = var_3_18

	local var_3_19
	local var_3_20 = LUI.UIStyledText.new()

	var_3_20.id = "Score3"

	var_3_20:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_20:setText("00:00", 0)
	var_3_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_20:SetAlignment(LUI.Alignment.Center)
	var_3_20:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 136, _1080p * 296, _1080p * 102, _1080p * 150)
	var_3_0:addElement(var_3_20)

	var_3_0.Score3 = var_3_20

	local var_3_21
	local var_3_22 = LUI.UIStyledText.new()

	var_3_22.id = "Score2"

	var_3_22:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_22:setText("00:00", 0)
	var_3_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_22:SetAlignment(LUI.Alignment.Center)
	var_3_22:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -80, _1080p * 80, _1080p * 102, _1080p * 150)
	var_3_0:addElement(var_3_22)

	var_3_0.Score2 = var_3_22

	local var_3_23
	local var_3_24 = LUI.UIStyledText.new()

	var_3_24.id = "Score1"

	var_3_24:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_24:setText("00:00", 0)
	var_3_24:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_24:SetAlignment(LUI.Alignment.Center)
	var_3_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -297, _1080p * -137, _1080p * 102, _1080p * 150)
	var_3_0:addElement(var_3_24)

	var_3_0.Score1 = var_3_24

	local var_3_25
	local var_3_26 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_3_1
	})

	var_3_26.id = "TierDividerRight"

	var_3_26:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -108, _1080p * -106, _1080p * 60, _1080p * 152)
	var_3_0:addElement(var_3_26)

	var_3_0.TierDividerRight = var_3_26

	local var_3_27
	local var_3_28 = MenuBuilder.BuildRegisteredType("TabsSpacer", {
		controllerIndex = var_3_1
	})

	var_3_28.id = "TierDividerLeft"

	var_3_28:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 109, _1080p * 111, _1080p * 60, _1080p * 152)
	var_3_0:addElement(var_3_28)

	var_3_0.TierDividerLeft = var_3_28

	local var_3_29
	local var_3_30 = MenuBuilder.BuildRegisteredType("AARContentHeader", {
		controllerIndex = var_3_1
	})

	var_3_30.id = "RequirementsTitle"

	var_3_30.Text:setText(Engine.CBBHFCGDIC("CAS/UNLOCK_REQUIREMENTS"), 0)
	var_3_30:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 48)
	var_3_0:addElement(var_3_30)

	var_3_0.RequirementsTitle = var_3_30

	local var_3_31
	local var_3_32 = LUI.UIImage.new()

	var_3_32.id = "StarOff1"

	var_3_32:setImage(RegisterMaterial("star_off"), 0)
	var_3_32:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -237, _1080p * -197, _1080p * -291, _1080p * -251)
	var_3_0:addElement(var_3_32)

	var_3_0.StarOff1 = var_3_32

	local var_3_33
	local var_3_34 = LUI.UIImage.new()

	var_3_34.id = "StarOff2"

	var_3_34:setImage(RegisterMaterial("star_off"), 0)
	var_3_34:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -291, _1080p * -251)
	var_3_0:addElement(var_3_34)

	var_3_0.StarOff2 = var_3_34

	local var_3_35
	local var_3_36 = LUI.UIImage.new()

	var_3_36.id = "StarOff3"

	var_3_36:setImage(RegisterMaterial("star_off"), 0)
	var_3_36:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 196, _1080p * 236, _1080p * -291, _1080p * -251)
	var_3_0:addElement(var_3_36)

	var_3_0.StarOff3 = var_3_36

	local var_3_37
	local var_3_38 = LUI.UIImage.new()

	var_3_38.id = "StarOn1"

	var_3_38:setImage(RegisterMaterial("star_on"), 0)
	var_3_38:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -237, _1080p * -197, _1080p * -291, _1080p * -251)
	var_3_0:addElement(var_3_38)

	var_3_0.StarOn1 = var_3_38

	local var_3_39
	local var_3_40 = LUI.UIImage.new()

	var_3_40.id = "StarOn2"

	var_3_40:setImage(RegisterMaterial("star_on"), 0)
	var_3_40:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -291, _1080p * -251)
	var_3_0:addElement(var_3_40)

	var_3_0.StarOn2 = var_3_40

	local var_3_41
	local var_3_42 = LUI.UIImage.new()

	var_3_42.id = "StarOn3"

	var_3_42:setImage(RegisterMaterial("star_on"), 0)
	var_3_42:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * 196, _1080p * 236, _1080p * -291, _1080p * -251)
	var_3_0:addElement(var_3_42)

	var_3_0.StarOn3 = var_3_42

	local function var_3_43()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_43

	local function var_3_44()
		return
	end

	var_3_0._sequences.AR = var_3_44

	local var_3_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -126
		}
	}

	var_3_4:RegisterAnimationSequence("Offline", var_3_45)

	local var_3_46 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Offline", var_3_46)

	local var_3_47 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Offline", var_3_47)

	local var_3_48 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Offline", var_3_48)

	local var_3_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Offline", var_3_49)

	local var_3_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Offline", var_3_50)

	local var_3_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_16:RegisterAnimationSequence("Offline", var_3_51)

	local var_3_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_18:RegisterAnimationSequence("Offline", var_3_52)

	local var_3_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 130
		}
	}

	var_3_20:RegisterAnimationSequence("Offline", var_3_53)

	local var_3_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 130
		}
	}

	var_3_22:RegisterAnimationSequence("Offline", var_3_54)

	local var_3_55 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 82
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 130
		}
	}

	var_3_24:RegisterAnimationSequence("Offline", var_3_55)

	local var_3_56 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_32:RegisterAnimationSequence("Offline", var_3_56)

	local var_3_57 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_34:RegisterAnimationSequence("Offline", var_3_57)

	local var_3_58 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_36:RegisterAnimationSequence("Offline", var_3_58)

	local var_3_59 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("Offline", var_3_59)

	local var_3_60 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Offline", var_3_60)

	local var_3_61 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Offline", var_3_61)

	local function var_3_62()
		var_3_4:AnimateSequence("Offline")
		var_3_6:AnimateSequence("Offline")
		var_3_8:AnimateSequence("Offline")
		var_3_10:AnimateSequence("Offline")
		var_3_12:AnimateSequence("Offline")
		var_3_14:AnimateSequence("Offline")
		var_3_16:AnimateSequence("Offline")
		var_3_18:AnimateSequence("Offline")
		var_3_20:AnimateSequence("Offline")
		var_3_22:AnimateSequence("Offline")
		var_3_24:AnimateSequence("Offline")
		var_3_32:AnimateSequence("Offline")
		var_3_34:AnimateSequence("Offline")
		var_3_36:AnimateSequence("Offline")
		var_3_38:AnimateSequence("Offline")
		var_3_40:AnimateSequence("Offline")
		var_3_42:AnimateSequence("Offline")
	end

	var_3_0._sequences.Offline = var_3_62

	local var_3_63 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("Tier0", var_3_63)

	local var_3_64 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Tier0", var_3_64)

	local var_3_65 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Tier0", var_3_65)

	local function var_3_66()
		var_3_38:AnimateSequence("Tier0")
		var_3_40:AnimateSequence("Tier0")
		var_3_42:AnimateSequence("Tier0")
	end

	var_3_0._sequences.Tier0 = var_3_66

	local var_3_67 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("Tier1", var_3_67)

	local var_3_68 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Tier1", var_3_68)

	local var_3_69 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Tier1", var_3_69)

	local function var_3_70()
		var_3_38:AnimateSequence("Tier1")
		var_3_40:AnimateSequence("Tier1")
		var_3_42:AnimateSequence("Tier1")
	end

	var_3_0._sequences.Tier1 = var_3_70

	local var_3_71 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("Tier2", var_3_71)

	local var_3_72 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Tier2", var_3_72)

	local var_3_73 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Tier2", var_3_73)

	local function var_3_74()
		var_3_38:AnimateSequence("Tier2")
		var_3_40:AnimateSequence("Tier2")
		var_3_42:AnimateSequence("Tier2")
	end

	var_3_0._sequences.Tier2 = var_3_74

	local var_3_75 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_38:RegisterAnimationSequence("Tier3", var_3_75)

	local var_3_76 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_40:RegisterAnimationSequence("Tier3", var_3_76)

	local var_3_77 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_42:RegisterAnimationSequence("Tier3", var_3_77)

	local function var_3_78()
		var_3_38:AnimateSequence("Tier3")
		var_3_40:AnimateSequence("Tier3")
		var_3_42:AnimateSequence("Tier3")
	end

	var_3_0._sequences.Tier3 = var_3_78

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SOStarRequirements", SOStarRequirements)
LockTable(_M)
