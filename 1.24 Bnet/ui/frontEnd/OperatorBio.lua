module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._introVideo = arg_1_1

	arg_1_0.TutorialVideo.Mask:SetAlpha(1)

	arg_1_0._endFlag = false

	arg_1_0.TutorialVideo:AnimateSequence("MaskFadeOut")
	Engine.DFCGFCGBFD(arg_1_1, VideoPlaybackFlags.MUTE)
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = OPERATOR.IsUnlocked(arg_2_0._controllerIndex, arg_2_1.ref)

	var_0_0(arg_2_0, arg_2_1.introVideo)
	arg_2_0.OperatorCard:SetupCardDetails(arg_2_1)
	arg_2_0.SquadName:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/BREADCRUMB_2_ITEMS", OPERATOR.GetFactionName(arg_2_1.ref), arg_2_1.name)))
	arg_2_0.Bloodtype:SetupBloodDetails(arg_2_1.bloodType)
	arg_2_0.Thumbprint:setImage(RegisterMaterial(arg_2_1.thumbprint))
	arg_2_0.FactionIcon:setImage(RegisterMaterial(arg_2_1.factionIcon))
end

local function var_0_2(arg_3_0, arg_3_1)
	if not arg_3_0._activeButton or arg_3_0._activeButton ~= arg_3_1 then
		if arg_3_0._activeButton then
			arg_3_0._activeButton:LoseButtonFocus()
		end

		arg_3_0._activeButton = arg_3_1

		var_0_1(arg_3_0, arg_3_1._operatorData)
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
	arg_6_0._menu = arg_6_2.menu
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
		arg_6_0._menu:RefreshFocus(arg_6_0._menu)
	end)
	arg_6_0.bindButton:addEventHandler("button_right_stick", function(arg_9_0, arg_9_1)
		LUI.FlowManager.GetScopedData(arg_6_0._menu).operatorData.useSelectedOperatorIndexForFocus = true

		OPERATOR.PlayFullscreenIntroVideo(arg_6_0, arg_6_0._introVideo, arg_9_1.controller)
	end)
	arg_6_0.TutorialVideo.FullscreenVideoButton:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		OPERATOR.PlayFullscreenIntroVideo(arg_6_0, arg_6_0._introVideo, arg_10_1.controller)
	end)
	arg_6_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		gamepad_only = true,
		button_ref = "button_r3",
		side = "left",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN")
	})

	local function var_6_1()
		local var_11_0 = 0

		for iter_11_0 = 1, #arg_6_0._operatorList do
			if arg_6_0._initialSelectedOperatorRef == arg_6_0._operatorList[iter_11_0].ref then
				var_11_0 = iter_11_0 - 1

				break
			end
		end

		return arg_6_0.OperatorGrid:GetPositionForIndex(var_11_0)
	end

	if IsLanguageChinese() or IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_6_0, "LargeText")
	end

	arg_6_0.OperatorGrid:SetDefaultFocus(var_6_1)
	arg_6_0.OperatorGrid:GainFocus()
end

