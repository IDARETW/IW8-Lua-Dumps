module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	arg_1_0._buttonData = arg_1_1

	arg_1_0.Image:setImage(RegisterMaterial(arg_1_1.image))
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.SetButtonData = var_0_0

	arg_2_0:addEventHandler("button_action", function(arg_3_0, arg_3_1)
		if not arg_2_0._buttonData or arg_2_0._buttonData.owned then
			return true
		end

		LUI.FlowManager.RequestPopupMenu(nil, "MagmaUpsellFullScreenPopup", true, arg_3_1.controller, false, {
			controllerIndex = arg_2_1
		})
		InGameStore.SelectProduct(arg_2_1, arg_2_0._buttonData.productId, InGameStorePurchaseType.BROWSE)

		if arg_2_0._buttonData.leavePartyAndLobbyOnPurchase and Lobby.BBDICGHE() then
			Lobby.LeavePublicLobby()

			if LUI.FlowManager.IsInStack("BRPublicLobby") then
				LUI.FlowManager.RequestLeaveMenuByName("BRPublicLobby", true, true)
			elseif LUI.FlowManager.IsInStack("MPPublicLobby") then
				LUI.FlowManager.RequestLeaveMenuByName("MPPublicLobby", true, true)
			end
		end
	end)
end

function TitleIDItemButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 307 * _1080p, 0, 153 * _1080p)

	var_4_0.id = "TitleIDItemButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Image"

	var_4_4:setImage(RegisterMaterial("magma_upsell_button_standard"), 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Image = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "HighlightBarTop"

	var_4_6:SetAlpha(0, 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_4_0:addElement(var_4_6)

	var_4_0.HighlightBarTop = var_4_6

	local var_4_7
	local var_4_8 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_4_1
	})

	var_4_8.id = "HighlightBarBottom"

	var_4_8:SetAlpha(0, 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.HighlightBarBottom = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -18,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -18,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 18,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonOver", var_4_11)

	local var_4_12 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -20,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -18,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -18,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 18,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_12)

	local var_4_13 = {
		{
			value = 1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -18,
			easing = LUI.EASING.inQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 18,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonOver", var_4_13)

	local function var_4_14()
		var_4_4:AnimateSequence("ButtonOver")
		var_4_6:AnimateSequence("ButtonOver")
		var_4_8:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_14

	local var_4_15
	local var_4_16 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_4:RegisterAnimationSequence("ButtonUp", var_4_16)

	local var_4_17 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Top,
			easing = LUI.EASING.outQuadratic
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 2,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_17)

	local var_4_18 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Left,
			easing = LUI.EASING.outQuadratic
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Right,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_4_8:RegisterAnimationSequence("ButtonUp", var_4_18)

	local function var_4_19()
		var_4_4:AnimateSequence("ButtonUp")
		var_4_6:AnimateSequence("ButtonUp")
		var_4_8:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_19

	var_4_0:addEventHandler("button_over", function(arg_8_0, arg_8_1)
		if not arg_8_1.controller then
			local var_8_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonOver")
	end)
	var_4_0:addEventHandler("button_up", function(arg_9_0, arg_9_1)
		if not arg_9_1.controller then
			local var_9_0 = var_4_1
		end

		ACTIONS.AnimateSequence(var_4_0, "ButtonUp")
	end)
	var_0_1(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "ButtonUp")

	return var_4_0
end

MenuBuilder.registerType("TitleIDItemButton", TitleIDItemButton)
LockTable(_M)
