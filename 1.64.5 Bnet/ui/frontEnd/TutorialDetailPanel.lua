module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	for iter_1_0 = 1, #arg_1_0._infoPoints do
		arg_1_0._infoPoints[iter_1_0]:SetAlpha(0)
	end

	local var_1_0 = #arg_1_1.infoPoints

	for iter_1_1 = 1, var_1_0 do
		local var_1_1 = arg_1_1.infoPoints[iter_1_1]

		arg_1_0._infoPoints[iter_1_1]:SetAlpha(1)

		if var_1_1.icon and var_1_1.text then
			ACTIONS.AnimateSequence(arg_1_0._infoPoints[iter_1_1], "IconAndText")
			arg_1_0._infoPoints[iter_1_1].Icon:setImage(RegisterMaterial(var_1_1.icon))
			arg_1_0._infoPoints[iter_1_1]:UpdateText(Engine.CBBHFCGDIC(var_1_1.text))
		elseif var_1_1.text then
			ACTIONS.AnimateSequence(arg_1_0._infoPoints[iter_1_1], "TextOnly")
			arg_1_0._infoPoints[iter_1_1]:UpdateText(Engine.CBBHFCGDIC(var_1_1.text))
		else
			ACTIONS.AnimateSequence(arg_1_0._infoPoints[iter_1_1], "IconOnly")
			arg_1_0._infoPoints[iter_1_1].Icon:setImage(RegisterMaterial(var_1_1.icon))
		end

		ACTIONS.AnimateSequence(arg_1_0._infoPoints[iter_1_1], var_1_1.iconBacker and "ShowIconBacker" or "HideIconBacker")
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1.image then
		arg_2_0.Image:setImage(RegisterMaterial(arg_2_1.image))
	end

	if arg_2_1.header then
		arg_2_0.Header:setText(Engine.CBBHFCGDIC(arg_2_1.header))
	end

	if arg_2_1.desc then
		arg_2_0.Description:setText(Engine.CBBHFCGDIC(arg_2_1.desc))
	end

	if arg_2_1.infoPointAnim then
		ACTIONS.AnimateSequence(arg_2_0, arg_2_1.infoPointAnim)
	end

	var_0_0(arg_2_0, arg_2_1)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.UpdateDetails = var_0_1
	arg_3_0._infoPoints = {
		arg_3_0.TutorialInfoPoint1,
		arg_3_0.TutorialInfoPoint2,
		arg_3_0.TutorialInfoPoint3
	}
end

