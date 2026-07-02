module(..., package.seeall)

local function var_0_0()
	WipeGlobalModelsAtPath(menuModelPath)
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0.PS4StickLayout == nil then
		local var_2_0 = LUI.UIImage.new()

		var_2_0.id = "PS4StickLayout"

		var_2_0:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
		var_2_0:setImage(RegisterMaterial("cont_ps4"), 0)
		var_2_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -168, _1080p * 168, _1080p * -53, _1080p * 283)
		arg_2_0:addElement(var_2_0)

		arg_2_0.PS4StickLayout = var_2_0
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	if arg_3_0.XB3StickLayout == nil then
		local var_3_0 = LUI.UIImage.new()

		var_3_0.id = "XB3StickLayout"

		var_3_0:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
		var_3_0:setImage(RegisterMaterial("cont"), 0)
		var_3_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -143, _1080p * 143, _1080p * -27, _1080p * 259)
		arg_3_0:addElement(var_3_0)

		arg_3_0.XB3StickLayout = var_3_0
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	if arg_4_0.PSVitaStickLayout == nil then
		local var_4_0 = LUI.UIImage.new()

		var_4_0.id = "PSVitaStickLayout"

		var_4_0:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
		var_4_0:setImage(RegisterMaterial("cont_vita"), 0)
		var_4_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -138, _1080p * 116, _1080p * -8, _1080p * 240)
		arg_4_0:addElement(var_4_0)

		arg_4_0.PSVitaStickLayout = var_4_0
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.CreatePS4Layout = var_0_1
	arg_5_0.CreateXB3Layout = var_0_2
	arg_5_0.CreateVitaLayout = var_0_3

	LUI.AddStickLayoutLogic(arg_5_0, arg_5_1, arg_5_2)
	ACTIONS.AnimateSequence(arg_5_0.ButtonLayoutLines, "StickLayout")
	arg_5_0:registerAndCallEventHandler("input_connection", function(arg_6_0, arg_6_1)
		if Engine.CIEGIACHAE() then
			if Engine.BIAEDEEBJI(arg_5_1) then
				if arg_6_0.PS4StickLayout then
					arg_6_0:RemoveElement(arg_6_0.PS4StickLayout)
					arg_6_0.PS4StickLayout:closeTree()

					arg_6_0.PS4StickLayout = nil
				end

				arg_6_0:CreateVitaLayout(arg_6_1.controllerIndex)
				ACTIONS.AnimateSequenceByElement(arg_6_0, {
					elementPath = "LeftStickLayoutDirections",
					sequenceName = "HideStickButtonPromptsForVita",
					elementName = "LeftStickLayoutDirections"
				})
				ACTIONS.AnimateSequenceByElement(arg_6_0, {
					elementPath = "RightStickLayoutDirections",
					sequenceName = "HideStickButtonPromptsForVita",
					elementName = "RightStickLayoutDirections"
				})
			else
				if arg_6_0.PSVitaStickLayout then
					arg_6_0:RemoveElement(arg_6_0.PSVitaStickLayout)
					arg_6_0.PSVitaStickLayout:closeTree()

					arg_6_0.PSVitaStickLayout = nil
				end

				arg_6_0:CreatePS4Layout(arg_6_1.controllerIndex)
				ACTIONS.AnimateSequenceByElement(arg_6_0, {
					elementPath = "LeftStickLayoutDirections",
					sequenceName = "L3ButtonIcon",
					elementName = "LeftStickLayoutDirections"
				})
				ACTIONS.AnimateSequenceByElement(arg_6_0, {
					elementPath = "RightStickLayoutDirections",
					sequenceName = "R3ButtonIcon",
					elementName = "RightStickLayoutDirections"
				})
			end
		elseif Engine.BAHIIBFDDG() then
			assert(arg_6_0.XB3StickLayout)
			ACTIONS.AnimateSequenceByElement(arg_6_0, {
				elementPath = "LeftStickLayoutDirections",
				sequenceName = "L3ButtonIcon",
				elementName = "LeftStickLayoutDirections"
			})
			ACTIONS.AnimateSequenceByElement(arg_6_0, {
				elementPath = "RightStickLayoutDirections",
				sequenceName = "R3ButtonIcon",
				elementName = "RightStickLayoutDirections"
			})
		elseif not Engine.HDGDBCJFG() then
			if Engine.GGFCHCDDE(arg_5_1) then
				if arg_6_0.XB3StickLayout then
					arg_6_0:RemoveElement(arg_6_0.XB3StickLayout)
					arg_6_0.XB3StickLayout:closeTree()

					arg_6_0.XB3StickLayout = nil
				end

				arg_6_0:CreatePS4Layout(arg_6_1.controllerIndex)
				arg_6_0.LeftStickLayoutDirections.Button:setImage(RegisterMaterial("button_stick_left_anim_ps4"))
				arg_6_0.RightStickLayoutDirections.Button:setImage(RegisterMaterial("button_stick_right_anim_ps4"))
			else
				if arg_6_0.PS4StickLayout then
					arg_6_0:RemoveElement(arg_6_0.PS4StickLayout)
					arg_6_0.PS4StickLayout:closeTree()

					arg_6_0.PS4StickLayout = nil
				end

				arg_6_0:CreateXB3Layout(arg_6_1.controllerIndex)
				ACTIONS.AnimateSequenceByElement(arg_6_0, {
					elementPath = "LeftStickLayoutDirections",
					sequenceName = "L3ButtonIcon",
					elementName = "LeftStickLayoutDirections"
				})
				ACTIONS.AnimateSequenceByElement(arg_6_0, {
					elementPath = "RightStickLayoutDirections",
					sequenceName = "R3ButtonIcon",
					elementName = "RightStickLayoutDirections"
				})
			end
		end
	end, {
		name = "input_connection",
		controllerIndex = arg_5_1
	})
