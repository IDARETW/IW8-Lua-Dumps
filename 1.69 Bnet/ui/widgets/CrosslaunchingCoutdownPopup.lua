module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {
		CrossLaunchUtils.CrossLaunchPlatformOptions.PS5,
		CrossLaunchUtils.CrossLaunchPlatformOptions.PS4
	}
	local var_1_1 = 1

	arg_1_0.PlatformSelection:UpdatePip(var_1_1, #var_1_0)
	Engine.BHHGDCDFIE(var_1_0[var_1_1], arg_1_2)

	local var_1_2 = {
		clickRepeatDisabled = true,
		labels = {
			CrossLaunchUtils.CrossLaunchPlatformOptionsLabels.PS5,
			CrossLaunchUtils.CrossLaunchPlatformOptionsLabels.PS4
		},
		action = function(arg_2_0, arg_2_1, arg_2_2)
			Engine.BHHGDCDFIE(var_1_0[arg_2_0], arg_1_2)
		end
	}

	LUI.AddUIArrowTextButtonLogic(arg_1_0.PlatformSelection, arg_1_1, var_1_2)
	ACTIONS.AnimateSequence(arg_1_0, "PlatformSelectionShow")
end

local function var_0_1(arg_3_0, arg_3_1)
	arg_3_0.BindButton = LUI.UIBindButton.new()
	arg_3_0.BindButton.onCancel = arg_3_1

	arg_3_0.BindButton:registerEventHandler("button_secondary", function(arg_4_0, arg_4_1)
		arg_4_0:onCancel(arg_4_1.controller)
	end)
	arg_3_0.BindButton:registerEventHandler("virtual_keyboard_popup_active", function(arg_5_0, arg_5_1)
		arg_5_0:processEvent({
			name = "popup_active"
		})
	end)
	arg_3_0:addElement(arg_3_0.BindButton)

	local var_3_0 = Engine.CBBHFCGDIC("LUA_MENU/CANCEL")

	arg_3_0.ButtonHelperBar.ButtonHelperText:PushButtonPrompt({
		side = "left",
		button_ref = "button_secondary",
		priority = 0,
		helper_text = var_3_0
	})
end

local function var_0_2(arg_6_0, arg_6_1, arg_6_2)
	assert(arg_6_0.Text)
	assert(arg_6_0.GenericPopupFrame)
	assert(arg_6_2.title)
	assert(arg_6_2.message)
	assert(arg_6_2.onCancel)

	if arg_6_2.darkenerAlpha and arg_6_0.GenericPopupFrame.Darkener then
		arg_6_0.GenericPopupFrame.Darkener:SetAlpha(arg_6_2.darkenerAlpha)
	end

	arg_6_0.Title:setText(Engine.CBEAHDFCFC(arg_6_2.title))
	arg_6_0.Text:setText(arg_6_2.message, 0)

	if not Engine.CFHBIHABCB(arg_6_1) and not arg_6_2.imageOverride then
		arg_6_2.imageOverride = "logo_wz"
	end

	var_0_1(arg_6_0, arg_6_2.onCancel)

	if arg_6_2.timerData and arg_6_2.timerData.time then
		arg_6_0.endTime = Engine.DEIDGHDBHD() + arg_6_2.timerData.time
	end

	if arg_6_2.buttons and #arg_6_2.buttons >= 1 then
		local var_6_0 = LUI.UIElement.new()

		var_6_0:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * 58, _1080p * 196)

		var_6_0.id = "ButtonContainer"

		arg_6_0:addElement(var_6_0)
		ACTIONS.AnimateSequence(arg_6_0, "ButtonVer")

		local var_6_1 = LUI.UIVerticalList.new({
			adjustSizeToContent = true,
			ignoreStretchingChildren = true,
			verticalAlignment = LUI.Alignment.Bottom
		})

		var_6_1:SetSpacing(4)
		var_6_0:addElement(var_6_1)

		for iter_6_0, iter_6_1 in ipairs(arg_6_2.buttons) do
			local var_6_2 = iter_6_1.type and iter_6_1.type or "GenericButton"
			local var_6_3 = MenuBuilder.BuildRegisteredType(var_6_2, {
				controllerIndex = arg_6_1
			})

			if iter_6_1.checkBoxHandled then
				if iter_6_1.disabled then
					var_6_3:ElementDisable()
				end

				local function var_6_4(arg_7_0, arg_7_1)
					if arg_7_1.enable then
						var_6_3:ElementEnable(arg_7_1)
					else
						var_6_3:ElementDisable()
					end
				end

				var_6_3:addEventHandler("checkbox_disable", var_6_4)
			end

			var_6_3:SetLeftAnchor(0)
			var_6_3:SetRightAnchor(0)
			var_6_3:SetRight(0)
			var_6_3:SetLeft(0)

			if iter_6_1.spacerSize then
				var_6_3:SetTopAnchor(0)
				var_6_3:SetBottomAnchor(1)
				var_6_3:SetBottom(iter_6_1.spacerSize)
			end

			var_6_3.id = "button_" .. iter_6_0

			if iter_6_1.label then
				var_6_3.Text:setText(iter_6_1.label)

				local var_6_5 = LUI.Alignment.Left

				var_6_3.Background:SetupButton(var_6_3.Text, var_6_3.Text:getText(), var_6_5)
				var_6_3.Text:SetAlignment(var_6_5)
			end

			local var_6_6 = iter_6_1.action and iter_6_1.action or function()
				LUI.FlowManager.RequestLeaveMenu(arg_6_0, true, nil)
			end

			if var_6_2 == "GenericHoldButton" then
				AddUIHoldButtonLogic(var_6_3, var_6_6, arg_6_1)
			else
				var_6_3:addEventHandler("button_action", var_6_6)
			end

			var_6_1:addElement(var_6_3)
		end
	end

	if arg_6_2.timerData then
		local var_6_7

		local function var_6_8()
			local var_9_0 = arg_6_2.timerData.getTimeRemainingCallback(arg_6_0)

			if var_9_0 < 0 then
				var_9_0 = 0

				LUI.FlowManager.RequestLeaveMenu(arg_6_0, true, nil)

				if arg_6_2.timerData.onCountdownCompleteCallback ~= nil then
					arg_6_2.timerData.onCountdownCompleteCallback(arg_6_0, arg_6_1, arg_6_2.gameMode, arg_6_2.gameId)
				end
			elseif arg_6_2.timerData.noDecisionMadeInTimeCallback ~= nil and var_9_0 < Dvar.CFHDGABACF("MSQNQPSSL") then
				arg_6_2.timerData.noDecisionMadeInTimeCallback(arg_6_0, arg_6_1)
			elseif not arg_6_2.shouldAlwaysBeCancellable and var_9_0 < Dvar.CFHDGABACF("NSLTKSKOQQ") then
				arg_6_0.BindButton:disable()
				arg_6_0.ButtonHelperBar.ButtonHelperText:PopButtonPrompt({
					button_ref = "button_secondary"
				})
			end

			if arg_6_2.timerData.noDecisionMadeInTimeCallback ~= nil then
				var_9_0 = var_9_0 - Dvar.CFHDGABACF("MSQNQPSSL")
			end

			arg_6_0.Timer:setText(var_9_0)

			arg_6_0:Wait(arg_6_2.timerData.frequency, true).onComplete = var_6_8
		end

		var_6_8()
	else
		arg_6_0.Timer:SetAlpha(0)
	end

	ACTIONS.ScaleFullscreen(arg_6_0.GenericPopupFrame.Darkener)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_6_0, "WZWipSetup")
	end

	if Engine.DJIFJCHEBE(arg_6_2.gameId) == 1 then
		var_0_0(arg_6_0, arg_6_1, arg_6_2.gameId)
	end

	local var_6_9 = Dvar.CFHDGABACF("NLTLMQTLK")

	arg_6_0.BOCW:SetAlpha(arg_6_2.gameId == LUI.DEEP_LINK_GAME.COLD_WAR and arg_6_2.confirmScreen ~= true and 1 or 0)
	arg_6_0.VG:SetAlpha(arg_6_2.gameId == LUI.DEEP_LINK_GAME.VANGUARD and arg_6_2.confirmScreen ~= true and 1 or 0)
	arg_6_0.MWII:SetAlpha(arg_6_2.gameId == LUI.DEEP_LINK_GAME.HQ and arg_6_2.confirmScreen ~= true and var_6_9 == CrossLaunchUtils.HQCrosslaunchTitles.CORTEZ and 1 or 0)
	arg_6_0.WZ2:SetAlpha(arg_6_2.gameId == LUI.DEEP_LINK_GAME.HQ and arg_6_2.confirmScreen ~= true and var_6_9 == CrossLaunchUtils.HQCrosslaunchTitles.WZ2 and 1 or 0)
