module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	return {
		controllerIndex = arg_1_0,
		helperBar = arg_1_1.helperBar,
		isInboxTabEnabled = arg_1_1.isInboxTabEnabled or false
	}
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if not arg_2_0.ClanEnlist then
		local var_2_0
		local var_2_1 = MenuBuilder.BuildRegisteredType("ClanEnlist", var_0_0(arg_2_1, arg_2_2))

		var_2_1.id = "ClanEnlist"

		var_2_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		arg_2_0:addElement(var_2_1)

		arg_2_0.ClanEnlist = var_2_1
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	if not arg_3_0.ClanBarracks then
		local var_3_0
		local var_3_1 = MenuBuilder.BuildRegisteredType("ClanBarracks", var_0_0(arg_3_1, arg_3_2))

		var_3_1.id = "ClanBarracks"

		var_3_1:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
		arg_3_0:addElement(var_3_1)

		arg_3_0.ClanBarracks = var_3_1
	end
end

local function var_0_3(arg_4_0, arg_4_1, arg_4_2)
	if CLANS.IsInClan(arg_4_1) then
		var_0_2(arg_4_0, arg_4_1, arg_4_2)
	else
		var_0_1(arg_4_0, arg_4_1, arg_4_2)
	end
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._controllerIndex = arg_5_1
	arg_5_0._helperBar = arg_5_2.helperBar and arg_5_2.helperBar or nil

	var_0_3(arg_5_0, arg_5_1, arg_5_2)
end

function SocialClanMenu(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0.id = "SocialClanMenu"

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0

	var_0_4(var_6_0, var_6_1, arg_6_1)

	return var_6_0
end

MenuBuilder.registerType("SocialClanMenu", SocialClanMenu)
LockTable(_M)
