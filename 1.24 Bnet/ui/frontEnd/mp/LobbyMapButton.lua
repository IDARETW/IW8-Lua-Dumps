module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0()
		local var_2_0 = DataSources.frontEnd.lobby.battleRoyale.selectedMode:GetValue(arg_1_1)
		local var_2_1 = DataSources.frontEnd.lobby.battleRoyale.fillType:GetValue(arg_1_1)
		local var_2_2 = DataSources.frontEnd.lobby.battleRoyale.selectedMode:GetValue(arg_1_1)

		if var_2_0 ~= nil and var_2_1 ~= nil and var_2_2 ~= nil then
			local var_2_3 = Engine.CBBHFCGDIC(Lobby.BRLobbyPlaylistTitle[var_2_2])
			local var_2_4

			if var_2_1 then
				var_2_4 = Engine.CBBHFCGDIC("LUA_MENU/FILL")
			else
				var_2_4 = Engine.CBBHFCGDIC("LUA_MENU/DONT_FILL")
			end

			arg_1_0.Squads:setText(var_2_3 .. " ( " .. var_2_4 .. " )")
		end
	end

	arg_1_0:SubscribeToModel(DataSources.frontEnd.lobby.battleRoyale.fillType:GetModel(arg_1_1), var_1_0)
	arg_1_0:SubscribeToModel(DataSources.frontEnd.lobby.battleRoyale.selectedMode:GetModel(arg_1_1), var_1_0)
	var_1_0()
end

