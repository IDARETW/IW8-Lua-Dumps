module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.m_requireFocusType = FocusType.MouseOver

	local var_1_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_1_1 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.maxCount")

	arg_1_0.SocialDetails:SetDataSources(var_1_0, var_1_1)
end

function FriendsButton(arg_2_0, arg_2_1)
	local var_2_0 = LUI.UIButton.new()

	var_2_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 298 * _1080p, 0, 31 * _1080p)

	var_2_0.id = "FriendsButton"
	var_2_0._animationSets = var_2_0._animationSets or {}
	var_2_0._sequences = var_2_0._sequences or {}

	local var_2_1 = arg_2_1 and arg_2_1.controllerIndex

	if not var_2_1 and not Engine.DDJFBBJAIG() then
		var_2_1 = var_2_0:getRootController()
	end

	assert(var_2_1)

	local var_2_2 = var_2_0
	local var_2_3
	local var_2_4 = MenuBuilder.BuildRegisteredType("SocialPlayerButtonBackground", {
		controllerIndex = var_2_1
	})

	var_2_4.id = "SocialPlayerButtonBackground"

	var_2_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, 0, 0, 0)
	var_2_0:addElement(var_2_4)

	var_2_0.SocialPlayerButtonBackground = var_2_4

	local var_2_5
	local var_2_6 = MenuBuilder.BuildRegisteredType("PlayerCount", {
		controllerIndex = var_2_1
	})

	var_2_6.id = "SocialDetails"

	var_2_6:SetRGBFromInt(14936290, 0)
	var_2_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 454, _1080p * 2, _1080p * 32)
	var_2_0:addElement(var_2_6)

	var_2_0.SocialDetails = var_2_6

	local function var_2_7()
		return
	end

	var_2_0._sequences.DefaultSequence = var_2_7

	local var_2_8
	local var_2_9 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_2_0.SocialDetails.CountText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_2_0.SocialDetails.TotalOnlineText
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonOver", var_2_9)

	local function var_2_10()
		var_2_6:AnimateSequence("ButtonOver")
	end

	var_2_0._sequences.ButtonOver = var_2_10

	local var_2_11
	local var_2_12 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_2_0.SocialDetails.CountText
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_2_0.SocialDetails.CountText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_2_0.SocialDetails.TotalOnlineText
		}
	}

	var_2_6:RegisterAnimationSequence("ButtonUp", var_2_12)

	local function var_2_13()
		var_2_6:AnimateSequence("ButtonUp")
	end

	var_2_0._sequences.ButtonUp = var_2_13

	var_2_0:addEventHandler("button_over", function(arg_6_0, arg_6_1)
		if not arg_6_1.controller then
			local var_6_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonOver")
	end)
	var_2_0:addEventHandler("button_up", function(arg_7_0, arg_7_1)
		if not arg_7_1.controller then
			local var_7_0 = var_2_1
		end

		ACTIONS.AnimateSequence(var_2_0, "ButtonUp")
	end)
	PostLoadFunc(var_2_0, var_2_1, arg_2_1)

	return var_2_0
end

MenuBuilder.registerType("FriendsButton", FriendsButton)
LockTable(_M)
