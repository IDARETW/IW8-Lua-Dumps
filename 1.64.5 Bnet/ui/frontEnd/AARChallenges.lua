module(..., package.seeall)

local var_0_0 = 0.05
local var_0_1 = 0.1
local var_0_2 = 4

local function var_0_3(arg_1_0, arg_1_1)
	if not LUI.IsLastInputGamepad(arg_1_1.controller) then
		arg_1_0._scrollDirection = nil

		return
	end

	local var_1_0 = arg_1_1.leftStickPitch or 0

	if math.abs(var_1_0) < var_0_0 then
		arg_1_0._scrollDirection = nil

		return
	end

	arg_1_0._scrollDirection = var_1_0 > 0 and "up" or "down"

	return true
end

local function var_0_4(arg_2_0, arg_2_1)
	arg_2_0._scrollDirection = nil

	if arg_2_1.down then
		if arg_2_1.button == "up" then
			arg_2_0._scrollDirection = "up"
		elseif arg_2_1.button == "down" then
			arg_2_0._scrollDirection = "down"
		end
	end

	return true
end

local function var_0_5(arg_3_0)
	if arg_3_0._scrollDirection then
		arg_3_0.List:ScrollAmount(arg_3_0._scrollDirection, var_0_1)
	end
end

local function var_0_6(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	local var_4_0 = arg_4_0.List:GetContentIndex(arg_4_3, arg_4_4, {
		relativePosition = false
	})
	local var_4_1 = arg_4_0.challengesPackage[var_4_0 + 1]

	arg_4_2:InitChallenge(arg_4_1, var_4_1)
end

function PostLoadFunc(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_0.List)

	arg_5_0.challengesPackage = nil

	if AAR.IsDebugAARSummaryEnabled() then
		arg_5_0.challengesPackage = AAR.GetDebugChallengesPackage(arg_5_1, arg_5_2.matchDataPackage.challenges)

		local var_5_0 = AAR.GetCamoUnlocksPackage({
			{
				ID = 2005100
			}
		})

		for iter_5_0 = 1, #var_5_0 do
			table.insert(arg_5_0.challengesPackage, var_5_0[iter_5_0])
		end
	else
		arg_5_0.challengesPackage = AAR.GetChallengesPackage(arg_5_1, arg_5_2.matchDataPackage.challenges)

		local var_5_1 = AAR.GetCamoUnlocksPackage(arg_5_2.matchDataPackage.unlocks)

		for iter_5_1 = 1, #var_5_1 do
			table.insert(arg_5_0.challengesPackage, var_5_1[iter_5_1])
		end
	end

	arg_5_0.List.default = true

	arg_5_0.List:SetNumChildren(#arg_5_0.challengesPackage)
	arg_5_0.List:SetRefreshChild(function(arg_6_0, arg_6_1, arg_6_2)
		var_0_6(arg_5_0, arg_5_1, arg_6_0, arg_6_1, arg_6_2)
	end)
	arg_5_0.List:RefreshContent()

	if #arg_5_0.challengesPackage > var_0_2 then
		arg_5_0.List:SetScrollbarKBMStyle(true)
		arg_5_0:registerEventHandler("gamepad_sticks", var_0_3)
		arg_5_0:registerEventHandler("gamepad_button", var_0_4)

		arg_5_0.aarChallengeTimer = LUI.UITimer.new({
			interval = 10,
			event = "update_aar_challenge_input"
		})
		arg_5_0.aarChallengeTimer.id = "aarChallengeTimer"

		arg_5_0:addElement(arg_5_0.aarChallengeTimer)
		arg_5_0:registerEventHandler("update_aar_challenge_input", function(arg_7_0, arg_7_1)
			var_0_5(arg_7_0)
		end)
	end

	ACTIONS.AnimateSequence(arg_5_0, "Intro")
end

function AARChallenges(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_8_0.id = "AARChallenges"
	var_8_0._animationSets = var_8_0._animationSets or {}
	var_8_0._sequences = var_8_0._sequences or {}

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0
	local var_8_3
	local var_8_4 = MenuBuilder.BuildRegisteredType("VerticalMinimalScrollbar", {
		controllerIndex = var_8_1
	})

	var_8_4.id = "VerticalScrollbar"

	var_8_4:SetAnchorsAndPosition(1, 0, 0, 1, _1080p * -1824, _1080p * -1814, _1080p * 200, _1080p * 979)
	var_8_0:addElement(var_8_4)

	var_8_0.VerticalScrollbar = var_8_4

	local var_8_5
	local var_8_6 = {
		scrollingThresholdX = 1,
		buildArrowsLabel = false,
		maxVelocity = 5000,
		adjustSizeToContent = false,
		scrollingThresholdY = 1,
		wrapX = true,
		maxVisibleColumns = 2,
		maxVisibleRows = 4,
		wrapY = true,
		arrowsVerticalOffset = 0,
		springCoefficient = 400,
		controllerIndex = var_8_1,
		buildChild = function()
			return MenuBuilder.BuildRegisteredType("AARChallengeItemStandard", {
				controllerIndex = var_8_1
			})
		end,
		refreshChild = function(arg_10_0, arg_10_1, arg_10_2)
			return
		end,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 840,
		rowHeight = _1080p * 300,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top
	}
	local var_8_7 = LUI.UIGrid.new(var_8_6)

	var_8_7.id = "List"

	var_8_7:setUseStencil(true)
	var_8_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 118, _1080p * 1802, _1080p * 200, _1080p * 979)
	var_8_0:addElement(var_8_7)

	var_8_0.List = var_8_7

	local var_8_8
	local var_8_9 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_8_1
	})

	var_8_9.id = "ArrowUp"

	var_8_9:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -32, 0, _1080p * 979, _1080p * 1011)
	var_8_0:addElement(var_8_9)

	var_8_0.ArrowUp = var_8_9

	local var_8_10
	local var_8_11 = MenuBuilder.BuildRegisteredType("NavigationArrow", {
		controllerIndex = var_8_1
	})

	var_8_11.id = "ArrowDown"

	var_8_11.Arrow:SetZRotation(180, 0)
	var_8_11:SetAnchorsAndPosition(0.5, 0.5, 0, 1, 0, _1080p * 32, _1080p * 979, _1080p * 1011)
	var_8_0:addElement(var_8_11)

	var_8_0.ArrowDown = var_8_11

	local function var_8_12()
		return
	end

	var_8_0._sequences.DefaultSequence = var_8_12

	local var_8_13 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1784
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1774
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -1824
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -1814
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_8_4:RegisterAnimationSequence("Intro", var_8_13)

	local var_8_14 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 157
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1842
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 117
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 1802
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_8_7:RegisterAnimationSequence("Intro", var_8_14)

	local var_8_15 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 8
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 40
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -32
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Right
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_8_9:RegisterAnimationSequence("Intro", var_8_15)

	local var_8_16 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 40
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 72
		},
		{
			value = 0,
			duration = 150,
			property = TWEEN_PROPERTY.Left
		},
		{
			duration = 150,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 32
		},
		{
			value = 1,
			duration = 250,
			property = TWEEN_PROPERTY.Alpha,
			easing = LUI.EASING.inQuadratic
		}
	}

	var_8_11:RegisterAnimationSequence("Intro", var_8_16)

	local function var_8_17()
		var_8_4:AnimateSequence("Intro")
		var_8_7:AnimateSequence("Intro")
		var_8_9:AnimateSequence("Intro")
		var_8_11:AnimateSequence("Intro")
	end

	var_8_0._sequences.Intro = var_8_17

	local var_8_18 = LUI.UIScrollbar.new({
		direction = LUI.DIRECTION.vertical,
		eventListener = var_8_4,
		startCap = var_8_4.startCap,
		endCap = var_8_4.endCap,
		sliderArea = var_8_4.sliderArea,
		slider = var_8_4.sliderArea and var_8_4.sliderArea.slider,
		fixedSizeSlider = var_8_4.sliderArea and var_8_4.sliderArea.fixedSizeSlider
	})

	var_8_7:AddScrollbar(var_8_18)
	var_8_7:AddArrow(var_8_9)
	var_8_7:AddArrow(var_8_11)
	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("AARChallenges", AARChallenges)
LockTable(_M)
