module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_0.squadActionButtonTimer == nil then
		arg_1_0.squadActionButtonTimer = LUI.UITimer.new({
			interval = 100,
			event = "update_squad_action"
		})
		arg_1_0.squadActionButtonTimer.id = "squadActionButtonTimer"

		arg_1_0:addElement(arg_1_0.squadActionButtonTimer)
		arg_1_0:addEventHandler("update_squad_action", function(arg_2_0, arg_2_1)
			local var_2_0 = Lobby.BJFFDBJHDD()

			arg_1_0.Choose:SetButtonDisabled(var_2_0)
			arg_1_0.Random:SetButtonDisabled(var_2_0)
		end)
	end
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	var_0_0(arg_3_0, arg_3_1)

	local var_3_0 = FRIENDS.GetWZPrivateMatchLobbySquadActions(arg_3_2)

	arg_3_0.Choose:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		var_3_0[FRIENDS.SQUAD_BUTTONS.SELECT_SQUAD].action()
	end)
	arg_3_0.Random:addEventHandler("button_action", function(arg_5_0, arg_5_1)
		var_3_0[FRIENDS.SQUAD_BUTTONS.RANDOM_SQUAD].action()
	end)
	arg_3_0.NotNow:addEventHandler("button_action", function(arg_6_0, arg_6_1)
		var_3_0[FRIENDS.SQUAD_BUTTONS.NO_SQUAD].action()
	end)
	ACTIONS.ScaleFullscreen(arg_3_0.Darkener)

	if arg_3_2.isWZPrivateMatch then
		arg_3_0:registerEventHandler("popup_active", function(arg_7_0, arg_7_1)
			if LUI.FlowManager.IsInStack("AcceptingInvite") and LUI.FlowManager.IsInStack("WarzonePrivateMatchLobby") then
				Lobby.LeaveCustomGameLobby()
				LUI.FlowManager.RequestLeaveMenu(arg_3_0, false, true)
				LUI.FlowManager.RequestLeaveMenuByName("WarzonePrivateMatchLobby", false, true)
			end
		end)
	end
end

