module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	local var_1_0 = {
		factionRef = arg_1_4.factionRef,
		category = arg_1_2,
		operatorIndex = arg_1_3,
		operatorRef = arg_1_4.ref
	}

	arg_1_0._isFactionHead = arg_1_4.showFactionHeader

	arg_1_0.Button:SetupButton(arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)

	arg_1_0._operatorInfo = arg_1_4

	if arg_1_0._isFactionHead and arg_1_4.factionRef ~= OPERATOR.RANDOM_FACTION then
		local var_1_1 = OPERATOR.GetFactionName(arg_1_4.ref)

		arg_1_0.FactionName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/TITLE_VALUE_FORMAT", var_1_1, arg_1_4.numOperatorsUnlocked, arg_1_4.numOperators)))

		if arg_1_4.numOperators == 1 then
			arg_1_0.FactionName:SetRight(_1080p * 110)
		else
			arg_1_0.FactionName:SetRight(_1080p * 360)
		end
	end

	local var_1_2 = OPERATOR.GetOperatorGameSourceID(arg_1_4.ref)
	local var_1_3 = LUI.GetAnimForGameSource(var_1_2)

	ACTIONS.AnimateSequence(arg_1_0, var_1_3)

	if var_1_2 == LUI.GAME_SOURCE_ID.VANGUARD and OPERATOR.IsUnlocked(arg_1_1, arg_1_4.ref) then
		local var_1_4 = OPERATOR.GetRank(arg_1_1, arg_1_4.ref)
		local var_1_5 = OPERATOR.GetRankDisplay(var_1_4)

		if var_1_4 == OPERATOR.GetMaxRank(arg_1_4.ref) then
			ACTIONS.AnimateSequence(arg_1_0, "ShowVGOpMaxProgress")
		else
			ACTIONS.AnimateSequence(arg_1_0, "ShowVGOpProgress")
		end

		local var_1_6 = OPERATOR.GetOperatorProgress(arg_1_1, arg_1_4.ref).xp / OPERATOR.GetRankMaxXP(arg_1_4.ref, var_1_4)

		arg_1_0.ProgressBar:SetProgress(var_1_6, 0)
		arg_1_0.Level:setText(var_1_5)
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0._isFactionHead then
		ACTIONS.AnimateSequence(arg_2_0, "ShowFactionSep")
	else
		ACTIONS.AnimateSequence(arg_2_0, "HideFactionSep")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupButton = var_0_0
	arg_3_0.SetButtonDisplay = var_0_1
	arg_3_0._isFactionHead = false
end

