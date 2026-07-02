LUI.AspectRatioFadeFrameLayer = LUI.Class(LUI.UIElement)
LUI.AspectRatioFadeFrameLayer.DEFAULT_FADESCREEN_PERCENTAGE = 1.1

local function var_0_0(arg_1_0)
	local var_1_0 = Engine.DBFFAEEFGJ()

	assert(var_1_0 and var_1_0.flowManager)

	local var_1_1 = arg_1_0:getParent()

	while var_1_1 do
		if var_1_1 == var_1_0.flowManager or var_1_1 == var_1_0 then
			return true
		end

		local var_1_2 = var_1_1

		var_1_1 = var_1_1:getParent()
	end

	return false
end

function LUI.AspectRatioFadeFrameLayer.init(arg_2_0, arg_2_1)
	LUI.UIElement.init(arg_2_0)

	arg_2_0.id = "AspectRatioFadeFrameLayer"
	arg_2_0._controllerIndex = arg_2_1 or Engine.IJEBHJIJF()

	arg_2_0:addEventHandler("onVideoChange", function(arg_3_0, arg_3_1)
		if CoD.AspectRatioCompare() == LUI.COMPARE.higher and LUI.AspectRatioFadeFrameLayer.ShouldBeVisible(arg_3_0) then
			local var_3_0 = arg_3_0:GetCurrentScreenFadePercent()

			if arg_3_0.aspectRatioFade then
				arg_3_0.aspectRatioFade:setCustomScreenPercent(var_3_0)
			else
				arg_3_0.aspectRatioFade = MenuBuilder.BuildRegisteredType("AspectRatioFadeFrame", {
					controllerIndex = arg_3_0._controllerIndex,
					customScreenPercent = var_3_0
				})

				arg_3_0:addElement(arg_3_0.aspectRatioFade)
			end
		elseif arg_3_0.aspectRatioFade then
			arg_3_0.aspectRatioFade:closeTree()

			arg_3_0.aspectRatioFade = nil
		end
	end)
	arg_2_0:processEvent("onVideoChange")
end

function LUI.AspectRatioFadeFrameLayer.Setup(arg_4_0, arg_4_1)
	local var_4_0 = LUI.AspectRatioFadeFrameLayer.GetInstance(arg_4_0, controllerIndex)

	if var_4_0 == nil then
		return
	end

	if not var_4_0.menu then
		var_4_0.menu = arg_4_0
	elseif not arg_4_0:isDescendentOf(var_4_0.menu) then
		if var_0_0(var_4_0.menu) then
			var_4_0.popup = arg_4_0
		else
			var_4_0.menu = arg_4_0
			var_4_0.popup = nil
		end
	end

	if var_4_0.aspectRatioFade then
		local var_4_1 = var_4_0:GetCurrentScreenFadePercent()

		var_4_0.aspectRatioFade:setCustomScreenPercent(var_4_1)
	end
end

function LUI.AspectRatioFadeFrameLayer.OpenAspectRatioFadeFrame(arg_5_0, arg_5_1, arg_5_2)
	if LUI.AspectRatioFadeFrameLayer.GetInstance(arg_5_0, controllerIndex) == nil then
		return
	end

	local var_5_0 = arg_5_1 or arg_5_0

	var_5_0.aspectRatioFadeFrameCustomScreenPercent = arg_5_2 or LUI.AspectRatioFadeFrameLayer.DEFAULT_FADESCREEN_PERCENTAGE

	if var_5_0:getParent() then
		LUI.AspectRatioFadeFrameLayer.Setup(var_5_0)
	else
		var_5_0:addEventHandler("menu_create", LUI.AspectRatioFadeFrameLayer.Setup)
	end
end

function LUI.AspectRatioFadeFrameLayer.GetInstance(arg_6_0, arg_6_1)
	if Engine.HDGDBCJFG() then
		return
	end

	local var_6_0

	if arg_6_1 ~= nil then
		var_6_0 = LUI.UIRoot.GetRootForControllerIndex(arg_6_1)
	else
		var_6_0 = Engine.DBFFAEEFGJ()
	end

	assert(var_6_0)

	local var_6_1 = var_6_0.fadeFrameLayer

	assert(var_6_1)

	return var_6_1
end

function LUI.AspectRatioFadeFrameLayer.ShouldBeVisible(arg_7_0)
	if arg_7_0.popup and var_0_0(arg_7_0.popup) then
		return true
	elseif arg_7_0.menu then
		if arg_7_0.popup then
			arg_7_0.popup = nil

			if arg_7_0.aspectRatioFade then
				arg_7_0.aspectRatioFade:setCustomScreenPercent(arg_7_0.menu.aspectRatioFadeFrameCustomScreenPercent)
			end
		end

		return var_0_0(arg_7_0.menu)
	end

	return false
end

function LUI.AspectRatioFadeFrameLayer.GetCurrentScreenFadePercent(arg_8_0)
	local var_8_0 = arg_8_0.popup or arg_8_0.menu

	return var_8_0 and var_8_0.aspectRatioFadeFrameCustomScreenPercent or LUI.AspectRatioFadeFrameLayer.DEFAULT_FADESCREEN_PERCENTAGE
end

function LUI.AspectRatioFadeFrameLayer.InitLayer(arg_9_0)
	if CoD.AspectRatioCompare() == LUI.COMPARE.higher then
		if not arg_9_0.aspectRatioFade then
			local var_9_0 = arg_9_0:GetCurrentScreenFadePercent()

			arg_9_0.aspectRatioFade = MenuBuilder.BuildRegisteredType("AspectRatioFadeFrame", {
				controllerIndex = arg_9_0._controllerIndex,
				customScreenPercent = var_9_0
			})

			arg_9_0:addElement(arg_9_0.aspectRatioFade)
		end

		arg_9_0.aspectRatioFade:SetAlpha(1)
	end
end

function LUI.AspectRatioFadeFrameLayer.ClearLayer(arg_10_0, arg_10_1)
	if arg_10_0.aspectRatioFade then
		arg_10_0.aspectRatioFade:SetAlpha(0)
	end
end
