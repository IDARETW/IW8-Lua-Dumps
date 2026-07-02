module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = DataSources.frontEnd.lobby.battleRoyale.fillType:GetValue(arg_1_1)

	if var_1_0 ~= nil then
		local var_1_1 = not var_1_0

		DataSources.frontEnd.lobby.battleRoyale.fillType:SetValue(arg_1_1, var_1_1)
		arg_1_0:UpdateStatus(arg_1_1)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = DataSources.frontEnd.lobby.battleRoyale.fillType:GetValue(arg_2_1)
	local var_2_1 = Lobby.CJHICGEEFD()

	if var_2_0 == nil then
		var_2_0 = var_2_1

		DataSources.frontEnd.lobby.battleRoyale.fillType:SetValue(arg_2_1, var_2_0)
	end

	if var_2_0 ~= var_2_1 then
		Lobby.DAFCJHFFAF(arg_2_1, var_2_0)
	end

	if var_2_0 then
		arg_2_0.Status:setText(Engine.CBBHFCGDIC("LUA_MENU/FILL"))
		arg_2_0.FillPip:SetAlpha(1)
		arg_2_0.DontFillPip:SetAlpha(0.2)
	else
		arg_2_0.Status:setText(Engine.CBBHFCGDIC("LUA_MENU/DONT_FILL"))
		arg_2_0.DontFillPip:SetAlpha(1)
		arg_2_0.FillPip:SetAlpha(0.2)
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.ToggleFill = var_0_0
	arg_3_0.UpdateStatus = var_0_1

	arg_3_0:registerEventHandler("button_action", function(arg_4_0, arg_4_1)
		arg_4_0:ToggleFill(arg_3_1)
	end)
	arg_3_0:UpdateStatus(arg_3_1)
end

function LobbyBattleRoyaleFillTypeButton(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIButton.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 550 * _1080p, 0, 50 * _1080p)

	var_5_0.id = "LobbyBattleRoyaleFillTypeButton"
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

	var_5_4.id = "Backer"

	var_5_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_5_4:SetAlpha(0.8, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * -3)
	var_5_0:addElement(var_5_4)

	var_5_0.Backer = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("FrameCorners", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "FrameCorners"

	var_5_6:SetRGBFromTable(SWATCHES.genericButton.brackets, 0)
	var_5_6:SetAlpha(0.7, 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 9, _1080p * -9, _1080p * 9, _1080p * -9)
	var_5_0:addElement(var_5_6)

	var_5_0.FrameCorners = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "HighlightBottom"

	var_5_8:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_8:SetAlpha(0, 0)
	var_5_8:SetAnchorsAndPosition(0, 0, 1, 0, _1080p * 3, _1080p * -3, _1080p * -7, _1080p * -3)
	var_5_0:addElement(var_5_8)

	var_5_0.HighlightBottom = var_5_8

	local var_5_9
	local var_5_10 = LUI.UIImage.new()

	var_5_10.id = "HighlightTop"

	var_5_10:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_10:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * 7)
	var_5_0:addElement(var_5_10)

	var_5_0.HighlightTop = var_5_10

	local var_5_11
	local var_5_12 = LUI.UIText.new()

	var_5_12.id = "Title"

	var_5_12:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_5_12:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/FILL_SQUAD_WITH_PLAYERS"), 0)
	var_5_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_5_12:SetWordWrap(false)
	var_5_12:SetAlignment(LUI.Alignment.Left)
	var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 16, _1080p * 166, _1080p * 14, _1080p * 38)
	var_5_0:addElement(var_5_12)

	var_5_0.Title = var_5_12

	local var_5_13
	local var_5_14 = LUI.UIImage.new()

	var_5_14.id = "DontFillPip"

	var_5_14:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -80, _1080p * -61, _1080p * 34, _1080p * 38)
	var_5_0:addElement(var_5_14)

	var_5_0.DontFillPip = var_5_14

	local var_5_15
	local var_5_16 = LUI.UIImage.new()

	var_5_16.id = "FillPip"

	var_5_16:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -59, _1080p * -40, _1080p * 34, _1080p * 38)
	var_5_0:addElement(var_5_16)

	var_5_0.FillPip = var_5_16

	local var_5_17
	local var_5_18 = LUI.UIText.new()

	var_5_18.id = "Status"

	var_5_18:setText("Dont Fill", 0)
	var_5_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_5_18:SetAlignment(LUI.Alignment.Center)
	var_5_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -118, _1080p * -16, _1080p * 13, _1080p * 31)
	var_5_0:addElement(var_5_18)

	var_5_0.Status = var_5_18

	local var_5_19
	local var_5_20 = LUI.UIImage.new()

	var_5_20.id = "Foreground"

	var_5_20:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_20:SetAlpha(0.4, 0)
	var_5_20:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 50)
	var_5_0:addElement(var_5_20)

	var_5_0.Foreground = var_5_20

	local function var_5_21()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_21

	local var_5_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("OnButtonOver", var_5_22)

	local var_5_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("OnButtonOver", var_5_23)

	local var_5_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("OnButtonOver", var_5_24)

	local function var_5_25()
		var_5_8:AnimateSequence("OnButtonOver")
		var_5_10:AnimateSequence("OnButtonOver")
		var_5_20:AnimateSequence("OnButtonOver")
	end

	var_5_0._sequences.OnButtonOver = var_5_25

	local var_5_26 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("OnButtonUp", var_5_26)

	local var_5_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_10:RegisterAnimationSequence("OnButtonUp", var_5_27)

	local var_5_28 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_20:RegisterAnimationSequence("OnButtonUp", var_5_28)

	local function var_5_29()
		var_5_8:AnimateSequence("OnButtonUp")
		var_5_10:AnimateSequence("OnButtonUp")
		var_5_20:AnimateSequence("OnButtonUp")
	end

	var_5_0._sequences.OnButtonUp = var_5_29

	local var_5_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 38
		}
	}

	var_5_12:RegisterAnimationSequence("AR", var_5_30)

	local var_5_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 7
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -114
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -12
		}
	}

	var_5_18:RegisterAnimationSequence("AR", var_5_31)

	local function var_5_32()
		var_5_12:AnimateSequence("AR")
		var_5_18:AnimateSequence("AR")
	end

	var_5_0._sequences.AR = var_5_32

	var_5_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "OnButtonOver")
	end)
	var_5_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_5_1
		end

		ACTIONS.AnimateSequence(var_5_0, "OnButtonUp")
	end)
	var_0_2(var_5_0, var_5_1, arg_5_1)

	if CONDITIONS.IsArabic(var_5_0) then
		ACTIONS.AnimateSequence(var_5_0, "AR")
	end

	return var_5_0
end

MenuBuilder.registerType("LobbyBattleRoyaleFillTypeButton", LobbyBattleRoyaleFillTypeButton)
LockTable(_M)
