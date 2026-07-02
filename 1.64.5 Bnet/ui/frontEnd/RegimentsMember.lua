module(..., package.seeall)

function RegimentsMember(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p)

	var_1_0.id = "RegimentsMember"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0
	local var_1_3
	local var_1_4 = MenuBuilder.BuildRegisteredType("LoadoutItemButtonBackground", {
		controllerIndex = var_1_1
	})

	var_1_4.id = "Background"

	var_1_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_1_0:addElement(var_1_4)

	var_1_0.Background = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIStyledText.new()

	var_1_6.id = "FullName"

	var_1_6:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_6:SetUseEllipses(ELLIPSES.enabled_default)
	var_1_6:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 22, _1080p * -126, _1080p * -11, _1080p * 11)
	var_1_0:addElement(var_1_6)

	var_1_0.FullName = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIImage.new()

	var_1_8.id = "LeaderIcon"

	var_1_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_8:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_1_8:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -61, _1080p * -37, _1080p * -13, _1080p * 11)
	var_1_0:addElement(var_1_8)

	var_1_0.LeaderIcon = var_1_8

	local var_1_9
	local var_1_10 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_1_1
	})

	var_1_10.id = "PlatformPresence"

	var_1_10:SetAlpha(0.5, 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -33, _1080p * -11, _1080p * -11, _1080p * 11)
	var_1_0:addElement(var_1_10)

	var_1_0.PlatformPresence = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "PartyStripe"

	var_1_12:SetRGBFromTable(SWATCHES.Lobby.PartyTag, 0)
	var_1_12:SetAlpha(0.8, 0)
	var_1_12:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_1_0:addElement(var_1_12)

	var_1_0.PartyStripe = var_1_12

	local var_1_13
	local var_1_14 = LUI.UIStyledText.new()

	var_1_14.id = "Action"

	var_1_14:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_14:setText("", 0)
	var_1_14:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_1_14:SetWordWrap(false)
	var_1_14:SetAlignment(LUI.Alignment.Right)
	var_1_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_14:SetUseEllipses(ELLIPSES.enabled_default)
	var_1_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -161, _1080p * -67, _1080p * -11, _1080p * 11)
	var_1_0:addElement(var_1_14)

	var_1_0.Action = var_1_14

	local function var_1_15()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_15

	local var_1_16
	local var_1_17 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonOver", var_1_17)

	local var_1_18 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_18)

	local var_1_19 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonOver", var_1_19)

	local function var_1_20()
		var_1_6:AnimateSequence("ButtonOver")
		var_1_8:AnimateSequence("ButtonOver")
		var_1_14:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_20

	local var_1_21
	local var_1_22 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonUp", var_1_22)

	local var_1_23 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_23)

	local var_1_24 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonUp", var_1_24)

	local function var_1_25()
		var_1_6:AnimateSequence("ButtonUp")
		var_1_8:AnimateSequence("ButtonUp")
		var_1_14:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_25

	local var_1_26
	local var_1_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_1_6:RegisterAnimationSequence("IsPlayer", var_1_27)

	local var_1_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_1_8:RegisterAnimationSequence("IsPlayer", var_1_28)

	local function var_1_29()
		var_1_6:AnimateSequence("IsPlayer")
		var_1_8:AnimateSequence("IsPlayer")
	end

	var_1_0._sequences.IsPlayer = var_1_29

	local var_1_30
	local var_1_31 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOverPresence", var_1_31)

	local function var_1_32()
		var_1_10:AnimateSequence("ButtonOverPresence")
	end

	var_1_0._sequences.ButtonOverPresence = var_1_32

	local var_1_33
	local var_1_34 = {
		{
			value = 0.5,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUpPresence", var_1_34)

	local function var_1_35()
		var_1_10:AnimateSequence("ButtonUpPresence")
	end

	var_1_0._sequences.ButtonUpPresence = var_1_35

	local var_1_36
	local var_1_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_6:RegisterAnimationSequence("ButtonReset", var_1_37)

	local var_1_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonReset", var_1_38)

	local var_1_39 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonReset", var_1_39)

	local var_1_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonReset", var_1_40)

	local function var_1_41()
		var_1_6:AnimateSequence("ButtonReset")
		var_1_8:AnimateSequence("ButtonReset")
		var_1_10:AnimateSequence("ButtonReset")
		var_1_14:AnimateSequence("ButtonReset")
	end

	var_1_0._sequences.ButtonReset = var_1_41

	return var_1_0
end

MenuBuilder.registerType("RegimentsMember", RegimentsMember)
LockTable(_M)
