module(..., package.seeall)

function LeaveMenu()
	return function(arg_2_0, arg_2_1)
		LUI.FlowManager.RequestLeaveMenu(arg_2_0)
	end
end

helpers = {
	LeaveMenu = LeaveMenu
}

local function var_0_0(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIElement.new()

	var_3_0:setUseStencil(true)

	return var_3_0
end

local function var_0_1(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:setupWorldBlur()

	return var_4_0
end

function buildOwnerDraw(arg_5_0, arg_5_1)
	local var_5_0 = LUI.UIElement.new()

	var_5_0:setupOwnerdraw(arg_5_1.ownerDraw, arg_5_1.ownerDrawTextScale, arg_5_1.ownerDrawTextStyle)

	return var_5_0
end

function buildTextEdit(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:setupTextEdit(arg_6_1.maxLength, arg_6_1.isPassword, arg_6_1.useAutoAlign, arg_6_1.disableAfterEdit, arg_6_1.isNumeric, arg_6_1.autoConfirmOnTab, arg_6_1.autoConfirmOnOutsideClick, arg_6_1.autoSelectAllOnActive, arg_6_1.wantTabButtonEvent, arg_6_1.letGamepadInputsGoThrough, arg_6_1.alwaysSendTypingEvents, arg_6_1.controllerIndex)

	if arg_6_1.useAutoAlign then
		var_6_0:setUseStencil(true)
	end

	return var_6_0
end

m_types = {
	uielement = LUI.UIElement.build,
	uitext = LUI.UIText.build,
	uiimage = LUI.UIImage.build,
	uibutton = LUI.UIButton.build,
	uitimer = LUI.UITimer.build,
	uistencil = var_0_0,
	uiverticallist = LUI.UIVerticalList.build,
	uihorizontallist = LUI.UIHorizontalList.build,
	uicountdown = LUI.UICountdown.build,
	uilongcountdown = LUI.UILongCountdown.build,
	uitechydigits = LUI.UITechyDigits.build,
	uibindbutton = LUI.UIBindButton.build,
	uiworldblur = var_0_1,
	uiownerdraw = buildOwnerDraw,
	uitextedit = buildTextEdit
}

function registerType(arg_7_0, arg_7_1)
	local var_7_0 = string.lower(arg_7_0)

	assert(m_types[var_7_0] == nil, "This type is a basic element type that has been registered! " .. arg_7_0)
	assert(type(arg_7_1) == "function", "The buildFunction for this type is not a function!  typeName = " .. arg_7_0)

	m_types[var_7_0] = arg_7_1
end

function buildMenu(arg_8_0, arg_8_1)
	local var_8_0 = string.lower(arg_8_0)

	arg_8_1 = arg_8_1 or {}

	return (BuildRegisteredType(var_8_0, arg_8_1))
end

function BuildRegisteredType(arg_9_0, arg_9_1)
	assert(type(arg_9_0) == "string")

	local var_9_0 = string.lower(arg_9_0)

	assert(m_types[var_9_0], "Could not find a constructor for " .. arg_9_0 .. ".")
	Engine.BHFFIBEFFH(arg_9_0, "widget")

	local var_9_1 = m_types[var_9_0](nil, arg_9_1)

	if Engine.BHICADFIHA() then
		var_9_1._typeName = arg_9_0
	end

	Engine.DCHDDCJCEG(arg_9_0, "widget")

	return var_9_1
end

function IsTypeRegistered(arg_10_0)
	assert(type(arg_10_0) == "string")

	local var_10_0 = string.lower(arg_10_0)

	return m_types[var_10_0] ~= nil
end

LockTable(_M)
