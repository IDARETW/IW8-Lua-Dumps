module(..., package.seeall)

local var_0_0 = 12
local var_0_1 = 600
local var_0_2 = 50
local var_0_3 = 100

local function var_0_4(arg_1_0, arg_1_1)
	local var_1_0 = LUI.UIImage.new()

	var_1_0.id = "Darkener"

	var_1_0:SetRGBFromTable(COLORS.black)
	var_1_0:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -564, _1080p * 1612, _1080p * -484, _1080p * 484)
	arg_1_0:addElement(var_1_0)

	arg_1_0.darkener = var_1_0

	arg_1_0.darkener:SetAlpha(0)

	for iter_1_0 = 1, #arg_1_1 do
		local var_1_1 = arg_1_1[iter_1_0].positionLeft
		local var_1_2 = arg_1_1[iter_1_0].positionTop
		local var_1_3 = MenuBuilder.BuildRegisteredType("LevelSelectNode", {
			controllerIndex = arg_1_0._controllerIndex,
			nodeSize = var_0_0,
			transitionDuration = var_0_1
		})

		var_1_3.id = "Level" .. arg_1_1[iter_1_0].displayName

		var_1_3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_1_1, _1080p * (var_1_1 + var_0_0), _1080p * var_1_2, _1080p * (var_1_2 + var_0_0))

		if arg_1_1[iter_1_0].mapPosition == WORLD_MAP.Regions.GLOBAL_LOWER or arg_1_1[iter_1_0].mapPosition == WORLD_MAP.Regions.GLOBAL_UPPER then
			arg_1_0:addElement(var_1_3)
		else
			table.insert(arg_1_0._overPopupNodes, var_1_3)

			if arg_1_1[iter_1_0].mapPosition == WORLD_MAP.Regions.URZIKSTAN then
				table.insert(arg_1_0._urzPopupNodes, var_1_3)
			elseif arg_1_1[iter_1_0].mapPosition == WORLD_MAP.Regions.UK then
				table.insert(arg_1_0._ukPopupNodes, var_1_3)
			end
		end

		arg_1_0.levelNode = var_1_3

		table.insert(arg_1_0._nodes, arg_1_0.levelNode)
		arg_1_0.levelNode:SetupNode(arg_1_1[iter_1_0].levelIndex + 1)
	end

	local var_1_4 = MenuBuilder.BuildRegisteredType("LevelSelectZoomMap", {
		controllerIndex = arg_1_0._controllerIndex
	})

	var_1_4.id = "LevelSelectZoomMap"

	var_1_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2453, _1080p * 2589, _1080p * 713, _1080p * 781)
	var_1_4:setPriority(var_0_2)
	arg_1_0:addElement(var_1_4)

	arg_1_0.levelSelectZoomMap = var_1_4
	arg_1_0.DynamicLine = LUI.UILine.new()

	arg_1_0.DynamicLine:setPriority(var_0_3 - 1)
	arg_1_0:addElement(arg_1_0.DynamicLine)
	arg_1_0.DynamicLine:SetThickness(2)
	arg_1_0.DynamicLine:SetRGBFromTable(SWATCHES.MainMenu.ButtonText)
	arg_1_0.DynamicLine:SetAlpha(0)

	for iter_1_1 = 1, #arg_1_0._overPopupNodes do
		arg_1_0._overPopupNodes[iter_1_1]:setPriority(var_0_2 + 1)
		arg_1_0:addElement(arg_1_0._overPopupNodes[iter_1_1])
	end

	local var_1_5 = MenuBuilder.BuildRegisteredType("LevelSelectNodeDetails", {
		controllerIndex = arg_1_0._controllerIndex
	})

	var_1_5.id = "Details"

	var_1_5:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * (var_0_0 + 50), _1080p * 0, _1080p * var_0_0)
	var_1_5:setPriority(var_0_3)
	arg_1_0:addElement(var_1_5)

	arg_1_0.details = var_1_5

	arg_1_0.details:SetAlpha(0)
end

