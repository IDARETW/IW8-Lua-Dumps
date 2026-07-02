module(..., package.seeall)

local var_0_0 = {
	[CRM.locations.NG_LIVE_EVENT] = true,
	[CRM.locations.CW_LIVE_EVENT] = true,
	[CRM.locations.MW_LIVE_EVENT] = true,
	[CRM.locations.WZ_LIVE_EVENT] = true
}

local function var_0_1(arg_1_0, arg_1_1)
	ACTIONS.AnimateSequence(arg_1_0, "DefaultSequence")
	arg_1_0.ContentShort:setText(arg_1_1[CRM.keys.CONTENT_SHORT])
	arg_1_0.ContentLong:setText(arg_1_1[CRM.keys.CONTENT_LONG])

	local var_1_0 = arg_1_1[CRM.keys.IMAGE]

	if var_1_0 and #var_1_0 > 0 then
		arg_1_0.Backing:setImage(RegisterMaterial(var_1_0))
		arg_1_0.Backing:SetRGBFromTable(SWATCHES.Reticles.White)
		arg_1_0.Backing:SetAlpha(1)
	else
		arg_1_0.Backing:SetAlpha(0)
	end
end

local function var_0_2(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2.locationIndex
	local var_2_1 = 0
	local var_2_2 = var_2_0 ~= nil and var_0_0[var_2_0]

	assert(var_2_2)

	local var_2_3 = CRM.GetMessageContent(arg_2_1, var_2_0, var_2_1)

	if var_2_3 and var_2_2 then
		ACTIONS.AnimateSequence(arg_2_0, WZWIP.CheckForApplyPrependWZWipPrefix("Show", CONDITIONS.IsWZWipDvarEnabled()))
		arg_2_0:SetupContent(var_2_3)
	else
		ACTIONS.AnimateSequence(arg_2_0, WZWIP.CheckForApplyPrependWZWipPrefix("Hide", CONDITIONS.IsWZWipDvarEnabled()))
	end
end

local function var_0_3(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.SetupContent = var_0_1
	arg_3_0.GetMessage = var_0_2

	arg_3_0:setPriority(10)

	if CONDITIONS.IsWZWipFlowEnabled() then
		ACTIONS.AnimateSequence(arg_3_0, "WZWipSetup")
	end
end

function CRMLiveEventBladeInfo(arg_4_0, arg_4_1)
	local var_4_0 = LUI.UIElement.new()

	var_4_0:SetAnchorsAndPosition(0, 1, 0, 1, 0, 312 * _1080p, 0, 76 * _1080p)

	var_4_0.id = "CRMLiveEventBladeInfo"
	var_4_0._animationSets = var_4_0._animationSets or {}
	var_4_0._sequences = var_4_0._sequences or {}

	local var_4_1 = arg_4_1 and arg_4_1.controllerIndex

	if not var_4_1 and not Engine.DDJFBBJAIG() then
		var_4_1 = var_4_0:getRootController()
	end

	assert(var_4_1)

	local var_4_2 = var_4_0
	local var_4_3

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_4_3 = LUI.UIImage.new()
		var_4_3.id = "WZWipBacking"

		var_4_3:SetRGBFromInt(1118481, 0)
		var_4_0:addElement(var_4_3)

		var_4_0.WZWipBacking = var_4_3
	end

	local var_4_4
	local var_4_5 = LUI.UIImage.new()

	var_4_5.id = "Backing"

	var_4_5:setImage(RegisterMaterial("blade_live_event_2xp_backing"), 0)
	var_4_5:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 312, 0, _1080p * 76)
	var_4_0:addElement(var_4_5)

	var_4_0.Backing = var_4_5

	local var_4_6
	local var_4_7 = LUI.UIStyledText.new()

	var_4_7.id = "ContentShort"

	var_4_7:setText("", 0)
	var_4_7:SetFont(FONTS.GetFont(FONTS.MainRegular.File))
	var_4_7:SetWordWrap(false)
	var_4_7:SetAlignment(LUI.Alignment.Center)
	var_4_7:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_7:SetStartupDelay(2000)
	var_4_7:SetLineHoldTime(400)
	var_4_7:SetAnimMoveTime(1000)
	var_4_7:SetAnimMoveSpeed(50)
	var_4_7:SetEndDelay(2000)
	var_4_7:SetCrossfadeTime(400)
	var_4_7:SetFadeInTime(300)
	var_4_7:SetFadeOutTime(300)
	var_4_7:SetMaxVisibleLines(1)
	var_4_7:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 308, _1080p * 17, _1080p * 35)
	var_4_0:addElement(var_4_7)

	var_4_0.ContentShort = var_4_7

	local var_4_8
	local var_4_9 = LUI.UIStyledText.new()

	var_4_9.id = "ContentLong"

	var_4_9:setText("", 0)
	var_4_9:SetFont(FONTS.GetFont(FONTS.MainBold.File))
	var_4_9:SetWordWrap(false)
	var_4_9:SetAlignment(LUI.Alignment.Center)
	var_4_9:SetAutoScrollStyle(LUI.UIStyledText.AutoScrollStyle.ScrollH)
	var_4_9:SetStartupDelay(2000)
	var_4_9:SetLineHoldTime(400)
	var_4_9:SetAnimMoveTime(1000)
	var_4_9:SetAnimMoveSpeed(50)
	var_4_9:SetEndDelay(2000)
	var_4_9:SetCrossfadeTime(400)
	var_4_9:SetFadeInTime(300)
	var_4_9:SetFadeOutTime(300)
	var_4_9:SetMaxVisibleLines(1)
	var_4_9:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 142, _1080p * 308, _1080p * 35, _1080p * 57)
	var_4_0:addElement(var_4_9)

	var_4_0.ContentLong = var_4_9

	local var_4_10

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_4_10 = LUI.UIImage.new()
		var_4_10.id = "WZWipTopSep"

		var_4_10:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_4_10:SetAlpha(0, 0)
		var_4_10:SetAnchorsAndPosition(0, 0, 0, 1, 0, 0, _1080p * -5, _1080p * -4)
		var_4_0:addElement(var_4_10)

		var_4_0.WZWipTopSep = var_4_10
	end

	local var_4_11

	if CONDITIONS.IsWZWipDvarEnabled() then
		var_4_11 = LUI.UIImage.new()
		var_4_11.id = "WZWipBotSep"

		var_4_11:SetRGBFromTable(SWATCHES.CH2.WZGenericText, 0)
		var_4_11:SetAlpha(0, 0)
		var_4_11:SetAnchorsAndPosition(0, 0, 1, 0, 0, 0, _1080p * 4, _1080p * 5)
		var_4_0:addElement(var_4_11)

		var_4_0.WZWipBotSep = var_4_11
	end

	local function var_4_12()
		return
	end

	var_4_0._sequences.DefaultSequence = var_4_12

	local var_4_13
	local var_4_14 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("Show", var_4_14)

	local var_4_15 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Show", var_4_15)

	local var_4_16 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("Show", var_4_16)

	local function var_4_17()
		var_4_5:AnimateSequence("Show")
		var_4_7:AnimateSequence("Show")
		var_4_9:AnimateSequence("Show")
	end

	var_4_0._sequences.Show = var_4_17

	local var_4_18
	local var_4_19 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("Hide", var_4_19)

	local var_4_20 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("Hide", var_4_20)

	local var_4_21 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("Hide", var_4_21)

	local function var_4_22()
		var_4_5:AnimateSequence("Hide")
		var_4_7:AnimateSequence("Hide")
		var_4_9:AnimateSequence("Hide")
	end

	var_4_0._sequences.Hide = var_4_22

	local var_4_23

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_24 = {
			{
				value = 0.75,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("WZWipShow", var_4_24)
	end

	local var_4_25 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("WZWipShow", var_4_25)

	local var_4_26 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipShow", var_4_26)

	local var_4_27 = {
		{
			value = 1,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipShow", var_4_27)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_28 = {
			{
				value = 0.25,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipShow", var_4_28)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_29 = {
			{
				value = 0.25,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipShow", var_4_29)
	end

	local function var_4_30()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_3:AnimateSequence("WZWipShow")
		end

		var_4_5:AnimateSequence("WZWipShow")
		var_4_7:AnimateSequence("WZWipShow")
		var_4_9:AnimateSequence("WZWipShow")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_10:AnimateSequence("WZWipShow")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_11:AnimateSequence("WZWipShow")
		end
	end

	var_4_0._sequences.WZWipShow = var_4_30

	local var_4_31

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_32 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_3:RegisterAnimationSequence("WZWipHide", var_4_32)
	end

	local var_4_33 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("WZWipHide", var_4_33)

	local var_4_34 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_7:RegisterAnimationSequence("WZWipHide", var_4_34)

	local var_4_35 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_9:RegisterAnimationSequence("WZWipHide", var_4_35)

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_36 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_10:RegisterAnimationSequence("WZWipHide", var_4_36)
	end

	if CONDITIONS.IsWZWipDvarEnabled() then
		local var_4_37 = {
			{
				value = 0,
				duration = 0,
				property = TWEEN_PROPERTY.Alpha
			}
		}

		var_4_11:RegisterAnimationSequence("WZWipHide", var_4_37)
	end

	local function var_4_38()
		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_3:AnimateSequence("WZWipHide")
		end

		var_4_5:AnimateSequence("WZWipHide")
		var_4_7:AnimateSequence("WZWipHide")
		var_4_9:AnimateSequence("WZWipHide")

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_10:AnimateSequence("WZWipHide")
		end

		if CONDITIONS.IsWZWipDvarEnabled() then
			var_4_11:AnimateSequence("WZWipHide")
		end
	end

	var_4_0._sequences.WZWipHide = var_4_38

	local var_4_39
	local var_4_40 = {
		{
			value = 0,
			duration = 0,
			property = TWEEN_PROPERTY.Alpha
		}
	}

	var_4_5:RegisterAnimationSequence("WZWipSetup", var_4_40)

	local function var_4_41()
		var_4_5:AnimateSequence("WZWipSetup")
	end

	var_4_0._sequences.WZWipSetup = var_4_41

	var_0_3(var_4_0, var_4_1, arg_4_1)

	return var_4_0
end

MenuBuilder.registerType("CRMLiveEventBladeInfo", CRMLiveEventBladeInfo)
LockTable(_M)
