module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local var_1_0

	if arg_1_3 == true then
		local var_1_1 = arg_1_2.DisabledText and arg_1_2.DisabledText:getText() or Engine.CBBHFCGDIC("LUA_MENU_MP/BUTTON_DISABLED_NOT_HOST")

		var_1_0 = arg_1_2.Description:getText() .. "\n\n^3" .. var_1_1 .. "^7"
	else
		var_1_0 = arg_1_2.Description:getText()
	end

	if arg_1_4 then
		local var_1_2 = {
			tooltipDescription = var_1_0,
			promptsData = arg_1_4
		}

		arg_1_2:AddTooltipData(arg_1_1, var_1_2)
	else
		arg_1_2:AddTooltipData(arg_1_1, {
			tooltipDescription = var_1_0
		})
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = #arg_2_2

	if var_2_0 > 0 then
		arg_2_1:addElementAfter(arg_2_2[var_2_0])
	else
		arg_2_1:addElementAfter(arg_2_0.FeaturedLabel)
	end

	table.insert(arg_2_2, arg_2_1)
end

local function var_0_2(arg_3_0)
	if arg_3_0.promotedButtonWidgets and #arg_3_0.promotedButtonWidgets > 0 then
		return arg_3_0.promotedButtonWidgets[#arg_3_0.promotedButtonWidgets]
	end
end

local function var_0_3(arg_4_0)
	if arg_4_0.promotedButtonWidgets and #arg_4_0.promotedButtonWidgets > 0 then
		return arg_4_0.promotedButtonWidgets[1]
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.InsertIntoButtonList = var_0_1
	arg_5_0.AddButtonTooltipData = var_0_0
	arg_5_0.GetLastButtonWidget = var_0_2
	arg_5_0.GetFirstButtonWidget = var_0_3
	arg_5_0.promotedButtonWidgets = {}

	local function var_5_0()
		PlaylistUtils.UpdateDisabledStateOnButtons(arg_5_1, arg_5_0, arg_5_0.promotedButtonWidgets)
	end

	local var_5_1 = DataSources.frontEnd.lobby.inSplitScreen
	local var_5_2 = LUI.DataSourceInGlobalModel.new("frontEnd.lobby.areWeGameHost")
	local var_5_3 = DataSources.frontEnd.lobby.memberCount

	arg_5_0:SubscribeToModel(var_5_2:GetModel(arg_5_1), var_5_0)
	arg_5_0:SubscribeToModel(var_5_3:GetModel(arg_5_1), var_5_0)
	arg_5_0:SubscribeToModel(var_5_1:GetModel(arg_5_1), var_5_0)
	arg_5_0:addEventHandler("update_publisher_variables", var_5_0)
end

function BRPlayMenuPromotedbuttons(arg_7_0, arg_7_1)
	local var_7_0 = LUI.UIVerticalList.new()

	var_7_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 430 * _1080p, 0, 300 * _1080p)

	var_7_0.id = "BRPlayMenuPromotedbuttons"

	local var_7_1 = arg_7_1 and arg_7_1.controllerIndex

	if not var_7_1 and not Engine.DDJFBBJAIG() then
		var_7_1 = var_7_0:getRootController()
	end

	assert(var_7_1)

	local var_7_2 = var_7_0

	var_7_0:SetSpacing(13 * _1080p)

	local var_7_3
	local var_7_4 = MenuBuilder.BuildRegisteredType("BRPlayMenuPromotedHeader", {
		controllerIndex = var_7_1
	})

	var_7_4.id = "FeaturedLabel"

	var_7_4:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, 0, _1080p * 30)
	var_7_0:addElement(var_7_4)

	var_7_0.FeaturedLabel = var_7_4

	var_0_4(var_7_0, var_7_1, arg_7_1)

	return var_7_0
end

MenuBuilder.registerType("BRPlayMenuPromotedbuttons", BRPlayMenuPromotedbuttons)
LockTable(_M)