function LobbyMapButton(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIButton.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 300 * _1080p, 0, 150 * _1080p)

	var_3_0.id = "LobbyMapButton"
	var_3_0._animationSets = {}
	var_3_0._sequences = {}

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0
	local var_3_3
	local var_3_4 = LUI.UIImage.new()

	var_3_4.id = "MapImage"

	var_3_4:SetRGBFromInt(14211288, 0)

	local function var_3_5()
		local var_4_0 = DataSources.frontEnd.lobby.mapImage:GetValue(var_3_1)

		if var_4_0 ~= nil then
			var_3_4:setImage(RegisterMaterial(var_4_0), 0)
		end
	end

	local var_3_6 = DataSources.frontEnd.lobby.mapImage

	var_3_4:SubscribeToModel(var_3_6:GetModel(var_3_1), var_3_5)
	var_3_0:addElement(var_3_4)

	var_3_0.MapImage = var_3_4

	local var_3_7
	local var_3_8 = LUI.UIImage.new()

	var_3_8.id = "TitleBackground"

	var_3_8:SetRGBFromInt(0, 0)
	var_3_8:SetAlpha(0.7, 0)
	var_3_8:setImage(RegisterMaterial("widg_gradient_top_to_bottom"), 0)
	var_3_8:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, 0, _1080p * -60)
	var_3_0:addElement(var_3_8)

	var_3_0.TitleBackground = var_3_8

	local var_3_9
	local var_3_10 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_3_11 = LUI.UIBorder.new(var_3_10)

	var_3_11.id = "Border"

	var_3_11:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_3_0:addElement(var_3_11)

	var_3_0.Border = var_3_11

	local var_3_12
	local var_3_13 = LUI.UIStyledText.new()

	var_3_13.id = "Squads"

	var_3_13:SetRGBFromTable(SWATCHES.CAC.panelText, 0)
	var_3_13:setText("Squads (No fill )", 0)
	var_3_13:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_3_13:SetAlignment(LUI.Alignment.Left)
	var_3_13:SetOutlineMinDistance(0.03, 0)
	var_3_13:SetOutlineMaxDistance(0.03, 0)
	var_3_13:SetOutlineRGBFromInt(0, 0)
	var_3_13:SetAnchorsAndPosition(1, 0, 1, 0, _1080p * -294, _1080p * -9, _1080p * -30, _1080p * -12)
	var_3_0:addElement(var_3_13)

	var_3_0.Squads = var_3_13

	local var_3_14
	local var_3_15 = LUI.UIImage.new()

	var_3_15.id = "Foreground"

	var_3_15:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_3_15:SetAlpha(0.4, 0)
	var_3_0:addElement(var_3_15)

	var_3_0.Foreground = var_3_15

	local var_3_16
	local var_3_17 = LUI.UIImage.new()

	var_3_17.id = "Lock"

	var_3_17:SetAlpha(0, 0)
	var_3_17:setImage(RegisterMaterial("cp_wepbuild_lock"), 0)
	var_3_17:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 101, _1080p * 141, _1080p * 25, _1080p * 65)
	var_3_0:addElement(var_3_17)

	var_3_0.Lock = var_3_17

	local var_3_18
	local var_3_19 = LUI.UIImage.new()

	var_3_19.id = "HighlightTop"

	var_3_19:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_19:SetAlpha(0, 0)
	var_3_19:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -3, _1080p * 3, _1080p * 7)
	var_3_0:addElement(var_3_19)

	var_3_0.HighlightTop = var_3_19

	local var_3_20
	local var_3_21 = LUI.UIImage.new()

	var_3_21.id = "HighlighBottom"

	var_3_21:SetRGBFromTable(SWATCHES.Global.keyColor, 0)
	var_3_21:SetAlpha(0, 0)
	var_3_21:SetAnchorsAndPosition(0, 0, 0, 1, _1080p * 3, _1080p * -3, _1080p * 142, _1080p * 146)
	var_3_0:addElement(var_3_21)

	var_3_0.HighlighBottom = var_3_21

	local function var_3_22()
		return
	end

	var_3_0._sequences.DefaultSequence = var_3_22

	local var_3_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("ButtonOver", var_3_23)

	local var_3_24 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("ButtonOver", var_3_24)

	local var_3_25 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("ButtonOver", var_3_25)

	local var_3_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("ButtonOver", var_3_26)

	local function var_3_27()
		var_3_15:AnimateSequence("ButtonOver")
		var_3_17:AnimateSequence("ButtonOver")
		var_3_19:AnimateSequence("ButtonOver")
		var_3_21:AnimateSequence("ButtonOver")
	end

	var_3_0._sequences.ButtonOver = var_3_27

	local var_3_28 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("ButtonUp", var_3_28)

	local var_3_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("ButtonUp", var_3_29)

	local var_3_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("ButtonUp", var_3_30)

	local var_3_31 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("ButtonUp", var_3_31)

	local function var_3_32()
		var_3_15:AnimateSequence("ButtonUp")
		var_3_17:AnimateSequence("ButtonUp")
		var_3_19:AnimateSequence("ButtonUp")
		var_3_21:AnimateSequence("ButtonUp")
	end

	var_3_0._sequences.ButtonUp = var_3_32

	local var_3_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		}
	}

	var_3_13:RegisterAnimationSequence("ButtonOverDisabled", var_3_33)

	local var_3_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("ButtonOverDisabled", var_3_34)

	local var_3_35 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("ButtonOverDisabled", var_3_35)

	local var_3_36 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("ButtonOverDisabled", var_3_36)

	local var_3_37 = {
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("ButtonOverDisabled", var_3_37)

	local function var_3_38()
		var_3_13:AnimateSequence("ButtonOverDisabled")
		var_3_15:AnimateSequence("ButtonOverDisabled")
		var_3_17:AnimateSequence("ButtonOverDisabled")
		var_3_19:AnimateSequence("ButtonOverDisabled")
		var_3_21:AnimateSequence("ButtonOverDisabled")
	end

	var_3_0._sequences.ButtonOverDisabled = var_3_38

	local var_3_39 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.text.secondaryText
		}
	}

	var_3_13:RegisterAnimationSequence("ButtonUpDisabled", var_3_39)

	local var_3_40 = {
		{
			value = 0.4,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_15:RegisterAnimationSequence("ButtonUpDisabled", var_3_40)

	local var_3_41 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_17:RegisterAnimationSequence("ButtonUpDisabled", var_3_41)

	local var_3_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_19:RegisterAnimationSequence("ButtonUpDisabled", var_3_42)

	local var_3_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_3_21:RegisterAnimationSequence("ButtonUpDisabled", var_3_43)

	local function var_3_44()
		var_3_13:AnimateSequence("ButtonUpDisabled")
		var_3_15:AnimateSequence("ButtonUpDisabled")
		var_3_17:AnimateSequence("ButtonUpDisabled")
		var_3_19:AnimateSequence("ButtonUpDisabled")
		var_3_21:AnimateSequence("ButtonUpDisabled")
	end

	var_3_0._sequences.ButtonUpDisabled = var_3_44

	var_3_0:addEventHandler("button_over", function(arg_10_0, arg_10_1)
		if not arg_10_1.controller then
			local var_10_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOver")
	end)
	var_3_0:addEventHandler("button_up", function(arg_11_0, arg_11_1)
		if not arg_11_1.controller then
			local var_11_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUp")
	end)
	var_3_0:addEventHandler("button_disable", function(arg_12_0, arg_12_1)
		if not arg_12_1.controller then
			local var_12_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonUpDisabled")
	end)
	var_3_0:addEventHandler("button_over_disable", function(arg_13_0, arg_13_1)
		if not arg_13_1.controller then
			local var_13_0 = var_3_1
		end

		ACTIONS.AnimateSequence(var_3_0, "ButtonOverDisabled")
	end)
	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("LobbyMapButton", LobbyMapButton)
LockTable(_M)
