LUI.UIPagedText = LUI.Class(LUI.UIStyledText)

function LUI.UIPagedText.init(arg_1_0)
	LUI.UIPagedText.super.init(arg_1_0)

	arg_1_0._textPageHeight = 500 * _1080p
	arg_1_0._curPage = 1
	arg_1_0._maxCharsPerPage = -1
	arg_1_0._textPages = {}
	arg_1_0._layoutInitialized = false

	arg_1_0:SetNotifyOnLayoutInit(true)
	arg_1_0:addEventHandler("prev_page", LUI.UIPagedText.PrevPage)
	arg_1_0:addEventHandler("next_page", LUI.UIPagedText.NextPage)
	arg_1_0:addEventHandler("layout_initialized", function(arg_2_0, arg_2_1)
		arg_2_0._layoutInitialized = true

		if arg_2_0._text ~= nil then
			arg_2_0:setText(arg_2_0._text, nil, arg_2_0._markLocalized, arg_2_0._maxCharsPerPage)

			if arg_2_0.OnFirstSetTextDone then
				arg_2_0:OnFirstSetTextDone()
			end
		end
	end)
	arg_1_0:addEventHandler("gamepad_button", function(arg_3_0, arg_3_1)
		return arg_3_0:GamepadButton(arg_3_1)
	end)
	LUI.UIElement.SetHandleMouse(arg_1_0, true)
end

function LUI.UIPagedText.RecalculatePages(arg_4_0)
	if arg_4_0._text ~= nil then
		arg_4_0._textPages = arg_4_0:GetPagedText(arg_4_0._text, arg_4_0._textPageHeight, arg_4_0._maxCharsPerPage)
		arg_4_0._curPage = 1
	else
		arg_4_0._textPages = {}
	end
end

function LUI.UIPagedText.UpdatePageNumText(arg_5_0)
	if arg_5_0._pageNumDisplayDatasource ~= nil then
		local var_5_0

		if Engine.DDJFBBJAIG() then
			local var_5_1 = LUI.FlowManager.GetScopedData(arg_5_0)

			assert(var_5_1)

			var_5_0 = var_5_1.controllerIndex
		else
			var_5_0 = arg_5_0:getRootController()
		end

		if #arg_5_0._textPages > 0 and arg_5_0._curPage <= #arg_5_0._textPages then
			arg_5_0._pageNumDisplayDatasource:SetValue(var_5_0, arg_5_0._curPage .. " / " .. #arg_5_0._textPages)
		else
			arg_5_0._pageNumDisplayDatasource:SetValue(var_5_0, "")
		end
	end
end

function LUI.UIPagedText.setText(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	arg_6_0._text = arg_6_1
	arg_6_0._markLocalized = arg_6_3
	arg_6_0._maxCharsPerPage = arg_6_4 or -1

	if arg_6_0._layoutInitialized then
		arg_6_0:RecalculatePages()

		if #arg_6_0._textPages > 0 and arg_6_0._curPage <= #arg_6_0._textPages then
			local var_6_0 = arg_6_0._textPages[arg_6_0._curPage]

			if arg_6_0._markLocalized then
				var_6_0 = Engine.JCBDICCAH(var_6_0)
			end

			arg_6_0:setTextInC(var_6_0, arg_6_2)
		else
			arg_6_0:setTextInC("", arg_6_2)
		end

		arg_6_0:UpdatePageNumText()
	end
end

function LUI.UIPagedText.SetTextPageHeight(arg_7_0, arg_7_1)
	arg_7_0._textPageHeight = arg_7_1

	if arg_7_0._text ~= nil then
		arg_7_0:setText(arg_7_0._text, nil, arg_7_0._markLocalized, arg_7_0._maxCharsPerPage)
	end
end

function LUI.UIPagedText.SetPageNumDisplayDatasource(arg_8_0, arg_8_1)
	arg_8_0._pageNumDisplayDatasource = arg_8_1
end

function LUI.UIPagedText.GetNumPages(arg_9_0)
	return #arg_9_0._textPages
end

function LUI.UIPagedText.GetCurrentPage(arg_10_0)
	return arg_10_0._curPage
end

function LUI.UIPagedText.SetPage(arg_11_0, arg_11_1)
	if arg_11_1 > 0 and #arg_11_0._textPages > 0 and arg_11_1 <= #arg_11_0._textPages then
		arg_11_0._curPage = arg_11_1

		local var_11_0 = arg_11_0._textPages[arg_11_0._curPage]

		if arg_11_0._markLocalized then
			var_11_0 = Engine.JCBDICCAH(var_11_0)
		end

		arg_11_0:setTextInC(var_11_0)
		arg_11_0:UpdatePageNumText()

		return true
	end

	return false
end

function LUI.UIPagedText.NextPage(arg_12_0)
	if arg_12_0:SetPage(arg_12_0._curPage + 1) then
		arg_12_0:processEvent({
			name = "next_page_success"
		})
	else
		arg_12_0:processEvent({
			name = "next_page_fail"
		})
	end
end

function LUI.UIPagedText.PrevPage(arg_13_0)
	if arg_13_0:SetPage(arg_13_0._curPage - 1) then
		arg_13_0:processEvent({
			name = "prev_page_success"
		})
	else
		arg_13_0:processEvent({
			name = "prev_page_fail"
		})
	end
end

function LUI.UIPagedText.AcceptsFocusType(arg_14_0, arg_14_1)
	return arg_14_1 == FocusType.MouseOver
end

function LUI.UIPagedText.IsPositionInside(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = false
	local var_15_1, var_15_2, var_15_3, var_15_4 = arg_15_0:getRect()
	local var_15_5, var_15_6, var_15_7, var_15_8 = arg_15_0:getLocalRect()

	if var_15_1 ~= nil then
		local var_15_9 = var_15_2 + (var_15_4 - var_15_2) / (var_15_8 - var_15_6) * arg_15_0._textPageHeight

		if var_15_2 <= arg_15_2 and arg_15_2 <= var_15_9 and var_15_1 <= arg_15_1 and arg_15_1 <= var_15_3 then
			var_15_0 = true
		end
	end

	return var_15_0
end

function LUI.UIPagedText.GamepadButton(arg_16_0, arg_16_1)
	if LUI.UIPagedText.super.GamepadButton and LUI.UIPagedText.super.GamepadButton(arg_16_0, arg_16_1) then
		return true
	end

	if arg_16_1.qualifier == ButtonQualifiers.Mousewheel and arg_16_1.down then
		local var_16_0, var_16_1 = ProjectRootCoordinate(arg_16_1.rootName, arg_16_1.x, arg_16_1.y)

		if var_16_0 == nil or var_16_1 == nil then
			return
		end

		if arg_16_0:IsPositionInside(var_16_0, var_16_1) then
			if arg_16_1.button == "down" then
				arg_16_0:NextPage()
			else
				arg_16_0:PrevPage()
			end

			return true
		end
	end

	return false
end

LUI.UIPagedText.id = "LUIPagedText"

function LUI.UIPagedText.GetTotalPages(arg_17_0, arg_17_1)
	local var_17_0 = 0

	for iter_17_0 = 1, #arg_17_1 do
		var_17_0 = var_17_0 + #arg_17_0:GetPagedText(LocalizeLongString(arg_17_1[iter_17_0]), arg_17_0._textPageHeight, arg_17_0._maxCharsPerPage)
	end

	return var_17_0
end
