module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_1 ~= nil and arg_1_1 ~= "" then
		arg_1_0:setImage(RegisterMaterial(arg_1_1))

		if arg_1_2 then
			arg_1_0:SetRGBFromTable(arg_1_2)
		else
			arg_1_0:SetRGBFromTable(COLORS.white)
		end

		arg_1_0:SetAlpha(1)
	end
end

local function var_0_1(arg_2_0)
	arg_2_0:SetAlpha(0)
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = CLANS.EMBLEM.GetEmblemForClan(arg_3_1.foregroundShapeId, arg_3_1.backgroundShapeId, arg_3_2)
	local var_3_1 = CLANS.EMBLEM.GetEmblemColorForClan(arg_3_1.foregroundColorId, arg_3_1.backgroundColorId)

	var_0_0(arg_3_0.ForegroundIcon, var_3_0._foreground, var_3_1._foreground)
	var_0_0(arg_3_0.BackgroundIcon, var_3_0._background, var_3_1._background)
end

local function var_0_3(arg_4_0, arg_4_1)
	var_0_0(arg_4_0.ForegroundIcon, nil, COLORS.white)
	var_0_1(arg_4_0.BackgroundIcon)
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetEmblem = var_0_2
	arg_5_0.SetNonClanEmblem = var_0_3
end

function ClanEmblemWidget(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p)

	var_6_0.id = "ClanEmblemWidget"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "BackgroundIcon"

	var_6_0:addElement(var_6_4)

	var_6_0.BackgroundIcon = var_6_4

	local var_6_5
	local var_6_6 = LUI.UIImage.new()

	var_6_6.id = "ForegroundIcon"

	var_6_0:addElement(var_6_6)

	var_6_0.ForegroundIcon = var_6_6

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("ClanEmblemWidget", ClanEmblemWidget)
LockTable(_M)
