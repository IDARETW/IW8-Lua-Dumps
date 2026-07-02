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
	if arg_2_0.options and #arg_2_0.options > 0 and type(arg_2_0.options[1]) == "userdata" then
		for iter_2_0 = 1, #arg_2_0.options do
			arg_2_0.buttonList:RemoveElement(arg_2_0.options[iter_2_0])
		end
	end

	arg_2_0.options = {}
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	assert(arg_3_2)

	arg_3_5 = arg_3_5 or 1

	if arg_3_0.currCategory == arg_3_4 and arg_3_4 ~= nil then
		arg_3_0:RefreshCurrentOptions()

		return
	end

	local var_3_0 = 0

	arg_3_0:ClearCurrentOptions()

	arg_3_0.options = arg_3_2(arg_3_0, arg_3_1, arg_3_3)

	if arg_3_0.options and #arg_3_0.options > 0 and type(arg_3_0.options[1]) == "userdata" then
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
	end

	local var_3_1 = arg_3_0.options[arg_3_5]

	if var_3_1 then
		if var_3_1._innerWidget then
			var_3_1 = var_3_1._innerWidget
		end

		if var_3_1.Text then
			arg_3_0.subCategoryName = var_3_1.Text:getText()
		end

		var_3_1:dispatchEventToParent({
			name = "request_active",
			target = var_3_1
		})
	end

	arg_3_0.currCategory = arg_3_4
end

local function var_0_3(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_0.options and #arg_6_0.options > 0 then
		for iter_6_0 = 1, #arg_6_0.options do
			local var_6_0 = not LUI.IsLastInputMouseNavigation(arg_6_2)
			local var_6_1 = arg_6_0.options[iter_6_0]
			local var_6_2 = var_6_1.GenericOptionButtonBase ~= nil and var_6_1.GenericOptionButtonBase.GenericButtonBackground ~= nil and var_6_1.GenericOptionButtonBase.Title ~= nil

			if arg_6_1 and not arg_6_0.options[iter_6_0].isActive then
				var_6_1:SetAlpha(0.6)

				if var_6_0 and var_6_2 then
					var_6_1.GenericOptionButtonBase.GenericButtonBackground:SetAlpha(0)
					var_6_1.GenericOptionButtonBase.Title:SetRGBFromTable(SWATCHES.genericButton.textDefault, 0)
				end
			elseif arg_6_1 and arg_6_0.options[iter_6_0].isActive and var_6_0 and var_6_2 then
				var_6_1:SetAlpha(1)
				var_6_1.GenericOptionButtonBase.GenericButtonBackground:SetAlpha(0)
				var_6_1.GenericOptionButtonBase.Title:SetRGBFromTable(SWATCHES.genericButton.textFocus, 0)
			else
				var_6_1:SetAlpha(1)

				if var_6_2 then
					var_6_1.GenericOptionButtonBase.GenericButtonBackground:SetAlpha(1)
				end
			end
		end

		arg_6_0.isFaded = arg_6_1
	else
		arg_6_0.isFaded = true
	end
end

function PostLoadFunc(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = LUI.UIHorizontalList.new()

	var_7_0:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, 0, 366 * _1080p)

	var_7_0.id = "buttonListId"

	var_7_0:SetAlignment(LUI.Alignment.Top)
	var_7_0:SetIgnoreStretchingChildren(true)
	var_7_0:SetAdjustSizeToContent(false)
	var_7_0:SetSpacing(4)
	var_7_0:SetForceDefaultFocus(true)
	arg_7_0:addElement(var_7_0)

	arg_7_0.buttonList = var_7_0

	arg_7_0.buttonList:SetActiveParentBehavior()

	arg_7_0.RefreshCurrentOptions = var_0_0
	arg_7_0.ClearCurrentOptions = var_0_1
	arg_7_0.UpdateOptions = var_0_2
	arg_7_0.FadeCategories = var_0_3
	arg_7_0.options = {}
end

function OptionCategories(arg_8_0, arg_8_1)
	local var_8_0 = LUI.UIElement.new()

	var_8_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 320 * _1080p, 0, 800 * _1080p)

	var_8_0.id = "OptionCategories"

	local var_8_1 = arg_8_1 and arg_8_1.controllerIndex

	if not var_8_1 and not Engine.DDJFBBJAIG() then
		var_8_1 = var_8_0:getRootController()
	end

	assert(var_8_1)

	local var_8_2 = var_8_0

	PostLoadFunc(var_8_0, var_8_1, arg_8_1)

	return var_8_0
end

MenuBuilder.registerType("OptionCategories", OptionCategories)
LockTable(_M)
