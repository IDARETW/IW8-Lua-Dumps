module(..., package.seeall)

local var_0_0 = "icon_lock"
local var_0_1 = "icon_lock"
local var_0_2 = "icon_challenge_weapon"

local function var_0_3(arg_1_0, arg_1_1)
	if arg_1_1.type == LOOT.unlockTypes.PURCHASE then
		arg_1_0.OverlayText:SetAlpha(0)
		arg_1_0.Lock:setImage(RegisterMaterial(var_0_0))
	elseif arg_1_1.type == LOOT.unlockTypes.LEVEL then
		arg_1_0.OverlayText:SetAlpha(1)
		arg_1_0.OverlayText:setText(arg_1_1.level)
		arg_1_0.Lock:setImage(RegisterMaterial(var_0_1))
	elseif arg_1_1.type == LOOT.unlockTypes.CHALLENGE then
		arg_1_0.OverlayText:SetAlpha(0)
		arg_1_0.Lock:setImage(RegisterMaterial(var_0_2))
	else
		assert(false, "Attempt to setup GenericLock with unsupported unlock type")
	end
end

local function var_0_4(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_0.OverlayText)
	assert(arg_2_0.Lock)

	arg_2_0.Setup = var_0_3
end

function GenericLock(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p)

	var_3_0.id = "GenericLock"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "Lock"

	var_3_4:SetRGBFromTable(SWATCHES.Global.lockColor, 0)
	var_3_4:setImage(RegisterMaterial("icon_playlist_trophy"), 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Lock = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIText.new()

	var_3_6.id = "OverlayText"

	var_3_6:SetRGBFromTable(SWATCHES.genericButton.listButtonDefault, 0)
	var_3_6:setText("10", 0)
	var_3_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_6:SetAlignment(LUI.Alignment.Center)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -18, _1080p * 18, _1080p * 19, _1080p * 44.5)
	var_3_0:addElement(var_3_6)

	var_3_0.OverlayText = var_3_6

	local function var_3_7()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_7

	local var_3_8 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 39
		}
	}

	var_3_6:RegisterAnimationSequence("LevelText", var_3_8)

	local function var_3_9()
		var_3_6:AnimateSequence("LevelText")
	end

	var_3_0._sequences.LevelText = var_3_9

	local var_3_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 11
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 36
		}
	}

	var_3_6:RegisterAnimationSequence("ModificationText", var_3_10)

	local function var_3_11()
		var_3_6:AnimateSequence("ModificationText")
	end

	var_3_0._sequences.ModificationText = var_3_11

	local var_3_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		}
	}

	var_3_6:RegisterAnimationSequence("ChallengeText", var_3_12)

	local function var_3_13()
		var_3_6:AnimateSequence("ChallengeText")
	end

	var_3_0._sequences.ChallengeText = var_3_13

	var_0_4(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("GenericLock", GenericLock)
LockTable(_M)