local function var_0_5(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = var_0_1

	if arg_2_0._isZoomIn and not arg_2_0._isZoomed then
		local var_2_1 = arg_2_2:Wait(var_0_1)

		if arg_2_2._levelInfo.mapPosition == WORLD_MAP.Regions.URZIKSTAN then
			ACTIONS.AnimateSequence(arg_2_0, "UrzBlink")
			ACTIONS.AnimateSequence(arg_2_0, "UrzFocusStart")
			ACTIONS.AnimateSequence(arg_2_0, "UrzFocusLoop")
			Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.mapOpen)
		end

		function var_2_1.onComplete()
			if arg_2_0._isZoomIn and not arg_2_0._isZoomed then
				for iter_3_0 = 1, #arg_2_0._urzPopupNodes do
					arg_2_0._urzPopupNodes[iter_3_0]:SetAlpha(1, 600)
				end

				arg_2_0.darkener:SetAlpha(0.2, var_0_1, LUI.EASING.outQuadratic)
				arg_2_0.levelSelectZoomMap.RegionName:setText("")
				ACTIONS.AnimateSequence(arg_2_0.levelSelectZoomMap, "ZoomIn")

				arg_2_0._isZoomed = true
			end
		end

		var_2_0 = 800
	elseif not arg_2_0._isZoomIn then
		if arg_2_2._levelInfo.mapPosition ~= WORLD_MAP.Regions.URZIKSTAN then
			ACTIONS.AnimateSequence(arg_2_0, "UrzHide")
			ACTIONS.AnimateSequence(arg_2_0, "UrzFocusEnd")
		end

		for iter_2_0 = 1, #arg_2_0._urzPopupNodes do
			arg_2_0._urzPopupNodes[iter_2_0]:SetAlpha(0, 0)
		end
	end

	local var_2_2 = arg_2_0.details

	if arg_2_1 then
		if arg_2_1._details then
			Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailClose)
			arg_2_1._details:SetAlpha(0)

			arg_2_1._details = nil
		end

		local var_2_3 = var_0_0 / 2
		local var_2_4
		local var_2_5

		if arg_2_2._levelInfo.mapPosition ~= WORLD_MAP.Regions.URZIKSTAN and arg_2_1._levelInfo.mapPosition == WORLD_MAP.Regions.URZIKSTAN then
			var_2_4 = _1080p * (WORLD_MAP.UrzikstanLocation.left + var_2_3)
			var_2_5 = _1080p * (WORLD_MAP.UrzikstanLocation.top + var_2_3)
		else
			var_2_4 = _1080p * (arg_2_1._levelInfo.positionLeft + var_2_3)
			var_2_5 = _1080p * (arg_2_1._levelInfo.positionTop + var_2_3)
		end

		local var_2_6
		local var_2_7

		if arg_2_1._levelInfo.mapPosition ~= WORLD_MAP.Regions.URZIKSTAN and arg_2_2._levelInfo.mapPosition == WORLD_MAP.Regions.URZIKSTAN then
			var_2_6 = _1080p * (WORLD_MAP.UrzikstanLocation.left + var_2_3)
			var_2_7 = _1080p * (WORLD_MAP.UrzikstanLocation.top + var_2_3)
		else
			var_2_6 = _1080p * (arg_2_2._levelInfo.positionLeft + var_2_3)
			var_2_7 = _1080p * (arg_2_2._levelInfo.positionTop + var_2_3)
		end

		arg_2_0.DynamicLine:SetVertexPosition(LUI.UILine.START, 0, 0, var_2_4, var_2_5)
		arg_2_0.DynamicLine:SetVertexPosition(LUI.UILine.END, 0, 0, var_2_6, var_2_7)
		arg_2_0.DynamicLine:SetVertexPadding(LUI.UILine.START, 0)
		arg_2_0.DynamicLine:SetVertexPadding(LUI.UILine.END, 1)
		arg_2_0.DynamicLine:SetAlpha(0.8)
		arg_2_0.DynamicLine:SetVertexPadding(LUI.UILine.END, 0, var_0_1 / 2, LUI.EASING.outQuadratic)

		arg_2_0:Wait(var_0_1 / 2, true).onComplete = function()
			arg_2_0.DynamicLine:SetAlpha(0, var_0_1 / 2, LUI.EASING.inQuadratic)
			arg_2_0.DynamicLine:SetVertexPadding(LUI.UILine.START, 1, var_0_1 / 2, LUI.EASING.inQuadratic)
		end
	end

	arg_2_0.details:Wait(var_2_0, true).onComplete = function()
		if arg_2_2._isSelected then
			Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.detailOpen)

			arg_2_2._details = var_2_2

			local var_5_0 = arg_2_2._levelInfo.positionLeft
			local var_5_1 = arg_2_2._levelInfo.positionTop

			arg_2_2._details:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_5_0, _1080p * (var_5_0 + var_0_0), _1080p * var_5_1, _1080p * (var_5_1 + var_0_0))
			arg_2_2._details:SetAlpha(1)
			arg_2_2._details.CollateralValue:SetAlpha(0)
			arg_2_2._details.DifficultyValue:SetAlpha(0)

			if arg_2_0._isZoomed then
				local var_5_2 = arg_2_3.mapPosition == WORLD_MAP.Regions.URZIKSTAN and Engine.CBBHFCGDIC("LEVELS/URZIKSTAN") or Engine.CBBHFCGDIC("LUA_MENU/BRITISH")

				if arg_2_0.levelSelectZoomMap.RegionName:getText() ~= var_5_2 then
					arg_2_0.levelSelectZoomMap.RegionName:setText(var_5_2)
				end
			end

			arg_2_2._details:UpdateContent(arg_2_3)
		end
	end
