module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.MapText:setText(arg_1_1)
	arg_1_0.MapImage:setImage(RegisterMaterial(arg_1_2))
	arg_1_0.GameModeText:setText(arg_1_3)
	arg_1_0.GameModeImage:setImage(RegisterMaterial(arg_1_4))
	ACTIONS.AnimateSequence(arg_1_0, "Show")
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetLobbyInfo = var_0_0

	ACTIONS.AnimateSequence(arg_2_0, "Hide")
end

function LocalLobbyMap(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 460 * _1080p, 0, 220 * _1080p)

	var_3_0.id = "LocalLobbyMap"
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

	var_3_4.id = "MapImage"

	var_3_4:SetRGBFromInt(14211288, 0)
	var_3_4:setImage(RegisterMaterial("placeholder_x"), 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -230, _1080p * 230, _1080p * -122, _1080p * 122)
	var_3_0:addElement(var_3_4)

	var_3_0.MapImage = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Gradient"

	var_3_6:SetRGBFromInt(0, 0)
	var_3_6:SetAlpha(0.9, 0)
	var_3_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_3_6:SetAnchorsAndPosition(0, 1, 1, 0, 0, _1080p * 460, _1080p * -170, 0)
	var_3_0:addElement(var_3_6)

	var_3_0.Gradient = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "GameModeText"

	var_3_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_3_8:setText(ToUpperCase(""), 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_3_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollV)
	var_3_8:SetStartupDelay(1000)
	var_3_8:SetLineHoldTime(400)
	var_3_8:SetAnimMoveTime(2000)
	var_3_8:SetAnimMoveSpeed(150)
	var_3_8:SetEndDelay(1000)
	var_3_8:SetCrossfadeTime(1000)
	var_3_8:SetFadeInTime(300)
	var_3_8:SetFadeOutTime(300)
	var_3_8:SetMaxVisibleLines(2)
	var_3_8:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 98, _1080p * 422, _1080p * -87, _1080p * -51)
	var_3_0:addElement(var_3_8)

	var_3_0.GameModeText = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIText.new()

	var_3_10.id = "MapText"

	var_3_10:SetRGBFromTable(SWATCHES.AAR.AARdescription, 0)
	var_3_10:setText(ToUpperCase(""), 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Left)
	var_3_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 98, _1080p * 452, _1080p * -55, _1080p * -27)
	var_3_0:addElement(var_3_10)

	var_3_0.MapText = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "GameModeImage"

	var_3_12:setImage(RegisterMaterial("icon_mp_mode_dom"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 14, _1080p * 90, _1080p * -91, _1080p * -15)
	var_3_0:addElement(var_3_12)

	var_3_0.GameModeImage = var_3_12

	local function var_3_13()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_13

	local var_3_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Hide", var_3_14)

	local var_3_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Hide", var_3_15)

	local var_3_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Hide", var_3_16)

	local var_3_17 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Hide", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Hide", var_3_18)

	local function var_3_19()
		var_3_4:AnimateSequence("Hide")
		var_3_6:AnimateSequence("Hide")
		var_3_8:AnimateSequence("Hide")
		var_3_10:AnimateSequence("Hide")
		var_3_12:AnimateSequence("Hide")
	end

	var_3_0._sequences.Hide = var_3_19

	local var_3_20 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_4:RegisterAnimationSequence("Show", var_3_20)

	local var_3_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_6:RegisterAnimationSequence("Show", var_3_21)

	local var_3_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_8:RegisterAnimationSequence("Show", var_3_22)

	local var_3_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_10:RegisterAnimationSequence("Show", var_3_23)

	local var_3_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Show", var_3_24)

	local function var_3_25()
		var_3_4:AnimateSequence("Show")
		var_3_6:AnimateSequence("Show")
		var_3_8:AnimateSequence("Show")
		var_3_10:AnimateSequence("Show")
		var_3_12:AnimateSequence("Show")
	end

	var_3_0._sequences.Show = var_3_25

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LocalLobbyMap", LocalLobbyMap)
LockTable(_M)
