module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0.ToastNotification.HeaderText:setText("")
	arg_1_0.ToastNotification.CenterDescription:setText("")
	arg_1_0.ToastNotification.Description:setText("")
	arg_1_0.ToastNotification.ButtonPromptLeft:setText("")

	if arg_1_1.header then
		if arg_1_1.useBnetFont and not arg_1_0.ToastNotification.HeaderText.usingBnetFont then
			arg_1_0.ToastNotification.HeaderText:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))

			arg_1_0.ToastNotification.HeaderText.usingBnetFont = true
		elseif not arg_1_1.useBnetFont and arg_1_0.ToastNotification.HeaderText.usingBnetFont then
			arg_1_0.ToastNotification.HeaderText:SetFont(FONTS.GetFont(FONTS.MainRegular.File))

			arg_1_0.ToastNotification.HeaderText.usingBnetFont = false
		end

		arg_1_0.ToastNotification.HeaderText:setText(arg_1_1.header)

		if arg_1_1.description then
			arg_1_0.ToastNotification.Description:setText(arg_1_1.description)
		end
	elseif arg_1_1.description then
		arg_1_0.ToastNotification.CenterDescription:setText(arg_1_1.description)
	end

	if arg_1_1.icon then
		local var_1_0 = RegisterMaterial(arg_1_1.icon)

		if arg_1_1.type == LUI.ToastManager.NotificationType.PlayerCardEquipped then
			arg_1_0.ToastNotification.Icon:setImage(var_1_0)
			ACTIONS.AnimateSequence(arg_1_0.ToastNotification, "Icon2x1")
		elseif arg_1_1.type == LUI.ToastManager.NotificationType.EmblemEquipped then
			arg_1_0.ToastNotification.Icon:setImage(var_1_0)
			ACTIONS.AnimateSequence(arg_1_0.ToastNotification, "Icon1x1")
		else
			local var_1_1 = Engine.DFEIGFBEH(var_1_0)

			arg_1_0.ToastNotification.Icon:setImage(var_1_0)

			if var_1_1 > 1 then
				ACTIONS.AnimateSequence(arg_1_0.ToastNotification, "Icon2x1")
			else
				ACTIONS.AnimateSequence(arg_1_0.ToastNotification, "Icon1x1")
			end
		end
	else
		arg_1_0.ToastNotification.Icon:SetAlpha(0)
	end

	arg_1_0.ToastNotification:AdjustARTextSize()

	if arg_1_1.iconColor then
		arg_1_0.ToastNotification.Icon:SetRGBFromTable(arg_1_1.iconColor)
	end

	if arg_1_1.iconScale then
		arg_1_0.ToastNotification.Icon:SetScale(arg_1_1.iconScale)
	end

	if arg_1_1.timerEndTime then
		arg_1_0.ToastNotification.CountdownTimer:SetAlpha(1)
		arg_1_0.ToastNotification.CountdownTimer:setEndTime(arg_1_1.timerEndTime)
	end

	arg_1_0.persistent = arg_1_1.persistent

	if arg_1_1.buttonPromptLeft then
		arg_1_0.ToastNotification.ButtonPromptLeft:setText(arg_1_1.buttonPromptLeft)
		arg_1_0.ToastNotification.MenuButtonLeft.Text:setText(arg_1_1.buttonPromptLeft)
		arg_1_0.ToastNotification.HoldButton.Text:setText(arg_1_1.buttonPromptLeft)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = LUI.IsLastInputGamepad(arg_2_0._controllerIndex)

	if Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() then
		var_2_0 = Engine.BECCFCBIAA("gpadEnabled", arg_2_0._controllerIndex)
	end

	if arg_2_1.header then
		if arg_2_1.ToOptionsPrompt then
			ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithHeaderToMenu")
		elseif not arg_2_1.callback then
			ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithHeader")
		else
			arg_2_0.ToastNotification:SetupButtonsTooltipData()

			if var_2_0 then
				ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithHeaderGamepad")

				if arg_2_1.useHoldButton then
					ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithHoldButton")
				end
			else
				ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithHeaderKBMInGame")
			end
		end
	elseif arg_2_1.ToOptionsPrompt then
		ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithoutHeaderToMenu")
	elseif not arg_2_1.callback then
		ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithoutHeader")
	else
		arg_2_0.ToastNotification:SetupButtonsTooltipData()

		if var_2_0 then
			ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithoutHeaderGamepad")

			if arg_2_1.useHoldButton then
				ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithHoldButton")
			end
		else
			ACTIONS.AnimateSequence(arg_2_0.ToastNotification, "WithoutHeaderKBM")
		end
	end

	arg_2_0.ToastNotification:AdjustARTextSize()

	if Engine.DBFFAEEFGJ().flowManager:IsStackEmpty() and not var_2_0 then
		arg_2_0.ToastNotification.MenuButtonLeft.Text:setText(Engine.BABHEFFEGI(arg_2_0._controllerIndex, "accept_notification") .. " " .. Engine.CBBHFCGDIC("LUA_MENU/ACCEPT_REQUEST"))
		arg_2_0.ToastNotification.MenuButtonRight.Text:setText(Engine.BABHEFFEGI(arg_2_0._controllerIndex, "decline_notification") .. " " .. Engine.CBBHFCGDIC("LUA_MENU/DISMISS_NOTIFICATION"))
	elseif arg_2_1.buttonPromptLeft then
		arg_2_0.ToastNotification.ButtonPromptLeft:setText(arg_2_1.buttonPromptLeft)
		arg_2_0.ToastNotification.MenuButtonLeft.Text:setText(arg_2_1.buttonPromptLeft)
		arg_2_0.ToastNotification.HoldButton.Text:setText(arg_2_1.buttonPromptLeft)
		arg_2_0.ToastNotification.MenuButtonRight.Text:setText(Engine.CBBHFCGDIC("LUA_MENU/DISMISS_NOTIFICATION"))
	end