end

local function var_0_6(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	var_0_5(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
end

local function var_0_7(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if not arg_7_0._isZoomIn and arg_7_0._isZoomed then
		arg_7_0.darkener:SetAlpha(0, var_0_1 / 2, LUI.EASING.outQuadratic)
		ACTIONS.AnimateSequence(arg_7_0.levelSelectZoomMap, "ZoomOut")
		Engine.BJDBIAGIDA(SOUND_SETS.spMainMenu.mapClose)
	end

	arg_7_0._isZoomed = false
end

local function var_0_8(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.PopulateMap = var_0_4
	arg_8_0.UpdateDetails = var_0_5
	arg_8_0.ZoomIn = var_0_6
	arg_8_0.ZoomOut = var_0_7
	arg_8_0._controllerIndex = arg_8_1
	arg_8_0._nodes = {}
	arg_8_0._ZoomIn = false
	arg_8_0._Zoomed = false
	arg_8_0._overPopupNodes = {}
	arg_8_0._urzPopupNodes = {}
	arg_8_0._ukPopupNodes = {}

	local var_8_0

	local function var_8_1()
		local var_9_0 = arg_8_0:Wait(math.random(5000, 10000))
		local var_9_1 = math.random(0.01, 0.02)

		function var_9_0.onComplete()
			arg_8_0.Map:SetGlitchAmount(var_9_1, 0)
			arg_8_0.Map:SetGlitchAmount(0, 100)
			var_8_1()
		end
	end

	var_8_1()
end

function LevelSelectMap(arg_11_0, arg_11_1)
	local var_11_0 = LUI.UIElement.new()

	var_11_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_11_0.id = "LevelSelectMap"
	var_11_0._animationSets = {}
	var_11_0._sequences = {}

	local var_11_1 = arg_11_1 and arg_11_1.controllerIndex

	if not var_11_1 and not Engine.DDJFBBJAIG() then
		var_11_1 = var_11_0:getRootController()
	end

	assert(var_11_1)

	local var_11_2 = var_11_0
	local var_11_3
	local var_11_4 = LUI.UIImage.new()

	var_11_4.id = "BG"

	var_11_4:SetRGBFromInt(0, 0)
	var_11_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -564, _1080p * 1612, _1080p * -484, _1080p * 484)
	var_11_0:addElement(var_11_4)

	var_11_0.BG = var_11_4

	local var_11_5
	local var_11_6 = LUI.UIImage.new()

	var_11_6.id = "Map"

	var_11_6:setImage(RegisterMaterial("campaign_world_map"), 0)
	var_11_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -564, _1080p * 1612, _1080p * -484, _1080p * 484)
	var_11_0:addElement(var_11_6)

	var_11_0.Map = var_11_6

	local var_11_7
	local var_11_8 = MenuBuilder.BuildRegisteredType("LevelMapDecoration", {
		controllerIndex = var_11_1
	})

	var_11_8.id = "Decoration1"

	var_11_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2042, _1080p * 2542, _1080p * -125, _1080p * 375)
	var_11_0:addElement(var_11_8)

	var_11_0.Decoration1 = var_11_8

	local var_11_9
	local var_11_10 = MenuBuilder.BuildRegisteredType("LevelMapDecoration", {
		controllerIndex = var_11_1
	})

	var_11_10.id = "Decoration2"

	var_11_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 242, _1080p * 742, _1080p * 154, _1080p * 654)
	var_11_0:addElement(var_11_10)

	var_11_0.Decoration2 = var_11_10

	local var_11_11
	local var_11_12 = MenuBuilder.BuildRegisteredType("LevelMapDecoration", {
		controllerIndex = var_11_1
	})

	var_11_12.id = "Decoration3"

	var_11_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1892, _1080p * 2392, _1080p * 457, _1080p * 957)
	var_11_0:addElement(var_11_12)

	var_11_0.Decoration3 = var_11_12

	local var_11_13
	local var_11_14 = MenuBuilder.BuildRegisteredType("LevelMapDecoration", {
		controllerIndex = var_11_1
	})

	var_11_14.id = "Decoration4"

	var_11_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 819, _1080p * 1319, _1080p * 290, _1080p * 790)
	var_11_0:addElement(var_11_14)

	var_11_0.Decoration4 = var_11_14

	local var_11_15
	local var_11_16 = MenuBuilder.BuildRegisteredType("LevelMapDecoration", {
		controllerIndex = var_11_1
	})

	var_11_16.id = "Decoration5"

	var_11_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1345, _1080p * 1845, _1080p * 54, _1080p * 554)
	var_11_0:addElement(var_11_16)

	var_11_0.Decoration5 = var_11_16

	local var_11_17
	local var_11_18 = MenuBuilder.BuildRegisteredType("LevelMapDecoration", {
		controllerIndex = var_11_1
	})

	var_11_18.id = "Decoration6"

	var_11_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1345, _1080p * 1845, _1080p * 503, _1080p * 1003)
	var_11_0:addElement(var_11_18)

	var_11_0.Decoration6 = var_11_18

	local var_11_19
	local var_11_20 = MenuBuilder.BuildRegisteredType("LevelMapDecoration", {
		controllerIndex = var_11_1
	})

	var_11_20.id = "Decoration7"

	var_11_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2588, _1080p * 3088, _1080p * 872, _1080p * 1372)
	var_11_0:addElement(var_11_20)

	var_11_0.Decoration7 = var_11_20

	local var_11_21
	local var_11_22 = MenuBuilder.BuildRegisteredType("LevelMapDecoration", {
		controllerIndex = var_11_1
	})

	var_11_22.id = "Decoration8"

	var_11_22:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2655, _1080p * 3155, _1080p * 40, _1080p * 540)
	var_11_0:addElement(var_11_22)

	var_11_0.Decoration8 = var_11_22

	local var_11_23
	local var_11_24 = LUI.UIImage.new()

	var_11_24.id = "UrzBox"

	var_11_24:SetAlpha(0, 0)
	var_11_24:SetPixelGridEnabled(true)
	var_11_24:SetPixelGridContrast(0.8, 0)
	var_11_24:SetPixelGridBlockWidth(6, 0)
	var_11_24:SetPixelGridBlockHeight(6, 0)
	var_11_24:SetPixelGridGutterWidth(2, 0)
	var_11_24:SetPixelGridGutterHeight(2, 0)
	var_11_24:setImage(RegisterMaterial("campaign_urzikstan_map_mask"), 0)
	var_11_24:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2478, _1080p * 2606, _1080p * 689, _1080p * 817)
	var_11_0:addElement(var_11_24)

	var_11_0.UrzBox = var_11_24

	local var_11_25
	local var_11_26 = LUI.UIImage.new()

	var_11_26.id = "UrzFocus"

	var_11_26:SetRGBFromTable(SWATCHES.Frontend.PanelBorder, 0)
	var_11_26:setImage(RegisterMaterial("campaign_urzikstan_map_circles"), 0)
	var_11_26:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2460, _1080p * 2588, _1080p * 685, _1080p * 813)
	var_11_0:addElement(var_11_26)

	var_11_0.UrzFocus = var_11_26

	local function var_11_27()
		return
	end

	var_11_0._sequences.DefaultSequence = var_11_27

	local var_11_28 = {
		{
			value = 0.1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.2,
			duration = 667,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.1,
			duration = 667,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outQuadratic
		}
	}

	var_11_24:RegisterAnimationSequence("UrzBlink", var_11_28)

	local function var_11_29()
		var_11_24:AnimateLoop("UrzBlink")
	end

	var_11_0._sequences.UrzBlink = var_11_29

	local var_11_30 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_11_24:RegisterAnimationSequence("UrzHide", var_11_30)

	local function var_11_31()
		var_11_24:AnimateSequence("UrzHide")
	end

	var_11_0._sequences.UrzHide = var_11_31

	local var_11_32 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2460,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2588,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 685,
			easing = LUI.EASING.outCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 813,
			easing = LUI.EASING.outCubic
		},
		{
			value = 1,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.outCubic
		}
	}

	var_11_26:RegisterAnimationSequence("UrzFocusStart", var_11_32)

	local function var_11_33()
		var_11_26:AnimateSequence("UrzFocusStart")
	end

	var_11_0._sequences.UrzFocusStart = var_11_33

	local var_11_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Z_Rotation
		},
		{
			value = 360,
			duration = 35000,
			property = TWEEN_PROPERTY.Z_Rotation
		}
	}

	var_11_26:RegisterAnimationSequence("UrzFocusLoop", var_11_34)

	local function var_11_35()
		var_11_26:AnimateLoop("UrzFocusLoop")
	end

	var_11_0._sequences.UrzFocusLoop = var_11_35

	local var_11_36 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2521,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 746,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 2527,
			easing = LUI.EASING.inCubic
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 752,
			easing = LUI.EASING.inCubic
		},
		{
			value = 0,
			duration = 200,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inCubic
		}
	}

	var_11_26:RegisterAnimationSequence("UrzFocusEnd", var_11_36)

	local function var_11_37()
		var_11_26:AnimateSequence("UrzFocusEnd")
	end

	var_11_0._sequences.UrzFocusEnd = var_11_37

	var_0_8(var_11_0, var_11_1, arg_11_1)

	return var_11_0
end

MenuBuilder.registerType("LevelSelectMap", LevelSelectMap)
LockTable(_M)
