module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._introVideo = arg_1_1

	if arg_1_0._introVideo and #arg_1_0._introVideo > 0 then
		ACTIONS.AnimateSequence(arg_1_0, "ShowIntroVideo")
		arg_1_0.TutorialVideo.Mask:SetAlpha(1)

		arg_1_0._endFlag = false

		arg_1_0.TutorialVideo:AnimateSequence("MaskFadeOut")
		Engine.DFCGFCGBFD(arg_1_1, VideoPlaybackFlags.MUTE)
		arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			gamepad_only = true,
			button_ref = "button_r3",
			side = "left",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN")
		})
	else
		ACTIONS.AnimateSequence(arg_1_0, "HideIntroVideo")
		arg_1_0.HelperBar.ButtonHelperText:PushButtonPrompt({
			gamepad_only = true,
			button_ref = "button_r3",
			helper_text = "",
			side = "left"
		})
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = OPERATOR.IsUnlocked(arg_2_0._controllerIndex, arg_2_1.ref)

	var_0_0(arg_2_0, arg_2_1.introVideo)
	arg_2_0.OperatorCard:SetupCardDetails(arg_2_1)
	arg_2_0.SquadName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BREADCRUMB_2_ITEMS", OPERATOR.GetFactionName(arg_2_1.ref), arg_2_1.name)))
	arg_2_0.Bloodtype:SetupBloodDetails(arg_2_1.bloodType)
	arg_2_0.Thumbprint:setImage(RegisterMaterial(arg_2_1.thumbprint))
	arg_2_0.FactionIcon:setImage(RegisterMaterial(arg_2_1.factionIcon))

	arg_2_0._currentFocusedOperatorData = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1)
	if not arg_3_0._activeButton or arg_3_0._activeButton ~= arg_3_1 then
		if arg_3_0._activeButton then
			arg_3_0._activeButton:LoseButtonFocus()
		end

		arg_3_0._activeButton = arg_3_1

		var_0_1(arg_3_0, arg_3_1._operatorInfo)
	end
end

local function var_0_3(arg_4_0)
	arg_4_0.OperatorGrid:SetRefreshChild(function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = arg_5_1 + arg_5_2 * arg_4_0.OperatorGrid:GetNumColumns()

		if var_5_0 == nil then
			return
		end

		if not arg_4_0._operatorList then
			return
		end

		local var_5_1 = arg_4_0._operatorList[var_5_0 + 1]

		arg_5_0:Setup(arg_4_0._controllerIndex, var_5_1, arg_4_0)
	end)
end

local function var_0_4(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.OperatorCard)
	assert(arg_6_2.operatorRef)
	assert(arg_6_2.operatorList)

	arg_6_0._controllerIndex = arg_6_1
	arg_6_0.OnChildFocused = var_0_2
	arg_6_0._initialSelectedOperatorRef = arg_6_2.operatorRef
	arg_6_0._operatorList = arg_6_2.operatorList

	var_0_3(arg_6_0)
	arg_6_0.OperatorGrid:SetNumChildren(#arg_6_0._operatorList)
	arg_6_0.OperatorGrid:RefreshContent()

	local function var_6_0()
		local var_7_0 = CoD.GetAspectRatioScaleAdjust(0.2)

		arg_6_0.Darkener:SetScale(var_7_0)
		arg_6_0.Blur:SetScale(var_7_0)
	end

	arg_6_0:addAndCallEventHandler("onVideoChange", var_6_0)
	LAYOUT.AddAspectRatioFadeFrame(arg_6_0, arg_6_1)

	arg_6_0.bindButton = LUI.UIBindButton.new()
	arg_6_0.bindButton.id = "bindButton"

	arg_6_0:addElement(arg_6_0.bindButton)
	arg_6_0.bindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		Engine.EBCGADABJ()
		ACTIONS.LeaveMenu(arg_6_0)
	end)

	local function var_6_1()
		local var_9_0 = 0

		for iter_9_0 = 1, #arg_6_0._operatorList do
			if arg_6_0._initialSelectedOperatorRef == arg_6_0._operatorList[iter_9_0].ref then
				var_9_0 = iter_9_0 - 1

				break
			end
		end

		return arg_6_0.OperatorGrid:GetPositionForIndex(var_9_0)
	end

	if IsLanguageChinese() or IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "LargeText")
	end

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
	end

	arg_6_0.OperatorGrid:SetDefaultFocus(var_6_1)
	arg_6_0.OperatorGrid:GainFocus()
end

