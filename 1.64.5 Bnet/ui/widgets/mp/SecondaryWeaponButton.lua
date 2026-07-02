module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(arg_1_0.Image)
	assert(arg_1_0.WeaponName)
	assert(arg_1_0.MiniAttachments)
	assert(arg_1_0.WeaponClass)
	assert(arg_1_0.WeaponLevel)

	local var_1_0 = arg_1_2.weapon:get()
	local var_1_1 = WEAPON.GetWeaponClass(var_1_0)
	local var_1_2 = GUNSMITH.GetCustomModName(arg_1_2.blueprintName:get())

	arg_1_0.Image:setImage(RegisterMaterial(WEAPON.GetImage(var_1_0)))

	if #var_1_2 > 0 then
		arg_1_0.WeaponName:setText(Engine.CBBHFCGDIC("CAS/BLUEPRINT_AND_WEAPON", WEAPON.GetName(var_1_0), Engine.JCBDICCAH(var_1_2)))
	else
		arg_1_0.WeaponName:setText(WEAPON.GetName(var_1_0))
	end

	arg_1_0.MiniAttachments:Setup(arg_1_1, arg_1_2.weapon:get(), ATTACHMENT.GetTableFromWeaponSetup(arg_1_2))
	arg_1_0.WeaponClass:setText(WEAPON.GetClassName(var_1_1))
	arg_1_0.WeaponLevel:setText("Level " .. PROGRESSION.GetWeaponLevel(arg_1_1, var_1_0))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetupButton = var_0_0
end

function SecondaryWeaponButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 420 * _1080p, 0, 140 * _1080p)

	var_3_0.id = "SecondaryWeaponButton"
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

	var_3_4.id = "Backer"

	var_3_4:SetRGBFromInt(6710886, 0)
	var_3_4:SetBlurStrength(3, 0)
	var_3_0:addElement(var_3_4)

	var_3_0.Backer = var_3_4

	local var_3_5
	local var_3_6 = LUI.UIImage.new()

	var_3_6.id = "Image"

	var_3_6:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -113, _1080p * 113, _1080p * 12, _1080p * 125)
	var_3_0:addElement(var_3_6)

	var_3_0.Image = var_3_6

	local var_3_7
	local var_3_8 = LUI.UIText.new()

	var_3_8.id = "WeaponName"

	var_3_8:setText("", 0)
	var_3_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_8:SetAlignment(LUI.Alignment.Left)
	var_3_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 7, _1080p * 252, _1080p * 7, _1080p * 25)
	var_3_0:addElement(var_3_8)

	var_3_0.WeaponName = var_3_8

	local var_3_9
	local var_3_10 = MenuBuilder.BuildRegisteredType("MiniAttachments", {
		controllerIndex = var_3_1
	})

	var_3_10.id = "MiniAttachments"

	var_3_10:SetAnchorsAndPosition(0, 1, 1, 0, _1080p * 5, _1080p * 197, _1080p * -36, _1080p * -5)
	var_3_0:addElement(var_3_10)

	var_3_0.MiniAttachments = var_3_10

	local var_3_11
	local var_3_12 = LUI.UIStyledText.new()

	var_3_12.id = "WeaponClass"

	var_3_12:setText(ToUpperCase(""), 0)
	var_3_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_12:SetAlignment(LUI.Alignment.Right)
	var_3_12:SetStartupDelay(2000)
	var_3_12:SetLineHoldTime(400)
	var_3_12:SetAnimMoveTime(300)
	var_3_12:SetEndDelay(1500)
	var_3_12:SetCrossfadeTime(750)
	var_3_12:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_12:SetMaxVisibleLines(1)
	var_3_12:SetOutlineRGBFromInt(0, 0)
	var_3_12:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -175, _1080p * -7, _1080p * -25, _1080p * -7)
	var_3_0:addElement(var_3_12)

	var_3_0.WeaponClass = var_3_12

	local var_3_13
	local var_3_14 = LUI.UIStyledText.new()

	var_3_14.id = "WeaponLevel"

	var_3_14:setText(ToUpperCase(""), 0)
	var_3_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_3_14:SetAlignment(LUI.Alignment.Right)
	var_3_14:SetStartupDelay(2000)
	var_3_14:SetLineHoldTime(400)
	var_3_14:SetAnimMoveTime(300)
	var_3_14:SetEndDelay(1500)
	var_3_14:SetCrossfadeTime(750)
	var_3_14:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_3_14:SetMaxVisibleLines(1)
	var_3_14:SetOutlineRGBFromInt(0, 0)
	var_3_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -175, _1080p * -7, _1080p * 7, _1080p * 25)
	var_3_0:addElement(var_3_14)

	var_3_0.WeaponLevel = var_3_14

	local function var_3_15()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_15

	local var_3_16 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonOver", var_3_16)

	local var_3_17 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonOver", var_3_17)

	local var_3_18 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonOver", var_3_18)

	local var_3_19 = {
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_14:RegisterAnimationSequence("ButtonOver", var_3_19)

	local function var_3_20()
		var_3_6:AnimateSequence("ButtonOver")
		var_3_8:AnimateSequence("ButtonOver")
		var_3_12:AnimateSequence("ButtonOver")
		var_3_14:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_20

	local var_3_21 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_6:RegisterAnimationSequence("ButtonUp", var_3_21)

	local var_3_22 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_8:RegisterAnimationSequence("ButtonUp", var_3_22)

	local var_3_23 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_12:RegisterAnimationSequence("ButtonUp", var_3_23)

	local var_3_24 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_3_14:RegisterAnimationSequence("ButtonUp", var_3_24)

	local function var_3_25()
		var_3_6:AnimateSequence("ButtonUp")
		var_3_8:AnimateSequence("ButtonUp")
		var_3_12:AnimateSequence("ButtonUp")
		var_3_14:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_25

	local function var_3_26()
		return
	end

	var_3_0._sequences.NewNotification = var_3_26

	var_0_1(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("SecondaryWeaponButton", SecondaryWeaponButton)
LockTable(_M)