function TutorialDetailPanel(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1726 * _1080p, 0, 798 * _1080p)

	var_4_0.id = "TutorialDetailPanel"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0

	var_4_0:setUseStencil(true)

	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Image"

	var_4_4:setImage(RegisterMaterial("tutorial_br_plunder_3"), 0)
	var_4_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * 864, _1080p * -269, _1080p * 399)
	var_4_0:addElement(var_4_4)

	var_4_0.Image = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "ButtonBacker"

	var_4_6:SetRGBFromTable(SWATCHES.Popups.backgroundPopup, 0)
	var_4_6:SetAlpha(0.8, 0)
	var_4_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -130, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.ButtonBacker = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "HeaderBacker"

	var_4_8:SetRGBFromTable(SWATCHES.Popups.backgroundPopup, 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 130)
	var_4_0:addElement(var_4_8)

	var_4_0.HeaderBacker = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIImage.new()

	var_4_10.id = "HeaderBackerCopy0"

	var_4_10:SetRGBFromTable(SWATCHES.genericMenu.frame, 0)
	var_4_10:SetAlpha(0.6, 0)
	var_4_10:SetPixelGridEnabled(true)
	var_4_10:SetPixelGridContrast(0.5, 0)
	var_4_10:SetPixelGridBlockWidth(2, 0)
	var_4_10:SetPixelGridBlockHeight(2, 0)
	var_4_10:SetPixelGridGutterWidth(1, 0)
	var_4_10:SetPixelGridGutterHeight(1, 0)
	var_4_10:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_4_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 130)
	var_4_0:addElement(var_4_10)

	var_4_0.HeaderBackerCopy0 = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "Description"

	var_4_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_4_12:setText("", 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_12:SetAlignment(LUI.Alignment.Center)
	var_4_12:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -695, _1080p * 695, _1080p * -716, _1080p * -684)
	var_4_0:addElement(var_4_12)

	var_4_0.Description = var_4_12

	local var_4_13
	local var_4_14 = LUI.UIStyledText.new()

	var_4_14.id = "Header"

	var_4_14:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_4_14:setText("", 0)
	var_4_14:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_14:SetAlignment(LUI.Alignment.Center)
	var_4_14:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -695, _1080p * 695, _1080p * -786, _1080p * -716)
	var_4_0:addElement(var_4_14)

	var_4_0.Header = var_4_14

	local var_4_15
	local var_4_16 = MenuBuilder.BuildRegisteredType("TutorialInfoPoint", {
		controllerIndex = var_4_1
	})

	var_4_16.id = "TutorialInfoPoint1"

	var_4_16.TutorialInfoPointText.Text:SetAlignment(LUI.Alignment.Left)
	var_4_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -649, _1080p * -116, _1080p * -207, _1080p * -133)
	var_4_0:addElement(var_4_16)

	var_4_0.TutorialInfoPoint1 = var_4_16

	local var_4_17
	local var_4_18 = MenuBuilder.BuildRegisteredType("TutorialInfoPoint", {
		controllerIndex = var_4_1
	})

	var_4_18.id = "TutorialInfoPoint2"

	var_4_18.TutorialInfoPointText.Text:SetAlignment(LUI.Alignment.Left)
	var_4_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 37, _1080p * -207, _1080p * -133)
	var_4_0:addElement(var_4_18)

	var_4_0.TutorialInfoPoint2 = var_4_18

	local var_4_19
	local var_4_20 = MenuBuilder.BuildRegisteredType("TutorialInfoPoint", {
		controllerIndex = var_4_1
	})

	var_4_20.id = "TutorialInfoPoint3"

	var_4_20.TutorialInfoPointText.Text:SetAlignment(LUI.Alignment.Left)
	var_4_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 555, _1080p * 629, _1080p * -207, _1080p * -133)
	var_4_0:addElement(var_4_20)

	var_4_0.TutorialInfoPoint3 = var_4_20

	local var_4_21
	local var_4_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_22)

	local function var_4_23()
		var_4_4:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_23

	local var_4_24
	local var_4_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -261
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 239
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 37
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 111
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center,
			child = var_4_0.TutorialInfoPoint1.TutorialInfoPointText.Text
		}
	}

	var_4_16:RegisterAnimationSequence("InfoPointLayoutPlunder1", var_4_25)

	local var_4_26 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -142
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 319
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -128
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -54
		}
	}

	var_4_18:RegisterAnimationSequence("InfoPointLayoutPlunder1", var_4_26)

	local var_4_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 323
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 768
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 74
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 148
		}
	}

	var_4_20:RegisterAnimationSequence("InfoPointLayoutPlunder1", var_4_27)

	local function var_4_28()
		var_4_16:AnimateSequence("InfoPointLayoutPlunder1")
		var_4_18:AnimateSequence("InfoPointLayoutPlunder1")
		var_4_20:AnimateSequence("InfoPointLayoutPlunder1")
	end

	var_4_0._sequences.InfoPointLayoutPlunder1 = var_4_28

	local var_4_29
	local var_4_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -824
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -324
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center,
			child = var_4_0.TutorialInfoPoint1.TutorialInfoPointText.Text
		}
	}

	var_4_16:RegisterAnimationSequence("InfoPointLayoutPlunder2", var_4_30)

	local var_4_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 250
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center,
			child = var_4_0.TutorialInfoPoint2.TutorialInfoPointText.Text
		}
	}

	var_4_18:RegisterAnimationSequence("InfoPointLayoutPlunder2", var_4_31)

	local var_4_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 328
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 828
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -204
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -130
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center,
			child = var_4_0.TutorialInfoPoint3.TutorialInfoPointText.Text
		}
	}

	var_4_20:RegisterAnimationSequence("InfoPointLayoutPlunder2", var_4_32)

	local function var_4_33()
		var_4_16:AnimateSequence("InfoPointLayoutPlunder2")
		var_4_18:AnimateSequence("InfoPointLayoutPlunder2")
		var_4_20:AnimateSequence("InfoPointLayoutPlunder2")
	end

	var_4_0._sequences.InfoPointLayoutPlunder2 = var_4_33

	local var_4_34
	local var_4_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -474
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -14
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -186
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -112
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left,
			child = var_4_0.TutorialInfoPoint1.TutorialInfoPointText.Text
		}
	}

	var_4_16:RegisterAnimationSequence("InfoPointLayoutPlunder3", var_4_35)

	local var_4_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -297
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 269
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 28
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 102
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left,
			child = var_4_0.TutorialInfoPoint2.TutorialInfoPointText.Text
		}
	}

	var_4_18:RegisterAnimationSequence("InfoPointLayoutPlunder3", var_4_36)

	local var_4_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 334
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 834
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 155
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 229
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left,
			child = var_4_0.TutorialInfoPoint3.TutorialInfoPointText.Text
		}
	}

	var_4_20:RegisterAnimationSequence("InfoPointLayoutPlunder3", var_4_37)

	local function var_4_38()
		var_4_16:AnimateSequence("InfoPointLayoutPlunder3")
		var_4_18:AnimateSequence("InfoPointLayoutPlunder3")
		var_4_20:AnimateSequence("InfoPointLayoutPlunder3")
	end

	var_4_0._sequences.InfoPointLayoutPlunder3 = var_4_38

	var_0_2(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("TutorialDetailPanel", TutorialDetailPanel)
LockTable(_M)
