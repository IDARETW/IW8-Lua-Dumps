module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = arg_2_0[arg_2_1]

		if var_2_0 then
			arg_2_2:setText(var_2_0)
		end
	end

	local function var_1_1(arg_3_0, arg_3_1)
		local var_3_0 = Debug.BGCHIICIHA()

		if var_3_0 then
			var_1_0(var_3_0, "DataA", arg_1_0.DebugTextA)
			var_1_0(var_3_0, "DataB", arg_1_0.DebugTextB)
			var_1_0(var_3_0, "DataC", arg_1_0.DebugTextC)
		end
	end

	local var_1_2 = LUI.UITimer.new({
		interval = 500,
		event = "fetch_debug_info"
	})

	var_1_2.id = "dataFetchTimer"

	arg_1_0:addElement(var_1_2)
	arg_1_0:registerEventHandler("fetch_debug_info", var_1_1)
end

function DebugLayerWidget(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_4_0.id = "DebugLayerWidget"

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIStyledText.new()

	var_4_4.id = "DebugTextA"

	var_4_4:SetRGBFromTable(SWATCHES.HUD.spinner, 0)
	var_4_4:setText("", 0)
	var_4_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_4:SetAlignment(LUI.Alignment.Left)
	var_4_4:SetOutlineMinDistance(-0.5, 0)
	var_4_4:SetOutlineRGBFromInt(0, 0)
	var_4_4:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 96, _1080p * 622, _1080p * 54, _1080p * 74)
	var_4_0:addElement(var_4_4)

	var_4_0.DebugTextA = var_4_4

	local var_4_5
	local var_4_6 = LUI.UIStyledText.new()

	var_4_6.id = "DebugTextB"

	var_4_6:SetRGBFromTable(SWATCHES.HUD.spinner, 0)
	var_4_6:setText("", 0)
	var_4_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_6:SetAlignment(LUI.Alignment.Left)
	var_4_6:SetOutlineMinDistance(-0.5, 0)
	var_4_6:SetOutlineRGBFromInt(0, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 647, _1080p * 1175, _1080p * 54, _1080p * 74)
	var_4_0:addElement(var_4_6)

	var_4_0.DebugTextB = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "DebugTextC"

	var_4_8:SetRGBFromTable(SWATCHES.HUD.spinner, 0)
	var_4_8:setText("", 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetAlignment(LUI.Alignment.Left)
	var_4_8:SetOutlineMinDistance(-0.5, 0)
	var_4_8:SetOutlineRGBFromInt(0, 0)
	var_4_8:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1210, _1080p * 1824, _1080p * 54, _1080p * 74)
	var_4_0:addElement(var_4_8)

	var_4_0.DebugTextC = var_4_8

	var_0_0(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("DebugLayerWidget", DebugLayerWidget)
LockTable(_M)
