module(..., package.seeall)

function PostLoadFunc(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.m_requireFocusType = FocusType.MouseOver

	local var_1_0 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.count")
	local var_1_1 = LUI.DataSourceInGlobalModel.new("alwaysLoaded.privateParty.maxCount")

	arg_1_0.SocialDetails:SetDataSources(var_1_0, var_1_1)
	arg_1_0:addEventHandler("button_over", function(arg_2_0, arg_2_1)
		ACTIONS.AnimateSequence(arg_2_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonOver"))
	end)
	arg_1_0:addEventHandler("button_up", function(arg_3_0, arg_3_1)
		ACTIONS.AnimateSequence(arg_3_0, WZWIP.CheckForApplyPrependWZWipPrefix("ButtonUp"))
	end)

	if CONDITIONS.IsWZWipDvarEnabled() then
		ACTIONS.AnimateSequence(arg_1_0, "WZWipSetup")
	end
end

function FriendsButton(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIButton.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 298 * _1080p, 0, 31 * _1080p)

	var_4_0.id = "FriendsButton"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3
	local var_4_4 = MenuBuilder.BuildRegisteredType("SocialPlayerButtonBackground", {
		controllerIndex = var_4_1
	})

	var_4_4.id = "SocialPlayerButtonBackground"

	var_4_4:SetAnchorsAndPosition(0, 0, 0, 0, 0, _1080p * -6, 0, 0)
	var_4_0:addElement(var_4_4)

	var_4_0.SocialPlayerButtonBackground = var_4_4

	local var_4_5
	local var_4_6 = MenuBuilder.BuildRegisteredType("PlayerCount", {
		controllerIndex = var_4_1
	})

	var_4_6.id = "SocialDetails"

	var_4_6:SetRGBFromInt(14936290, 0)
	var_4_6:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 454, _1080p * 1, _1080p * 31)
	var_4_0:addElement(var_4_6)

	var_4_0.SocialDetails = var_4_6

	local var_4_7
	local var_4_8 = LUI.UIStyledText.new()

	var_4_8.id = "Prompt"

	var_4_8:SetRGBFromTable(SWATCHES.genericMenu.descText, 0)
	var_4_8:setText(Engine.CBBHFCGDIC("LUA_MENU/PAD_ALT2_BUTTON"), 0)
	var_4_8:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_8:SetWordWrap(false)
	var_4_8:SetAlignment(LUI.Alignment.Right)
	var_4_8:SetTintFontIcons(true)
	var_4_8:SetAnchorsAndPosition(1, 0, 0, 0, _1080p * -344, _1080p * -200, 0, 0)
	var_4_0:addElement(var_4_8)

	var_4_0.Prompt = var_4_8

	local function var_4_9()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_9

	local var_4_10
	local var_4_11 = {
		{
			value = 16777215,
			duration = 0,
			property = TWEEN_PROPERTY.RGB
		},
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_4_0.SocialDetails.CountText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.textFocus,
			child = var_4_0.SocialDetails.TotalOnlineText
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonOver", var_4_11)

	local function var_4_12()
		var_4_6:AnimateSequence("ButtonOver")
	end

	var_4_0._sequences.ButtonOver = var_4_12

	local var_4_13
	local var_4_14 = {
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_4_0.SocialDetails.CountText
		},
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_4_0.SocialDetails.CountText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.genericButton.description,
			child = var_4_0.SocialDetails.TotalOnlineText
		}
	}

	var_4_6:RegisterAnimationSequence("ButtonUp", var_4_14)

	local function var_4_15()
		var_4_6:AnimateSequence("ButtonUp")
	end

	var_4_0._sequences.ButtonUp = var_4_15

	local var_4_16
	local var_4_17 = {
		{
			duration = 200,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText,
			child = var_4_0.SocialDetails.CountText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericTabText,
			child = var_4_0.SocialDetails.TotalOnlineText
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipButtonOver", var_4_17)

	local function var_4_18()
		var_4_6:AnimateSequence("WZWipButtonOver")
	end

	var_4_0._sequences.WZWipButtonOver = var_4_18

	local var_4_19
	local var_4_20 = {
		{
			duration = 100,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_4_0.SocialDetails.CountText
		},
		{
			duration = 0,
			property = TWEEN_PROPERTY.RGB,
			value = SWATCHES.CH2.WZGenericText,
			child = var_4_0.SocialDetails.TotalOnlineText
		}
	}

	var_4_6:RegisterAnimationSequence("WZWipButtonUp", var_4_20)

	local function var_4_21()
		var_4_6:AnimateSequence("WZWipButtonUp")
	end

	var_4_0._sequences.WZWipButtonUp = var_4_21

	PostLoadFunc(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("FriendsButton", FriendsButton)
LockTable(_M)
