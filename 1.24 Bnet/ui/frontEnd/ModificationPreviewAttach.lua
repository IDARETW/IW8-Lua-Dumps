module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0._attachLine then
		arg_1_0._attachLine:SetAlpha(0.2)
		arg_1_0._attachLine:SetVertexPadding(LUI.UILine.END, 1)
		arg_1_0._attachLine:SetVertexPadding(LUI.UILine.END, 0, GUNSMITH.lineDuration, LUI.EASING.outQuadratic)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = ATTACHMENT.GetCategory(arg_2_3)
	local var_2_1 = Engine.CBBHFCGDIC(ATTACHMENT.GetAttachmentCategoryName(var_2_0))
	local var_2_2 = Engine.CBBHFCGDIC("CAS/ATTACHMENT_VARIANT", var_2_1)

	arg_2_0.Category:setText(arg_2_2 and arg_2_2 > WEAPON.baseVariant and var_2_2 or var_2_1)
	arg_2_0.Name:setText(ATTACHMENT.GetName(arg_2_3))
	arg_2_0.Image:setImage(RegisterMaterial(ATTACHMENT.GetImage(arg_2_3)))
	arg_2_0:registerEventHandler("weapon_model_loaded", function(arg_3_0, arg_3_1)
		GUNSMITH.SetupAttachLine(arg_3_0, arg_2_1, arg_2_2, var_2_0)
		var_0_0(arg_3_0)
	end)
end

local function var_0_2(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.Image)
	assert(arg_4_0.Category)
	assert(arg_4_0.Name)

	arg_4_0.Setup = var_0_1
end

function ModificationPreviewAttach(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 284 * _1080p, 0, 64 * _1080p)

	var_5_0.id = "ModificationPreviewAttach"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "DoubleNotchedBacker"

	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 284, 0, _1080p * 64)
	var_5_0:addElement(var_5_4)

	var_5_0.DoubleNotchedBacker = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Image"

	var_5_6:setImage(RegisterMaterial("icon_attachment_reflex_east01"), 0)
	var_5_6:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -260, _1080p * -216, _1080p * 12, _1080p * -8)
	var_5_0:addElement(var_5_6)

	var_5_0.Image = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIStyledText.new()

	var_5_8.id = "Category"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_8:SetWordWrap(false)
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_8:SetStartupDelay(2000)
	var_5_8:SetLineHoldTime(400)
	var_5_8:SetAnimMoveTime(2000)
	var_5_8:SetAnimMoveSpeed(150)
	var_5_8:SetEndDelay(2000)
	var_5_8:SetCrossfadeTime(1000)
	var_5_8:SetFadeInTime(300)
	var_5_8:SetFadeOutTime(300)
	var_5_8:SetMaxVisibleLines(1)
	var_5_8:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 80, _1080p * -22, _1080p * 10, _1080p * 34)
	var_5_0:addElement(var_5_8)

	var_5_0.Category = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "Name"

	var_5_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_10:SetStartupDelay(2000)
	var_5_10:SetLineHoldTime(400)
	var_5_10:SetAnimMoveTime(1500)
	var_5_10:SetAnimMoveSpeed(150)
	var_5_10:SetEndDelay(2000)
	var_5_10:SetCrossfadeTime(1000)
	var_5_10:SetFadeInTime(300)
	var_5_10:SetFadeOutTime(300)
	var_5_10:SetMaxVisibleLines(1)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 80, _1080p * -10, _1080p * 34, _1080p * 54)
	var_5_0:addElement(var_5_10)

	var_5_0.Name = var_5_10

	local function var_5_11()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_11

	local var_5_12
	local var_5_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		}
	}

	var_5_8:RegisterAnimationSequence("AR", var_5_13)

	local var_5_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 61
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 29
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 108
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -108
		}
	}

	var_5_10:RegisterAnimationSequence("AR", var_5_14)

	local function var_5_15()
		var_5_8:AnimateSequence("AR")
		var_5_10:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_15

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ModificationPreviewAttach", ModificationPreviewAttach)
LockTable(_M)
