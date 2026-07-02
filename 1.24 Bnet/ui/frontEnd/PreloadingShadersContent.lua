module(..., package.seeall)

local var_0_0 = 7000
local var_0_1 = 0.15
local var_0_2 = 0.13
local var_0_3 = {
	[LUI.ShaderPreloadLayer.States.IN_PROGRESS] = 0.085,
	[LUI.ShaderPreloadLayer.States.PAUSED] = 0.085,
	[LUI.ShaderPreloadLayer.States.PENDING] = 0.085,
	[LUI.ShaderPreloadLayer.States.COMPLETED] = 0.16
}

local function var_0_4(arg_1_0, arg_1_1)
	LAYOUT.ScaleWidgetToTextWidthLeftAligned(arg_1_0.ContentInternal.Text, arg_1_0.ContentInternal.Text)
	LAYOUT.ScaleWidgetToTextWidthLeftAligned(arg_1_0.ContentInternal.ColoredText, arg_1_0.ContentInternal.ColoredText)

	local var_1_0 = var_0_3[arg_1_1]

	if CONDITIONS.IsArabic() then
		var_1_0 = var_0_1
	elseif IsLanguagePortuguese() and arg_1_1 == LUI.ShaderPreloadLayer.States.PAUSED then
		var_1_0 = var_0_2
	end

	local var_1_1 = LAYOUT.GetHorizontalListChildrenWidth(arg_1_0.ContentInternal) * var_1_0

	LAYOUT.ScaleWidgetToHorizontalListContentCenterAligned(arg_1_0, arg_1_0.ContentInternal, var_1_1)
end

local function var_0_5(arg_2_0, arg_2_1, arg_2_2)
	if not arg_2_0.hasTooltip and arg_2_2 < 100 then
		arg_2_0:SetHandleMouseMove(true)

		local var_2_0 = {
			tooltipDescription = Engine.CBBHFCGDIC("LUA_MENU_PC/SHADERS_INSTALLATION_TOOLTIP")
		}

		arg_2_0:AddTooltipData(controllerIndex, var_2_0)

		arg_2_0.hasTooltip = true
	end

	arg_2_0.ContentInternal.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/SHADER_PRELOADING_PROGRESS", arg_2_1, arg_2_2))
	ACTIONS.AnimateSequence(arg_2_0.ContentInternal, "InProgress")
	arg_2_0:UpdateLayout(LUI.ShaderPreloadLayer.States.IN_PROGRESS)
end

local function var_0_6(arg_3_0)
	ACTIONS.AnimateSequence(arg_3_0.ContentInternal, "Completed")
	Engine.BJDBIAGIDA(CoD.SFX.AdjustSafeArea)
	arg_3_0:RemoveToolTipData()

	arg_3_0.shaderPreloadingCompleteTimer = arg_3_0:Wait(var_0_0)

	function arg_3_0.shaderPreloadingCompleteTimer.onComplete()
		LUI.ShaderPreloadLayer.SetShaderPreloadingVisible(false)

		arg_3_0.shaderPreloadingCompleteTimer = nil
	end
end

local function var_0_7(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.UpdateLayout = var_0_4
	arg_5_0.UpdateProgress = var_0_5
	arg_5_0.CompleteSequence = var_0_6
	arg_5_0.hasTooltip = false

	arg_5_0:addEventHandler("onVideoChange", function()
		local var_6_0 = Engine.DBFFAEEFGJ()

		var_0_4(arg_5_0, var_6_0.shaderPreloadLayer:GetCurrentState())
	end)
end

function PreloadingShadersContent(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIElement.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 750 * _1080p, 0, 40 * _1080p)

	var_7_0.id = "PreloadingShadersContent"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0
	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("PreloadingShadersBackground", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "Background"

	var_7_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_7_0:addElement(var_7_4)

	var_7_0.Background = var_7_4

	local var_7_5
	local var_7_6 = MenuBuilder.BuildRegisteredType("PreloadingShadersContentInternal", {
		controllerIndex = var_7_1
	})

	var_7_6.id = "ContentInternal"

	var_7_6:SetAnchorsAndPosition(0, 1, 0.5, 0.5, _1080p * 12, _1080p * 685, _1080p * -15, _1080p * 15)
	var_7_0:addElement(var_7_6)

	var_7_0.ContentInternal = var_7_6

	var_0_7(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("PreloadingShadersContent", PreloadingShadersContent)
LockTable(_M)
