module(..., package.seeall)

function SocialPartyMember(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIButton.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 85 * _1080p)

	var_1_0.id = "SocialPartyMember"
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
	local var_1_6 = LUI.UIImage.new()

	var_1_6.id = "Emblem"

	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 10, _1080p * 60, _1080p * -25.5, _1080p * 24.5)
	var_1_0:addElement(var_1_6)

	var_1_0.Emblem = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIStyledText.new()

	var_1_8.id = "FullName"

	var_1_8:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_8:setText(Engine.CBBHFCGDIC("LUA_MENU/GAMERTAG"), 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_1_8:SetUseEllipses(ELLIPSES.enabled_default)
	var_1_8:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 64, _1080p * -113, _1080p * -10.5, _1080p * 11.5)
	var_1_0:addElement(var_1_8)

	var_1_0.FullName = var_1_8

	local var_1_9
	local var_1_10 = LUI.UIImage.new()

	var_1_10.id = "MuteIcon"

	var_1_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_10:setImage(RegisterMaterial("icon_mic_muted"), 0)
	var_1_10:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -32, 0, _1080p * -16.5, _1080p * 15.5)
	var_1_0:addElement(var_1_10)

	var_1_0.MuteIcon = var_1_10

	local var_1_11
	local var_1_12 = LUI.UIImage.new()

	var_1_12.id = "LeaderIcon"

	var_1_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_1_12:setImage(RegisterMaterial("icon_party_leader_crown"), 0)
	var_1_12:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -65, _1080p * -41, _1080p * -12.5, _1080p * 11.5)
	var_1_0:addElement(var_1_12)

	var_1_0.LeaderIcon = var_1_12

	local var_1_13
	local var_1_14 = MenuBuilder.BuildRegisteredType("SocialPlatformPresence", {
		controllerIndex = var_1_1
	})

	var_1_14.id = "PlatformPresence"

	var_1_14:SetAlpha(0.75, 0)
	var_1_14:SetAnchorsAndPosition(1, 0, 0.5, 0.5, _1080p * -98, _1080p * -76, _1080p * -10.5, _1080p * 11.5)
	var_1_0:addElement(var_1_14)

	var_1_0.PlatformPresence = var_1_14

	local var_1_15
	local var_1_16 = LUI.UIImage.new()

	var_1_16.id = "PartyStripe"

	var_1_16:SetRGBFromTable(SWATCHES.Lobby.PartyTag, 0)
	var_1_16:SetAlpha(0.8, 0)
	var_1_16:SetAnchorsAndPosition(0, 1, 0, 0, 0, _1080p * 5, 0, 0)
	var_1_0:addElement(var_1_16)

	var_1_0.PartyStripe = var_1_16

	local function var_1_17()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_17

	local var_1_18
	local var_1_19 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonOver", var_1_19)

	local var_1_20 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonOver", var_1_20)

	local var_1_21 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonOver", var_1_21)

	local var_1_22 = {
		{
			value = 1,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonOver", var_1_22)

	local function var_1_23()
		var_1_8:AnimateSequence("ButtonOver")
		var_1_10:AnimateSequence("ButtonOver")
		var_1_12:AnimateSequence("ButtonOver")
		var_1_14:AnimateSequence("ButtonOver")
	end

	var_1_0._sequences.ButtonOver = var_1_23

	local var_1_24
	local var_1_25 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_8:RegisterAnimationSequence("ButtonUp", var_1_25)

	local var_1_26 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_10:RegisterAnimationSequence("ButtonUp", var_1_26)

	local var_1_27 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_1_12:RegisterAnimationSequence("ButtonUp", var_1_27)

	local var_1_28 = {
		{
			value = 0.75,
			duration = 150,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_1_14:RegisterAnimationSequence("ButtonUp", var_1_28)

	local function var_1_29()
		var_1_8:AnimateSequence("ButtonUp")
		var_1_10:AnimateSequence("ButtonUp")
		var_1_12:AnimateSequence("ButtonUp")
		var_1_14:AnimateSequence("ButtonUp")
	end

	var_1_0._sequences.ButtonUp = var_1_29

	local var_1_30
	local var_1_31 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_1_8:RegisterAnimationSequence("IsPlayer", var_1_31)

	local var_1_32 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_1_10:RegisterAnimationSequence("IsPlayer", var_1_32)

	local var_1_33 = {
		{
			duration = 150,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.highlight
		}
	}

	var_1_12:RegisterAnimationSequence("IsPlayer", var_1_33)

	local function var_1_34()
		var_1_8:AnimateSequence("IsPlayer")
		var_1_10:AnimateSequence("IsPlayer")
		var_1_12:AnimateSequence("IsPlayer")
	end

	var_1_0._sequences.IsPlayer = var_1_34

	return var_1_0
end

MenuBuilder.registerType("SocialPartyMember", SocialPartyMember)
LockTable(_M)
