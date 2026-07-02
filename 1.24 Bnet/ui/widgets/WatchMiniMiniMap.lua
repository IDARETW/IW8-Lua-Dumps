module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = Engine.CIIGICAIFC(Engine.DCJHCAFIIA())

		arg_1_0:Wait(10000).onComplete = var_1_1

		arg_1_0.TimeLabel:setText(var_2_0)
	end

	var_1_1()

	if Engine.DDJFBBJAIG() then
		local var_1_2

		local function var_1_3()
			ACTIONS.AnimateSequence(arg_1_0, "WalkLoop")

			arg_1_0:Wait(16000).onComplete = var_1_3
		end

		var_1_3()
	elseif Engine.ECHCFGDDDF() then
		local var_1_4 = MatchRules.EAIEFBHGJ()

		ACTIONS.AnimateSequence(arg_1_0, "MinimapON")

		if MLG.IsCDLActive(arg_1_1) then
			ACTIONS.AnimateSequence(arg_1_0, "MinimapOFF")
		elseif var_1_4 ~= nil then
			if MatchRules.BIJEDCBCBH("commonOption", "enableMinimap") == false then
				ACTIONS.AnimateSequence(arg_1_0, "MinimapOFF")
			else
				ACTIONS.AnimateSequence(arg_1_0, "MinimapON")
			end
		else
			local var_1_5 = CONDITIONS.IsRealismMode(arg_1_0, arg_1_1)
			local var_1_6 = Dvar.IBEGCHEFE("MSQTTNSTNO")

			if DataSources.inGame.MP.match.gameType:GetValue(arg_1_1) == "arena" or var_1_6 or var_1_5 then
				ACTIONS.AnimateSequence(arg_1_0, "MinimapOFF")
			else
				ACTIONS.AnimateSequence(arg_1_0, "MinimapON")
			end
		end
	end
end

