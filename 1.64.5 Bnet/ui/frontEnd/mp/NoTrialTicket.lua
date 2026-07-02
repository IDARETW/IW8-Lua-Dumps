module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	assert(arg_1_0.Darkener)
	assert(arg_1_0.Blur)
	ACTIONS.ScaleFullscreen(arg_1_0.Darkener)
	ACTIONS.ScaleFullscreen(arg_1_0.Blur)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function NoTrialTicket(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_2_0.id = "NoTrialTicket"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = LUI.UIBlur.new()

	var_2_4.id = "Blur"

	var_2_4:SetBlurStrength(0.75, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.Blur = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIImage.new()

	var_2_6.id = "Darkener"

	var_2_6:SetRGBFromInt(0, 0)
	var_2_6:SetAlpha(0.8, 0)
	var_2_6:SetScale(1, 0)
	var_2_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 480, _1080p * -480, _1080p * 270, _1080p * -270)
	var_2_0:addElement(var_2_6)

	var_2_0.Darkener = var_2_6

	local var_2_7
	local var_2_8 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_2_1
	})

	var_2_8.id = "GenericPopupWindow"

	var_2_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -235, _1080p * 235)
	var_2_0:addElement(var_2_8)

	var_2_0.GenericPopupWindow = var_2_8

	local var_2_9
	local var_2_10 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_2_1
	})

	var_2_10.id = "ButtonHelperBar"

	var_2_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_10.Background:SetAlpha(0, 0)
	var_2_10:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 105, _1080p * -818, _1080p * 245, _1080p * 295)
	var_2_0:addElement(var_2_10)

	var_2_0.ButtonHelperBar = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIText.new()

	var_2_12.id = "NoTrialTicketLabel"

	var_2_12:SetRGBFromTable(SWATCHES.genericMenu.title, 0)
	var_2_12:setText(Engine.CBBHFCGDIC("MPUI/NO_TRIAL_TICKET"), 0)
	var_2_12:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_2_12:SetAlignment(LUI.Alignment.Left)
	var_2_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 616, _1080p * -127, _1080p * -69)
	var_2_0:addElement(var_2_12)

	var_2_0.NoTrialTicketLabel = var_2_12

	local var_2_13
	local var_2_14 = LUI.UIImage.new()

	var_2_14.id = "NoTrialTicketImage"

	var_2_14:setImage(RegisterMaterial("image_killhouse_ticket"), 0)
	var_2_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -612, _1080p * -100, _1080p * -127, _1080p * 127)
	var_2_0:addElement(var_2_14)

	var_2_0.NoTrialTicketImage = var_2_14

	local var_2_15
	local var_2_16 = LUI.UIText.new()

	var_2_16.id = "NoTrialTicketDescLabel"

	var_2_16:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_16:setText(Engine.CBBHFCGDIC("MPUI/NO_TRIAL_TICKET_DESC"), 0)
	var_2_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_16:SetAlignment(LUI.Alignment.Left)
	var_2_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 616, _1080p * -28, _1080p * -8)
	var_2_0:addElement(var_2_16)

	var_2_0.NoTrialTicketDescLabel = var_2_16

	local var_2_17
	local var_2_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_2_1
	})

	var_2_18.id = "OkButton"

	var_2_18.Text:SetLeft(_1080p * 20, 0)
	var_2_18.Text:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/OK")), 0)
	var_2_18.Text:SetAlignment(LUI.Alignment.Center)
	var_2_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 616, _1080p * 75, _1080p * 111)
	var_2_0:addElement(var_2_18)

	var_2_0.OkButton = var_2_18

	local function var_2_19()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_19

	local var_2_20 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -30
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_2_16:RegisterAnimationSequence("AR", var_2_20)

	local function var_2_21()
		var_2_16:AnimateSequence("AR")
	end

	var_2_0._sequences.AR = var_2_21

	var_2_18:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		if not arg_5_1.controller then
			local var_5_0 = var_2_1
		end

		ACTIONS.LeaveMenu(var_2_0)
	end)
	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("NoTrialTicket", NoTrialTicket)
LockTable(_M)
