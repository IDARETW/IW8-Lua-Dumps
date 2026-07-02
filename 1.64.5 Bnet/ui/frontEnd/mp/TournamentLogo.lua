module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0

	local function var_1_1()
		local var_2_0 = math.random(10000, 12000)
		local var_2_1 = arg_1_0:Wait(var_2_0)
		local var_2_2, var_2_3, var_2_4, var_2_5 = arg_1_0.Logo:getLocalRect()
		local var_2_6 = {
			-10,
			-9,
			-8,
			-7,
			-6,
			6,
			7,
			8,
			9,
			10
		}
		local var_2_7 = var_2_6[math.floor(math.random(1, #var_2_6))] * _1080p
		local var_2_8 = var_2_2 + var_2_7
		local var_2_9 = var_2_3 + var_2_7
		local var_2_10 = var_2_4 + var_2_7
		local var_2_11 = var_2_5 + var_2_7

		arg_1_0.LogoGhost:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_2_8, var_2_10, var_2_9, var_2_11)
		ACTIONS.AnimateSequence(arg_1_0, "GhostBlink")
		arg_1_0:SetGlitchAmount(0.1)
		arg_1_0:SetGlitchAmount(0, 100)

		function var_2_1.onComplete()
			var_1_1()
		end
	end

	var_1_1()
	arg_1_0.LogoRed:SetRGBFromTable(COLORS.red)
	arg_1_0.LogoGreen:SetRGBFromTable(COLORS.green)
	arg_1_0.LogoBlue:SetRGBFromTable(COLORS.blue)

	local var_1_2

	local function var_1_3()
		local var_4_0 = arg_1_0:Wait(math.random(100, 150))
		local var_4_1 = 4
		local var_4_2 = math.random(-var_4_1, var_4_1) * _1080p
		local var_4_3 = math.random(-var_4_1, var_4_1) * _1080p
		local var_4_4 = math.random(-var_4_1, var_4_1) * _1080p
		local var_4_5, var_4_6, var_4_7, var_4_8 = arg_1_0.Logo:getLocalRect()

		arg_1_0.LogoRed:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_4_5 + var_4_2, var_4_7 + var_4_2, var_4_6 + var_4_2, var_4_8 + var_4_2, 100)
		arg_1_0.LogoGreen:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_4_5 + var_4_3, var_4_7 + var_4_3, var_4_6 + var_4_3, var_4_8 + var_4_3, 100)
		arg_1_0.LogoBlue:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, var_4_5 + var_4_4, var_4_7 + var_4_4, var_4_6 + var_4_4, var_4_8 + var_4_4, 100)

		function var_4_0.onComplete()
			var_1_3()
		end
	end

	var_1_3()
end

