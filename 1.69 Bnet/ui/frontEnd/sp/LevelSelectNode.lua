module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1 < 10 and "0" .. arg_1_1 or arg_1_1

	arg_1_0.Number:setText(var_1_0)
end

local function var_0_1(arg_2_0)
	if arg_2_0.NodeFocus then
		local var_2_0 = math.random(50, 100)
		local var_2_1 = math.random(50, 100)
		local var_2_2 = math.random(50, 200)
		local var_2_3 = 2
		local var_2_4 = math.random(8, 10) / 10
		local var_2_5 = math.random(var_2_3, -var_2_3)
		local var_2_6 = math.random(var_2_3, -var_2_3)

		arg_2_0.NodeFocus:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * var_2_5, _1080p * arg_2_0._nodeSize, _1080p * var_2_6, _1080p * arg_2_0._nodeSize, var_2_0)
		arg_2_0.NodeFocus:SetAlpha(var_2_4, var_2_1)

		arg_2_0:Wait(var_2_0 + var_2_2).onComplete = function()
			arg_2_0:ShakeFocusedNode()
		end
	end
end

local function var_0_2(arg_4_0)
	if arg_4_0.NodeFocus then
		local var_4_0 = math.random(1, 6) * 1000

		arg_4_0:Wait(var_4_0).onComplete = function()
			if arg_4_0.NodeFocus then
				ACTIONS.AnimateSequence(arg_4_0.NodeFocus, "FlashGhost")
				arg_4_0:GhostFlash()
			end
		end
	end
end

local function var_0_3(arg_6_0, arg_6_1)
	arg_6_0._levelInfo = arg_6_1

	if not arg_6_0.NodeFocus then
		arg_6_0:RemoveElement(arg_6_0.NodeMain)

		local var_6_0 = MenuBuilder.BuildRegisteredType("LevelSelectNodeFocus", {
			controllerIndex = arg_6_0._controllerIndex
		})

		var_6_0.id = "NodeFocus"

		var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, _1080p * arg_6_0._nodeSize, _1080p * 0, _1080p * arg_6_0._nodeSize)
		arg_6_0:addElement(var_6_0)

		arg_6_0.NodeFocus = var_6_0

		arg_6_0:addElement(arg_6_0.NodeMain)

		local var_6_1 = arg_6_0:getParent()

		if var_6_1 then
			var_6_1:RemoveElement(arg_6_0)
			var_6_1:addElement(arg_6_0)
		end
	end

	local var_6_2 = arg_6_1.levelIndex + 1 < 10 and "0" .. arg_6_1.levelIndex + 1 or arg_6_1.levelIndex + 1

	arg_6_0.NodeFocus:SetMissionNum(var_6_2)

	arg_6_0._isSelected = true
	arg_6_0:Wait(arg_6_0._transitionDuration / 2, true).onComplete = function()
		if arg_6_0.NodeFocus then
			ACTIONS.AnimateSequence(arg_6_0, "Selected")
			ACTIONS.AnimateSequence(arg_6_0.NodeFocus, "Selected")

			arg_6_0:Wait(arg_6_0._transitionDuration, true).onComplete = function()
				if arg_6_0._isSelected then
					if arg_6_0.NodeFocus then
						ACTIONS.AnimateSequence(arg_6_0.NodeFocus, "MissionPulse")
						ACTIONS.AnimateSequence(arg_6_0.NodeFocus, "DashLoop")
						arg_6_0:ShakeFocusedNode()
						arg_6_0:GhostFlash()
					end
				else
					ACTIONS.AnimateSequence(arg_6_0, "Deselected")
					arg_6_0:DeselectNode()
				end
			end
		end
	end
end

local function var_0_4(arg_9_0)
	if arg_9_0.NodeFocus and arg_9_0._isSelected then
		ACTIONS.AnimateSequence(arg_9_0, "Deselected")
		ACTIONS.AnimateSequence(arg_9_0.NodeFocus, "Deselected")

		arg_9_0:Wait(arg_9_0._transitionDuration, true).onComplete = function()
			if arg_9_0._isSelected == false and arg_9_0.NodeFocus then
				arg_9_0.NodeFocus:closeTree()

				arg_9_0.NodeFocus = nil
			end
		end
	end

	arg_9_0._isSelected = false

	ACTIONS.AnimateSequence(arg_9_0, "Pulse")
end

