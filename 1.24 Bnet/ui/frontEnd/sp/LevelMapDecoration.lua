module(..., package.seeall)

local var_0_0 = 16

local function var_0_1(arg_1_0, arg_1_1)
	if arg_1_1 then
		local var_1_0 = math.random(0, 50) * 10
		local var_1_1 = math.random(0, 50) * 10

		arg_1_1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_1_0, _1080p * var_0_0, _1080p * var_1_1, _1080p * var_0_0, 0)
	end
end

local function var_0_2(arg_2_0)
	local var_2_0 = math.random(1, #arg_2_0._circles)

	if arg_2_0._circles[var_2_0] then
		ACTIONS.AnimateSequence(arg_2_0._circles[var_2_0], "Hide")

		arg_2_0:Wait(arg_2_0._circles[var_2_0]._transitionDuration).onComplete = function()
			arg_2_0:PositionNode(arg_2_0._circles[var_2_0])
			arg_2_0._circles[var_2_0]:PlayAnim()
		end

		local var_2_1 = math.random(arg_2_0._circles[var_2_0]._transitionDuration + 5000, 10000)

		arg_2_0:Wait(var_2_1).onComplete = function()
			arg_2_0:UpdateCircleNodes()
		end
	end
end

local function var_0_3(arg_5_0)
	local var_5_0 = math.random(1, #arg_5_0._squares)

	if arg_5_0._squares[var_5_0] then
		ACTIONS.AnimateSequence(arg_5_0._squares[var_5_0], "Hide")

		arg_5_0:Wait(arg_5_0._squares[var_5_0]._transitionDuration).onComplete = function()
			arg_5_0:PositionNode(arg_5_0._squares[var_5_0])
			arg_5_0._squares[var_5_0]:PlayAnim()
		end
	end

	local var_5_1 = math.random(arg_5_0._squares[var_5_0]._transitionDuration + 5000, 8000)

	arg_5_0:Wait(var_5_1).onComplete = function()
		arg_5_0:UpdateSquareNodes()
	end
end

local function var_0_4(arg_8_0)
	local var_8_0 = math.random(1, #arg_8_0._triangles)

	if arg_8_0._triangles[var_8_0] then
		ACTIONS.AnimateSequence(arg_8_0._triangles[var_8_0], "Hide")

		arg_8_0:Wait(arg_8_0._triangles[var_8_0]._transitionDuration).onComplete = function()
			arg_8_0:PositionNode(arg_8_0._triangles[var_8_0])
			arg_8_0._triangles[var_8_0]:PlayAnim()
		end
	end

	local var_8_1 = math.random(arg_8_0._triangles[var_8_0]._transitionDuration + 1000, 2000)

	arg_8_0:Wait(var_8_1).onComplete = function()
		arg_8_0:UpdateTriangleNodes()
	end
end

local function var_0_5(arg_11_0)
	local var_11_0 = math.random(1, #arg_11_0._arrows)

	if arg_11_0._arrows[var_11_0] then
		ACTIONS.AnimateSequence(arg_11_0._arrows[var_11_0], "Hide")

		arg_11_0:Wait(arg_11_0._arrows[var_11_0]._transitionDuration).onComplete = function()
			arg_11_0:PositionNode(arg_11_0._arrows[var_11_0])
			arg_11_0._arrows[var_11_0]:PlayAnim()
		end
	end

	local var_11_1 = math.random(arg_11_0._arrows[var_11_0]._transitionDuration + 3000, 5000)

	arg_11_0:Wait(var_11_1).onComplete = function()
		arg_11_0:UpdateArrowNodes()
	end
end

local function var_0_6(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.PositionNode = var_0_1
	arg_14_0.UpdateCircleNodes = var_0_2
	arg_14_0.UpdateSquareNodes = var_0_3
	arg_14_0.UpdateTriangleNodes = var_0_4
	arg_14_0.UpdateArrowNodes = var_0_5
	arg_14_0._triangles = {
		arg_14_0.Triangle1,
		arg_14_0.Triangle2,
		arg_14_0.Triangle3
	}
	arg_14_0._circles = {
		arg_14_0.Circle1
	}
	arg_14_0._squares = {
		arg_14_0.Square1,
		arg_14_0.Square2
	}
	arg_14_0._arrows = {
		arg_14_0.Arrow1,
		arg_14_0.Arrow2,
		arg_14_0.Arrow3
	}

	arg_14_0:UpdateCircleNodes()
	arg_14_0:UpdateSquareNodes()
	arg_14_0:UpdateTriangleNodes()
	arg_14_0:UpdateArrowNodes()
end

function LevelMapDecoration(arg_15_0, arg_15_1)
	local var_15_0 = LUI.UIElement.new()

	var_15_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 500 * _1080p, 0, 500 * _1080p)

	var_15_0.id = "LevelMapDecoration"

	local var_15_1 = arg_15_1 and arg_15_1.controllerIndex

	if not var_15_1 and not Engine.DDJFBBJAIG() then
		var_15_1 = var_15_0:getRootController()
	end

	assert(var_15_1)

	local var_15_2 = var_15_0
	local var_15_3
	local var_15_4 = MenuBuilder.BuildRegisteredType("MapDecorationCircle", {
		controllerIndex = var_15_1
	})

	var_15_4.id = "Circle1"

	var_15_4:SetAlpha(0.75, 0)
	var_15_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 34, _1080p * 50, _1080p * 32, _1080p * 48)
	var_15_0:addElement(var_15_4)

	var_15_0.Circle1 = var_15_4

	local var_15_5
	local var_15_6 = MenuBuilder.BuildRegisteredType("MapDecorationTriangle", {
		controllerIndex = var_15_1
	})

	var_15_6.id = "Triangle1"

	var_15_6:SetAlpha(0.85, 0)
	var_15_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 300, _1080p * 316, _1080p * 216, _1080p * 232)
	var_15_0:addElement(var_15_6)

	var_15_0.Triangle1 = var_15_6

	local var_15_7
	local var_15_8 = MenuBuilder.BuildRegisteredType("MapDecorationTriangle", {
		controllerIndex = var_15_1
	})

	var_15_8.id = "Triangle2"

	var_15_8:SetAlpha(0.85, 0)
	var_15_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 178, _1080p * 194, _1080p * 292, _1080p * 308)
	var_15_0:addElement(var_15_8)

	var_15_0.Triangle2 = var_15_8

	local var_15_9
	local var_15_10 = MenuBuilder.BuildRegisteredType("MapDecorationTriangle", {
		controllerIndex = var_15_1
	})

	var_15_10.id = "Triangle3"

	var_15_10:SetAlpha(0.85, 0)
	var_15_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 50, _1080p * 66, _1080p * 200, _1080p * 216)
	var_15_0:addElement(var_15_10)

	var_15_0.Triangle3 = var_15_10

	local var_15_11
	local var_15_12 = MenuBuilder.BuildRegisteredType("MapDecorationSquare", {
		controllerIndex = var_15_1
	})

	var_15_12.id = "Square1"

	var_15_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 356, _1080p * 372, _1080p * 73, _1080p * 89)
	var_15_0:addElement(var_15_12)

	var_15_0.Square1 = var_15_12

	local var_15_13
	local var_15_14 = MenuBuilder.BuildRegisteredType("MapDecorationSquare", {
		controllerIndex = var_15_1
	})

	var_15_14.id = "Square2"

	var_15_14:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 91, _1080p * 107, _1080p * 404, _1080p * 420)
	var_15_0:addElement(var_15_14)

	var_15_0.Square2 = var_15_14

	local var_15_15
	local var_15_16 = MenuBuilder.BuildRegisteredType("MapDecorationArrow", {
		controllerIndex = var_15_1
	})

	var_15_16.id = "Arrow1"

	var_15_16:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 284, _1080p * 300, _1080p * 308, _1080p * 324)
	var_15_0:addElement(var_15_16)

	var_15_0.Arrow1 = var_15_16

	local var_15_17
	local var_15_18 = MenuBuilder.BuildRegisteredType("MapDecorationArrow", {
		controllerIndex = var_15_1
	})

	var_15_18.id = "Arrow2"

	var_15_18:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 214, _1080p * 230, _1080p * 196, _1080p * 212)
	var_15_0:addElement(var_15_18)

	var_15_0.Arrow2 = var_15_18

	local var_15_19
	local var_15_20 = MenuBuilder.BuildRegisteredType("MapDecorationArrow", {
		controllerIndex = var_15_1
	})

	var_15_20.id = "Arrow3"

	var_15_20:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 425, _1080p * 441, _1080p * 372, _1080p * 388)
	var_15_0:addElement(var_15_20)

	var_15_0.Arrow3 = var_15_20

	var_0_6(var_15_0, var_15_1, arg_15_1)

	return var_15_0
end

MenuBuilder.registerType("LevelMapDecoration", LevelMapDecoration)
LockTable(_M)