function OperatorBio(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0.id = "OperatorBio"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	var_12_0.HelperBar = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})
	var_12_0.HelperBar.id = "HelperBar"

	var_12_0.HelperBar:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -85, 0)
	var_12_0.HelperBar:setPriority(10)
	var_12_0:addElement(var_12_0.HelperBar)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIBlur.new()

	var_12_4.id = "Blur"

	var_12_4:SetBlurStrength(0.75, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Blur = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "Darkener"

	var_12_6:SetRGBFromInt(0, 0)
	var_12_6:SetAlpha(0.8, 0)
	var_12_0:addElement(var_12_6)

	var_12_0.Darkener = var_12_6

	local var_12_7
	local var_12_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_12_1
	})

	var_12_8.id = "GenericPopupWindow"

	var_12_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * -442, _1080p * 450)
	var_12_0:addElement(var_12_8)

	var_12_0.GenericPopupWindow = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "Header"

	var_12_10:SetRGBFromTable(SWATCHES.Global.keyColorDark, 0)
	var_12_10:SetAlpha(0.25, 0)
	var_12_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 105, _1080p * 1815, _1080p * 98, _1080p * 138)
	var_12_0:addElement(var_12_10)

	var_12_0.Header = var_12_10

	local var_12_11
	local var_12_12 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_12_1
	})

	var_12_12.id = "ButtonHelperBar"

	var_12_12:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_12_12.Background:SetAlpha(0, 0)
	var_12_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 142, _1080p * 486, _1080p * 540)
	var_12_0:addElement(var_12_12)

	var_12_0.ButtonHelperBar = var_12_12

	local var_12_13
	local var_12_14 = MenuBuilder.BuildRegisteredType("OperatorCard", {
		controllerIndex = var_12_1
	})

	var_12_14.id = "OperatorCard"

	var_12_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -813, _1080p * 815, _1080p * -386, _1080p * -138)
	var_12_0:addElement(var_12_14)

	var_12_0.OperatorCard = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIText.new()

	var_12_16.id = "SquadName"

	var_12_16:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_12_16:SetAlpha(0.5, 0)
	var_12_16:setText("", 0)
	var_12_16:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_12_16:SetTracking(1 * _1080p, 0)
	var_12_16:SetAlignment(LUI.Alignment.Left)
	var_12_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 93, _1080p * -432, _1080p * -408)
	var_12_0:addElement(var_12_16)

	var_12_0.SquadName = var_12_16

	local var_12_17
	local var_12_18 = MenuBuilder.BuildRegisteredType("TutorialVideo", {
		controllerIndex = var_12_1
	})

	var_12_18.id = "TutorialVideo"

	var_12_18:SetAlpha(0.8, 0)
	var_12_18:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 1066, _1080p * 1774, _1080p * -78, _1080p * 342)
	var_12_0:addElement(var_12_18)

	var_12_0.TutorialVideo = var_12_18

	local var_12_19
	local var_12_20 = MenuBuilder.BuildRegisteredType("LobbyMembersFooter", {
		controllerIndex = var_12_1
	})

	var_12_20.id = "LobbyMembersFooter"

	var_12_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 150)
	var_12_0:addElement(var_12_20)

	var_12_0.LobbyMembersFooter = var_12_20

	local var_12_21
	local var_12_22 = LUI.UIImage.new()

	var_12_22.id = "Thumbprint"

	var_12_22:setImage(RegisterMaterial("ui_operator_bio_thumbprint_5"), 0)
	var_12_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 171, _1080p * 323, _1080p * 462, _1080p * 614)
	var_12_0:addElement(var_12_22)

	var_12_0.Thumbprint = var_12_22

	local var_12_23
	local var_12_24 = LUI.UIImage.new()

	var_12_24.id = "FactionIcon"

	var_12_24:SetAlpha(0.4, 0)
	var_12_24:SetColorOp(COLOR_OP.saturation, 0)
	var_12_24:SetColorOpParam(1, 0)
	var_12_24:setImage(RegisterMaterial("icon_faction_sas_large"), 0)
	var_12_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -805, _1080p * -621, _1080p * 92, _1080p * 276)
	var_12_0:addElement(var_12_24)

	var_12_0.FactionIcon = var_12_24

	local var_12_25
	local var_12_26 = LUI.UIImage.new()

	var_12_26.id = "Banner"

	var_12_26:SetRGBFromInt(5987163, 0)
	var_12_26:SetAlpha(0.3, 0)
	var_12_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 147, _1080p * 1775, _1080p * 412, _1080p * 444)
	var_12_0:addElement(var_12_26)

	var_12_0.Banner = var_12_26

	local var_12_27
	local var_12_28 = LUI.UIText.new()

	var_12_28.id = "Identity"

	var_12_28:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_12_28:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU/OPERATOR_BIO_IDENTITY")), 0)
	var_12_28:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_12_28:SetAlignment(LUI.Alignment.Left)
	var_12_28:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 155, _1080p * 1013, _1080p * 419, _1080p * 441)
	var_12_0:addElement(var_12_28)

	var_12_0.Identity = var_12_28

	local var_12_29
	local var_12_30 = MenuBuilder.BuildRegisteredType("OperatorBloodtype", {
		controllerIndex = var_12_1
	})

	var_12_30.id = "Bloodtype"

	var_12_30:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 377, _1080p * 1013, _1080p * 469, _1080p * 609)
	var_12_0:addElement(var_12_30)

	var_12_0.Bloodtype = var_12_30

	local var_12_31
	local var_12_32 = {
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
		controllerIndex = var_12_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("OperatorBioButton", {
				controllerIndex = var_12_1
			})
		end,
		refreshChild = function(arg_14_0, arg_14_1, arg_14_2)
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
	local var_12_33 = LUI.UIGrid.new(var_12_32)

	var_12_33.id = "OperatorGrid"

	var_12_33:setUseStencil(true)
	var_12_33:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -583, _1080p * 51, _1080p * 92, _1080p * 404)
	var_12_0:addElement(var_12_33)

	var_12_0.OperatorGrid = var_12_33

	local function var_12_34()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_34

	local var_12_35
	local var_12_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -855
		}
	}

	var_12_8:RegisterAnimationSequence("LargeText", var_12_36)

	local var_12_37 = {
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

	var_12_16:RegisterAnimationSequence("LargeText", var_12_37)

	local var_12_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 408
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 448
		}
	}

	var_12_26:RegisterAnimationSequence("LargeText", var_12_38)

	local var_12_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 413
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 443
		}
	}

	var_12_28:RegisterAnimationSequence("LargeText", var_12_39)

	local function var_12_40()
		var_12_8:AnimateSequence("LargeText")
		var_12_16:AnimateSequence("LargeText")
		var_12_26:AnimateSequence("LargeText")
		var_12_28:AnimateSequence("LargeText")
	end

	var_12_0._sequences.LargeText = var_12_40

	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = -10,
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
	})
	var_12_0.HelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_r3",
		helper_text = Engine.CBBHFCGDIC("LUA_MENU/MODE_FULLSCREEN")
	})

	local var_12_41 = LUI.UIBindButton.new()

	var_12_41.id = "selfBindButton"

	var_12_0:addElement(var_12_41)

	var_12_0.bindButton = var_12_41

	var_0_4(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("OperatorBio", OperatorBio)
LockTable(_M)