local function var_0_5(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.SetupNode = var_0_0
	arg_11_0.SelectNode = var_0_3
	arg_11_0.DeselectNode = var_0_4
	arg_11_0.ShakeFocusedNode = var_0_1
	arg_11_0.GhostFlash = var_0_2
	arg_11_0._nodeSize = arg_11_2.nodeSize
	arg_11_0._transitionDuration = arg_11_2.transitionDuration
	arg_11_0._levelInfo = nil
	arg_11_0._isSelected = false
	arg_11_0._details = nil
	arg_11_0._controllerIndex = arg_11_1

	ACTIONS.AnimateSequence(arg_11_0, "Pulse")
end

function LevelSelectNode(arg_12_0, arg_12_1)
	local var_12_0 = LUI.UIElement.new()

	var_12_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 12 * _1080p, 0, 12 * _1080p)

	var_12_0.id = "LevelSelectNode"
	var_12_0._animationSets = {}
	var_12_0._sequences = {}

	local var_12_1 = arg_12_1 and arg_12_1.controllerIndex

	if not var_12_1 and not Engine.DDJFBBJAIG() then
		var_12_1 = var_12_0:getRootController()
	end

	assert(var_12_1)

	local var_12_2 = var_12_0
	local var_12_3
	local var_12_4 = LUI.UIImage.new()

	var_12_4.id = "Backer"

	var_12_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_12_4:SetAlpha(0.25, 0)
	var_12_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -3, _1080p * 15, _1080p * -3, _1080p * 15)
	var_12_0:addElement(var_12_4)

	var_12_0.Backer = var_12_4

	local var_12_5
	local var_12_6 = {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	local var_12_7 = LUI.UIBorder.new(var_12_6)

	var_12_7.id = "Border"

	var_12_7:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_12_7:SetAlpha(0.7, 0)
	var_12_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * -3, _1080p * 15, _1080p * -3, _1080p * 15)
	var_12_0:addElement(var_12_7)

	var_12_0.Border = var_12_7

	local var_12_8
	local var_12_9 = LUI.UIImage.new()

	var_12_9.id = "NodeMain"

	var_12_9:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
	var_12_9:SetAlpha(0.7, 0)
	var_12_9:setImage(RegisterMaterial("campaign_world_map_triangle"), 0)
	var_12_9:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 2, _1080p * -2)
	var_12_0:addElement(var_12_9)

	var_12_0.NodeMain = var_12_9

	local var_12_10
	local var_12_11 = LUI.UIStyledText.new()

	var_12_11.id = "Number"

	var_12_11:SetRGBFromTable(SWATCHES.MainMenu.ButtonText, 0)
	var_12_11:SetScale(-0.25, 0)
	var_12_11:setText("", 0)
	var_12_11:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_12_11:SetWordWrap(false)
	var_12_11:SetAlignment(LUI.Alignment.Center)
	var_12_11:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -14, _1080p * 14, _1080p * -19, _1080p * -1)
	var_12_0:addElement(var_12_11)

	var_12_0.Number = var_12_11

	local function var_12_12()
		return
	end

	var_12_0._sequences.DefaultSequence = var_12_12

	local var_12_13 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -3
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 15
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			value = 0.25,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Deselected", var_12_13)

	local var_12_14 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * -3
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * -3
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 15
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 15
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_7:RegisterAnimationSequence("Deselected", var_12_14)

	local var_12_15 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 2
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 2
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -2
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -2
		},
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("Deselected", var_12_15)

	local var_12_16 = {
		{
			value = 1,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_11:RegisterAnimationSequence("Deselected", var_12_16)

	local function var_12_17()
		var_12_4:AnimateSequence("Deselected")
		var_12_7:AnimateSequence("Deselected")
		var_12_9:AnimateSequence("Deselected")
		var_12_11:AnimateSequence("Deselected")
	end

	var_12_0._sequences.Deselected = var_12_17

	local var_12_18 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 7
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 7
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_4:RegisterAnimationSequence("Selected", var_12_18)

	local var_12_19 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 4
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 4
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * 8
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * 8
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_7:RegisterAnimationSequence("Selected", var_12_19)

	local var_12_20 = {
		{
			duration = 300,
			property = TWEEN_PROPERTY.Left,
			value = _1080p * 5
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Top,
			value = _1080p * 5
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Right,
			value = _1080p * -5
		},
		{
			duration = 300,
			property = TWEEN_PROPERTY.Bottom,
			value = _1080p * -5
		},
		{
			value = 0,
			duration = 300,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("Selected", var_12_20)

	local var_12_21 = {
		{
			value = 0,
			duration = 100,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_11:RegisterAnimationSequence("Selected", var_12_21)

	local function var_12_22()
		var_12_4:AnimateSequence("Selected")
		var_12_7:AnimateSequence("Selected")
		var_12_9:AnimateSequence("Selected")
		var_12_11:AnimateSequence("Selected")
	end

	var_12_0._sequences.Selected = var_12_22

	local var_12_23 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 0.5,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		},
		{
			value = 1,
			duration = 1000,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_12_9:RegisterAnimationSequence("Pulse", var_12_23)

	local function var_12_24()
		var_12_9:AnimateLoop("Pulse")
	end

	var_12_0._sequences.Pulse = var_12_24

	var_0_5(var_12_0, var_12_1, arg_12_1)

	return var_12_0
end

MenuBuilder.registerType("LevelSelectNode", LevelSelectNode)
LockTable(_M)
