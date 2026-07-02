module(..., package.seeall)

local var_0_0 = {
	{
		icon = "icon_mp_mode_ffa",
		name = "GAME/LAUNCH_PHASE_1",
		desc = "GAME/LAUNCH_PHASE_1_DESC"
	},
	{
		icon = "icon_mp_mode_arena",
		name = "GAME/LAUNCH_PHASE_2",
		desc = "GAME/LAUNCH_PHASE_2_DESC"
	},
	{
		icon = "icon_mp_mode_arena",
		name = "GAME/LAUNCH_PHASE_3",
		desc = "GAME/LAUNCH_PHASE_3_DESC"
	},
	{
		icon = "icon_mp_mode_conf",
		name = "GAME/LAUNCH_PHASE_4",
		desc = "GAME/LAUNCH_PHASE_4_DESC"
	}
}

local function var_0_1(arg_1_0, arg_1_1)
	assert(arg_1_1)
	assert(arg_1_0.Icon and arg_1_0.ModeText and arg_1_0.DescriptionText, "Warning: Elements missing from LaunchChunkNewPhasePopup...")

	if arg_1_0._currentPhase ~= arg_1_1 then
		arg_1_0._currentPhase = arg_1_1

		if arg_1_1 > #var_0_0 then
			ACTIONS.AnimateSequence(arg_1_0, "ShowMessage")
		elseif arg_1_1 ~= 0 then
			local var_1_0 = var_0_0[arg_1_1]

			arg_1_0.ModeText:setText(Engine.CBBHFCGDIC(var_1_0.name))
			arg_1_0.DescriptionText:setText(Engine.CBBHFCGDIC(var_1_0.desc))
			arg_1_0.Icon:setImage(RegisterMaterial(var_1_0.icon))
		end
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._currentPhase = nil
	arg_2_0.SetupPhase = var_0_1

	arg_2_0:registerOmnvarHandler("ui_launch_chunk_phase", function(arg_3_0, arg_3_1)
		arg_3_0:SetupPhase(arg_3_1.value)
	end)
	arg_2_0:SetupPhase(Game.BFEEGCHICA(arg_2_1, "ui_launch_chunk_phase"))

	arg_2_0._allowInput = false
	arg_2_0:Wait(3000).onComplete = function()
		arg_2_0._allowInput = true
	end

	arg_2_0:registerEventHandler("gamepad_button", function(arg_5_0, arg_5_1)
		if arg_5_1.button == "primary" and arg_2_0._allowInput then
			Engine.EBHIFJCGBH("class_select", arg_2_1)
			LUI.FlowManager.RequestLeaveMenu(arg_5_0)
		end
	end)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_2_0, "AR")
	end
end

