module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Host)

	arg_1_0._isAlternative = false

	arg_1_0.Host:SetFont(FONTS.GetFont(FONTS.BattleNetRegular.File))
	arg_1_0.Host:SetFontSize(22 * _1080p)

	local function var_1_0(arg_2_0)
		if arg_2_0._isAlternative then
			arg_2_0.Background:SetAlpha(0.3)
		else
			arg_2_0.Background:SetAlpha(0.2)
		end
	end

	local function var_1_1()
		local var_3_0 = arg_1_0:GetDataSource()

		arg_1_0._isAlternative = var_3_0 ~= nil and var_3_0.index % 2 == 0

		var_1_0(arg_1_0)
	end

	arg_1_0:SubscribeToModelThroughElement(arg_1_0, "host", var_1_1)
	arg_1_0:addEventHandler("button_action", function(arg_4_0, arg_4_1)
		local var_4_0 = arg_1_0:GetDataSource().index

		Lobby.CCIAIGDIIC(arg_1_1, var_4_0)
	end)
	arg_1_0:addEventHandler("button_over", function(arg_5_0, arg_5_1)
		arg_5_0.Background:SetAlpha(1)
	end)
	arg_1_0:addEventHandler("button_up", var_1_0)

	if IsLanguageArabic() then
		ACTIONS.AnimateSequence(arg_1_0, "AR")
	end
end