end

local function var_0_2(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0.ToastNotification, "Hide")
end

function PostLoadFunc(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_0.ToastNotification.Icon)
	assert(arg_4_0.ToastNotification.Description)
	assert(arg_4_0.ToastNotification.CenterDescription)
	assert(arg_4_0.ToastNotification.HeaderText)
	assert(arg_4_0.ToastNotification.ButtonPromptLeft)
	assert(arg_4_0.ToastNotification.ButtonPromptRight)
	assert(arg_4_0.ToastNotification.MenuButtonLeft)
	assert(arg_4_0.ToastNotification.HoldButton)
	assert(arg_4_0.ToastNotification.FontIconLeft)
	assert(arg_4_0.ToastNotification.FontIconRight)
	assert(arg_4_0.ToastNotification.HoldButtonIcon)

	arg_4_0._controllerIndex = arg_4_1
	arg_4_0.SetData = var_0_0
	arg_4_0.SetGraphics = var_0_1
	arg_4_0.HideNotification = var_0_2
end

function ToastNotificationContainer(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 115 * _1080p)

	var_5_0.id = "ToastNotificationContainer"
	var_5_0._animationSets = {}
	var_5_0._sequences = {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("ToastNotification", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "ToastNotification"

	var_5_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 500, _1080p * 900, _1080p * 70, _1080p * 130)
	var_5_0:addElement(var_5_4)

	var_5_0.ToastNotification = var_5_4

	local function var_5_5()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_5

	local var_5_6 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 900
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 70,
			easing = LUI.EASING.outBack
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 470,
			easing = LUI.EASING.outBack
		}
	}

	var_5_4:RegisterAnimationSequence("SlideInFromRight", var_5_6)

	local function var_5_7()
		var_5_4:AnimateSequence("SlideInFromRight")
	end

	var_5_0._sequences.SlideInFromRight = var_5_7

	local var_5_8 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 1,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 60,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_5_4:RegisterAnimationSequence("HideAll", var_5_8)

	local function var_5_9()
		var_5_4:AnimateSequence("HideAll")
	end

	var_5_0._sequences.HideAll = var_5_9

	local var_5_10 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 500
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 900
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_4:RegisterAnimationSequence("Reset", var_5_10)

	local function var_5_11()
		var_5_4:AnimateSequence("Reset")
	end

	var_5_0._sequences.Reset = var_5_11

	PostLoadFunc(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ToastNotificationContainer", ToastNotificationContainer)
LockTable(_M)
