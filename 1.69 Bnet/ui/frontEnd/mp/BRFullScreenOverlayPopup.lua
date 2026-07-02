module(..., package.seeall)

local var_0_0 = 15
local var_0_1 = 90

local function var_0_2()
	Engine.DAGFFDGFII("frontendscene_start")
end

local function var_0_3(arg_2_0, arg_2_1, arg_2_2)
	ACTIONS.ScaleFullscreen(arg_2_0.Darkener)
	LUI.TextChat.SetupMenuForNoChat(arg_2_0)

	arg_2_0:Wait(var_0_0 * 1000).onComplete = function()
		ACTIONS.AnimateSequence(arg_2_0, "ShowSpinner")
	end
	arg_2_0:Wait(var_0_1 * 1000).onComplete = function()
		ACTIONS.LeaveMenu(arg_2_0)
		DebugPrint("[BRFullScreenOverlayPopup] Overlay timed out after " .. var_0_1 .. " seconds, returning control to user.")
	end
end

function BRFullScreenOverlayPopup(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0.id = "BRFullScreenOverlayPopup"
	var_5_0._animationSets = var_5_0._animationSets or {}
	var_5_0._sequences = var_5_0._sequences or {}

	local var_5_1 = arg_5_1 and arg_5_1.controllerIndex

	if not var_5_1 and not Engine.DDJFBBJAIG() then
		var_5_1 = var_5_0:getRootController()
	end

	assert(var_5_1)

	local var_5_2 = var_5_0
	local var_5_3
	local var_5_4 = LUI.UIImage.new()

	var_5_4.id = "Darkener"

	var_5_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_5_0:addElement(var_5_4)

	var_5_0.Darkener = var_5_4

	local var_5_5
	local var_5_6 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_5_1
	})

	var_5_6.id = "Spinner"

	var_5_6:SetAlpha(0, 0)
	var_5_6:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 790, _1080p * 1130, _1080p * 810, _1080p * 820)
	var_5_0:addElement(var_5_6)

	var_5_0.Spinner = var_5_6

	local function var_5_7()
		return
	end

	var_5_0._sequences.DefaultSequence = var_5_7

	local var_5_8
	local var_5_9 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_5_6:RegisterAnimationSequence("ShowSpinner", var_5_9)

	local function var_5_10()
		var_5_6:AnimateSequence("ShowSpinner")
	end

	var_5_0._sequences.ShowSpinner = var_5_10

	function var_5_0.addButtonHelperFunction(arg_8_0, arg_8_1)
		arg_8_0:AddButtonHelperText({
			side = "left",
			button_ref = "button_primary",
			priority = 1,
			helper_text = Engine.CBBHFCGDIC("LUA_MENU/SELECT")
		})
	end

	var_5_0:addEventHandler("menu_create", var_5_0.addButtonHelperFunction)

	local var_5_11 = LUI.UIBindButton.new()

	var_5_11.id = "selfBindButton"

	var_5_0:addElement(var_5_11)

	var_5_0.bindButton = var_5_11

	var_0_3(var_5_0, var_5_1, arg_5_1)

	return var_5_0
end

MenuBuilder.registerType("BRFullScreenOverlayPopup", BRFullScreenOverlayPopup)
LUI.FlowManager.RegisterStackPopBehaviour("BRFullScreenOverlayPopup", var_0_2)
LockTable(_M)
