module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2.index ~= "" and arg_1_2.index ~= nil then
		assert(arg_1_1.CinematicName)
		assert(arg_1_1.CinematicDesc)
		arg_1_0.MissionLabel:setText(Engine.CBBHFCGDIC(arg_1_2.name))
		arg_1_0.Image:setImage(RegisterMaterial(arg_1_2.image))
		arg_1_0:registerEventHandler("button_action", function()
			LUI.FlowManager.RequestAddMenu("CinematicFullscreen", true, arg_1_0._controllerIndex, false, {
				disableQuickAccess = true,
				video = arg_1_2.ref
			})
		end)
		arg_1_0:addEventHandler("button_over", function()
			arg_1_1.CinematicName:setText(Engine.CBBHFCGDIC(arg_1_2.name))
			arg_1_1.CinematicDesc:setText(Engine.CBBHFCGDIC(arg_1_2.desc))
			ACTIONS.AnimateSequence(arg_1_1, "DetailsFadeIn")
			Engine.DFCGFCGBFD(arg_1_2.ref, VideoPlaybackFlags.LOOP)
		end)
	end
end

local function var_0_1(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.MissionLabel)
	assert(arg_4_0.Image)

	arg_4_0._controllerIndex = arg_4_1

	arg_4_0.Image:SetMask(arg_4_0.Mask)

	arg_4_0.RefreshButton = var_0_0
end

function CPCinematicSelectButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 210 * _1080p, 0, 105 * _1080p)

	var_5_0.id = "CPCinematicSelectButton"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Image"

	var_5_4:setImage(RegisterMaterial("keyart_standard_edition_thumbnail"), 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Image = var_5_4

	local var_5_5
	local var_5_6 = LUI.UIImage.new()

	var_5_6.id = "Mask"

	var_5_6:setImage(RegisterMaterial("stencil_mask"), 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 210, 0, _1080p * 105)
	var_5_0:addElement(var_5_6)

	var_5_0.Mask = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "TextBacker"

	var_5_8:SetRGBFromInt(0, 0)
	var_5_8:SetAlpha(0.6, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -28, 0)
	var_5_0:addElement(var_5_8)

	var_5_0.TextBacker = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIStyledText.new()

	var_5_10.id = "MissionLabel"

	var_5_10:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_5_10:setText("", 0)
	var_5_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_10:SetWordWrap(false)
	var_5_10:SetAlignment(LUI.Alignment.Left)
	var_5_10:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_5_10:SetStartupDelay(1000)
	var_5_10:SetLineHoldTime(400)
	var_5_10:SetAnimMoveTime(150)
	var_5_10:SetAnimMoveSpeed(50)
	var_5_10:SetEndDelay(1000)
	var_5_10:SetCrossfadeTime(400)
	var_5_10:SetFadeInTime(300)
	var_5_10:SetFadeOutTime(300)
	var_5_10:SetMaxVisibleLines(1)
	var_5_10:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 8, _1080p * -7, _1080p * -28, _1080p * -4)
	var_5_0:addElement(var_5_10)

	var_5_0.MissionLabel = var_5_10

	local var_5_11
	local var_5_12 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_12.id = "ButtonHighlightBarTop"

	var_5_12:SetAlpha(0, 0)
	var_5_12:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_5_0:addElement(var_5_12)

	var_5_0.ButtonHighlightBarTop = var_5_12

	local var_5_13
	local var_5_14 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_5_1
	})

	var_5_14.id = "ButtonHighlightBarBottom"

	var_5_14:SetAlpha(0, 0)
	var_5_14:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_5_0:addElement(var_5_14)

	var_5_0.ButtonHighlightBarBottom = var_5_14

	local function var_5_15()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_15

	local var_5_16 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 16777215,
			duration = 200,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.05,
			duration = 200,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonOver", var_5_16)

	local var_5_17 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonOver", var_5_17)

	local var_5_18 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonOver", var_5_18)

	local var_5_19 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonOver", var_5_19)

	local function var_5_20()
		var_5_4:AnimateSequence("ButtonOver")
		var_5_10:AnimateSequence("ButtonOver")
		var_5_12:AnimateSequence("ButtonOver")
		var_5_14:AnimateSequence("ButtonOver")
	end

	var_5_0._sequences.ButtonOver = var_5_20

	local var_5_21 = {
		{
			value = 16777215,
			duration = 100,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_5_4:RegisterAnimationSequence("ButtonUp", var_5_21)

	local var_5_22 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_5_10:RegisterAnimationSequence("ButtonUp", var_5_22)

	local var_5_23 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_12:RegisterAnimationSequence("ButtonUp", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_14:RegisterAnimationSequence("ButtonUp", var_5_24)

	local function var_5_25()
		var_5_4:AnimateSequence("ButtonUp")
		var_5_10:AnimateSequence("ButtonUp")
		var_5_12:AnimateSequence("ButtonUp")
		var_5_14:AnimateSequence("ButtonUp")
	end

	var_5_0._sequences.ButtonUp = var_5_25

	var_5_0:addEventHandler("button_over", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "ButtonUp")
	end)
	var_0_1(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("CPCinematicSelectButton", CPCinematicSelectButton)
LockTable(_M)