function WatchMiniMiniMap(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p)

	var_4_0.id = "WatchMiniMiniMap"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3

	if not Engine.DDJFBBJAIG() then
		local var_4_4 = {
			boundsRadius = 0.9,
			drawItems = false,
			drawRadarSweep = false,
			drawPlayer = false,
			drawOthers = false,
			mapAlpha = 1,
			compassType = CoD.CompassType.Partial,
			controllerIndex = var_4_1
		}

		var_4_3 = MenuBuilder.BuildRegisteredType("MinimapContent", var_4_4)
		var_4_3.id = "Minimap"

		var_4_3:SetZRotation(-48, 0)
		var_4_3:SetScale(0.4, 0)
		var_4_3:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, _1080p * 30, _1080p * 30)
		var_4_0:addElement(var_4_3)

		var_4_0.Minimap = var_4_3
	end

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "BG"

	var_4_6:SetRGBFromInt(0, 0)
	var_4_0:addElement(var_4_6)

	var_4_0.BG = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIImage.new()

	var_4_8.id = "Radi"

	var_4_8:SetRGBFromInt(16449280, 0)
	var_4_8:SetAlpha(0.25, 0)
	var_4_8:SetPixelGridEnabled(true)
	var_4_8:SetPixelGridContrast(0.95, 0)
	var_4_8:SetPixelGridBlockWidth(16, 0)
	var_4_8:SetPixelGridBlockHeight(16, 0)
	var_4_8:SetPixelGridGutterWidth(2, 0)
	var_4_8:SetPixelGridGutterHeight(2, 0)
	var_4_8:setImage(RegisterMaterial("hud_reticle_radial_glow"), 0)
	var_4_8:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -87, _1080p * 87, _1080p * -87, _1080p * 87)
	var_4_0:addElement(var_4_8)

	var_4_0.Radi = var_4_8

	local var_4_9
	local var_4_10 = LUI.UIStyledText.new()

	var_4_10.id = "TimeLabel"

	var_4_10:SetRGBFromInt(13487565, 0)
	var_4_10:setText("00:00", 0)
	var_4_10:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_10:SetAlignment(LUI.Alignment.Center)
	var_4_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -227, _1080p * 227, _1080p * -134, _1080p * -6)
	var_4_0:addElement(var_4_10)

	var_4_0.TimeLabel = var_4_10

	local var_4_11
	local var_4_12 = LUI.UIStyledText.new()

	var_4_12.id = "MapError"

	var_4_12:SetRGBFromInt(13487565, 0)
	var_4_12:setText(Engine.CBBHFCGDIC("LUA_MENU/MINIMAP_ERROR"), 0)
	var_4_12:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_12:SetAlignment(LUI.Alignment.Center)
	var_4_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 29, _1080p * 483, _1080p * 286, _1080p * 356)
	var_4_0:addElement(var_4_12)

	var_4_0.MapError = var_4_12

	local var_4_13

	if Engine.DDJFBBJAIG() then
		var_4_13 = LUI.UIImage.new()
		var_4_13.id = "FrontendPic"

		var_4_13:SetRGBFromInt(13487565, 0)
		var_4_13:SetAlpha(0, 0)
		var_4_13:setImage(RegisterMaterial("compass_map_mp_hackney_am"), 0)
		var_4_13:SetUMin(0.3599999, 0)
		var_4_13:SetUMax(0.84, 0)
		var_4_13:SetVMin(0.23, 0)
		var_4_13:SetVMax(0.73, 0)
		var_4_13:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -901, _1080p * 901, _1080p * -876, _1080p * 926)
		var_4_0:addElement(var_4_13)

		var_4_0.FrontendPic = var_4_13
	end

	local var_4_14
	local var_4_15 = LUI.UIImage.new()

	var_4_15.id = "PlayerArrow"

	var_4_15:SetRGBFromTable(SWATCHES.genericButton.highlight, 0)
	var_4_15:SetAlpha(0, 0)
	var_4_15:SetZRotation(-48, 0)
	var_4_15:setImage(RegisterMaterial("icon_minimap_player"), 0)
	var_4_15:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -55, _1080p * 55, _1080p * -38, _1080p * 72)
	var_4_0:addElement(var_4_15)

	var_4_0.PlayerArrow = var_4_15

	local function var_4_16()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_16

	local var_4_17

	if not Engine.DDJFBBJAIG() then
		local var_4_18 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("MinimapOFF", var_4_18)
	end

	local var_4_19 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("MinimapOFF", var_4_19)

	local var_4_20 = {
		{
			value = 0.25,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("MinimapOFF", var_4_20)

	local var_4_21 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("MinimapOFF", var_4_21)

	local var_4_22 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("MinimapOFF", var_4_22)

	local var_4_23 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_15:RegisterAnimationSequence("MinimapOFF", var_4_23)

	local function var_4_24()
		if not Engine.DDJFBBJAIG() then
			var_4_3:AnimateSequence("MinimapOFF")
		end

		var_4_6:AnimateSequence("MinimapOFF")
		var_4_8:AnimateSequence("MinimapOFF")
		var_4_10:AnimateSequence("MinimapOFF")
		var_4_12:AnimateSequence("MinimapOFF")
		var_4_15:AnimateSequence("MinimapOFF")
	end

	var_4_0._sequences.MinimapOFF = var_4_24

	local var_4_25

	if not Engine.DDJFBBJAIG() then
		local var_4_26 = {
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("MinimapON", var_4_26)
	end

	local var_4_27 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_6:RegisterAnimationSequence("MinimapON", var_4_27)

	local var_4_28 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_8:RegisterAnimationSequence("MinimapON", var_4_28)

	local var_4_29 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_10:RegisterAnimationSequence("MinimapON", var_4_29)

	local var_4_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_12:RegisterAnimationSequence("MinimapON", var_4_30)

	local var_4_31 = {
		{
			value = 0.6,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -48,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_4_15:RegisterAnimationSequence("MinimapON", var_4_31)

	local function var_4_32()
		if not Engine.DDJFBBJAIG() then
			var_4_3:AnimateSequence("MinimapON")
		end

		var_4_6:AnimateSequence("MinimapON")
		var_4_8:AnimateSequence("MinimapON")
		var_4_10:AnimateSequence("MinimapON")
		var_4_12:AnimateSequence("MinimapON")
		var_4_15:AnimateSequence("MinimapON")
	end

	var_4_0._sequences.MinimapON = var_4_32

	local var_4_33

	if Engine.DDJFBBJAIG() then
		local var_4_34 = {
			{
				value = 0.3599999,
				duration = 0,
				property = TWEEN_PROPERTY.U_Min
			},
			{
				value = 0.84,
				duration = 0,
				property = TWEEN_PROPERTY.U_Max
			},
			{
				value = 0.23,
				duration = 0,
				property = TWEEN_PROPERTY.V_Min
			},
			{
				value = 0.73,
				duration = 0,
				property = TWEEN_PROPERTY.V_Max
			},
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Z_Rotation
			},
			{
				value = 1,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			},
			{
				value = -0.5,
				duration = 0,
				property = TWEEN_PROPERTY.Scale
			},
			{
				value = 0,
				duration = 1667,
				property = TWEEN_PROPERTY.Z_Rotation
			},
			{
				value = 0.23,
				duration = 3500,
				property = TWEEN_PROPERTY.V_Min
			},
			{
				value = 0.73,
				duration = 3500,
				property = TWEEN_PROPERTY.V_Max
			},
			{
				value = 0.3599999,
				duration = 3500,
				property = TWEEN_PROPERTY.U_Min
			},
			{
				value = 0.84,
				duration = 3500,
				property = TWEEN_PROPERTY.U_Max
			},
			{
				value = -24,
				duration = 500,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = -24,
				duration = 350,
				property = TWEEN_PROPERTY.Z_Rotation
			},
			{
				value = 40,
				duration = 317,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.outQuadratic
			},
			{
				value = 40,
				duration = 500,
				property = TWEEN_PROPERTY.Z_Rotation
			},
			{
				value = 15,
				duration = 500,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = 0.3699999,
				duration = 1500,
				property = TWEEN_PROPERTY.U_Min,
				easing = LUI.EASING.inOutCubic
			},
			{
				value = 0.85,
				duration = 1500,
				property = TWEEN_PROPERTY.U_Max,
				easing = LUI.EASING.inOutCubic
			},
			{
				value = 0.13,
				duration = 1500,
				property = TWEEN_PROPERTY.V_Min,
				easing = LUI.EASING.inOutCubic
			},
			{
				value = 0.65,
				duration = 1500,
				property = TWEEN_PROPERTY.V_Max,
				easing = LUI.EASING.inOutCubic
			},
			{
				value = 15,
				duration = 1667,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = 0.85,
				duration = 3333,
				property = TWEEN_PROPERTY.U_Max
			},
			{
				value = 0.3699999,
				duration = 3333,
				property = TWEEN_PROPERTY.U_Min
			},
			{
				value = 0.65,
				duration = 3333,
				property = TWEEN_PROPERTY.V_Max
			},
			{
				value = 0.13,
				duration = 3333,
				property = TWEEN_PROPERTY.V_Min
			},
			{
				value = -10,
				duration = 333,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = -10,
				duration = 667,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = 20,
				duration = 833,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = 56,
				duration = 667,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.outQuadratic
			},
			{
				value = 188,
				duration = 833,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = 0.84,
				duration = 1667,
				property = TWEEN_PROPERTY.U_Max,
				easing = LUI.EASING.inOutQuintic
			},
			{
				value = 0.3599999,
				duration = 1667,
				property = TWEEN_PROPERTY.U_Min,
				easing = LUI.EASING.inOutQuintic
			},
			{
				value = 0.73,
				duration = 1667,
				property = TWEEN_PROPERTY.V_Max,
				easing = LUI.EASING.inOutQuintic
			},
			{
				value = 0.23,
				duration = 1667,
				property = TWEEN_PROPERTY.V_Min,
				easing = LUI.EASING.inOutQuintic
			},
			{
				value = 188,
				duration = 817,
				property = TWEEN_PROPERTY.Z_Rotation
			},
			{
				value = 360,
				duration = 933,
				property = TWEEN_PROPERTY.Z_Rotation,
				easing = LUI.EASING.inOutQuadratic
			},
			{
				value = 0.3599999,
				duration = 583,
				property = TWEEN_PROPERTY.U_Min
			},
			{
				value = 0.84,
				duration = 583,
				property = TWEEN_PROPERTY.U_Max
			},
			{
				value = 0.23,
				duration = 583,
				property = TWEEN_PROPERTY.V_Min
			},
			{
				value = 0.73,
				duration = 583,
				property = TWEEN_PROPERTY.V_Max
			},
			{
				value = 0,
				duration = 17,
				property = TWEEN_PROPERTY.Z_Rotation
			}
		}

		var_4_13:RegisterAnimationSequence("WalkLoop", var_4_34)
	end

	local var_4_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 0.8,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.45,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		}
	}

	var_4_15:RegisterAnimationSequence("WalkLoop", var_4_35)

	local function var_4_36()
		if Engine.DDJFBBJAIG() then
			var_4_13:AnimateSequence("WalkLoop")
		end

		var_4_15:AnimateSequence("WalkLoop")
	end

	var_4_0._sequences.WalkLoop = var_4_36

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	if CONDITIONS.InFrontend(var_4_0) then
		ACTIONS.AnimateSequence(var_4_0, "WalkLoop")
	end

	return var_4_0
end

MenuBuilder.registerType("WatchMiniMiniMap", WatchMiniMiniMap)
LockTable(_M)