function LaunchChunkNewPhasePopup(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_6_0.id = "LaunchChunkNewPhasePopup"
	var_6_0._animationSets = {}
	var_6_0._sequences = {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Darkener"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_4:SetAlpha(0.7, 0)
	var_6_4:SetScale(1, 0)
	var_6_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 269, _1080p * -270)
	var_6_0:addElement(var_6_4)

	var_6_0.Darkener = var_6_4

	local var_6_5
	local var_6_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_6_1
	})

	var_6_6.id = "GenericPopupWindow"

	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -870, _1080p * 870, _1080p * -200, _1080p * 200)
	var_6_0:addElement(var_6_6)

	var_6_0.GenericPopupWindow = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "SelectButtonHint"

	var_6_8:SetRGBFromTable(SWATCHES.genericButton.description, 0)
	var_6_8:SetAlpha(0, 0)
	var_6_8:setText(Engine.CBBHFCGDIC("GAME/LAUNCH_START_MATCH"), 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_8:SetWordWrap(false)
	var_6_8:SetAlignment(LUI.Alignment.Center)
	var_6_8:SetTintFontIcons(true)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * 125, _1080p * 147)
	var_6_0:addElement(var_6_8)

	var_6_0.SelectButtonHint = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIStyledText.new()

	var_6_10.id = "TitleText"

	var_6_10:SetRGBFromTable(SWATCHES.Popups.titleTxt, 0)
	var_6_10:setText(ToUpperCase(Engine.CBBHFCGDIC("GAME/NEXT_MATCH")), 0)
	var_6_10:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_6_10:SetAlignment(LUI.Alignment.Center)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -850, _1080p * 850, _1080p * -180, _1080p * -120)
	var_6_0:addElement(var_6_10)

	var_6_0.TitleText = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "Icon"

	var_6_12:setImage(RegisterMaterial("icon_mp_mode_conf"), 0)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -294, _1080p * -166, _1080p * -74, _1080p * 54)
	var_6_0:addElement(var_6_12)

	var_6_0.Icon = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIStyledText.new()

	var_6_14.id = "OperationText"

	var_6_14:SetRGBFromTable(SWATCHES.Popups.headerTxt, 0)
	var_6_14:setText(Engine.CBBHFCGDIC("GAME/OPERATION"), 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_14:SetAlignment(LUI.Alignment.Left)
	var_6_14:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -144, _1080p * 356, _1080p * -78, _1080p * -50)
	var_6_0:addElement(var_6_14)

	var_6_0.OperationText = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIStyledText.new()

	var_6_16.id = "DescriptionText"

	var_6_16:SetRGBFromTable(SWATCHES.Popups.bodyTxt, 0)
	var_6_16:setText("", 0)
	var_6_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_6_16:SetAlignment(LUI.Alignment.Left)
	var_6_16:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -144, _1080p * 516, 0, _1080p * 28)
	var_6_0:addElement(var_6_16)

	var_6_0.DescriptionText = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIStyledText.new()

	var_6_18.id = "ModeText"

	var_6_18:SetRGBFromTable(SWATCHES.Popups.subHeaderTxt2, 0)
	var_6_18:setText("", 0)
	var_6_18:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_6_18:SetWordWrap(false)
	var_6_18:SetAlignment(LUI.Alignment.Left)
	var_6_18:SetOptOutRightToLeftAlignmentFlip(true)
	var_6_18:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_18:SetStartupDelay(1000)
	var_6_18:SetLineHoldTime(400)
	var_6_18:SetAnimMoveTime(150)
	var_6_18:SetAnimMoveSpeed(50)
	var_6_18:SetEndDelay(1000)
	var_6_18:SetCrossfadeTime(400)
	var_6_18:SetFadeInTime(300)
	var_6_18:SetFadeOutTime(300)
	var_6_18:SetMaxVisibleLines(1)
	var_6_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -144, _1080p * 516, _1080p * -50, 0)
	var_6_0:addElement(var_6_18)

	var_6_0.ModeText = var_6_18

	local function var_6_19()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_19

	local var_6_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_6_8:RegisterAnimationSequence("ShowMessage", var_6_20)

	local function var_6_21()
		var_6_8:AnimateSequence("ShowMessage")
	end

	var_6_0._sequences.ShowMessage = var_6_21

	local var_6_22 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_8:RegisterAnimationSequence("HideMessage", var_6_22)

	local function var_6_23()
		var_6_8:AnimateSequence("HideMessage")
	end

	var_6_0._sequences.HideMessage = var_6_23

	local var_6_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -88
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -52
		}
	}

	var_6_14:RegisterAnimationSequence("AR", var_6_24)

	local var_6_25 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 40
		}
	}

	var_6_16:RegisterAnimationSequence("AR", var_6_25)

	local function var_6_26()
		var_6_14:AnimateSequence("AR")
		var_6_16:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_26

	var_6_4:addEventHandler("menu_create", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_6_1
		end

		ACTIONS.ScaleFullscreen(var_6_0)
	end)
	var_0_2(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("LaunchChunkNewPhasePopup", LaunchChunkNewPhasePopup)
LockTable(_M)
