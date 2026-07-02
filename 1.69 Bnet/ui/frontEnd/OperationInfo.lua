module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	assert(arg_1_0.OperationName)
	assert(arg_1_0.EventName)
	arg_1_0.OperationName:setText(WORLD_MAP.GetOperationName())
	arg_1_0.EventName:setText(WORLD_MAP.GetEventName())

	if Dvar.IBEGCHEFE("LNLNSSNKQ") then
		arg_1_0.ViewOperation:SetAlpha(1)
		arg_1_0.ButtonImage:SetAlpha(1)
	else
		arg_1_0.ViewOperation:SetAlpha(0)
		arg_1_0.ButtonImage:SetAlpha(0)
	end
end

function OperationInfo(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIElement.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 750 * _1080p, 0, 120 * _1080p)

	var_2_0.id = "OperationInfo"

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("OperationEventBanner", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "OperationEventBanner"

	var_2_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 467, _1080p * 86, _1080p * 116)
	var_2_0:addElement(var_2_4)

	var_2_0.OperationEventBanner = var_2_4

	local var_2_5
	local var_2_6 = LUI.UIText.new()

	var_2_6.id = "EventName"

	var_2_6:SetRGBFromTable(SWATCHES.genericMenu.bodycopy, 0)
	var_2_6:setText("", 0)
	var_2_6:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_6:SetAlignment(LUI.Alignment.Left)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 426, 0, _1080p * 18)
	var_2_0:addElement(var_2_6)

	var_2_0.EventName = var_2_6

	local var_2_7
	local var_2_8 = LUI.UIText.new()

	var_2_8.id = "OperationName"

	var_2_8:SetRGBFromTable(SWATCHES.genericMenu.mainTitle, 0)
	var_2_8:setText("", 0)
	var_2_8:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_2_8:SetAlignment(LUI.Alignment.Left)
	var_2_8:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 500, _1080p * 32, _1080p * 68)
	var_2_0:addElement(var_2_8)

	var_2_0.OperationName = var_2_8

	local var_2_9
	local var_2_10 = LUI.UIText.new()

	var_2_10.id = "ViewOperation"

	var_2_10:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_10:setText(Engine.CBBHFCGDIC("LUA_MENU/VIEW_OPERATION"), 0)
	var_2_10:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_2_10:SetAlignment(LUI.Alignment.Left)
	var_2_10:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 500, _1080p * 700, _1080p * 92, _1080p * 110)
	var_2_0:addElement(var_2_10)

	var_2_0.ViewOperation = var_2_10

	local var_2_11
	local var_2_12 = LUI.UIImage.new()

	var_2_12.id = "ButtonImage"

	var_2_12:SetRGBFromTable(SWATCHES.text.primaryText, 0)
	var_2_12:setImage(RegisterMaterial("button_alt1"), 0)
	var_2_12:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 470, _1080p * 492, _1080p * 92, _1080p * 110)
	var_2_0:addElement(var_2_12)

	var_2_0.ButtonImage = var_2_12

	var_0_0(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("OperationInfo", OperationInfo)
LockTable(_M)