end

function CrosslaunchingCoutdownPopup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_10_0.id = "CrosslaunchingCoutdownPopup"
	var_10_0._animationSets = var_10_0._animationSets or {}
	var_10_0._sequences = var_10_0._sequences or {}

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = MenuBuilder.BuildRegisteredType("GenericPopupFrame", {
		controllerIndex = var_10_1
	})

	var_10_4.id = "GenericPopupFrame"

	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.GenericPopupFrame = var_10_4

	local var_10_5
	local var_10_6 = LUI.UIStyledText.new()

	var_10_6.id = "Text"

	var_10_6:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_6:setText("", 0)
	var_10_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_10_6:SetWordWrap(false)
	var_10_6:SetAlignment(LUI.Alignment.Center)
	var_10_6:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_10_6:SetStartupDelay(2000)
	var_10_6:SetLineHoldTime(400)
	var_10_6:SetAnimMoveTime(2000)
	var_10_6:SetAnimMoveSpeed(150)
	var_10_6:SetEndDelay(2000)
	var_10_6:SetCrossfadeTime(250)
	var_10_6:SetFadeInTime(300)
	var_10_6:SetFadeOutTime(300)
	var_10_6:SetMaxVisibleLines(1)
	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * 72, _1080p * 100)
	var_10_0:addElement(var_10_6)

	var_10_0.Text = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIText.new()

	var_10_8.id = "Timer"

	var_10_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_10_8:setText("", 0)
	var_10_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_10_8:SetWordWrap(false)
	var_10_8:SetAlignment(LUI.Alignment.Center)
	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -830, _1080p * 830, _1080p * 132, _1080p * 168)
	var_10_0:addElement(var_10_8)

	var_10_0.Timer = var_10_8

	local var_10_9
	local var_10_10 = LUI.UIStyledText.new()

	var_10_10.id = "Title"

	var_10_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_10_10:setText("", 0)
	var_10_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_10_10:SetAlignment(LUI.Alignment.Center)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -802, _1080p * 802, _1080p * -192, _1080p * -132)
	var_10_0:addElement(var_10_10)

	var_10_0.Title = var_10_10

	local var_10_11
	local var_10_12 = LUI.UIImage.new()

	var_10_12.id = "VG"

	var_10_12:setImage(RegisterMaterial("logo_cod_vg"), 0)
	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -138, _1080p * 138, _1080p * -97, _1080p * 41)
	var_10_0:addElement(var_10_12)

	var_10_0.VG = var_10_12

	local var_10_13
	local var_10_14 = LUI.UIImage.new()

	var_10_14.id = "BOCW"

	var_10_14:setImage(RegisterMaterial("mw_bocw_logo"), 0)
	var_10_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -138, _1080p * 138, _1080p * -97, _1080p * 41)
	var_10_0:addElement(var_10_14)

	var_10_0.BOCW = var_10_14

	local var_10_15
	local var_10_16 = LUI.UIImage.new()

	var_10_16.id = "MWII"

	var_10_16:setImage(RegisterMaterial("logo_cod_cortez"), 0)
	var_10_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -138, _1080p * 138, _1080p * -97, _1080p * 41)
	var_10_0:addElement(var_10_16)

	var_10_0.MWII = var_10_16

	local var_10_17
	local var_10_18 = LUI.UIImage.new()

	var_10_18.id = "WZ2"

	var_10_18:setImage(RegisterMaterial("logo_cod_wz2"), 0)
	var_10_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -138, _1080p * 138, _1080p * -97, _1080p * 41)
	var_10_0:addElement(var_10_18)

	var_10_0.WZ2 = var_10_18

	local var_10_19
	local var_10_20 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_10_1
	})

	var_10_20.id = "Spinner"

	var_10_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 111, _1080p * 121)
	var_10_0:addElement(var_10_20)

	var_10_0.Spinner = var_10_20

	local var_10_21
	local var_10_22 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_10_1
	})

	var_10_22.id = "ButtonHelperBar"

	var_10_22.Background:SetAlpha(0, 0)
	var_10_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * 230, _1080p * 290)
	var_10_0:addElement(var_10_22)

	var_10_0.ButtonHelperBar = var_10_22

	local var_10_23
	local var_10_24 = MenuBuilder.BuildRegisteredType("GenericCycleList", {
		controllerIndex = var_10_1
	})

	var_10_24.id = "PlatformSelection"

	var_10_24:SetAlpha(0, 0)
	var_10_24.GenericOptionButtonBase.Title:setText(Engine.CBBHFCGDIC("LUA_MENU_EAGLE/CROSSLAUNCH_PLATFORM_SELECTION_TITLE"), 0)
	var_10_24.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_EAGLE/CROSSLAUNCH_PLATFORM_SELECTION_PS4"), 0)
	var_10_24:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -315, _1080p * 315, _1080p * 711, _1080p * 765)
	var_10_0:addElement(var_10_24)

	var_10_0.PlatformSelection = var_10_24

	local function var_10_25()
		return
	end

	var_10_0._sequences.DefaultSequence = var_10_25

	local var_10_26
	local var_10_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -78
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -50
		}
	}

	var_10_6:RegisterAnimationSequence("ButtonVer", var_10_27)

	local var_10_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18
		}
	}

	var_10_8:RegisterAnimationSequence("ButtonVer", var_10_28)

	local var_10_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_14:RegisterAnimationSequence("ButtonVer", var_10_29)

	local var_10_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -39
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -29
		}
	}

	var_10_20:RegisterAnimationSequence("ButtonVer", var_10_30)

	local function var_10_31()
		var_10_6:AnimateSequence("ButtonVer")
		var_10_8:AnimateSequence("ButtonVer")
		var_10_14:AnimateSequence("ButtonVer")
		var_10_20:AnimateSequence("ButtonVer")
	end

	var_10_0._sequences.ButtonVer = var_10_31

	local var_10_32
	local var_10_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText
		}
	}

	var_10_10:RegisterAnimationSequence("WZWipSetup", var_10_33)

	local function var_10_34()
		var_10_10:AnimateSequence("WZWipSetup")
	end

	var_10_0._sequences.WZWipSetup = var_10_34

	local var_10_35
	local var_10_36 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_10_24:RegisterAnimationSequence("PlatformSelectionShow", var_10_36)

	local function var_10_37()
		var_10_24:AnimateSequence("PlatformSelectionShow")
	end

	var_10_0._sequences.PlatformSelectionShow = var_10_37

	var_10_4:addEventHandler("menu_create", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_10_1
		end

		ACTIONS.ScaleFullscreen(var_10_0)
	end)
	var_0_2(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("CrosslaunchingCoutdownPopup", CrosslaunchingCoutdownPopup)
LockTable(_M)
