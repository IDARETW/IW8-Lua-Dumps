module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 then
		local var_1_0 = PERK.GetName(arg_1_1)
		local var_1_1 = Cac.GetPerkDesc(arg_1_1)
		local var_1_2 = PERK.GetImage(arg_1_1)

		arg_1_0.PerkName:setText(var_1_0)
		arg_1_0.PerkDescription:setText(var_1_1)

		if var_1_2 ~= "" then
			arg_1_0.PerkIcon:setImage(RegisterMaterial(var_1_2))
		else
			arg_1_0.PerkIcon:setImage(RegisterMaterial("placeholder_x"))
		end
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.UpdatePerk = var_0_0
end

function PerkDetails(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 316 * _1080p, 0, 316 * _1080p)

	var_3_0.id = "PerkDetails"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIBlur.new()

	var_3_4.id = "NameBacker"

	var_3_4:SetRGBFromInt(6710886, 0)
	var_3_4:SetBlurStrength(3, 0)
	var_3_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -104, _1080p * 104, _1080p * 61.5, _1080p * 93.5)
	var_3_0:addElement(var_3_4)

	var_3_0.NameBacker = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "PerkIcon"

	var_3_6:SetRGBFromTable(SWATCHES.HUD.HUDMain, 0)
	var_3_6:setImage(RegisterMaterial("placeholder_x"), 0)
	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -88, _1080p * 88, _1080p * -122, _1080p * 58)
	var_3_0:addElement(var_3_6)

	var_3_0.PerkIcon = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIStyledText.new()

	var_3_8.id = "PerkName"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetWordWrap(false)
	var_3_8:SetAlignment(LUI.Alignment.Center)
	var_3_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -158, _1080p * 158, _1080p * 66, _1080p * 90)
	var_3_0:addElement(var_3_8)

	var_3_0.PerkName = var_3_8

	local var_3_9
	local var_3_10 = LUI.UIStyledText.new()

	var_3_10.id = "PerkDescription"

	var_3_10:setText("", 0)
	var_3_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_10:SetAlignment(LUI.Alignment.Center)
	var_3_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -158, _1080p * 158, _1080p * 99, _1080p * 123)
	var_3_0:addElement(var_3_10)

	var_3_0.PerkDescription = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIImage.new()

	var_3_12.id = "Glow1"

	var_3_12:SetAlpha(0, 0)
	var_3_12:SetZRotation(90, 0)
	var_3_12:setImage(RegisterMaterial("hud_glow"), 0)
	var_3_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -121, _1080p * 437, _1080p * -274, _1080p * 526)
	var_3_0:addElement(var_3_12)

	var_3_0.Glow1 = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIImage.new()

	var_3_14.id = "Glow2"

	var_3_14:SetRGBFromTable(SWATCHES.genericMenu.elderRank, 0)
	var_3_14:SetAlpha(0, 0)
	var_3_14:setImage(RegisterMaterial("hud_glow"), 0)
	var_3_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -114, _1080p * 430, _1080p * -400, _1080p * 652)
	var_3_0:addElement(var_3_14)

	var_3_0.Glow2 = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 400,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.1,
			duration = 400,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 400,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_12:RegisterAnimationSequence("Glow", var_3_16)

	local var_3_17 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.1,
			duration = 300,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 300,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.1,
			duration = 300,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_3_14:RegisterAnimationSequence("Glow", var_3_17)

	local function var_3_18()
		var_3_12:AnimateLoop("Glow")
		var_3_14:AnimateLoop("Glow")
	end

	var_3_0._sequences.Glow = var_3_18

	local var_3_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.35,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 500,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.3,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 340,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_12:RegisterAnimationSequence("Select", var_3_19)

	local var_3_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0.35,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.3,
			duration = 80,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 400,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 340,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_14:RegisterAnimationSequence("Select", var_3_20)

	local function var_3_21()
		var_3_12:AnimateSequence("Select")
		var_3_14:AnimateSequence("Select")
	end

	var_3_0._sequences.Select = var_3_21

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("PerkDetails", PerkDetails)
LockTable(_M)
