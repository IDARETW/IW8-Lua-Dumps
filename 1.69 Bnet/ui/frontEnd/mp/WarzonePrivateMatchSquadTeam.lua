module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if (arg_1_0._buttonState == nil or arg_1_0._buttonState ~= arg_1_2) and arg_1_0._squadTeamData then
		if arg_1_2 then
			arg_1_0._buttonState = arg_1_2
		end

		local var_1_0 = ""
		local var_1_1 = arg_1_0._squadTeamData:GetSquadState()

		if arg_1_0._buttonState == "button_up" or arg_1_0._buttonState == "button_disable" then
			arg_1_0.SquadNumber:SetFont(FONTS.GetFont(FONTS.MainRegular.File))

			if var_1_1 == SQUAD.SquadState.FULL then
				var_1_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_FULL")
			else
				var_1_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/SLOTS_AVAILABLE")
			end
		elseif arg_1_0._buttonState == "button_over" or arg_1_0._buttonState == "button_over_disable" then
			arg_1_0.SquadNumber:SetFont(FONTS.GetFont(FONTS.MainBold.File))

			if var_1_1 == SQUAD.SquadState.FULL then
				var_1_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_FULL")
			else
				var_1_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/JOIN_SQUAD_PROMPT")
			end
		elseif arg_1_0._buttonState == nil then
			if var_1_1 == SQUAD.SquadState.FULL then
				var_1_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_FULL")
			else
				var_1_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/SLOTS_AVAILABLE")
			end
		end

		if arg_1_0._buttonState == "button_over" then
			arg_1_0.StateText:SetRGBFromTable(SWATCHES.genericButton.textFocus)
		else
			arg_1_0.StateText:SetRGBFromTable(SWATCHES.genericButton.textDefault)
		end

		if arg_1_0._isMyPlayerInSquad then
			var_1_0 = ToUpperCase(Engine.CBBHFCGDIC("LUA_MENU_MP/YOUR_SQUAD"))

			if arg_1_0._buttonState == "button_over" then
				arg_1_0.StateText:SetRGBFromTable(arg_1_0._isMyPlayerInSquad and SWATCHES.Scoreboard.highlight or SWATCHES.genericButton.textFocus)
			elseif arg_1_0._buttonState == "button_up" then
				arg_1_0.StateText:SetRGBFromTable(arg_1_0._isMyPlayerInSquad and SWATCHES.Scoreboard.highlight or SWATCHES.genericButton.textDefault)
			end
		end

		arg_1_0.StateText:setText(var_1_0)
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0._squadTeamData then
		if arg_2_0._squadTeamData:GetSquadState() == SQUAD.SquadState.FULL then
			ACTIONS.AnimateSequence(arg_2_0, "SquadFull")
			arg_2_0:SetButtonDisabled(true)
		else
			ACTIONS.AnimateSequence(arg_2_0, "SquadNotFull")
			arg_2_0:SetButtonDisabled(false)
		end

		if arg_2_0._isMyPlayerInSquad then
			ACTIONS.AnimateSequence(arg_2_0, "PlayerInSquad")
		else
			ACTIONS.AnimateSequence(arg_2_0, "PlayerNotInSquad")
		end
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._squadTeamData = arg_3_2
	arg_3_0._isMyPlayerInSquad = arg_3_0._squadTeamData:IsPlayerInSquad()

	local var_3_0 = Engine.CBBHFCGDIC("LUA_MENU_MP/SQUAD_INDEX", arg_3_2.squadIndex)
	local var_3_1 = Engine.CBBHFCGDIC("LUA_MENU_MP/PROGRESS_TOTAL", arg_3_2:GetAvailableSize(), arg_3_2.fullSize)

	arg_3_0.SquadNumber:setText(var_3_0)
	arg_3_0.SquadSize:setText(var_3_1)
	var_0_0(arg_3_0, arg_3_1, nil)
	var_0_1(arg_3_0, arg_3_1)

	local var_3_2 = arg_3_2.memberList

	arg_3_0.SquadMemberGrid:SetNumChildren(#var_3_2)
	arg_3_0.SquadMemberGrid:SetRefreshChild(function(arg_4_0, arg_4_1, arg_4_2)
		local var_4_0 = arg_3_0.SquadMemberGrid:GetContentIndex(arg_4_1, arg_4_2, {
			relativePosition = false
		})
		local var_4_1 = arg_3_2.memberList[var_4_0 + 1]

		arg_4_0:SetupSquadMember(arg_3_1, var_4_1)
	end)
	arg_3_0.SquadMemberGrid:SetDirectionalInputEnabled(false)
	arg_3_0.SquadMemberGrid:SetMouseFocusBlocker(true)
end

local function var_0_3(arg_5_0, arg_5_1)
	arg_5_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		SQUAD.RefreshAnimation(arg_6_0, "ButtonOver")
		var_0_0(arg_5_0, arg_5_1, "button_over")
		arg_5_0.StateText:SetAlpha(1)
	end)
	arg_5_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		SQUAD.RefreshAnimation(arg_7_0, "ButtonUp")
		var_0_0(arg_5_0, arg_5_1, "button_up")
		arg_5_0.StateText:SetAlpha(arg_5_0._isMyPlayerInSquad and 0.6 or 1)
	end)
	arg_5_0:addEventHandler("button_disable", function(arg_8_0, arg_8_1)
		SQUAD.RefreshAnimation(arg_8_0, "ButtonDisabled")
		var_0_0(arg_5_0, arg_5_1, "button_disable")
	end)
	arg_5_0:addEventHandler("button_over_disable", function(arg_9_0, arg_9_1)
		SQUAD.RefreshAnimation(arg_9_0, "ButtonOverDisabled")
		var_0_0(arg_5_0, arg_5_1, "button_over_disable")
	end)
	arg_5_0:addEventHandler("button_action", function(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_0:getParent()

		while var_10_0 ~= nil and var_10_0.id ~= "WarzonePrivateMatchSquadMenu" do
			var_10_0 = var_10_0:getParent()
		end

		if var_10_0 then
			SQUAD.ProcessJoinSquadAction(arg_5_1, {
				squadTeamData = arg_5_0._squadTeamData,
				menu = var_10_0
			})
		end
	end)
end

local function var_0_4(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.SetupSquadTeam = var_0_2

	var_0_3(arg_11_0, arg_11_1)
end

function WarzonePrivateMatchSquadTeam(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIButton.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 450 * _1080p, 0, 280 * _1080p)

	var_12_0.id = "WarzonePrivateMatchSquadTeam"
	var_12_0._animationSets = var_12_0._animationSets or {}
	var_12_0._sequences = var_12_0._sequences or {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0

	var_12_0:SetButtonDisabled(true)

	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Backer"

	var_12_4:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_12_4:SetAlpha(0.5, 0)
	var_12_0:addElement(var_12_4)

	var_12_0.Backer = var_12_4

	local var_12_5
	local var_12_6 = LUI.UIImage.new()

	var_12_6.id = "TextureLayer"

	var_12_6:SetRGBFromTable(SWATCHES.genericButton.textureUnFocused, 0)
	var_12_6:SetAlpha(0.1, 0)
	var_12_6:SetPixelGridEnabled(true)
	var_12_6:SetPixelGridContrast(0.8, 0)
	var_12_6:SetPixelGridBlockWidth(2, 0)
	var_12_6:SetPixelGridBlockHeight(2, 0)
	var_12_6:SetPixelGridGutterWidth(1, 0)
	var_12_6:SetPixelGridGutterHeight(1, 0)
	var_12_6:setImage(RegisterMaterial("ui_default_white"), 0)
	var_12_0:addElement(var_12_6)

	var_12_0.TextureLayer = var_12_6

	local var_12_7
	local var_12_8 = LUI.UIImage.new()

	var_12_8.id = "Gradient"

	var_12_8:SetRGBFromTable(SWATCHES.Global.keyColorMid, 0)
	var_12_8:SetAlpha(0, 0)
	var_12_8:SetPixelGridEnabled(true)
	var_12_8:SetPixelGridContrast(0.2, 0)
	var_12_8:SetPixelGridBlockWidth(2, 0)
	var_12_8:SetPixelGridBlockHeight(2, 0)
	var_12_8:SetPixelGridGutterWidth(1, 0)
	var_12_8:SetPixelGridGutterHeight(1, 0)
	var_12_8:setImage(RegisterMaterial("widg_gradient_bottom_to_top"), 0)
	var_12_0:addElement(var_12_8)

	var_12_0.Gradient = var_12_8

	local var_12_9
	local var_12_10 = LUI.UIImage.new()

	var_12_10.id = "TextBacker"

	var_12_10:SetRGBFromTable(SWATCHES.genericButton.background, 0)
	var_12_10:SetAlpha(0.45, 0)
	var_12_10:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -32, 0)
	var_12_0:addElement(var_12_10)

	var_12_0.TextBacker = var_12_10

	local var_12_11
	local var_12_12 = LUI.UIText.new()

	var_12_12.id = "StateText"

	var_12_12:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_12_12:setText("", 0)
	var_12_12:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_12:SetAlignment(LUI.Alignment.Center)
	var_12_12:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -28, _1080p * -4)
	var_12_0:addElement(var_12_12)

	var_12_0.StateText = var_12_12

	local var_12_13
	local var_12_14 = LUI.UIImage.new()

	var_12_14.id = "LockIcon"

	var_12_14:SetRGBFromTable(SWATCHES.genericMenu.locked, 0)
	var_12_14:setImage(RegisterMaterial("icon_lock"), 0)
	var_12_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 108, _1080p * 132, _1080p * 252, _1080p * 276)
	var_12_0:addElement(var_12_14)

	var_12_0.LockIcon = var_12_14

	local var_12_15
	local var_12_16 = LUI.UIStyledText.new()

	var_12_16.id = "SquadNumber"

	var_12_16:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
	var_12_16:setText("", 0)
	var_12_16:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_16:SetAlignment(LUI.Alignment.Left)
	var_12_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 10, _1080p * 190, _1080p * 10, _1080p * 34)
	var_12_0:addElement(var_12_16)

	var_12_0.SquadNumber = var_12_16

	local var_12_17
	local var_12_18 = LUI.UIText.new()

	var_12_18.id = "SquadSize"

	var_12_18:SetRGBFromTable(SWATCHES.genericButton.warzoneDescription, 0)
	var_12_18:SetAlpha(0.6, 0)
	var_12_18:setText("", 0)
	var_12_18:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_18:SetAlignment(LUI.Alignment.Right)
	var_12_18:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -190, _1080p * -10, _1080p * 14, _1080p * 32)
	var_12_0:addElement(var_12_18)

	var_12_0.SquadSize = var_12_18

	local var_12_19
	local var_12_20 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		forcePrimaryAxisScrolling = true,
		springCoefficient = 400,
		controllerIndex = var_12_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("WarzonePrivateMatchSquadTeamMember", {
				controllerIndex = var_12_1
			})
		end,
		refreshChild = function(arg_14_0, arg_14_1, arg_14_2)
			return
		end,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 450,
		rowHeight = _1080p * 38,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_12_21 = LUI.UIGrid.new(var_12_20)

	var_12_21.id = "SquadMemberGrid"

	var_12_21:SetAlpha(0.6, 0)
	var_12_21:setUseStencil(true)
	var_12_21:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 450, _1080p * 44, _1080p * 241)
	var_12_0:addElement(var_12_21)

	var_12_0.SquadMemberGrid = var_12_21

	local var_12_22
	local var_12_23 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_12_1
	})

	var_12_23.id = "HighlightTop"

	var_12_23:SetAlpha(0, 0)
	var_12_23:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, _1080p * 2)
	var_12_0:addElement(var_12_23)

	var_12_0.HighlightTop = var_12_23

	local var_12_24
	local var_12_25 = MenuBuilder.BuildRegisteredType("ButtonHighlightBar", {
		controllerIndex = var_12_1
	})

	var_12_25.id = "HighlightBottom"

	var_12_25:SetAlpha(0, 0)
	var_12_25:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * -2, 0)
	var_12_0:addElement(var_12_25)

	var_12_0.HighlightBottom = var_12_25

	local function var_12_26()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_26

	local var_12_27
	local var_12_28 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonOver", var_12_28)

	local var_12_29 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOver", var_12_29)

	local var_12_30 = {
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOver", var_12_30)

	local var_12_31 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOver", var_12_31)

	local var_12_32 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus
		},
		{
			value = -0.6,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Shadow_Color,
			value = SWATCHES.genericButton.textFocus
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOver", var_12_32)

	local var_12_33 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ButtonOver", var_12_33)

	local var_12_34 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_21:RegisterAnimationSequence("ButtonOver", var_12_34)

	local var_12_35 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_23:RegisterAnimationSequence("ButtonOver", var_12_35)

	local var_12_36 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_25:RegisterAnimationSequence("ButtonOver", var_12_36)

	local function var_12_37()
		var_12_4:AnimateSequence("ButtonOver")
		var_12_6:AnimateSequence("ButtonOver")
		var_12_8:AnimateSequence("ButtonOver")
		var_12_12:AnimateSequence("ButtonOver")
		var_12_16:AnimateSequence("ButtonOver")
		var_12_18:AnimateSequence("ButtonOver")
		var_12_21:AnimateSequence("ButtonOver")
		var_12_23:AnimateSequence("ButtonOver")
		var_12_25:AnimateSequence("ButtonOver")
	end

	var_12_0._sequences.ButtonOver = var_12_37

	local var_12_38
	local var_12_39 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("ButtonUp", var_12_39)

	local var_12_40 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 0.1,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textureUnFocused
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonUp", var_12_40)

	local var_12_41 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonUp", var_12_41)

	local var_12_42 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonUp", var_12_42)

	local var_12_43 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.warzoneTextDefault
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Min_Distance
		},
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Text_Style_Shadow_Max_Distance
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDefault
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonUp", var_12_43)

	local var_12_44 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description
		},
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ButtonUp", var_12_44)

	local var_12_45 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_21:RegisterAnimationSequence("ButtonUp", var_12_45)

	local var_12_46 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_23:RegisterAnimationSequence("ButtonUp", var_12_46)

	local var_12_47 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_25:RegisterAnimationSequence("ButtonUp", var_12_47)

	local function var_12_48()
		var_12_4:AnimateSequence("ButtonUp")
		var_12_6:AnimateSequence("ButtonUp")
		var_12_8:AnimateSequence("ButtonUp")
		var_12_12:AnimateSequence("ButtonUp")
		var_12_16:AnimateSequence("ButtonUp")
		var_12_18:AnimateSequence("ButtonUp")
		var_12_21:AnimateSequence("ButtonUp")
		var_12_23:AnimateSequence("ButtonUp")
		var_12_25:AnimateSequence("ButtonUp")
	end

	var_12_0._sequences.ButtonUp = var_12_48

	local function var_12_49()
		return
	end

	var_12_0._sequences.PlayerInSquad = var_12_49

	local function var_12_50()
		return
	end

	var_12_0._sequences.PlayerNotInSquad = var_12_50

	local var_12_51
	local var_12_52 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("SquadFull", var_12_52)

	local function var_12_53()
		var_12_14:AnimateSequence("SquadFull")
	end

	var_12_0._sequences.SquadFull = var_12_53

	local var_12_54
	local var_12_55 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_14:RegisterAnimationSequence("SquadNotFull", var_12_55)

	local function var_12_56()
		var_12_14:AnimateSequence("SquadNotFull")
	end

	var_12_0._sequences.SquadNotFull = var_12_56

	local var_12_57
	local var_12_58 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("ui_default_white")
		},
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonDisabled", var_12_58)

	local var_12_59 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonDisabled", var_12_59)

	local var_12_60 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonDisabled", var_12_60)

	local var_12_61 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonDisabled", var_12_61)

	local var_12_62 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ButtonDisabled", var_12_62)

	local var_12_63 = {
		{
			value = 0.6,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_21:RegisterAnimationSequence("ButtonDisabled", var_12_63)

	local var_12_64 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_23:RegisterAnimationSequence("ButtonDisabled", var_12_64)

	local var_12_65 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_25:RegisterAnimationSequence("ButtonDisabled", var_12_65)

	local function var_12_66()
		var_12_6:AnimateSequence("ButtonDisabled")
		var_12_8:AnimateSequence("ButtonDisabled")
		var_12_12:AnimateSequence("ButtonDisabled")
		var_12_16:AnimateSequence("ButtonDisabled")
		var_12_18:AnimateSequence("ButtonDisabled")
		var_12_21:AnimateSequence("ButtonDisabled")
		var_12_23:AnimateSequence("ButtonDisabled")
		var_12_25:AnimateSequence("ButtonDisabled")
	end

	var_12_0._sequences.ButtonDisabled = var_12_66

	local var_12_67
	local var_12_68 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			value = 0.3,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("widg_gradient_center_out")
		}
	}

	var_12_6:RegisterAnimationSequence("ButtonOverDisabled", var_12_68)

	local var_12_69 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		},
		{
			value = 0.3,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_8:RegisterAnimationSequence("ButtonOverDisabled", var_12_69)

	local var_12_70 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_12_12:RegisterAnimationSequence("ButtonOverDisabled", var_12_70)

	local var_12_71 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textDisabled
		}
	}

	var_12_16:RegisterAnimationSequence("ButtonOverDisabled", var_12_71)

	local var_12_72 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_18:RegisterAnimationSequence("ButtonOverDisabled", var_12_72)

	local var_12_73 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_21:RegisterAnimationSequence("ButtonOverDisabled", var_12_73)

	local var_12_74 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_23:RegisterAnimationSequence("ButtonOverDisabled", var_12_74)

	local var_12_75 = {
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_25:RegisterAnimationSequence("ButtonOverDisabled", var_12_75)

	local function var_12_76()
		var_12_6:AnimateSequence("ButtonOverDisabled")
		var_12_8:AnimateSequence("ButtonOverDisabled")
		var_12_12:AnimateSequence("ButtonOverDisabled")
		var_12_16:AnimateSequence("ButtonOverDisabled")
		var_12_18:AnimateSequence("ButtonOverDisabled")
		var_12_21:AnimateSequence("ButtonOverDisabled")
		var_12_23:AnimateSequence("ButtonOverDisabled")
		var_12_25:AnimateSequence("ButtonOverDisabled")
	end

	var_12_0._sequences.ButtonOverDisabled = var_12_76

	var_0_4(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("WarzonePrivateMatchSquadTeam", WarzonePrivateMatchSquadTeam)
LockTable(_M)
