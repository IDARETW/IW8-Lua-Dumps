module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	local var_1_0 = GetMaterialDimensions(arg_1_1)

	assert(var_1_0)

	var_1_0.width = _1080p * var_1_0.width
	var_1_0.height = _1080p * var_1_0.height

	local var_1_1 = arg_1_0.Image:GetCurrentAnchorsAndPositions()

	var_1_1.width = var_1_1.right - var_1_1.left
	var_1_1.height = var_1_1.bottom - var_1_1.top
	var_1_1.centerX = var_1_1.left + var_1_1.width / 2
	var_1_1.centerY = var_1_1.top + var_1_1.height / 2

	local var_1_2 = var_1_0.width / 2
	local var_1_3 = var_1_0.height / 2

	var_1_1.left = var_1_1.centerX - var_1_2
	var_1_1.right = var_1_1.centerX + var_1_2
	var_1_1.top = var_1_1.centerY - var_1_3
	var_1_1.bottom = var_1_1.centerY + var_1_3

	return var_1_1
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = var_0_0(arg_2_0, arg_2_1)

	arg_2_0.Image:setImage(RegisterMaterial(arg_2_1), 0)
	arg_2_0.Image:SetAnchorsAndPosition(var_2_0.leftAnchor, var_2_0.rightAnchor, var_2_0.topAnchor, var_2_0.bottomAnchor, var_2_0.left, var_2_0.right, var_2_0.top, var_2_0.bottom)
end

local var_0_2

local function var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = 10
	local var_3_1 = 250

	if not arg_3_0._retries then
		arg_3_0._retries = 0
	end

	arg_3_0._retries = arg_3_0._retries + 1

	if Challenge.HasCompletedIntelMission(arg_3_1, arg_3_2) or var_3_0 < arg_3_0._retries then
		arg_3_3()
	else
		arg_3_0:Wait(var_3_1).onComplete = function()
			var_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		end
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.CloseButton:SetButtonDisabled(true)

	if not Challenge.IsInGameIntel(arg_5_2.intelRef) then
		arg_5_0.Spinner:SetAlpha(1)
		var_0_3(arg_5_0, arg_5_1, arg_5_2.intelRef, function()
			LUI.FlowManager.RequestLeaveMenu(arg_5_0, true, true)
		end)
	else
		LUI.FlowManager.RequestLeaveMenu(arg_5_0, true, true)
	end
end

local function var_0_5(arg_7_0, arg_7_1, arg_7_2)
	assert(arg_7_2.imageOverride)
	assert(arg_7_2.intelRef)

	if arg_7_2.imageOverride then
		var_0_1(arg_7_0, arg_7_2.imageOverride)
	end

	ACTIONS.ScaleFullscreen(arg_7_0.Darkener)

	arg_7_0.BindButton = LUI.UIBindButton.new()
	arg_7_0.BindButton.id = "BindButton"

	arg_7_0:addElement(arg_7_0.BindButton)
	arg_7_0.BindButton:addEventHandler("button_secondary", function(arg_8_0, arg_8_1)
		var_0_4(arg_7_0, arg_7_1, arg_7_2)
	end)
	arg_7_0.CloseButton:addEventHandler("button_action", function(arg_9_0, arg_9_1)
		var_0_4(arg_7_0, arg_7_1, arg_7_2)
	end)
end

function PreviewIntelPopup(arg_10_0, arg_10_1)
	local var_10_0 = LUI.UIElement.new()

	var_10_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p)

	var_10_0.id = "PreviewIntelPopup"

	local var_10_1 = arg_10_1 and arg_10_1.controllerIndex

	if not var_10_1 and not Engine.DDJFBBJAIG() then
		var_10_1 = var_10_0:getRootController()
	end

	assert(var_10_1)

	local var_10_2 = var_10_0
	local var_10_3
	local var_10_4 = LUI.UIImage.new()

	var_10_4.id = "Darkener"

	var_10_4:SetRGBFromTable(SWATCHES.genericMenu.blackBackground, 0)
	var_10_4:SetAlpha(0.8, 0)
	var_10_4:SetAnchorsAndPosition(0, 0, 0, 0, _1080p * 2, 0, 0, 0)
	var_10_0:addElement(var_10_4)

	var_10_0.Darkener = var_10_4

	local var_10_5
	local var_10_6 = MenuBuilder.BuildRegisteredType("GenericPopupWindow", {
		controllerIndex = var_10_1
	})

	var_10_6.id = "GenericPopupFrame"

	var_10_6:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -855, _1080p * 855, _1080p * -485, _1080p * 485)
	var_10_0:addElement(var_10_6)

	var_10_0.GenericPopupFrame = var_10_6

	local var_10_7
	local var_10_8 = LUI.UIImage.new()

	var_10_8.id = "Image"

	var_10_8:setImage(RegisterMaterial("placeholder_x"), 0)
	var_10_8:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256)
	var_10_0:addElement(var_10_8)

	var_10_0.Image = var_10_8

	local var_10_9
	local var_10_10 = MenuBuilder.BuildRegisteredType("PopupButton", {
		controllerIndex = var_10_1
	})

	var_10_10.id = "CloseButton"

	var_10_10.Label:setText(ToUpperCase(Engine.CBBHFCGDIC("MENU/EXIT")), 0)
	var_10_10.Label:SetAlignment(LUI.Alignment.Center)
	var_10_10:SetAnchorsAndPosition(0.5, 0.5, 1, 0, _1080p * -300, _1080p * 300, _1080p * -115, _1080p * -75)
	var_10_0:addElement(var_10_10)

	var_10_0.CloseButton = var_10_10

	local var_10_11
	local var_10_12 = MenuBuilder.BuildRegisteredType("FenceSpinner", {
		controllerIndex = var_10_1
	})

	var_10_12.id = "Spinner"

	var_10_12:SetAlpha(0, 0)
	var_10_12:SetAnchorsAndPosition(0.5, 0.5, 0.5, 0.5, _1080p * -170, _1080p * 170, _1080p * 470, _1080p * 480)
	var_10_0:addElement(var_10_12)

	var_10_0.Spinner = var_10_12

	var_0_5(var_10_0, var_10_1, arg_10_1)

	return var_10_0
end

MenuBuilder.registerType("PreviewIntelPopup", PreviewIntelPopup)
LockTable(_M)