function SquadAssignmentPopup(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIVerticalNavigator.new()

	var_8_0.id = "SquadAssignmentPopup"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = LUI.UIImage.new()

	var_8_4.id = "Darkener"

	var_8_4:SetRGBFromInt(0, 0)
	var_8_4:SetAlpha(0.8, 0)
	var_8_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -103, _1080p * 124, _1080p * -52, _1080p * 66)
	var_8_0:addElement(var_8_4)

	var_8_0.Darkener = var_8_4

	local var_8_5
	local var_8_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_8_1
	})

	var_8_6.id = "GenericPopupWindow"

	var_8_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 856, _1080p * -150, _1080p * 206)
	var_8_0:addElement(var_8_6)

	var_8_0.GenericPopupWindow = var_8_6

	local var_8_7
	local var_8_8 = LUI.UIText.new()

	var_8_8.id = "Header"

	var_8_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_8_8:setText(ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_SELECTION")), 0)
	var_8_8:SetFont(FONTS.GetFont(FONTS.MainLight.File))
	var_8_8:SetAlignment(LUI.Alignment.Left)
	var_8_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 770, _1080p * -104, _1080p * -44)
	var_8_0:addElement(var_8_8)

	var_8_0.Header = var_8_8

	local var_8_9
	local var_8_10 = LUI.UIText.new()

	var_8_10.id = "Message"

	var_8_10:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_8_10:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_SELECT_NOTE"), 0)
	var_8_10:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_8_10:SetAlignment(LUI.Alignment.Left)
	var_8_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 296, _1080p * -36, _1080p * -14)
	var_8_0:addElement(var_8_10)

	var_8_0.Message = var_8_10

	local var_8_11
	local var_8_12 = LUI.UIImage.new()

	var_8_12.id = "Image"

	var_8_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_8_12:SetAlpha(0.6, 0)
	var_8_12:setImage(RegisterMaterial("icon_warning_squad_large"), 0)
	var_8_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -757, _1080p * -431, _1080p * -135, _1080p * 191)
	var_8_0:addElement(var_8_12)

	var_8_0.Image = var_8_12

	local var_8_13
	local var_8_14 = MenuBuilder.BuildRegisteredType("ButtonHelperBar", {
		controllerIndex = var_8_1
	})

	var_8_14.id = "ButtonHelperBar"

	var_8_14.Background:SetAlpha(0, 0)
	var_8_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -854, _1080p * 854, _1080p * 210, _1080p * 270)
	var_8_0:addElement(var_8_14)

	var_8_0.ButtonHelperBar = var_8_14

	local var_8_15
	local var_8_16 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_16.id = "Choose"

	var_8_16.Text:SetLeft(_1080p * 20, 0)
	var_8_16.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/CHOOSE_YOUR_OWN"), 0)
	var_8_16.Text:SetAlignment(LUI.Alignment.Left)
	var_8_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 296, _1080p * 44, _1080p * 82)
	var_8_0:addElement(var_8_16)

	var_8_0.Choose = var_8_16

	local var_8_17
	local var_8_18 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_18.id = "Random"

	var_8_18.Text:SetLeft(_1080p * 20, 0)
	var_8_18.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/ASSIGN_RANDOM_SQUAD"), 0)
	var_8_18.Text:SetAlignment(LUI.Alignment.Left)
	var_8_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 296, _1080p * 91, _1080p * 129)
	var_8_0:addElement(var_8_18)

	var_8_0.Random = var_8_18

	local var_8_19
	local var_8_20 = MenuBuilder.BuildRegisteredType("GenericButton", {
		controllerIndex = var_8_1
	})

	var_8_20.id = "NotNow"

	var_8_20.Text:SetLeft(_1080p * 20, 0)
	var_8_20.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/NOT_NOW"), 0)
	var_8_20.Text:SetAlignment(LUI.Alignment.Left)
	var_8_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -304, _1080p * 296, _1080p * 138, _1080p * 176)
	var_8_0:addElement(var_8_20)

	var_8_0.NotNow = var_8_20

	local function var_8_21()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_21

	local var_8_22
	local var_8_23 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 663
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 701
		}
	}

	var_8_18:RegisterAnimationSequence("ConfirmOnly", var_8_23)

	local var_8_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_8_20:RegisterAnimationSequence("ConfirmOnly", var_8_24)

	local function var_8_25()
		var_8_18:AnimateSequence("ConfirmOnly")
		var_8_20:AnimateSequence("ConfirmOnly")
	end

	var_8_0._sequences.ConfirmOnly = var_8_25

	local var_8_26
	local var_8_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		}
	}

	var_8_8:RegisterAnimationSequence("AR", var_8_27)

	local var_8_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 340
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -6
		}
	}

	var_8_10:RegisterAnimationSequence("AR", var_8_28)

	local function var_8_29()
		var_8_8:AnimateSequence("AR")
		var_8_10:AnimateSequence("AR")
	end

	var_8_0._sequences.AR = var_8_29

	local var_8_30
	local var_8_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -64
		}
	}

	var_8_8:RegisterAnimationSequence("JP", var_8_31)

	local function var_8_32()
		var_8_8:AnimateSequence("JP")
	end

	var_8_0._sequences.JP = var_8_32

	var_8_20:addEventHandler("button_action", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_8_1
		end

		ACTIONS.LeaveMenu(var_8_0)
	end)

	function var_8_0.addButtonHelperFunction(arg_14_0, arg_14_1)
		arg_14_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_secondary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/BACK")
		})
		arg_14_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_8_0:addEventHandler("menu_create", var_8_0.addButtonHelperFunction)

	local var_8_33 = LUI.UIBindButton.new()

	var_8_33.id = "selfBindButton"

	var_8_0:addElement(var_8_33)

	var_8_0.bindButton = var_8_33

	var_8_0.bindButton:addEventHandler("button_secondary", function(arg_15_0, arg_15_1)
		if not arg_15_1.controller then
			local var_15_0 = var_8_1
		end

		ACTIONS.LeaveMenu(var_8_0)
	end)
	var_0_1(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("SquadAssignmentPopup", SquadAssignmentPopup)
LockTable(_M)