function OperatorBio(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0.id = "OperatorBio"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	var_10_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})
	var_10_0.HelperBar.id = "HelperBar"

	var_10_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_10_0.HelperBar:setPriority(10)
	var_10_0:addElement(var_10_0.HelperBar)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIBlur.new()

	var_10_4.id = "Blur"

	var_10_4:SetBlurStrength(0.75, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Blur = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIImage.new()

	var_10_6.id = "Darkener"

	var_10_6:SetRGBFromInt(0, 0)
	var_10_6:SetAlpha(0.8, 0)
	var_10_0:addElement(var_10_6)

	var_10_0.Darkener = var_10_6

	local var_10_7
	local var_10_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_8.id = "GenericPopupWindow"

	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * -440, _1080p * 452)
	var_10_0:addElement(var_10_8)

	var_10_0.GenericPopupWindow = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIImage.new()

	var_10_10.id = "Header"

	var_10_10:SetRGBFromTable(SWATCHES.Global.keyColorDark, 0)
	var_10_10:SetAlpha(0.25, 0)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -442, _1080p * -402)
	var_10_0:addElement(var_10_10)

	var_10_0.Header = var_10_10

	local var_10_11

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_10_11 = LUI.UIImage.new()
		var_10_11.id = "WZWipHeader"

		var_10_11:setImage(RegisterMaterial("ui_mp_br_shared_button_generic_background_ch2"), 0)
		var_10_11:Setup3SliceHorizontalImage(_1080p * 200, 0.29)
		var_10_11:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -856, _1080p * 861, _1080p * -439, _1080p * -402)
		var_10_0:addElement(var_10_11)

		var_10_0.WZWipHeader = var_10_11
	end

	local var_10_12
	local var_10_13 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})

	var_10_13.id = "ButtonHelperBar"

	var_10_13:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_10_13.Background:SetAlpha(0, 0)
	var_10_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 142, _1080p * 486, _1080p * 540)
	var_10_0:addElement(var_10_13)

	var_10_0.ButtonHelperBar = var_10_13

	local var_10_14
	local var_10_15 = MenuBuilder.BuildRegisteredType("OperatorCard", {
		controllerIndex = var_10_1
	})

	var_10_15.id = "OperatorCard"

	var_10_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -813, _1080p * 815, _1080p * -386, _1080p * -138)
	var_10_0:addElement(var_10_15)

	var_10_0.OperatorCard = var_10_15

	local var_10_16
	local var_10_17 = LUI.UIText.new()

	var_10_17.id = "SquadName"

	var_10_17:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_10_17:SetAlpha(0.5, 0)
	var_10_17:setText("", 0)
	var_10_17:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_17:SetTracking(1 * _1080p, 0)
	var_10_17:SetAlignment(LUI.Alignment.Left)
	var_10_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 93, _1080p * -434, _1080p * -410)
	var_10_0:addElement(var_10_17)

	var_10_0.SquadName = var_10_17

	local var_10_18
	local var_10_19 = MenuBuilder.BuildRegisteredType("TutorialVideo", {
		controllerIndex = var_10_1
	})

	var_10_19.id = "TutorialVideo"

	var_10_19:SetAlpha(0.8, 0)
	var_10_19:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 106, _1080p * 814, _1080p * -78, _1080p * 342)
	var_10_0:addElement(var_10_19)

	var_10_0.TutorialVideo = var_10_19

	local var_10_20
	local var_10_21 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_10_1
	})

	var_10_21.id = "LobbyMembersFooter"

	var_10_21:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_10_0:addElement(var_10_21)

	var_10_0.LobbyMembersFooter = var_10_21

	local var_10_22
	local var_10_23 = LUI.UIImage.new()

	var_10_23.id = "Thumbprint"

	var_10_23:setImage(RegisterMaterial("ui_operator_bio_thumbprint_5"), 0)
	var_10_23:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -789, _1080p * -637, _1080p * -78, _1080p * 74)
	var_10_0:addElement(var_10_23)

	var_10_0.Thumbprint = var_10_23

	local var_10_24
	local var_10_25 = LUI.UIImage.new()

	var_10_25.id = "FactionIcon"

	var_10_25:SetAlpha(0.4, 0)
	var_10_25:SetColorOp(COLOR_OP.saturation, 0)
	var_10_25:SetColorOpParam(1, 0)
	var_10_25:setImage(RegisterMaterial("icon_faction_sas_large"), 0)
	var_10_25:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -805, _1080p * -621, _1080p * 92, _1080p * 276)
	var_10_0:addElement(var_10_25)

	var_10_0.FactionIcon = var_10_25

	local var_10_26
	local var_10_27 = LUI.UIImage.new()

	var_10_27.id = "Banner"

	var_10_27:SetRGBFromTable(SWATCHES.CAC.weaponMeterDark, 0)
	var_10_27:SetAlpha(0.3, 0)
	var_10_27:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -813, _1080p * 815, _1080p * -128, _1080p * -96)
	var_10_0:addElement(var_10_27)

	var_10_0.Banner = var_10_27

	local var_10_28
	local var_10_29 = LUI.UIText.new()

	var_10_29.id = "Identity"

	var_10_29:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_29:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_BIO_IDENTITY")), 0)
	var_10_29:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_10_29:SetAlignment(LUI.Alignment.Left)
	var_10_29:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -805, _1080p * 53, _1080p * -121, _1080p * -99)
	var_10_0:addElement(var_10_29)

	var_10_0.Identity = var_10_29

	local var_10_30
	local var_10_31 = MenuBuilder.BuildRegisteredType("OperatorBloodtype", {
		controllerIndex = var_10_1
	})

	var_10_31.id = "Bloodtype"

	var_10_31:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -583, _1080p * 53, _1080p * -71, _1080p * 69)
	var_10_0:addElement(var_10_31)

	var_10_0.Bloodtype = var_10_31

	local var_10_32
	local var_10_33 = {
		scrollingThresholdX = 1,
		maxVisibleRows = 2,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 4,
		wrapY = false,
		arrowsVerticalOffset = 0,
		buildArrowsLabel = true,
		springCoefficient = 400,
		controllerIndex = var_10_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorBioButton", {
				controllerIndex = var_10_1
			})
		end,
		refreshChild = function(arg_12_0, arg_12_1, arg_12_2)
			return
		end,
		primaryAxis = LUI.DIRECTION.horizontal,
		spacingX = _1080p * 19,
		spacingY = _1080p * 19,
		columnWidth = _1080p * 144,
		rowHeight = _1080p * 146,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_10_34 = LUI.UIGrid.new(var_10_33)

	var_10_34.id = "OperatorGrid"

	var_10_34:setUseStencil(true)
	var_10_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -583, _1080p * 51, _1080p * 92, _1080p * 404)
	var_10_0:addElement(var_10_34)

	var_10_0.OperatorGrid = var_10_34

	local var_10_35
	local var_10_36 = MenuBuilder.BuildRegisteredType("VerticalScrollbar", {
		controllerIndex = var_10_1
	})

	var_10_36.id = "OperatorGridScrollbar"

	var_10_36:SetScale(1, 0)
	var_10_36:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 56, _1080p * 66, _1080p * 170, _1080p * 324)
	var_10_0:addElement(var_10_36)

	var_10_0.OperatorGridScrollbar = var_10_36

	local function var_10_37()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_37

	local var_10_38
	local var_10_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -855
		}
	}

	var_10_8:RegisterAnimationSequence("LargeText", var_10_39)

	local var_10_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -435
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -405
		}
	}

	var_10_17:RegisterAnimationSequence("LargeText", var_10_40)

	local var_10_41 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -127
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -87
		}
	}

	var_10_27:RegisterAnimationSequence("LargeText", var_10_41)

	local var_10_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -122
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -92
		}
	}

	var_10_29:RegisterAnimationSequence("LargeText", var_10_42)

	local function var_10_43()
		var_10_8:AnimateSequence("LargeText")
		var_10_17:AnimateSequence("LargeText")
		var_10_27:AnimateSequence("LargeText")
		var_10_29:AnimateSequence("LargeText")
	end

	var_10_0._sequences.LargeText = var_10_43

	local var_10_44
	local var_10_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("HideIntroVideo", var_10_45)

	local function var_10_46()
		var_10_19:AnimateSequence("HideIntroVideo")
	end

	var_10_0._sequences.HideIntroVideo = var_10_46

	local var_10_47
	local var_10_48 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_19:RegisterAnimationSequence("ShowIntroVideo", var_10_48)

	local function var_10_49()
		var_10_19:AnimateSequence("ShowIntroVideo")
	end

	var_10_0._sequences.ShowIntroVideo = var_10_49

	local var_10_50
	local var_10_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipSetup", var_10_51)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_10_52 = {
			{
				duration = 0,
				property = TWEEN_PROPERTY.Left,
				value = _1080p * -855
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Top,
				value = _1080p * -440
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Right,
				value = _1080p * 862
			},
			{
				duration = 0,
				property = TWEEN_PROPERTY.Bottom,
				value = _1080p * -403
			},
			{
				value = 0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_10_11:RegisterAnimationSequence("WZWipSetup", var_10_52)
	end

	local var_10_53 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_17:RegisterAnimationSequence("WZWipSetup", var_10_53)

	local var_10_54 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_10_29:RegisterAnimationSequence("WZWipSetup", var_10_54)

	local function var_10_55()
		var_10_10:AnimateSequence("WZWipSetup")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_10_11:AnimateSequence("WZWipSetup")
		end

		var_10_17:AnimateSequence("WZWipSetup")
		var_10_29:AnimateSequence("WZWipSetup")
	end

	var_10_0._sequences.WZWipSetup = var_10_55

	local var_10_56 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_10_36,
		startCap = var_10_36.startCap,
		endCap = var_10_36.endCap,
		sliderArea = var_10_36.sliderArea,
		slider = var_10_36.sliderArea and var_10_36.sliderArea.slider,
		fixedSizeSlider = var_10_36.sliderArea and var_10_36.sliderArea.fixedSizeSlider
	})

	var_10_34:AddScrollbar(var_10_56)
	var_10_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})

	local var_10_57 = LUI.UIBindButton.new()

	var_10_57.id = "selfBindButton"

	var_10_0:addElement(var_10_57)

	var_10_0.bindButton = var_10_57

	var_0_4(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("OperatorBio", OperatorBio)
LockTable(_M)
