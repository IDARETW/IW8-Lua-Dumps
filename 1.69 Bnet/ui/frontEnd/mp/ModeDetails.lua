module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_2 then
		arg_1_0.EquippedWidget:SetAlpha(1)
		ACTIONS.AnimateSequence(arg_1_0.EquippedWidget, "TurnOn")
	else
		arg_1_0.EquippedWidget:SetAlpha(0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_1 then
		ACTIONS.AnimateSequence(arg_2_0, "ShowIcon")
	else
		ACTIONS.AnimateSequence(arg_2_0, "HideIcon")
	end

	arg_2_0._isIconShown = arg_2_1
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	assert(arg_3_0.GenericItemInfo, "WARNING: Map Detail Items Are Missing")

	arg_3_0.ShowIcon = var_0_1
	arg_3_0.SetupSelectedIndicator = var_0_0
	arg_3_0._isIconShown = true

	local var_3_0 = arg_3_0.GenericItemInfo

	function arg_3_0.SetMode(arg_4_0, arg_4_1, arg_4_2)
		var_3_0.BodyText:setText(arg_4_1.desc)

		if arg_4_1.image then
			if arg_4_1.CDLImage and arg_4_2 == Lobby.gameModeCategories.CWL then
				var_3_0.HeaderText:setText(ToUpperCase(Engine.CBBHFCGDIC(arg_4_1.CDLName)))
				arg_4_0.Icon:setImage(arg_4_1.CDLImage)
			else
				var_3_0.HeaderText:setText(ToUpperCase(arg_4_1.name))
				arg_4_0.Icon:setImage(arg_4_1.image)
			end
		end

		if CONDITIONS.IsWZPrivateMatchEnabled(arg_4_0) then
			if arg_4_1.privatePlayerCount and #arg_4_1.privatePlayerCount > 0 and arg_4_0.PlayerCountValue then
				arg_4_0.PlayerCountIcon:SetAlpha(1)
				arg_4_0.PlayerCountLabel:SetAlpha(1)
				arg_4_0.PlayerCountValue:SetAlpha(1)
				arg_4_0.PlayerCountValue:setText(arg_4_1.privatePlayerCount)
			else
				arg_4_0.PlayerCountIcon:SetAlpha(0)
				arg_4_0.PlayerCountLabel:SetAlpha(0)
				arg_4_0.PlayerCountValue:SetAlpha(0)
			end

			if arg_4_1.privateSquadSize and #arg_4_1.privateSquadSize > 0 and arg_4_0.SquadSizeValue then
				arg_4_0.SquadSizeIcon:SetAlpha(1)
				arg_4_0.SquadSizeLabel:SetAlpha(1)
				arg_4_0.SquadSizeValue:SetAlpha(1)
				arg_4_0.SquadSizeValue:setText(arg_4_1.privateSquadSize)
			else
				arg_4_0.SquadSizeIcon:SetAlpha(0)
				arg_4_0.SquadSizeLabel:SetAlpha(0)
				arg_4_0.SquadSizeValue:SetAlpha(0)
			end
		end

		ACTIONS.AnimateSequence(arg_4_0, "Update")
	end
end

function ModeDetails(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 820 * _1080p, 0, 300 * _1080p)

	var_5_0.id = "ModeDetails"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = MenuBuilder.BuildRegisteredType("DoubleNotchedBacker", {
		controllerIndex = var_5_1
	})

	var_5_4.id = "DoubleNotchedBacker"

	var_5_4:SetAlpha(0.5, 0)
	var_5_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.DoubleNotchedBacker = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("GenericItemInfo", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "GenericItemInfo"

	var_5_6.BodyText:setText("", 0)
	var_5_6.HeaderText:setText(ToUpperCase(""), 0)
	var_5_6:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 192, _1080p * -30, _1080p * 27, _1080p * 159)
	var_5_0:addElement(var_5_6)

	var_5_0.GenericItemInfo = var_5_6

	local var_5_7
	local var_5_8 = LUI.UIImage.new()

	var_5_8.id = "Icon"

	var_5_8:setImage(RegisterMaterial("gamemode_generic"), 0)
	var_5_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 173, _1080p * 27, _1080p * 173)
	var_5_0:addElement(var_5_8)

	var_5_0.Icon = var_5_8

	local var_5_9
	local var_5_10 = MenuBuilder.BuildRegisteredType("EquippedWidget", {
		controllerIndex = var_5_1
	})

	var_5_10.id = "EquippedWidget"

	var_5_10:SetAlpha(0, 0)
	var_5_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 25, _1080p * 161, _1080p * 217, _1080p * 247)
	var_5_0:addElement(var_5_10)

	var_5_0.EquippedWidget = var_5_10

	local var_5_11

	if CONDITIONS.IsWZPrivateMatchEnabled(var_5_0) then
		local var_5_12 = LUI.UIImage.new()

		var_5_12.id = "PlayerCountIcon"

		var_5_12:SetAlpha(0, 0)
		var_5_12:setImage(RegisterMaterial("icon_playlist_players"), 0)
		var_5_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 9, _1080p * 73, _1080p * 186, _1080p * 250)
		var_5_0:addElement(var_5_12)

		var_5_0.PlayerCountIcon = var_5_12
	end

	local var_5_13

	if CONDITIONS.IsWZPrivateMatchEnabled(var_5_0) then
		local var_5_14 = LUI.UIText.new()

		var_5_14.id = "PlayerCountLabel"

		var_5_14:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_5_14:SetAlpha(0, 0)
		var_5_14:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/PLAYERS"), 0)
		var_5_14:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_5_14:SetAlignment(LUI.Alignment.Left)
		var_5_14:SetOptOutRightToLeftAlignmentFlip(true)
		var_5_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 73, _1080p * 237, _1080p * 196, _1080p * 216)
		var_5_0:addElement(var_5_14)

		var_5_0.PlayerCountLabel = var_5_14
	end

	local var_5_15

	if CONDITIONS.IsWZPrivateMatchEnabled(var_5_0) then
		local var_5_16 = LUI.UIText.new()

		var_5_16.id = "PlayerCountValue"

		var_5_16:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_5_16:SetAlpha(0, 0)
		var_5_16:setText("", 0)
		var_5_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_5_16:SetAlignment(LUI.Alignment.Left)
		var_5_16:SetOptOutRightToLeftAlignmentFlip(true)
		var_5_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 73, _1080p * 237, _1080p * 222, _1080p * 242)
		var_5_0:addElement(var_5_16)

		var_5_0.PlayerCountValue = var_5_16
	end

	local var_5_17

	if CONDITIONS.IsWZPrivateMatchEnabled(var_5_0) then
		local var_5_18 = LUI.UIImage.new()

		var_5_18.id = "SquadSizeIcon"

		var_5_18:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_5_18:SetAlpha(0, 0)
		var_5_18:setImage(RegisterMaterial("icon_playlist_team"), 0)
		var_5_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 237, _1080p * 301, _1080p * 186, _1080p * 250)
		var_5_0:addElement(var_5_18)

		var_5_0.SquadSizeIcon = var_5_18
	end

	local var_5_19

	if CONDITIONS.IsWZPrivateMatchEnabled(var_5_0) then
		local var_5_20 = LUI.UIText.new()

		var_5_20.id = "SquadSizeLabel"

		var_5_20:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_5_20:SetAlpha(0, 0)
		var_5_20:setText(Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_SIZE"), 0)
		var_5_20:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_5_20:SetAlignment(LUI.Alignment.Left)
		var_5_20:SetOptOutRightToLeftAlignmentFlip(true)
		var_5_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 301, _1080p * 465, _1080p * 196, _1080p * 216)
		var_5_0:addElement(var_5_20)

		var_5_0.SquadSizeLabel = var_5_20
	end

	local var_5_21

	if CONDITIONS.IsWZPrivateMatchEnabled(var_5_0) then
		local var_5_22 = LUI.UIText.new()

		var_5_22.id = "SquadSizeValue"

		var_5_22:SetRGBFromTable(SWATCHES.genericButton.description, 0)
		var_5_22:SetAlpha(0, 0)
		var_5_22:setText("", 0)
		var_5_22:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_5_22:SetAlignment(LUI.Alignment.Left)
		var_5_22:SetOptOutRightToLeftAlignmentFlip(true)
		var_5_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 301, _1080p * 465, _1080p * 222, _1080p * 242)
		var_5_0:addElement(var_5_22)

		var_5_0.SquadSizeValue = var_5_22
	end

	local function var_5_23()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_23

	local var_5_24
	local var_5_25 = {
		{
			value = -0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.outBack
		}
	}

	var_5_8:RegisterAnimationSequence("Update", var_5_25)

	local function var_5_26()
		var_5_8:AnimateSequence("Update")
	end

	var_5_0._sequences.Update = var_5_26

	local var_5_27
	local var_5_28 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 27
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -195
		}
	}

	var_5_6:RegisterAnimationSequence("HideIcon", var_5_28)

	local var_5_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("HideIcon", var_5_29)

	local function var_5_30()
		var_5_6:AnimateSequence("HideIcon")
		var_5_8:AnimateSequence("HideIcon")
	end

	var_5_0._sequences.HideIcon = var_5_30

	local var_5_31
	local var_5_32 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 197
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -25
		}
	}

	var_5_6:RegisterAnimationSequence("ShowIcon", var_5_32)

	local var_5_33 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_8:RegisterAnimationSequence("ShowIcon", var_5_33)

	local function var_5_34()
		var_5_6:AnimateSequence("ShowIcon")
		var_5_8:AnimateSequence("ShowIcon")
	end

	var_5_0._sequences.ShowIcon = var_5_34

	var_0_2(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("ModeDetails", ModeDetails)
LockTable(_M)
