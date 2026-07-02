LUI.ShaderPreloadLayer = LUI.Class(LUI.UIElement)

local var_0_0 = 800
local var_0_1 = 40
local var_0_2 = 300
local var_0_3 = {}

LUI.ShaderPreloadLayer.States = {
	COMPLETED = 4,
	IN_PROGRESS = 2,
	PAUSED = 3,
	PENDING = 1
}

function LUI.ShaderPreloadLayer.init(arg_1_0, arg_1_1)
	LUI.UIElement.init(arg_1_0)

	arg_1_0._controllerIndex = arg_1_1.controllerIndex or Engine.IJEBHJIJF()
	arg_1_0.id = "ShaderPreloadLayer"
	arg_1_0._isShaderPreloadingVisible = false
end

function LUI.ShaderPreloadLayer.ShouldBeVisible(arg_2_0)
	local var_2_0 = Engine.DBFFAEEFGJ().flowManager:GetStackTop()
	local var_2_1 = var_2_0 and var_2_0.name == "CinematicFullscreen"
	local var_2_2 = Engine.DIEEIEFCFF() and Dvar.IBEGCHEFE("MRTNMPRLKR")

	if not arg_2_0._isShaderPreloadingVisible then
		arg_2_0._isShaderPreloadingVisible = ShaderUpload.CEIBACCEAF()
	end

	return Engine.CGABICJHAI() and Engine.DDJFBBJAIG() and not var_2_2 and arg_2_0._isShaderPreloadingVisible and not var_2_1
end

function LUI.ShaderPreloadLayer.GetCurrentState(arg_3_0)
	return arg_3_0._currentState or LUI.ShaderPreloadLayer.States.NONE
end

function LUI.ShaderPreloadLayer.SetLayerPending(arg_4_0)
	arg_4_0.shaderPreloadContainer:SetTop(-var_0_1 * _1080p, var_0_2)
	arg_4_0.shaderPreloadContainer:SetBottom(0, var_0_2)

	arg_4_0._currentState = LUI.ShaderPreloadLayer.States.PENDING
end

function LUI.ShaderPreloadLayer.SetLayerInProgress(arg_5_0)
	arg_5_0.shaderPreloadContainer:SetTop(0, var_0_2)
	arg_5_0.shaderPreloadContainer:SetBottom(var_0_1 * _1080p, var_0_2)
	ACTIONS.AnimateSequence(arg_5_0.shaderPreloadContainer.ContentInternal, "InProgress")
	arg_5_0:UpdateProgress()

	arg_5_0._currentState = LUI.ShaderPreloadLayer.States.IN_PROGRESS

	arg_5_0.shaderPreloadContainer:UpdateLayout(arg_5_0._currentState)
end

function LUI.ShaderPreloadLayer.SetLayerPaused(arg_6_0)
	arg_6_0.shaderPreloadContainer.ContentInternal.Text:setText(Engine.CBBHFCGDIC("LUA_MENU_PC/SHADER_DURING_GAMEPLAY"))
	ACTIONS.AnimateSequence(arg_6_0.shaderPreloadContainer.ContentInternal, "Paused")

	arg_6_0._currentState = LUI.ShaderPreloadLayer.States.PAUSED

	arg_6_0.shaderPreloadContainer:UpdateLayout(arg_6_0._currentState)
end

function LUI.ShaderPreloadLayer.SetLayerComplete(arg_7_0)
	arg_7_0.shaderPreloadContainer:CompleteSequence()

	arg_7_0._currentState = LUI.ShaderPreloadLayer.States.COMPLETED

	arg_7_0.shaderPreloadContainer:UpdateLayout(arg_7_0._currentState)
end

function LUI.ShaderPreloadLayer.SetShaderPreloadingVisible(arg_8_0)
	Engine.DBFFAEEFGJ().shaderPreloadLayer._isShaderPreloadingVisible = arg_8_0
end

local function var_0_4(arg_9_0)
	local var_9_0 = ShaderUpload.DIHHGIFAIB()
	local var_9_1 = false

	if var_9_0 ~= arg_9_0._previousProcessingMode then
		arg_9_0._previousProcessingMode = var_9_0
		var_9_1 = true
	end

	local var_9_2 = var_0_3[var_9_0]

	if CONDITIONS.IsMagmaEnabled() and not Engine.CFHBIHABCB(arg_9_0._controllerIndex) then
		if var_9_2 == "MENU/MULTIPLAYER" then
			var_9_2 = "LUA_MENU/PACK1"
		elseif var_9_2 == "MENU/CAMPAIGN" then
			var_9_2 = "LUA_MENU/PACK2"
		elseif var_9_2 == "LUA_MENU/TAC_OPS" then
			var_9_2 = "LUA_MENU/PACK3"
		end
	end

	return var_9_2, var_9_1
