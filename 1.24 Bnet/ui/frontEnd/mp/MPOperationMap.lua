module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.Highlight)
	arg_1_0.Highlight:SetParallaxMotionAmount(1)

	if Engine.CGABICJHAI() then
		local function var_1_0()
			local var_2_0 = CoD.GetAspectRatioScaleAdjust(0.25)

			arg_1_0.Cinematic:SetScale(var_2_0)
		end

		var_1_0()
		arg_1_0:addEventHandler("onVideoChange", var_1_0)
		LAYOUT.AddAspectRatioFadeFrame(arg_1_0, arg_1_1)
	end

	Engine.DFCGFCGBFD("main_menu", VideoPlaybackFlags.LOOP)
	arg_1_0:addEventHandler("menu_close", function(arg_3_0, arg_3_1)
		Engine.EBCGADABJ()
	end)
end

function MPOperationMap(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "MPOperationMap"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("Cinematic", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "Cinematic"

	var_4_4:SetRGBFromTable(SWATCHES.genericMenu.titleCinematicBlue, 0)
	var_4_4:SetColorOp(COLOR_OP.saturation, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Cinematic = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIImage.new()

	var_4_6.id = "Highlight"

	var_4_6:SetAlpha(0.6, 0)
	var_4_6:setImage(RegisterMaterial("mm_map_circular_highlight"), 0)
	var_4_6:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * -66, _1080p * 66, _1080p * -37, _1080p * 37)
	var_4_0:addElement(var_4_6)

	var_4_0.Highlight = var_4_6

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("MPOperationMap", MPOperationMap)
LockTable(_M)
