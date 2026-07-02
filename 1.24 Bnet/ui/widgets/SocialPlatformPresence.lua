module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	if arg_1_1 < PresencePlatform.NONE or arg_1_1 > PresencePlatform.STEAM then
		return false
	elseif CONDITIONS.IsWeGame() then
		return false
	elseif arg_1_1 == PresencePlatform.NONE then
		return false
	elseif arg_1_1 == PresencePlatform.STEAM then
		return false
	elseif arg_1_1 == PresencePlatform.WEGAME then
		return false
	else
		return true
	end
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0:WillShowIcon(arg_2_1)

	arg_2_0.Icon:SetAlpha(var_2_0 and 1 or 0)

	if arg_2_1 == PresencePlatform.XBOX_ONE then
		if CONDITIONS.IsXboxOne() or CONDITIONS.IsBattleNet() then
			ACTIONS.AnimateSequence(arg_2_0, "FirstPartyXB3")
		else
			ACTIONS.AnimateSequence(arg_2_0, "ThirdPartyXB3")
		end
	elseif arg_2_1 == PresencePlatform.PS4 then
		if CONDITIONS.IsPS4() or CONDITIONS.IsBattleNet() then
			ACTIONS.AnimateSequence(arg_2_0, "FirstPartyPS4")
		else
			ACTIONS.AnimateSequence(arg_2_0, "ThirdPartyPS4")
		end
	elseif arg_2_1 == PresencePlatform.BNET then
		ACTIONS.AnimateSequence(arg_2_0, "PC")
	end
end

local function var_0_2(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetPlatformPresence = var_0_1
	arg_3_0.WillShowIcon = var_0_0
end

function SocialPlatformPresence(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p)

	var_4_0.id = "SocialPlatformPresence"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = LUI.UIImage.new()

	var_4_4.id = "Icon"

	var_4_4:setImage(RegisterMaterial("icon_platform_playstation"), 0)
	var_4_0:addElement(var_4_4)

	var_4_0.Icon = var_4_4

	local var_4_5 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("DefaultSequence", var_4_5)

	local function var_4_6()
		var_4_4:AnimateSequence("DefaultSequence")
	end

	var_4_0._sequences.DefaultSequence = var_4_6

	local var_4_7 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_playstation")
		}
	}

	var_4_4:RegisterAnimationSequence("FirstPartyPS4", var_4_7)

	local function var_4_8()
		var_4_4:AnimateSequence("FirstPartyPS4")
	end

	var_4_0._sequences.FirstPartyPS4 = var_4_8

	local var_4_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_xbox")
		}
	}

	var_4_4:RegisterAnimationSequence("FirstPartyXB3", var_4_9)

	local function var_4_10()
		var_4_4:AnimateSequence("FirstPartyXB3")
	end

	var_4_0._sequences.FirstPartyXB3 = var_4_10

	local var_4_11 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_console")
		},
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_4:RegisterAnimationSequence("ThirdPartyPS4", var_4_11)

	local function var_4_12()
		var_4_4:AnimateSequence("ThirdPartyPS4")
	end

	var_4_0._sequences.ThirdPartyPS4 = var_4_12

	local var_4_13 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_console")
		}
	}

	var_4_4:RegisterAnimationSequence("ThirdPartyXB3", var_4_13)

	local function var_4_14()
		var_4_4:AnimateSequence("ThirdPartyXB3")
	end

	var_4_0._sequences.ThirdPartyXB3 = var_4_14

	local var_4_15 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_pc")
		}
	}

	var_4_4:RegisterAnimationSequence("PC", var_4_15)

	local function var_4_16()
		var_4_4:AnimateSequence("PC")
	end

	var_4_0._sequences.PC = var_4_16

	var_0_2(var_4_0, var_4_1, arg_4_1)
	ACTIONS.AnimateSequence(var_4_0, "DefaultSequence")

	return var_4_0
end

MenuBuilder.registerType("SocialPlatformPresence", SocialPlatformPresence)
LockTable(_M)
