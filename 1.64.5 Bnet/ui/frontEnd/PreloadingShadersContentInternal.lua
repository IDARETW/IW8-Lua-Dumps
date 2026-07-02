module(..., package.seeall)

function PreloadingShadersContentInternal(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIHorizontalStackedLayout.new()

	var_1_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 540 * _1080p, 0, 40 * _1080p)

	var_1_0.id = "PreloadingShadersContentInternal"
	var_1_0._animationSets = var_1_0._animationSets or {}
	var_1_0._sequences = var_1_0._sequences or {}

	local var_1_1 = arg_1_1 and arg_1_1.controllerIndex

	if not var_1_1 and not Engine.DDJFBBJAIG() then
		var_1_1 = var_1_0:getRootController()
	end

	assert(var_1_1)

	local var_1_2 = var_1_0

	var_1_0:SetSpacing(8 * _1080p)

	local var_1_3
	local var_1_4 = LUI.UIImage.new()

	var_1_4.id = "Icon"

	var_1_4:SetRGBFromTable(SWATCHES.HUD.colorblindEnemyTeam, 0)
	var_1_4:setImage(RegisterMaterial("hud_icon_net_shader_warning"), 0)
	var_1_4:SetAnchorsAndPosition(0, 1, 0.5, 0.5, 0, _1080p * 28, _1080p * -15, _1080p * 15)
	var_1_0:addElement(var_1_4)

	var_1_0.Icon = var_1_4

	local var_1_5
	local var_1_6 = LUI.UIText.new()

	var_1_6.id = "ColoredText"

	var_1_6:SetRGBFromTable(SWATCHES.HUD.colorblindEnemyTeam, 0)
	var_1_6:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/SHADER_PERF_ISSUES"), 0)
	var_1_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_6:SetWordWrap(false)
	var_1_6:SetAlignment(LUI.Alignment.Left)
	var_1_6:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 36, _1080p * 471, _1080p * -9, _1080p * 9)
	var_1_0:addElement(var_1_6)

	var_1_0.ColoredText = var_1_6

	local var_1_7
	local var_1_8 = LUI.UIText.new()

	var_1_8.id = "Text"

	var_1_8:setText("", 0)
	var_1_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_1_8:SetWordWrap(false)
	var_1_8:SetAlignment(LUI.Alignment.Left)
	var_1_8:SetOptOutRightToLeftAlignmentFlip(true)
	var_1_8:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 479, _1080p * 519, _1080p * -9, _1080p * 9)
	var_1_0:addElement(var_1_8)

	var_1_0.Text = var_1_8

	local function var_1_9()
		return
	end

	var_1_0._sequences.DefaultSequence = var_1_9

	local var_1_10 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.enemyTeam
		}
	}

	var_1_4:RegisterAnimationSequence("Paused", var_1_10)

	local var_1_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_PC/SHADER_INSTALLATION_PAUSED")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 241
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.enemyTeam
		}
	}

	var_1_6:RegisterAnimationSequence("Paused", var_1_11)

	local var_1_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_PC/SHADER_DURING_GAMEPLAY")
		}
	}

	var_1_8:RegisterAnimationSequence("Paused", var_1_12)

	local function var_1_13()
		var_1_4:AnimateSequence("Paused")
		var_1_6:AnimateSequence("Paused")
		var_1_8:AnimateSequence("Paused")
	end

	var_1_0._sequences.Paused = var_1_13

	local var_1_14 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.colorblindEnemyTeam
		}
	}

	var_1_4:RegisterAnimationSequence("InProgress", var_1_14)

	local var_1_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_PC/SHADER_PERF_ISSUES")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 438
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.HUD.colorblindEnemyTeam
		}
	}

	var_1_6:RegisterAnimationSequence("InProgress", var_1_15)

	local var_1_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 447
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 487
		}
	}

	var_1_8:RegisterAnimationSequence("InProgress", var_1_16)

	local function var_1_17()
		var_1_4:AnimateSequence("InProgress")
		var_1_6:AnimateSequence("InProgress")
		var_1_8:AnimateSequence("InProgress")
	end

	var_1_0._sequences.InProgress = var_1_17

	local var_1_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_1_6:RegisterAnimationSequence("AR", var_1_18)

	local var_1_19 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -13
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 13
		}
	}

	var_1_8:RegisterAnimationSequence("AR", var_1_19)

	local function var_1_20()
		var_1_6:AnimateSequence("AR")
		var_1_8:AnimateSequence("AR")
	end

	var_1_0._sequences.AR = var_1_20

	local var_1_21 = {
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingSuccess
		}
	}

	var_1_4:RegisterAnimationSequence("Completed", var_1_21)

	local var_1_22 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 188
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text,
			value = Engine.CBBHFCGDIC("LUA_MENU_PC/INSTALLATION_COMPLETE")
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Text_Style_Horizontal_Alignment,
			value = LUI.Alignment.Center
		},
		{
			duration = 80,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.KeyBinding.bindingSuccess
		}
	}

	var_1_6:RegisterAnimationSequence("Completed", var_1_22)

	local var_1_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 225
		},
		{
			value = "",
			duration = 0,
			property = TWEEN_PROPERTY.Text
		}
	}

	var_1_8:RegisterAnimationSequence("Completed", var_1_23)

	local function var_1_24()
		var_1_4:AnimateSequence("Completed")
		var_1_6:AnimateSequence("Completed")
		var_1_8:AnimateSequence("Completed")
	end

	var_1_0._sequences.Completed = var_1_24

	return var_1_0
end

MenuBuilder.registerType("PreloadingShadersContentInternal", PreloadingShadersContentInternal)
LockTable(_M)
