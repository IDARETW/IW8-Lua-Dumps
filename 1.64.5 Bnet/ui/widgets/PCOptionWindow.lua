module(..., package.seeall)

local function var_0_0(arg_1_0)
	if arg_1_0.options and #arg_1_0.options > 0 then
		for iter_1_0 = 1, #arg_1_0.options do
			arg_1_0.options[iter_1_0]:processEvent({
				name = "refresh_values"
			})
		end
	end
end

local function var_0_1(arg_2_0)
	if arg_2_0.options and #arg_2_0.options > 0 then
		if type(arg_2_0.options[1]) == "userdata" then
			for iter_2_0 = 1, #arg_2_0.options do
				arg_2_0.buttonList:RemoveElement(arg_2_0.options[iter_2_0])
			end
		elseif arg_2_0.SubmenuGrid then
			arg_2_0.SubmenuGrid:UpdateOptions({})
		end
	end

	arg_2_0.options = {}
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	assert(arg_3_0.OptionDecorations.SetTitle)
	assert(arg_3_3)

	if arg_3_0.currCategory == arg_3_4 and arg_3_4 ~= nil then
		arg_3_0:RefreshCurrentOptions()

		return
	end

	arg_3_0.OptionDecorations:SetTitle(arg_3_2)

	local var_3_0 = 0

	arg_3_0:ClearCurrentOptions()

	arg_3_0.options = arg_3_3(arg_3_0, arg_3_1)

	if arg_3_0.options and #arg_3_0.options > 0 then
		if type(arg_3_0.options[1]) == "userdata" then
			for iter_3_0 = 1, #arg_3_0.options do
				arg_3_0.options[iter_3_0]:addEventHandler("button_over", function(arg_4_0, arg_4_1)
					arg_3_0:processEvent({
						name = "optionwindow_button_over"
					})
				end)
				arg_3_0.options[iter_3_0]:addEventHandler("button_over_disable", function(arg_5_0, arg_5_1)
					arg_3_0:processEvent({
						name = "optionwindow_button_over"
					})
				end)
				arg_3_0.buttonList:addElement(arg_3_0.options[iter_3_0])
			end

			arg_3_0.SubmenuGrid:UpdateOptions({})
		elseif arg_3_0.SubmenuGrid then
			arg_3_0.SubmenuGrid:UpdateOptions(arg_3_0.options)
		end
	end

	arg_3_0.currCategory = arg_3_4
end

function PostLoadFunc(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = LUI.UIVerticalList.new()

	var_6_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 800 * _1080p)

	var_6_0.id = "buttonListId"

	var_6_0:SetAlignment(LUI.Alignment.Top)
	var_6_0:SetIgnoreStretchingChildren(true)
	var_6_0:SetAdjustSizeToContent(true)
	var_6_0:SetSpacing(7)
	arg_6_0:addElement(var_6_0)

	arg_6_0.buttonList = var_6_0

	local var_6_1
	local var_6_2 = MenuBuilder.BuildRegisteredType("ButtonDescriptionText", {
		controllerIndex = arg_6_1
	})

	var_6_2.id = "ButtonDescriptionText"

	var_6_2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 2, _1080p * 778, 0, _1080p * 32)

	arg_6_0.ButtonDescriptionText = var_6_2

	local var_6_3 = MenuBuilder.BuildRegisteredType("PopupFrame", {
		hideBackground = true,
		controllerIndex = arg_6_1
	})

	arg_6_0.OptionDecorations = var_6_3

	assert(var_6_3.MeasureTitle)
	assert(var_6_3.SetTitle)
	var_6_3:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	arg_6_0.buttonList:addElement(var_6_3)

	local var_6_4
	local var_6_5 = MenuBuilder.BuildRegisteredType("PCOptionSubmenuGrid", {
		controllerIndex = arg_6_1
	})

	var_6_5.id = "SubmenuGrid"

	var_6_5:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 0)
	arg_6_0.buttonList:addElement(var_6_5)

	arg_6_0.SubmenuGrid = var_6_5

	arg_6_0:addElement(var_6_2)

	arg_6_0.RefreshCurrentOptions = var_0_0
	arg_6_0.ClearCurrentOptions = var_0_1
	arg_6_0.UpdateOptions = var_0_2
	arg_6_0.options = {}

	arg_6_0:registerEventHandler("hide_description_text", function(arg_7_0, arg_7_1)
		arg_6_0.ButtonDescriptionText:SetAlpha(0, 0)
	end)
	arg_6_0:registerEventHandler("show_description_text", function(arg_8_0, arg_8_1)
		arg_6_0.ButtonDescriptionText:SetAlpha(1, 0)
	end)
end

function PCOptionWindow(arg_9_0, arg_9_1)
	local var_9_0 = LUI.UIVerticalList.new()

	var_9_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 1000 * _1080p, 0, 800 * _1080p)

	var_9_0.id = "PCOptionWindow"

	local var_9_1 = arg_9_1 and arg_9_1.controllerIndex

	if not var_9_1 and not Engine.DDJFBBJAIG() then
		var_9_1 = var_9_0:getRootController()
	end

	assert(var_9_1)

	local var_9_2 = var_9_0

	var_9_0:SetSpacing(7 * _1080p)
	PostLoadFunc(var_9_0, var_9_1, arg_9_1)

	return var_9_0
end

MenuBuilder.registerType("PCOptionWindow", PCOptionWindow)
LockTable(_M)