end

local function var_0_5(arg_10_0)
	local var_10_0, var_10_1 = var_0_4(arg_10_0)
	local var_10_2 = ShaderUpload.EAACFJBCIB()
	local var_10_3 = LUI.Round(var_10_2 * 100, 0)

	arg_10_0.shaderPreloadContainer:UpdateProgress(var_10_0, var_10_3)

	if var_10_1 then
		arg_10_0.shaderPreloadContainer:UpdateLayout(LUI.ShaderPreloadLayer.GetCurrentState(arg_10_0))
	end
end

local function var_0_6(arg_11_0)
	local var_11_0 = 200
	local var_11_1 = LUI.UITimer.new({
		event = "update_layer",
		interval = var_11_0
	})

	var_11_1.id = "timer"

	arg_11_0:addElement(var_11_1)
	arg_11_0.shaderPreloadContainer:registerEventHandler("update_layer", function(arg_12_0, arg_12_1)
		if arg_11_0._isShaderPreloadingVisible then
			if ShaderUpload.DDBFFCFJJJ() then
				if LUI.ShaderPreloadLayer.GetCurrentState(arg_11_0) ~= LUI.ShaderPreloadLayer.States.IN_PROGRESS then
					LUI.ShaderPreloadLayer.SetLayerInProgress(arg_11_0)
				end

				arg_11_0:UpdateProgress()
			elseif not ShaderUpload.DDBFFCFJJJ() and LUI.ShaderPreloadLayer.GetCurrentState(arg_11_0) == LUI.ShaderPreloadLayer.States.IN_PROGRESS then
				if ShaderUpload.CEIBACCEAF() then
					LUI.ShaderPreloadLayer.SetLayerPaused(arg_11_0)
				else
					LUI.ShaderPreloadLayer.SetLayerComplete(arg_11_0)
				end
			end
		end
	end)
end

function LUI.ShaderPreloadLayer.InitLayer(arg_13_0)
	local var_13_0 = MenuBuilder.BuildRegisteredType("PreloadingShadersContent", {
		controllerIndex = arg_13_0._controllerIndex
	})

	var_13_0.id = "PreloadingShadersContent"

	var_13_0:SetAnchorsAndPosition(0.5, 0.5, 0, 1, _1080p * -var_0_0 / 2, _1080p * var_0_0 / 2, -var_0_1 * _1080p, 0)
	arg_13_0:addElement(var_13_0)

	arg_13_0.shaderPreloadContainer = var_13_0

	LUI.ShaderPreloadLayer.SetLayerPending(arg_13_0)
	var_0_6(arg_13_0)

	var_0_3[CoD.PlayMode.Core] = "MENU/MULTIPLAYER"
	var_0_3[CoD.PlayMode.Aliens] = "LUA_MENU/TAC_OPS"
	var_0_3[CoD.PlayMode.SP] = "MENU/CAMPAIGN"
	arg_13_0._previousProcessingMode = ShaderUpload.DIHHGIFAIB()
	arg_13_0.UpdateProgress = var_0_5
end

function LUI.ShaderPreloadLayer.ClearLayer(arg_14_0, arg_14_1)
	if arg_14_0.shaderPreloadContainer then
		LUI.ShaderPreloadLayer.SetLayerPending(arg_14_0)

		local var_14_0 = LUI.UITimer.new({
			event = "clear_layer",
			interval = var_0_2
		})

		arg_14_0:addElement(var_14_0)

		arg_14_0.clearLayerTimer = var_14_0

		arg_14_0:registerEventHandler("clear_layer", function()
			if arg_14_0.clearLayerTimer ~= nil then
				arg_14_0.clearLayerTimer:closeTree()

				arg_14_0.clearLayerTimer = nil
			end

			arg_14_0:closeChildren()

			arg_14_0.shaderPreloadContainer = nil
		end)
	end
end

function LUI.ShaderPreloadLayer.GetLayer()
	return Engine.DBFFAEEFGJ().shaderPreloadLayer
end