function SystemLinkJoinMenuRow(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIButton.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1150 * _1080p, 0, 37 * _1080p)

	var_6_0.id = "SystemLinkJoinMenuRow"
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

	var_6_4.id = "Background"

	var_6_4:SetRGBFromInt(0, 0)
	var_6_4:SetAlpha(0.2, 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Background = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "TextureLayer"

	var_6_6:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_6_6:SetAlpha(0.1, 0)
	var_6_6:SetPixelGridEnabled(true)
	var_6_6:SetPixelGridContrast(0.8, 0)
	var_6_6:SetPixelGridBlockWidth(2, 0)
	var_6_6:SetPixelGridBlockHeight(2, 0)
	var_6_6:SetPixelGridGutterWidth(1, 0)
	var_6_6:SetPixelGridGutterHeight(1, 0)
	var_6_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_6_0:addElement(var_6_6)

	var_6_0.TextureLayer = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIStyledText.new()

	var_6_8.id = "Host"

	var_6_8:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_6_8:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_8:SetAlignment(LUI.Alignment.Left)
	var_6_8:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_8:SetStartupDelay(1000)
	var_6_8:SetLineHoldTime(400)
	var_6_8:SetAnimMoveTime(150)
	var_6_8:SetAnimMoveSpeed(50)
	var_6_8:SetEndDelay(1000)
	var_6_8:SetCrossfadeTime(400)
	var_6_8:SetFadeInTime(300)
	var_6_8:SetFadeOutTime(300)
	var_6_8:SetMaxVisibleLines(1)
	var_6_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 15, _1080p * 255, _1080p * -11, _1080p * 11.5)

	local function var_6_9()
		local var_7_0 = var_6_0:GetDataSource().host:GetValue(var_6_1)

		if var_7_0 ~= nil then
			var_6_8:setText(var_7_0, 0)
		end
	end

	var_6_8:SubscribeToModelThroughElement(var_6_0, "host", var_6_9)
	var_6_0:addElement(var_6_8)

	var_6_0.Host = var_6_8

	local var_6_10
	local var_6_11 = LUI.UIText.new()

	var_6_11.id = "Players"

	var_6_11:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_6_11:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_11:SetAlignment(LUI.Alignment.Center)
	var_6_11:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 255, _1080p * 365, _1080p * -11.5, _1080p * 10.5)

	local function var_6_12()
		local var_8_0 = var_6_0:GetDataSource().players:GetValue(var_6_1)

		if var_8_0 ~= nil then
			var_6_11:setText(var_8_0, 0)
		end
	end

	var_6_11:SubscribeToModelThroughElement(var_6_0, "players", var_6_12)
	var_6_0:addElement(var_6_11)

	var_6_0.Players = var_6_11

	local var_6_13
	local var_6_14 = LUI.UIText.new()

	var_6_14.id = "Status"

	var_6_14:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_6_14:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_14:SetAlignment(LUI.Alignment.Center)
	var_6_14:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 400, _1080p * 590, _1080p * -11.5, _1080p * 10.5)

	local function var_6_15()
		local var_9_0 = var_6_0:GetDataSource().status:GetValue(var_6_1)

		if var_9_0 ~= nil then
			var_6_14:setText(var_9_0, 0)
		end
	end

	var_6_14:SubscribeToModelThroughElement(var_6_0, "status", var_6_15)
	var_6_0:addElement(var_6_14)

	var_6_0.Status = var_6_14

	local var_6_16
	local var_6_17 = LUI.UIStyledText.new()

	var_6_17.id = "Map"

	var_6_17:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_6_17:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_17:SetAlignment(LUI.Alignment.Center)
	var_6_17:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_6_17:SetStartupDelay(1250)
	var_6_17:SetLineHoldTime(400)
	var_6_17:SetAnimMoveTime(300)
	var_6_17:SetAnimMoveSpeed(50)
	var_6_17:SetEndDelay(1000)
	var_6_17:SetCrossfadeTime(500)
	var_6_17:SetFadeInTime(300)
	var_6_17:SetFadeOutTime(300)
	var_6_17:SetMaxVisibleLines(1)
	var_6_17:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 690, _1080p * 890, _1080p * -11.5, _1080p * 10.5)

	local function var_6_18()
		local var_10_0 = var_6_0:GetDataSource().map:GetValue(var_6_1)

		if var_10_0 ~= nil then
			var_6_17:setText(var_10_0, 0)
		end
	end

	var_6_17:SubscribeToModelThroughElement(var_6_0, "map", var_6_18)
	var_6_0:addElement(var_6_17)

	var_6_0.Map = var_6_17

	local var_6_19
	local var_6_20 = LUI.UIText.new()

	var_6_20.id = "Type"

	var_6_20:SetRGBFromTable(SWATCHES.genericMenu.featuredHeader, 0)
	var_6_20:SetFont(FONTS.GetFont(FONTS.BodyRegular.File))
	var_6_20:SetAlignment(LUI.Alignment.Right)
	var_6_20:SetAnchorsAndPosition(0, 0, 0.5, 0.5, _1080p * 890, _1080p * -10, _1080p * -11.5, _1080p * 10.5)

	local function var_6_21()
		local var_11_0 = var_6_0:GetDataSource().type:GetValue(var_6_1)

		if var_11_0 ~= nil then
			local var_11_1 = StringTable.DIFCHIGDFB(CSV.gameTypesTable.file, CSV.gameTypesTable.cols.ref, var_11_0, CSV.gameTypesTable.cols.name)
			local var_11_2 = Engine.CBBHFCGDIC(var_11_1)

			var_6_20:setText(var_11_2, 0)
		end
	end

	var_6_20:SubscribeToModelThroughElement(var_6_0, "type", var_6_21)
	var_6_0:addElement(var_6_20)

	var_6_0.Type = var_6_20

	local var_6_22
	local var_6_23 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	}
	local var_6_24 = LUI.UIBorder.new(var_6_23)

	var_6_24.id = "Highlight"

	var_6_24:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_6_24:SetAlpha(0, 0)
	var_6_24:SetBorderThicknessLeft(_1080p * 0, 0)
	var_6_24:SetBorderThicknessRight(_1080p * 0, 0)
	var_6_24:SetBorderThicknessBottom(_1080p * 0, 0)
	var_6_24:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 1150, 0, _1080p * 37)
	var_6_0:addElement(var_6_24)

	var_6_0.Highlight = var_6_24

	local function var_6_25()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_25

	local var_6_26 = {
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonOver", var_6_26)

	local var_6_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonOver", var_6_27)

	local var_6_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonOver", var_6_28)

	local var_6_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_6_14:RegisterAnimationSequence("ButtonOver", var_6_29)

	local var_6_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_6_17:RegisterAnimationSequence("ButtonOver", var_6_30)

	local var_6_31 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.Global.keyColor
		}
	}

	var_6_20:RegisterAnimationSequence("ButtonOver", var_6_31)

	local var_6_32 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_24:RegisterAnimationSequence("ButtonOver", var_6_32)

	local function var_6_33()
		var_6_6:AnimateSequence("ButtonOver")
		var_6_8:AnimateSequence("ButtonOver")
		var_6_11:AnimateSequence("ButtonOver")
		var_6_14:AnimateSequence("ButtonOver")
		var_6_17:AnimateSequence("ButtonOver")
		var_6_20:AnimateSequence("ButtonOver")
		var_6_24:AnimateSequence("ButtonOver")
	end

	var_6_0._sequences.ButtonOver = var_6_33

	local var_6_34 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.MainMenu.ButtonText
		}
	}

	var_6_6:RegisterAnimationSequence("ButtonUp", var_6_34)

	local var_6_35 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredHeader
		}
	}

	var_6_8:RegisterAnimationSequence("ButtonUp", var_6_35)

	local var_6_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredHeader
		}
	}

	var_6_11:RegisterAnimationSequence("ButtonUp", var_6_36)

	local var_6_37 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredHeader
		}
	}

	var_6_14:RegisterAnimationSequence("ButtonUp", var_6_37)

	local var_6_38 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredHeader
		}
	}

	var_6_17:RegisterAnimationSequence("ButtonUp", var_6_38)

	local var_6_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericMenu.featuredHeader
		}
	}

	var_6_20:RegisterAnimationSequence("ButtonUp", var_6_39)

	local var_6_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_24:RegisterAnimationSequence("ButtonUp", var_6_40)

	local function var_6_41()
		var_6_6:AnimateSequence("ButtonUp")
		var_6_8:AnimateSequence("ButtonUp")
		var_6_11:AnimateSequence("ButtonUp")
		var_6_14:AnimateSequence("ButtonUp")
		var_6_17:AnimateSequence("ButtonUp")
		var_6_20:AnimateSequence("ButtonUp")
		var_6_24:AnimateSequence("ButtonUp")
	end

	var_6_0._sequences.ButtonUp = var_6_41

	local var_6_42 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -10.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 19.5
		}
	}

	var_6_8:RegisterAnimationSequence("AR", var_6_42)

	local var_6_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18.5
		}
	}

	var_6_11:RegisterAnimationSequence("AR", var_6_43)

	local var_6_44 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18.5
		}
	}

	var_6_14:RegisterAnimationSequence("AR", var_6_44)

	local var_6_45 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -11.5
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18.5
		}
	}

	var_6_17:RegisterAnimationSequence("AR", var_6_45)

	local var_6_46 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 18.5
		}
	}

	var_6_20:RegisterAnimationSequence("AR", var_6_46)

	local function var_6_47()
		var_6_8:AnimateSequence("AR")
		var_6_11:AnimateSequence("AR")
		var_6_14:AnimateSequence("AR")
		var_6_17:AnimateSequence("AR")
		var_6_20:AnimateSequence("AR")
	end

	var_6_0._sequences.AR = var_6_47

	var_6_0:addEventHandler("button_over", function(arg_16_0, arg_16_1)
		if not arg_16_1.controller then
			local var_16_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonOver")
	end)
	var_6_0:addEventHandler("button_up", function(arg_17_0, arg_17_1)
		if not arg_17_1.controller then
			local var_17_0 = var_6_1
		end

		ACTIONS.AnimateSequence(var_6_0, "ButtonUp")
	end)
	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("SystemLinkJoinMenuRow", SystemLinkJoinMenuRow)
LockTable(_M)
