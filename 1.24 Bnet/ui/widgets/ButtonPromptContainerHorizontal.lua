module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		if LUI.IsLastInputGamepad(arg_2_1.controllerIndex) then
			arg_2_0:SetSpacing(20 * _1080p)
		else
			arg_2_0:SetSpacing(12 * _1080p)
		end
	end

	arg_1_0:addAndCallEventHandler("update_input_type", var_1_0, {
		controllerIndex = arg_1_1
	})
end

function ButtonPromptContainerHorizontal(arg_3_0, arg_3_1)
	local var_3_0 = LUI.UIHorizontalStackedLayout.new()

	var_3_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 100 * _1080p, 0, 31 * _1080p)

	var_3_0.id = "ButtonPromptContainerHorizontal"

	local var_3_1 = arg_3_1 and arg_3_1.controllerIndex

	if not var_3_1 and not Engine.DDJFBBJAIG() then
		var_3_1 = var_3_0:getRootController()
	end

	assert(var_3_1)

	local var_3_2 = var_3_0

	var_3_0:SetSpacing(10 * _1080p)

	local var_3_3

	if CONDITIONS.AlwaysFalse(var_3_0) then
		local var_3_4 = LUI.UIText.new()

		var_3_4.id = "Label"

		var_3_4:setText("ButtonPrompt", 0)
		var_3_4:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
		var_3_4:SetAlignment(LUI.Alignment.Center)
		var_3_4:SetVerticalAlignment(LUI.Alignment.Center)
		var_3_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 100, 0, _1080p * 18)
		var_3_0:addElement(var_3_4)

		var_3_0.Label = var_3_4
	end

	var_0_0(var_3_0, var_3_1, arg_3_1)

	return var_3_0
end

MenuBuilder.registerType("ButtonPromptContainerHorizontal", ButtonPromptContainerHorizontal)
LockTable(_M)
