module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._layoutType = arg_1_1
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetLayoutType = var_0_0
	arg_2_0._layoutType = 0

	arg_2_0:addEventHandler("button_over", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_2_0, "ButtonOver")

		if arg_2_0._layoutType == 3 then
			arg_2_0.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground)
		end
	end)
	arg_2_0:addEventHandler("button_up", function(arg_4_0, arg_4_1)
		ACTIONS.AnimateSequence(arg_2_0, "ButtonUp")

		if arg_2_0._layoutType == 3 then
			arg_2_0.Background:SetRGBFromTable(SWATCHES.genericMenu.blackBackground)
		end
	end)
end

function CRMListItem(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 432 * _1080p, 0, 240 * _1080p)

	var_5_0.id = "CRMListItem"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0

	var_5_0:setUseStencil(true)

	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Background"

	var_5_4:SetRGBFromTable(SWATCHES.CAC.greenLight, 0)
	var_5_4:setImage(RegisterMaterial("image_motd_mpreveal_price_small"), 0)
	var_5_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -216, _1080p * 216, _1080p * -110, _1080p * 110)
	var_5_0:addElement(var_5_4)

	var_5_0.Background = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Vignette"

	var_5_6:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_6:SetAlpha(0, 0)
	var_5_6:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * -3, _1080p * 3, _1080p * 10, _1080p * 230)
	var_5_0:addElement(var_5_6)

	var_5_0.Vignette = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIText.new()

	var_5_8.id = "Title"

	var_5_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_5_8:setText("", 0)
	var_5_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_8:SetAlignment(LUI.Alignment.Left)
	var_5_8:SetVerticalAlignment(LUI.Alignment.Bottom)
	var_5_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 7, _1080p * 425, _1080p * 43, _1080p * 73)
	var_5_0:addElement(var_5_8)

	var_5_0.Title = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "HighlightBottom"

	var_5_10:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * 109, _1080p * 111)
	var_5_0:addElement(var_5_10)

	var_5_0.HighlightBottom = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "HighlightTop"

	var_5_12:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0.5, 0.5, 0, 0, _1080p * -110, _1080p * -108)
	var_5_0:addElement(var_5_12)

	var_5_0.HighlightTop = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "CornerGradient"

	var_5_14:SetRGBFromTable(SWATCHES.Store.HotItemHighlight, 0)
	var_5_14:SetAlpha(0, 0)
	var_5_14:SetZRotation(-180, 0)
	var_5_14:setImage(RegisterMaterial("selected_angle_gradient"), 0)
	var_5_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -432, _1080p * -303, _1080p * 10, _1080p * 139)
	var_5_0:addElement(var_5_14)

	var_5_0.CornerGradient = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "Fire"

	var_5_16:SetAlpha(0, 0)
	var_5_16:setImage(RegisterMaterial("hot_item_fireball_atlas"), 0)
	var_5_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -425, _1080p * -385, _1080p * 18, _1080p * 58)
	var_5_0:addElement(var_5_16)

	var_5_0.Fire = var_5_16

	local var_5_17
	local var_5_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -216
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_4:RegisterAnimationSequence("DefaultSequence", var_5_18)

	local var_5_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Left
		},
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 425
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Bottom
		}
	}

	var_5_8:RegisterAnimationSequence("DefaultSequence", var_5_19)

	local function var_5_20()
		var_5_4:AnimateSequence("DefaultSequence")
		var_5_8:AnimateSequence("DefaultSequence")
	end

	var_5_0._sequences.DefaultSequence = var_5_20

	local var_5_21
	local var_5_22 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_22)

	local var_5_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.HUDMain
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonOver", var_5_23)

	local var_5_24 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_24)

	local var_5_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_25)

	local function var_5_26()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_8:AnimateSequence("ButtonOver")
		var_5_10:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_26

	local var_5_27
	local var_5_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CAC.greenLight
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_28)

	local var_5_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		}
	}

	var_5_8:RegisterAnimationSequence("ButtonUp", var_5_29)

	local var_5_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_30)

	local var_5_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_31)

	local function var_5_32()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_8:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_32

	local var_5_33
	local var_5_34 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonIdle", var_5_34)

	local function var_5_35()
		var_5_4:AnimateSequence("ButtonIdle")
	end

	var_5_0._sequences.ButtonIdle = var_5_35

	local var_5_36
	local var_5_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 159
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("Preview", var_5_37)

	local var_5_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 66
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 96
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 418
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 14
		}
	}

	var_5_8:RegisterAnimationSequence("Preview", var_5_38)

	local function var_5_39()
		var_5_6:AnimateSequence("Preview")
		var_5_8:AnimateSequence("Preview")
	end

	var_5_0._sequences.Preview = var_5_39

	local var_5_40
	local var_5_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -512
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -110
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 216
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 110
		}
	}

	var_5_4:RegisterAnimationSequence("BundleVer", var_5_41)

	local var_5_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.mainTitle
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 43
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 73
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Tracking,
			value = 0 * _1080p
		}
	}

	var_5_8:RegisterAnimationSequence("BundleVer", var_5_42)

	local var_5_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("BundleVer", var_5_43)

	local var_5_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("BundleVer", var_5_44)

	local function var_5_45()
		var_5_4:AnimateSequence("BundleVer")
		var_5_8:AnimateSequence("BundleVer")
		var_5_14:AnimateSequence("BundleVer")
		var_5_16:AnimateSequence("BundleVer")
	end

	var_5_0._sequences.BundleVer = var_5_45

	local var_5_46
	local var_5_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 82
		},
		{
			value = 0.9,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("BundlePreview", var_5_47)

	local function var_5_48()
		var_5_6:AnimateSequence("BundlePreview")
	end

	var_5_0._sequences.BundlePreview = var_5_48

	local var_5_49
	local var_5_50 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ShowHotItem", var_5_50)

	local var_5_51 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_16:RegisterAnimationSequence("ShowHotItem", var_5_51)

	local function var_5_52()
		var_5_14:AnimateSequence("ShowHotItem")
		var_5_16:AnimateSequence("ShowHotItem")
	end

	var_5_0._sequences.ShowHotItem = var_5_52

	local var_5_53
	local var_5_54 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		}
	}

	var_5_4:RegisterAnimationSequence("BLM", var_5_54)

	local var_5_55 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("BLM", var_5_55)

	local var_5_56 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 25
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.BLM.Body
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Left_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Right_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -209
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 209
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Top_Anchor
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Bottom_Anchor
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Vertical_Alignment,
			value = LUI.Alignment.Center
		}
	}

	var_5_8:RegisterAnimationSequence("BLM", var_5_56)

	local function var_5_57()
		var_5_4:AnimateSequence("BLM")
		var_5_6:AnimateSequence("BLM")
		var_5_8:AnimateSequence("BLM")
	end

	var_5_0._sequences.BLM = var_5_57

	local function var_5_58()
		return
	end

	var_5_0._sequences.Kerning = var_5_58

	var_0_1(var_5_0, var_5_1, arg_5_1)
	ACTIONS.AnimateSequence(var_5_0, "DefaultSequence")

	return var_5_0
end

MenuBuilder.registerType("CRMListItem", CRMListItem)
LockTable(_M)
