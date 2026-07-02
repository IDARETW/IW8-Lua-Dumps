module(..., package.seeall)

local function var_0_0(arg_1_0, arg_1_1)
	return arg_1_1 < PresencePlatform.NONE or arg_1_1 == PresencePlatform.IOS or arg_1_1 == PresencePlatform.WEGAME or arg_1_1 == PresencePlatform.CROSSPLAY_CONSOLE or arg_1_1 == PresencePlatform.CROSSPLAY_PC
end

local function var_0_1(arg_2_0, arg_2_1)
	if arg_2_0:IsPresencePlatformUnsupported(arg_2_1) then
		return false
	elseif CONDITIONS.IsWeGame() then
		return false
	elseif arg_2_1 == PresencePlatform.NONE then
		return false
	elseif arg_2_1 == PresencePlatform.WEGAME then
		return false
	else
		return true
	end
end

local function var_0_2(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:WillShowIcon(arg_3_1)

	arg_3_0.Icon:SetAlpha(var_3_0 and 1 or 0)

	if arg_3_1 == PresencePlatform.XBOX_ONE or arg_3_1 == PresencePlatform.XB4 then
		if not CONDITIONS.IsSony() then
			ACTIONS.AnimateSequence(arg_3_0, "FirstPartyXB3")
		else
			ACTIONS.AnimateSequence(arg_3_0, "ThirdPartyXB3")
		end
	elseif arg_3_1 == PresencePlatform.PS4 or arg_3_1 == PresencePlatform.PS5 then
		if CONDITIONS.IsSony() or CONDITIONS.IsBattleNet() or CONDITIONS.IsLaze() or CONDITIONS.IsUbiConnect() then
			ACTIONS.AnimateSequence(arg_3_0, "FirstPartyPS4")
		else
			ACTIONS.AnimateSequence(arg_3_0, "ThirdPartyPS4")
		end
	elseif arg_3_1 == PresencePlatform.BNET then
		if CONDITIONS.IsBattleNet() or CONDITIONS.IsUbiConnect() then
			ACTIONS.AnimateSequence(arg_3_0, "BNet")
		else
			ACTIONS.AnimateSequence(arg_3_0, "PC")
		end
	elseif arg_3_1 == PresencePlatform.STEAM then
		if CONDITIONS.IsLaze() or CONDITIONS.IsUbiConnect() then
			ACTIONS.AnimateSequence(arg_3_0, "Steam")
		else
			ACTIONS.AnimateSequence(arg_3_0, "PC")
		end
	elseif arg_3_1 == PresencePlatform.UBICONNECT then
		if CONDITIONS.IsUbiConnect() then
			ACTIONS.AnimateSequence(arg_3_0, "Ubiconnect")
		else
			ACTIONS.AnimateSequence(arg_3_0, "PC")
		end
	elseif arg_3_1 == PresencePlatform.MSSTORE then
		if not CONDITIONS.IsSony() then
			ACTIONS.AnimateSequence(arg_3_0, "MSSTORE")
		else
			ACTIONS.AnimateSequence(arg_3_0, "PC")
		end
	end
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0.isAtviFriend = arg_4_1
end

local function var_0_4(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.SetPlatformPresence = var_0_2
	arg_5_0.WillShowIcon = var_0_1
	arg_5_0.SetAtviFriend = var_0_3
	arg_5_0.IsPresencePlatformUnsupported = var_0_0
	arg_5_0.isAtviFriend = false
end

function SocialPlatformPresence(arg_6_0, arg_6_1)
	local var_6_0 = LUI.UIElement.new()

	var_6_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 22 * _1080p, 0, 22 * _1080p)

	var_6_0.id = "SocialPlatformPresence"
	var_6_0._animationSets = var_6_0._animationSets or {}
	var_6_0._sequences = var_6_0._sequences or {}

	local var_6_1 = arg_6_1 and arg_6_1.controllerIndex

	if not var_6_1 and not Engine.DDJFBBJAIG() then
		var_6_1 = var_6_0:getRootController()
	end

	assert(var_6_1)

	local var_6_2 = var_6_0
	local var_6_3
	local var_6_4 = LUI.UIImage.new()

	var_6_4.id = "Icon"

	var_6_4:setImage(RegisterMaterial("icon_platform_playstation"), 0)
	var_6_0:addElement(var_6_4)

	var_6_0.Icon = var_6_4

	local var_6_5
	local var_6_6 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_6_4:RegisterAnimationSequence("DefaultSequence", var_6_6)

	local function var_6_7()
		var_6_4:AnimateSequence("DefaultSequence")
	end

	var_6_0._sequences.DefaultSequence = var_6_7

	local var_6_8
	local var_6_9 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_playstation")
		}
	}

	var_6_4:RegisterAnimationSequence("FirstPartyPS4", var_6_9)

	local function var_6_10()
		var_6_4:AnimateSequence("FirstPartyPS4")
	end

	var_6_0._sequences.FirstPartyPS4 = var_6_10

	local var_6_11
	local var_6_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_xbox")
		}
	}

	var_6_4:RegisterAnimationSequence("FirstPartyXB3", var_6_12)

	local function var_6_13()
		var_6_4:AnimateSequence("FirstPartyXB3")
	end

	var_6_0._sequences.FirstPartyXB3 = var_6_13

	local var_6_14
	local var_6_15 = {
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

	var_6_4:RegisterAnimationSequence("ThirdPartyPS4", var_6_15)

	local function var_6_16()
		var_6_4:AnimateSequence("ThirdPartyPS4")
	end

	var_6_0._sequences.ThirdPartyPS4 = var_6_16

	local var_6_17
	local var_6_18 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_console")
		}
	}

	var_6_4:RegisterAnimationSequence("ThirdPartyXB3", var_6_18)

	local function var_6_19()
		var_6_4:AnimateSequence("ThirdPartyXB3")
	end

	var_6_0._sequences.ThirdPartyXB3 = var_6_19

	local var_6_20
	local var_6_21 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_pc")
		}
	}

	var_6_4:RegisterAnimationSequence("PC", var_6_21)

	local function var_6_22()
		var_6_4:AnimateSequence("PC")
	end

	var_6_0._sequences.PC = var_6_22

	local var_6_23
	local var_6_24 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_steam")
		}
	}

	var_6_4:RegisterAnimationSequence("Steam", var_6_24)

	local function var_6_25()
		var_6_4:AnimateSequence("Steam")
	end

	var_6_0._sequences.Steam = var_6_25

	local var_6_26
	local var_6_27 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_bnet")
		}
	}

	var_6_4:RegisterAnimationSequence("BNet", var_6_27)

	local function var_6_28()
		var_6_4:AnimateSequence("BNet")
	end

	var_6_0._sequences.BNet = var_6_28

	local var_6_29
	local var_6_30 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_social_friend_atvi")
		}
	}

	var_6_4:RegisterAnimationSequence("ATVI", var_6_30)

	local function var_6_31()
		var_6_4:AnimateSequence("ATVI")
	end

	var_6_0._sequences.ATVI = var_6_31

	local var_6_32
	local var_6_33 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_ubiconnect")
		}
	}

	var_6_4:RegisterAnimationSequence("Ubiconnect", var_6_33)

	local function var_6_34()
		var_6_4:AnimateSequence("Ubiconnect")
	end

	var_6_0._sequences.Ubiconnect = var_6_34

	local var_6_35
	local var_6_36 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.Material,
			value = RegisterMaterial("icon_platform_msstore_pc")
		}
	}

	var_6_4:RegisterAnimationSequence("MSSTORE", var_6_36)

	local function var_6_37()
		var_6_4:AnimateSequence("MSSTORE")
	end

	var_6_0._sequences.MSSTORE = var_6_37

	var_0_4(var_6_0, var_6_1, arg_6_1)
	ACTIONS.AnimateSequence(var_6_0, "DefaultSequence")

	return var_6_0
end

MenuBuilder.registerType("SocialPlatformPresence", SocialPlatformPresence)
LockTable(_M)