function WZOperatorSelectButtonContainer(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 110 * _1080p, 0, 134 * _1080p)

	var_4_0.id = "WZOperatorSelectButtonContainer"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("WZOperatorSelectButton", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Button"

	var_4_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -110, 0, _1080p * -14, _1080p * 120)
	var_4_0:addElement(var_4_4)

	var_4_0.Button = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "FactionSep"

	var_4_6:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
	var_4_6:SetAlpha(0, 0)
	var_4_6:setImage(RegisterMaterial("widg_gradient_top_to_bottom_with_base"), 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 0, _1080p * -5, _1080p * -2, _1080p * -34, _1080p * -14)
	var_4_0:addElement(var_4_6)

	var_4_0.FactionSep = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "FactionName"

	var_4_8:SetRGBFromTable(SWATCHES.CH2.SnipeOverlayModernWarfare, 0)
	var_4_8:SetAlpha(0, 0)
	var_4_8:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/FACTION_DEMONDOGS_NAME")), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_4_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 361, _1080p * -38, _1080p * -20)
	var_4_0:addElement(var_4_8)

	var_4_0.FactionName = var_4_8

	local var_4_9

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_4_9 = MenuBuilder.BuildRegisteredType("GenericProgressBar", {
			controllerIndex = var_4_1
		})
		var_4_9.id = "ProgressBar"

		var_4_9:SetAlpha(0, 0)
		var_4_9.DialogueBackground:SetAlpha(0.5, 0)
		var_4_9.Fill:SetRGBFromTable(SWATCHES.genericMenu.wzTitle, 0)
		var_4_9.Cap:SetAlpha(0, 0)
		var_4_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 100, _1080p * 100, _1080p * 108)
		var_4_0:addElement(var_4_9)

		var_4_0.ProgressBar = var_4_9
	end

	local var_4_10

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		var_4_10 = LUI.UIText.new()
		var_4_10.id = "Level"

		var_4_10:SetAlpha(0, 0)
		var_4_10:setText("1", 0)
		var_4_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_4_10:SetAlignment(LUI.Alignment.Left)
		var_4_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 58, _1080p * 79, _1080p * 97)
		var_4_0:addElement(var_4_10)

		var_4_0.Level = var_4_10
	end

	local function var_4_11()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_11

	local var_4_12
	local var_4_13 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("ShowFactionSep", var_4_13)

	local var_4_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("ShowFactionSep", var_4_14)

	local function var_4_15()
		var_4_6:AnimateSequence("ShowFactionSep")
		var_4_8:AnimateSequence("ShowFactionSep")
	end

	var_4_0._sequences.ShowFactionSep = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -110
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Right
		}
	}

	var_4_4:RegisterAnimationSequence("HideFactionSep", var_4_17)

	local var_4_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("HideFactionSep", var_4_18)

	local var_4_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("HideFactionSep", var_4_19)

	local function var_4_20()
		var_4_4:AnimateSequence("HideFactionSep")
		var_4_6:AnimateSequence("HideFactionSep")
		var_4_8:AnimateSequence("HideFactionSep")
	end

	var_4_0._sequences.HideFactionSep = var_4_20

	local var_4_21
	local var_4_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_4_6:RegisterAnimationSequence("CW", var_4_22)

	local var_4_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayBOColdWar
		}
	}

	var_4_8:RegisterAnimationSequence("CW", var_4_23)

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_24 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_9:RegisterAnimationSequence("CW", var_4_24)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_25 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_10:RegisterAnimationSequence("CW", var_4_25)
	end

	local function var_4_26()
		var_4_6:AnimateSequence("CW")
		var_4_8:AnimateSequence("CW")

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_9:AnimateSequence("CW")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_10:AnimateSequence("CW")
		end
	end

	var_4_0._sequences.CW = var_4_26

	local var_4_27
	local var_4_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_4_6:RegisterAnimationSequence("MW", var_4_28)

	local var_4_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.SnipeOverlayModernWarfare
		}
	}

	var_4_8:RegisterAnimationSequence("MW", var_4_29)

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_30 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_9:RegisterAnimationSequence("MW", var_4_30)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_31 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_10:RegisterAnimationSequence("MW", var_4_31)
	end

	local function var_4_32()
		var_4_6:AnimateSequence("MW")
		var_4_8:AnimateSequence("MW")

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_9:AnimateSequence("MW")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_10:AnimateSequence("MW")
		end
	end

	var_4_0._sequences.MW = var_4_32

	local var_4_33

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_34 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.genericMenu.wzTitle,
				child = var_4_0.ProgressBar.Fill
			}
		}

		var_4_9:RegisterAnimationSequence("ShowVGOpProgress", var_4_34)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_35 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.CH2.White
			}
		}

		var_4_10:RegisterAnimationSequence("ShowVGOpProgress", var_4_35)
	end

	local function var_4_36()
		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_9:AnimateSequence("ShowVGOpProgress")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_10:AnimateSequence("ShowVGOpProgress")
		end
	end

	var_4_0._sequences.ShowVGOpProgress = var_4_36

	local var_4_37
	local var_4_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_4_6:RegisterAnimationSequence("VG", var_4_38)

	local var_4_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.WZCH3.WZCH3VanguardGold
		}
	}

	var_4_8:RegisterAnimationSequence("VG", var_4_39)

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_40 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_9:RegisterAnimationSequence("VG", var_4_40)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_41 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_10:RegisterAnimationSequence("VG", var_4_41)
	end

	local function var_4_42()
		var_4_6:AnimateSequence("VG")
		var_4_8:AnimateSequence("VG")

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_9:AnimateSequence("VG")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_10:AnimateSequence("VG")
		end
	end

	var_4_0._sequences.VG = var_4_42

	local var_4_43

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_44 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZCH3.WZCH3VanguardGold,
				child = var_4_0.ProgressBar.Fill
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZCH3.WZCH3VanguardGold,
				child = var_4_0.ProgressBar.Frame
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZCH3.WZCH3VanguardGold,
				child = var_4_0.ProgressBar.Cap
			}
		}

		var_4_9:RegisterAnimationSequence("ShowVGOpMaxProgress", var_4_44)
	end

	if CONDITIONS.IsWZWipOperatorFlowEnabled() then
		local var_4_45 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.RGB,
				value = SWATCHES.WZCH3.WZCH3VanguardGold
			}
		}

		var_4_10:RegisterAnimationSequence("ShowVGOpMaxProgress", var_4_45)
	end

	local function var_4_46()
		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_9:AnimateSequence("ShowVGOpMaxProgress")
		end

		if CONDITIONS.IsWZWipOperatorFlowEnabled() then
			var_4_10:AnimateSequence("ShowVGOpMaxProgress")
		end
	end

	var_4_0._sequences.ShowVGOpMaxProgress = var_4_46

	var_0_2(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("WZOperatorSelectButtonContainer", WZOperatorSelectButtonContainer)
LockTable(_M)