end

function StickLayoutOptionsMenu(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 600 * _1080p, 0, 453 * _1080p)

	var_7_0.id = "StickLayoutOptionsMenu"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = LUI.UIImage.new()

	var_7_4.id = "Background"

	var_7_4:SetRGBFromInt(0, 0)
	var_7_4:SetAlpha(0.15, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("ButtonLayoutLines", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "ButtonLayoutLines"

	var_7_6:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * 227, _1080p * 577)
	var_7_0:addElement(var_7_6)

	var_7_0.ButtonLayoutLines = var_7_6

	local var_7_7
	local var_7_8 = MenuBuilder.BuildRegisteredType("StickLayoutDirections", {
		controllerIndex = var_7_1
	})

	var_7_8.id = "LeftStickLayoutDirections"

	var_7_8:SetDataSourceThroughElement(var_7_0, "left")
	var_7_8:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -169, _1080p * 32, _1080p * 224, _1080p * 474)
	var_7_0:addElement(var_7_8)

	var_7_0.LeftStickLayoutDirections = var_7_8

	local var_7_9
	local var_7_10 = MenuBuilder.BuildRegisteredType("StickLayoutDirections", {
		controllerIndex = var_7_1
	})

	var_7_10.id = "RightStickLayoutDirections"

	var_7_10:SetDataSourceThroughElement(var_7_0, "right")
	var_7_10:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * 59, _1080p * 256, _1080p * 224, _1080p * 474)
	var_7_0:addElement(var_7_10)

	var_7_0.RightStickLayoutDirections = var_7_10

	local var_7_11

	if CONDITIONS.IsPCOrPS4(var_7_0) then
		local var_7_12 = LUI.UIImage.new()

		var_7_12.id = "PS4StickLayout"

		var_7_12:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
		var_7_12:setImage(RegisterMaterial("cont_ps4"), 0)
		var_7_12:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -168, _1080p * 168, _1080p * -53, _1080p * 283)
		var_7_0:addElement(var_7_12)

		var_7_0.PS4StickLayout = var_7_12
	end

	local var_7_13

	if CONDITIONS.IsPCOrXB3(var_7_0) then
		local var_7_14 = LUI.UIImage.new()

		var_7_14.id = "XB3StickLayout"

		var_7_14:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
		var_7_14:setImage(RegisterMaterial("cont"), 0)
		var_7_14:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -143, _1080p * 143, _1080p * -27, _1080p * 259)
		var_7_0:addElement(var_7_14)

		var_7_0.XB3StickLayout = var_7_14
	end

	local var_7_15

	if Engine.CIEGIACHAE() then
		local var_7_16 = LUI.UIImage.new()

		var_7_16.id = "PSVitaStickLayout"

		var_7_16:SetRGBFromTable(SWATCHES.genericMenu.featuredLine, 0)
		var_7_16:setImage(RegisterMaterial("cont_vita"), 0)
		var_7_16:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -138, _1080p * 116, _1080p * -8, _1080p * 240)
		var_7_0:addElement(var_7_16)

		var_7_0.PSVitaStickLayout = var_7_16
	end

	ACTIONS.AnimateSequenceByElement(var_7_0, {
		elementPath = "self.LeftStickLayoutDirections",
		sequenceName = "ArrowsOnLeft",
		elementName = "LeftStickLayoutDirections"
	})
	ACTIONS.AnimateSequenceByElement(var_7_0, {
		elementPath = "self.RightStickLayoutDirections",
		sequenceName = "ArrowsOnLeft",
		elementName = "RightStickLayoutDirections"
	})
	var_7_8:SetDataSourceThroughElement(var_7_0, "left")
	var_7_10:SetDataSourceThroughElement(var_7_0, "right")
	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("StickLayoutOptionsMenu", StickLayoutOptionsMenu)
LUI.FlowManager.RegisterStackPopBehaviour("StickLayoutOptionsMenu", var_0_0)
LockTable(_M)