function TournamentLogo(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 320 * _1080p)

	var_6_0.id = "TournamentLogo"
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

	var_6_4.id = "LogoGhost"

	var_6_4:SetAlpha(0.95, 0)
	var_6_4:setImage(RegisterMaterial("tournament_logo"), 0)
	var_6_4:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -254, _1080p * 258)
	var_6_0:addElement(var_6_4)

	var_6_0.LogoGhost = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "LogoBlue"

	var_6_6:SetAlpha(0.12, 0)
	var_6_6:setImage(RegisterMaterial("tournament_logo"), 0)
	var_6_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -254, _1080p * 258)
	var_6_0:addElement(var_6_6)

	var_6_0.LogoBlue = var_6_6

	local var_6_7
	local var_6_8 = LUI.UIImage.new()

	var_6_8.id = "LogoGreen"

	var_6_8:SetAlpha(0.12, 0)
	var_6_8:setImage(RegisterMaterial("tournament_logo"), 0)
	var_6_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -254, _1080p * 258)
	var_6_0:addElement(var_6_8)

	var_6_0.LogoGreen = var_6_8

	local var_6_9
	local var_6_10 = LUI.UIImage.new()

	var_6_10.id = "LogoRed"

	var_6_10:SetAlpha(0.12, 0)
	var_6_10:setImage(RegisterMaterial("tournament_logo"), 0)
	var_6_10:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -254, _1080p * 258)
	var_6_0:addElement(var_6_10)

	var_6_0.LogoRed = var_6_10

	local var_6_11
	local var_6_12 = LUI.UIImage.new()

	var_6_12.id = "Logo"

	var_6_12:SetAlpha(0.85, 0)
	var_6_12:setImage(RegisterMaterial("tournament_logo"), 0)
	var_6_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -254, _1080p * 258)
	var_6_0:addElement(var_6_12)

	var_6_0.Logo = var_6_12

	local var_6_13
	local var_6_14 = LUI.UIImage.new()

	var_6_14.id = "TriangleTop"

	var_6_14:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_14:SetAlpha(0.5, 0)
	var_6_14:SetPixelGridEnabled(true)
	var_6_14:SetPixelGridContrast(0.3, 0)
	var_6_14:SetPixelGridBlockWidth(1, 0)
	var_6_14:SetPixelGridBlockHeight(1, 0)
	var_6_14:SetPixelGridGutterWidth(1, 0)
	var_6_14:SetPixelGridGutterHeight(0, 0)
	var_6_14:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_6_14:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * 113, _1080p * 129)
	var_6_0:addElement(var_6_14)

	var_6_0.TriangleTop = var_6_14

	local var_6_15
	local var_6_16 = LUI.UIImage.new()

	var_6_16.id = "TriangleMid"

	var_6_16:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_16:SetAlpha(0.5, 0)
	var_6_16:SetPixelGridEnabled(true)
	var_6_16:SetPixelGridContrast(0.3, 0)
	var_6_16:SetPixelGridBlockWidth(1, 0)
	var_6_16:SetPixelGridBlockHeight(1, 0)
	var_6_16:SetPixelGridGutterWidth(1, 0)
	var_6_16:SetPixelGridGutterHeight(0, 0)
	var_6_16:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_6_16:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * 129, _1080p * 145)
	var_6_0:addElement(var_6_16)

	var_6_0.TriangleMid = var_6_16

	local var_6_17
	local var_6_18 = LUI.UIImage.new()

	var_6_18.id = "TriangleBot"

	var_6_18:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_18:SetAlpha(0.5, 0)
	var_6_18:SetPixelGridEnabled(true)
	var_6_18:SetPixelGridContrast(0.3, 0)
	var_6_18:SetPixelGridBlockWidth(1, 0)
	var_6_18:SetPixelGridBlockHeight(1, 0)
	var_6_18:SetPixelGridGutterWidth(1, 0)
	var_6_18:SetPixelGridGutterHeight(0, 0)
	var_6_18:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_6_18:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * 145, _1080p * 161)
	var_6_0:addElement(var_6_18)

	var_6_0.TriangleBot = var_6_18

	local var_6_19
	local var_6_20 = LUI.UIImage.new()

	var_6_20.id = "ArrowLeft"

	var_6_20:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_20:SetScale(-0.25, 0)
	var_6_20:SetPixelGridEnabled(true)
	var_6_20:SetPixelGridContrast(0.3, 0)
	var_6_20:SetPixelGridBlockWidth(1, 0)
	var_6_20:SetPixelGridBlockHeight(1, 0)
	var_6_20:SetPixelGridGutterWidth(1, 0)
	var_6_20:SetPixelGridGutterHeight(0, 0)
	var_6_20:setImage(RegisterMaterial("campaign_decoration_triangle"), 0)
	var_6_20:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -87, _1080p * -71, _1080p * -35, _1080p * -19)
	var_6_0:addElement(var_6_20)

	var_6_0.ArrowLeft = var_6_20

	local var_6_21
	local var_6_22 = LUI.UIImage.new()

	var_6_22.id = "ArrowRight"

	var_6_22:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_22:SetZRotation(180, 0)
	var_6_22:SetScale(-0.25, 0)
	var_6_22:SetPixelGridEnabled(true)
	var_6_22:SetPixelGridContrast(0.3, 0)
	var_6_22:SetPixelGridBlockWidth(1, 0)
	var_6_22:SetPixelGridBlockHeight(1, 0)
	var_6_22:SetPixelGridGutterWidth(1, 0)
	var_6_22:SetPixelGridGutterHeight(0, 0)
	var_6_22:setImage(RegisterMaterial("campaign_decoration_triangle"), 0)
	var_6_22:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 69, _1080p * 85, _1080p * 19, _1080p * 35)
	var_6_0:addElement(var_6_22)

	var_6_0.ArrowRight = var_6_22

	local var_6_23
	local var_6_24 = LUI.UIImage.new()

	var_6_24.id = "RectangleLeft"

	var_6_24:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_24:SetAlpha(0.5, 0)
	var_6_24:SetPixelGridEnabled(true)
	var_6_24:SetPixelGridContrast(0.3, 0)
	var_6_24:SetPixelGridBlockWidth(1, 0)
	var_6_24:SetPixelGridBlockHeight(1, 0)
	var_6_24:SetPixelGridGutterWidth(1, 0)
	var_6_24:SetPixelGridGutterHeight(0, 0)
	var_6_24:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -234, _1080p * -226, _1080p * -101, _1080p * -84)
	var_6_0:addElement(var_6_24)

	var_6_0.RectangleLeft = var_6_24

	local var_6_25
	local var_6_26 = LUI.UIImage.new()

	var_6_26.id = "RectangleRight"

	var_6_26:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_26:SetAlpha(0.5, 0)
	var_6_26:SetPixelGridEnabled(true)
	var_6_26:SetPixelGridContrast(0.3, 0)
	var_6_26:SetPixelGridBlockWidth(1, 0)
	var_6_26:SetPixelGridBlockHeight(1, 0)
	var_6_26:SetPixelGridGutterWidth(1, 0)
	var_6_26:SetPixelGridGutterHeight(0, 0)
	var_6_26:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 229, _1080p * 251, _1080p * -103, _1080p * -95)
	var_6_0:addElement(var_6_26)

	var_6_0.RectangleRight = var_6_26

	local var_6_27
	local var_6_28 = LUI.UIImage.new()

	var_6_28.id = "CrossTopLeft"

	var_6_28:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_28:SetAlpha(0.5, 0)
	var_6_28:SetPixelGridEnabled(true)
	var_6_28:SetPixelGridContrast(0.3, 0)
	var_6_28:SetPixelGridBlockWidth(1, 0)
	var_6_28:SetPixelGridBlockHeight(1, 0)
	var_6_28:SetPixelGridGutterWidth(1, 0)
	var_6_28:SetPixelGridGutterHeight(0, 0)
	var_6_28:setImage(RegisterMaterial("aar_cross"), 0)
	var_6_28:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -197, _1080p * -181, _1080p * -70, _1080p * -54)
	var_6_0:addElement(var_6_28)

	var_6_0.CrossTopLeft = var_6_28

	local var_6_29
	local var_6_30 = LUI.UIImage.new()

	var_6_30.id = "CrossTopRight"

	var_6_30:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_30:SetAlpha(0.5, 0)
	var_6_30:SetPixelGridEnabled(true)
	var_6_30:SetPixelGridContrast(0.3, 0)
	var_6_30:SetPixelGridBlockWidth(1, 0)
	var_6_30:SetPixelGridBlockHeight(1, 0)
	var_6_30:SetPixelGridGutterWidth(1, 0)
	var_6_30:SetPixelGridGutterHeight(0, 0)
	var_6_30:setImage(RegisterMaterial("aar_cross"), 0)
	var_6_30:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 181, _1080p * 197, _1080p * -70, _1080p * -54)
	var_6_0:addElement(var_6_30)

	var_6_0.CrossTopRight = var_6_30

	local var_6_31
	local var_6_32 = LUI.UIImage.new()

	var_6_32.id = "CrossBotLeft"

	var_6_32:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_32:SetAlpha(0.5, 0)
	var_6_32:SetPixelGridEnabled(true)
	var_6_32:SetPixelGridContrast(0.3, 0)
	var_6_32:SetPixelGridBlockWidth(1, 0)
	var_6_32:SetPixelGridBlockHeight(1, 0)
	var_6_32:SetPixelGridGutterWidth(1, 0)
	var_6_32:SetPixelGridGutterHeight(0, 0)
	var_6_32:setImage(RegisterMaterial("aar_cross"), 0)
	var_6_32:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -197, _1080p * -181, _1080p * 58, _1080p * 74)
	var_6_0:addElement(var_6_32)

	var_6_0.CrossBotLeft = var_6_32

	local var_6_33
	local var_6_34 = LUI.UIImage.new()

	var_6_34.id = "CrossBotRight"

	var_6_34:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_34:SetAlpha(0.5, 0)
	var_6_34:SetPixelGridEnabled(true)
	var_6_34:SetPixelGridContrast(0.3, 0)
	var_6_34:SetPixelGridBlockWidth(1, 0)
	var_6_34:SetPixelGridBlockHeight(1, 0)
	var_6_34:SetPixelGridGutterWidth(1, 0)
	var_6_34:SetPixelGridGutterHeight(0, 0)
	var_6_34:setImage(RegisterMaterial("aar_cross"), 0)
	var_6_34:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * 181, _1080p * 197, _1080p * 58, _1080p * 74)
	var_6_0:addElement(var_6_34)

	var_6_0.CrossBotRight = var_6_34

	local var_6_35
	local var_6_36 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_6_37 = LUI.UIBorder.new(var_6_36)

	var_6_37.id = "ArrowMidBorder"

	var_6_37:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_37:SetAlpha(0.5, 0)
	var_6_37:SetPixelGridEnabled(true)
	var_6_37:SetPixelGridContrast(0.3, 0)
	var_6_37:SetPixelGridBlockWidth(1, 0)
	var_6_37:SetPixelGridBlockHeight(1, 0)
	var_6_37:SetPixelGridGutterWidth(1, 0)
	var_6_37:SetPixelGridGutterHeight(0, 0)
	var_6_37:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * 63, _1080p * 79)
	var_6_0:addElement(var_6_37)

	var_6_0.ArrowMidBorder = var_6_37

	local var_6_38
	local var_6_39 = LUI.UIImage.new()

	var_6_39.id = "ArrowMid"

	var_6_39:SetRGBFromTable(SWATCHES.genericMenu.default, 0)
	var_6_39:SetAlpha(0.5, 0)
	var_6_39:SetPixelGridEnabled(true)
	var_6_39:SetPixelGridContrast(0.3, 0)
	var_6_39:SetPixelGridBlockWidth(1, 0)
	var_6_39:SetPixelGridBlockHeight(1, 0)
	var_6_39:SetPixelGridGutterWidth(1, 0)
	var_6_39:SetPixelGridGutterHeight(0, 0)
	var_6_39:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_6_39:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * 67, _1080p * 75)
	var_6_0:addElement(var_6_39)

	var_6_0.ArrowMid = var_6_39

	local function var_6_40()
		return
	end

	var_6_0._sequences.DefaultSequence = var_6_40

	local var_6_41 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("DetailLoop", var_6_41)

	local var_6_42 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 550,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 700,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 3200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_14:RegisterAnimationSequence("DetailLoop", var_6_42)

	local var_6_43 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 750,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 3300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_16:RegisterAnimationSequence("DetailLoop", var_6_43)

	local var_6_44 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.25,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 3400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_18:RegisterAnimationSequence("DetailLoop", var_6_44)

	local var_6_45 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		},
		{
			value = 1,
			duration = 400,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 900,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35
		},
		{
			duration = 900,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -34,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -50
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -34
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 3200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -19,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 3200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -35,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_20:RegisterAnimationSequence("DetailLoop", var_6_45)

	local var_6_46 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 35
		},
		{
			value = 1,
			duration = 1200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 1700,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19
		},
		{
			duration = 1700,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 35
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 1500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 34
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 50
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 35,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 2400,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 35,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 2400,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 19,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 2000,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_22:RegisterAnimationSequence("DetailLoop", var_6_46)

	local var_6_47 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -101
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -84
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 1150,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 105
		},
		{
			duration = 1150,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 88
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 800,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 3700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -101,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -84,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 3450,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -84,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 3450,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -101,
			easing = LUI.EASING.inCubic
		}
	}

	var_6_24:RegisterAnimationSequence("DetailLoop", var_6_47)

	local var_6_48 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 229
		},
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 251,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 1550,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 1150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 251
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 229
		},
		{
			duration = 3450,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 229
		},
		{
			value = 0,
			duration = 3450,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_26:RegisterAnimationSequence("DetailLoop", var_6_48)

	local var_6_49 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -181
		},
		{
			value = 0.5,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -181
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -181,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -181,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1450,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_28:RegisterAnimationSequence("DetailLoop", var_6_49)

	local var_6_50 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 181
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197
		},
		{
			value = 0.5,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 181
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 181,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 181,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1450,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_30:RegisterAnimationSequence("DetailLoop", var_6_50)

	local var_6_51 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -181
		},
		{
			value = 0.5,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -181
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -181,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -197,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -181,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1450,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_32:RegisterAnimationSequence("DetailLoop", var_6_51)

	local var_6_52 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 181
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197
		},
		{
			value = 0.5,
			duration = 500,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 181
		},
		{
			duration = 1500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 2700,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -8,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 181,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 181,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 2500,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 197,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 50,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 1450,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_34:RegisterAnimationSequence("DetailLoop", var_6_52)

	local var_6_53 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 160,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 990,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.9,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = -0.9,
			duration = 3700,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 3700,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_37:RegisterAnimationSequence("DetailLoop", var_6_53)

	local var_6_54 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = -0.99,
			duration = 0,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 1300,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 1000,
			property = TWEEN_PROPERTY.Scale
		},
		{
			value = -0.9,
			duration = 150,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = -0.9,
			duration = 3700,
			property = TWEEN_PROPERTY.Scale,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 3700,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_39:RegisterAnimationSequence("DetailLoop", var_6_54)

	local function var_6_55()
		var_6_4:AnimateLoop("DetailLoop")
		var_6_14:AnimateLoop("DetailLoop")
		var_6_16:AnimateLoop("DetailLoop")
		var_6_18:AnimateLoop("DetailLoop")
		var_6_20:AnimateLoop("DetailLoop")
		var_6_22:AnimateLoop("DetailLoop")
		var_6_24:AnimateLoop("DetailLoop")
		var_6_26:AnimateLoop("DetailLoop")
		var_6_28:AnimateLoop("DetailLoop")
		var_6_30:AnimateLoop("DetailLoop")
		var_6_32:AnimateLoop("DetailLoop")
		var_6_34:AnimateLoop("DetailLoop")
		var_6_37:AnimateLoop("DetailLoop")
		var_6_39:AnimateLoop("DetailLoop")
	end

	var_6_0._sequences.DetailLoop = var_6_55

	local var_6_56 = {
		{
			value = 0.5,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0,
			duration = 44,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.35,
			duration = 33,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 17,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.3,
			duration = 39,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0,
			duration = 22,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_4:RegisterAnimationSequence("GhostBlink", var_6_56)

	local var_6_57 = {
		{
			value = 0.85,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.7,
			duration = 22,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.83,
			duration = 39,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.68,
			duration = 22,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.85,
			duration = 39,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		},
		{
			value = 0.85,
			duration = 39,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.snap
		}
	}

	var_6_12:RegisterAnimationSequence("GhostBlink", var_6_57)

	local function var_6_58()
		var_6_4:AnimateSequence("GhostBlink")
		var_6_12:AnimateSequence("GhostBlink")
	end

	var_6_0._sequences.GhostBlink = var_6_58

	ACTIONS.AnimateSequence(var_6_0, "DetailLoop")
	var_0_0(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("TournamentLogo", TournamentLogo)
LockTable(_M)
